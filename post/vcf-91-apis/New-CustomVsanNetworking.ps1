function New-CustomVsanNetworking {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "Name of the vSphere Cluster containing the ESXi hosts.")]
        [string]$ClusterName,

        [Parameter(Mandatory = $true, HelpMessage = "Name of the existing vSphere Distributed Switch.")]
        [string]$VdsName,

        [Parameter(Mandatory = $true, HelpMessage = "Desired name for the new vSAN Distributed Port Group.")]
        [string]$PortGroupName,

        [Parameter(Mandatory = $true, HelpMessage = "The base IP subnet for the vSAN network (e.g., '192.168.10.').")]
        [string]$VsanSubnetBase,

        [Parameter(Mandatory = $false, HelpMessage = "The starting IP suffix number for the first host. Default is 101.")]
        [int]$StartIpSuffix = 101,

        [Parameter(Mandatory = $false, HelpMessage = "Subnet mask for the vSAN network. Default is 255.255.255.0.")]
        [string]$SubnetMask = "255.255.255.0",

        [Parameter(Mandatory = $false, HelpMessage = "VLAN ID for vSAN traffic (1-4094). Default is 0 (Untagged).")]
        [ValidateRange(0, 4094)]
        [int]$VlanId = 0
    )

    process {
        # 1. Resolve Infrastructure References
        $Cluster = Get-Cluster -Name $ClusterName -ErrorAction SilentlyContinue
        $vDS = Get-VDSwitch -Name $VdsName -ErrorAction SilentlyContinue

        if (-not $Cluster) { Write-Error "Cluster '$ClusterName' not found."; return }
        if (-not $vDS) { Write-Error "Distributed Switch '$VdsName' not found."; return }

        $ClusterHosts = $Cluster | Get-VMHost

        # 2. Create the Distributed Port Group for vSAN
        $VdsPg = Get-VDPortgroup -VDSwitch $vDS -Name $PortGroupName -ErrorAction SilentlyContinue
        if (-not $VdsPg) {
            try {
                Write-Host "Creating Distributed Port Group '$PortGroupName' on '$VdsName' (VLAN $VlanId)..." -ForegroundColor Cyan
                $VdsPg = New-VDPortgroup -VDSwitch $vDS -Name $PortGroupName -VlanId $VlanId -Confirm:$false
                Write-Host "Port Group created successfully." -ForegroundColor Green
            } catch {
                Write-Error "Failed to create Port Group. Reason: $_"
                return
            }
        } else {
            Write-Warning "Distributed Port Group '$PortGroupName' already exists. Using existing group."
        }

        # 3. Configure VMkernel interfaces across all hosts in the cluster
        $CurrentSuffix = $StartIpSuffix

        foreach ($VMHost in $ClusterHosts) {
            Write-Host "------------------------------------------------" -ForegroundColor Gray
            Write-Host "Processing Host: $($VMHost.Name)" -ForegroundColor Cyan

            # Check if host is already connected to the vDS container framework
            $HostInVds = Get-VDSwitch -VMHost $VMHost -Name $VdsName -ErrorAction SilentlyContinue
            if (-not $HostInVds) {
                Write-Warning "Host $($VMHost.Name) is not a member of vDS '$VdsName'. Adding host to vDS first..."
                Add-VDSwitchVMHost -VDSwitch $vDS -VMHost $VMHost -Confirm:$false | Out-Null
            }

            # Check if a vSAN-enabled VMkernel adapter already exists on this host
            $ExistingVsanVmk = Get-VMHostNetworkAdapter -VMHost $VMHost -VMKernel | Where-Object { $_.VsanTrafficEnabled }

            if ($ExistingVsanVmk) {
                Write-Warning "A vSAN-enabled VMkernel interface already exists on $($VMHost.Name) ($($ExistingVsanVmk.IP)). Skipping creation."
                continue
            }

            # Calculate host specific IP address
            $TargetVsanIp = "$VsanSubnetBase$CurrentSuffix"

            try {
                Write-Host "Creating new VMkernel adapter for vSAN traffic ($TargetVsanIp)..." -ForegroundColor Yellow
                
                # Create the adapter, bind it to the vDS port group, and flag it specifically for vSAN
                $NewVmk = New-VMHostNetworkAdapter -VMHost $VMHost -VirtualSwitch $VdsName -PortGroup $VdsPg -IP $TargetVsanIp -SubnetMask $SubnetMask -VsanTrafficEnabled $true -Confirm:$false
                Write-Host "Successfully assigned $TargetVsanIp to vSAN interface on $($VMHost.Name)." -ForegroundColor Green
            } catch {
                Write-Error "Failed to create VMkernel interface on $($VMHost.Name). Reason: $_"
            }

            # Increment the IP address suffix for the next host in the loop
            $CurrentSuffix++
        }
    }
}
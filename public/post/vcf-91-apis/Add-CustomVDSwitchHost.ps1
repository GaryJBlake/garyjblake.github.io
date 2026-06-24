function Add-CustomVDSwitchHost {
    [CmdletBinding()]
    param (
        [Parameter (Mandatory = $true, HelpMessage = "The name of the existing vSphere Distributed Switch.")]
        [string]$vdsName,

        [Parameter (Mandatory = $true, ValueFromPipeline = $true, HelpMessage = "An array of ESX host names or VMHost objects to add.")]
        $vmHost,

        [Parameter (Mandatory = $true, HelpMessage = "The physical NIC name(s) on the host to attach as uplinks (e.g., 'vmnic1' or 'vmnic2').")]
        [string[]]$physicalNic
    )

    begin {
        # 1. Verify the target Distributed Switch exists globally first
        Write-Verbose "Validating vSphere Distributed Switch: $VdsName"
        $vds = Get-VDSwitch -Name $vdsName -ErrorAction SilentlyContinue

        if (-not $vds) {
            Write-Error "Target Distributed Switch '$vdsName' could not be found. Configuration aborted."
            return
        }
    }

    process {
        foreach ($TargetHost in $vmHost) {
            # Ensure we have a proper VMHost object if a string name was passed
            $HostObj = Get-VMHost -Name $TargetHost -ErrorAction SilentlyContinue
            if (-not $HostObj) {
                Write-Error "ESXi Host '$TargetHost' could not be found. Skipping."
                continue
            }

            Write-Host "--- Processing Host: $($HostObj.Name) ---" -ForegroundColor Cyan

            # 2. Check if the host is already a member of this vDS
            $HostInVds = Get-VDSwitch -VMHost $HostObj -Name $vdsName -ErrorAction SilentlyContinue
            
            if (-not $HostInVds) {
                try {
                    Write-Host "Adding host to the '$vdsName' framework..." -ForegroundColor Yellow
                    Add-VDSwitchVMHost -VDSwitch $vds -VMHost $HostObj -Confirm:$false | Out-Null
                } catch {
                    Write-Error "Failed to add host $($HostObj.Name) to the vDS. Reason: $_"
                    continue # Skip to next host if the proxy container can't be added
                }
            } else {
                Write-Host "Host is already associated with '$vdsName'." -ForegroundColor Yellow
            }

            # 3. Loop through and assign each specified physical NIC as an uplink
            foreach ($nic in $physicalNic) {
                try {
                    Write-Host "Mapping physical adapter '$nic' as a vDS uplink..." -ForegroundColor Yellow
                    
                    # Fetch the physical network adapter object from the host
                    $physicalAdapter = Get-VMHostNetworkAdapter -VMHost $HostObj -Physical -Name $nic -ErrorAction SilentlyContinue
                    
                    if (-not $PhysicalAdapter) {
                        Write-Warning "Physical adapter '$nic' was not found on host $($HostObj.Name). Skipping this adapter."
                        continue
                    }

                    # Attach the adapter to the distributed switch
                    Add-VDSwitchPhysicalNetworkAdapter -DistributedSwitch $vds -VMHostNetworkAdapter $physicalAdapter -Confirm:$false | Out-Null
                    Write-Host "Successfully attached '$nic' to '$vdsName'." -ForegroundColor Green
                } catch {
                    Write-Error "Failed to attach '$nic' on $($HostObj.Name). Ensure it is not locked by another switch. Error: $_"
                }
            }
        }
    }
}
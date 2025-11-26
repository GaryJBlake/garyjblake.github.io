+++
author = "GaryJBlake"
title = "VCF Automation: ?"
date = "2025-09-12"
description = "VCF Automation: ?"
tags = [
    "VCF",
    "Public APIs",
    "VCF.PowerCLI"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "SDDC Manager",
    "VCF.PowerCLI"
]
series = [

]
+++

In this procedure, we will use the **/v1/users** API exposed via the VCF.PowerCLI module `VMware.Sdk.Vcf.SddcManager` to assign/delete roles to users or groups in SDDC Manager based on the identity provider defined within the VCF Single Sign-On domain.

### Procedures Covered

* [Assigning an SDDC Manager Role to a Group](#assigning-an-sddc-manager-role-to-a-group)
* [Assigning an SDDC Manager Role to a User](#assigning-an-sddc-manager-role-to-a-user)
* [Removing a User or Group from an SDDC Manager Role](#removing-a-user-or-group-from-an-sddc-manager-role)
* [Assigning SDDC Manager Roles to Multiple Groups](#assigning-sddc-manager-roles-to-multiple-groups)
* [Removing Multiple Groups from SDDC Manager Roles](#removing-multiple-groups-from-sddc-manager-roles)

**SDDC Manager APIs Used**

* POST /v1/tokens
* GET /v1/users
* POST /v1/users
* DELETE /v1/users

### Assigning an SDDC Manager Role to a Group

**Procedure**

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for your instance of SDDC Manager and run the commands in the PowerShell console.

``` powershell
$sddcmFqdn      = "sfo-vcf01.sfo.rainpole.io"
$sddcmUser      = "administrator@vsphere.local"
$sddcmPass      = "VMw@re1!VMw@re1!"
$roleName       = "ADMIN"
$accountType    = "GROUP"
$accountName    = "role-sddcm-admins"
$authDomain     = "mycloudyworld.io"
```

3. Authenticate to the SDDC Manager appliance by running the following command in the PowerShell console:

``` powershell
Connect-VcfSddcManagerServer -Server $sddcmFqdn -User $sddcmUsername -Password $sddcmPassword
```

4. Assign access to the user/group by running the following commands in the PowerShell console:

``` powershell
$vcfRoleReference = Initialize-VcfRoleReference -Id ((Invoke-VcfGetRoles).Elements | Where-Object {$_.Name -eq $roleName}).Id
$vcfUser = Initialize-VcfUser -Name $accountName -Domain $authDomain -Type $accountType -Role $vcfRoleReference
Invoke-VcfAddUsers -User $vcfUser -Server $defaultSddcManagerConnections
```

5. Disconnect from SDDC Manager by running the following commands in the PowerShell console:

``` powershell
Disconnect-VcfSddcManagerServer -Server $sddcmFqdn
```

### Assigning an SDDC Manager Role to a User

**Procedure**

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for your instance of SDDC Manager and run the commands in the PowerShell console.

``` powershell
$sddcmFqdn      = "sfo-vcf01.sfo.rainpole.io"
$sddcmUser      = "administrator@vsphere.local"
$sddcmPass      = "VMw@re1!VMw@re1!"
$roleName       = "ADMIN"
$accountType    = "USER"
$accountName    = "cloud.admin"
$authDomain     = "mycloudyworld.io"
```

3. Authenticate to the SDDC Manager appliance by running the following command in the PowerShell console:

``` powershell
Connect-VcfSddcManagerServer -Server $sddcmFqdn -User $sddcmUsername -Password $sddcmPassword
```

4. Assign access to the user/group by running the following commands in the PowerShell console:

``` powershell
$vcfRoleReference = Initialize-VcfRoleReference -Id ((Invoke-VcfGetRoles).Elements | Where-Object {$_.Name -eq $roleName}).Id
$vcfUser = Initialize-VcfUser -Name $accountName -Domain $authDomain -Type $accountType -Role $vcfRoleReference
Invoke-VcfAddUsers -User $vcfUser -Server $defaultSddcManagerConnections
```

5. Disconnect from SDDC Manager by running the following commands in the PowerShell console:

``` powershell
Disconnect-VcfSddcManagerServer -Server $sddcmFqdn
```

### Removing a User or Group from an SDDC Manager Role

**Procedure**

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for your instance of SDDC Manager and run the commands in the PowerShell console.

``` powershell
$sddcmFqdn      = "sfo-vcf01.sfo.rainpole.io"
$sddcmUser      = "administrator@vsphere.local"
$sddcmPass      = "VMw@re1!VMw@re1!"
$accountName    = "role-sddcm-admins"
```

3. Authenticate to the SDDC Manager appliance by running the following command in the PowerShell console:

``` powershell
Connect-VcfSddcManagerServer -Server $sddcmFqdn -User $sddcmUsername -Password $sddcmPassword
```

4. Remove access to the user/group by running the following commands in the PowerShell console:

``` powershell
Invoke-VcfRemoveUser -Id ((Invoke-VcfGetUsers).Elements | Where-Object {$_.Name -match $accountName}).Id -Server $defaultSddcManagerConnections
```

5. Disconnect from SDDC Manager by running the following commands in the PowerShell console:

``` powershell
Disconnect-VcfSddcManagerServer -Server $sddcmFqdn
```

### Assigning SDDC Manager Roles to Multiple Groups

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for your instance of SDDC Manager and run the commands in the PowerShell console.

``` powershell
$sddcmFqdn      = "sfo-vcf01.sfo.rainpole.io"
$sddcmUser      = "administrator@vsphere.local"
$sddcmPass      = "VMw@re1!VMw@re1!"
$accountType    = "GROUP"
$authDomain     = "mycloudyworld.io"
$accessList     = [PSCustomObject] @{
  roleNAME = "ADMIN"
  accountName = "role-sddcm-admins"
 }, [PSCustomObject] @{
  roleNAME = "OPERATOR"
  accountName = "role-sddcm-operators"
 }, [PSCustomObject] @{
  roleNAME = "VIEWER"
  accountName = "role-sddcm-auditors"
 }
```

3. Authenticate to the SDDC Manager appliance by running the following command in the PowerShell console:

``` powershell
Connect-VcfSddcManagerServer -Server $sddcmFqdn -User $sddcmUsername -Password $sddcmPassword
```

4. Assign access to the user/group by running the following commands in the PowerShell console:

``` powershell
foreach ($access in $accessList) {
    $vcfRoleReference = Initialize-VcfRoleReference -Id ((Invoke-VcfGetRoles).Elements | Where-Object {$_.Name -eq $access.roleName}).Id
    $vcfUser = Initialize-VcfUser -Name $access.accountName -Domain $authDomain -Type $accountType -Role $vcfRoleReference
    Invoke-VcfAddUsers -User $vcfUser -Server $defaultSddcManagerConnections
}
```

5. Disconnect from SDDC Manager by running the following commands in the PowerShell console:

``` powershell
Disconnect-VcfSddcManagerServer -Server $sddcmFqdn
```

### Removing Multiple Groups from SDDC Manager Roles

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for your instance of SDDC Manager and run the commands in the PowerShell console.

``` powershell
$sddcmFqdn      = "sfo-vcf01.sfo.rainpole.io"
$sddcmUser      = "administrator@vsphere.local"
$sddcmPass      = "VMw@re1!VMw@re1!"
$accountNames   = "role-sddcm-admins", "role-sddcm-operators", "role-sddcm-auditors"
```

3. Authenticate to the SDDC Manager appliance by running the following command in the PowerShell console:

``` powershell
Connect-VcfSddcManagerServer -Server $sddcmFqdn -User $sddcmUsername -Password $sddcmPassword
```

4. Assign access to the user/group by running the following commands in the PowerShell console:

``` powershell
foreach ($accountName in $accountNames) {
    Invoke-VcfRemoveUser -Id ((Invoke-VcfGetUsers).Elements | Where-Object {$_.Name -match $accountName}).Id -Server $defaultSddcManagerConnections
}
```

5. Disconnect from SDDC Manager by running the following commands in the PowerShell console:

``` powershell
Disconnect-VcfSddcManagerServer -Server $sddcmFqdn
```

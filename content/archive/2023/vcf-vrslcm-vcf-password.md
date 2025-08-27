+++
author = "GaryJBlake"
title = "Cleaning Up VCF-password* Accounts from vRealize Suite Lifecycle Manager"
date = "2023-08-22"
description = "Cleaning Up VCF-password* Accounts from vRealize Suite Lifecycle Manager"
tags = [
    "VCF",
    "WSA"
]
categories = [
    "VMware Cloud Foundation",
    "vRealize Suite Lifecycle Manager",
    "Aria Suite Lifecycle"
]
series = [

]
+++

If you have had VMware Cloud Foundation and vRealize Suite Lifecycle Manager deployed within your infrastructure for some time you may have noticed in the vRealize Suite Lifecycle Manager Password Locker that there are many passwords called VCF-password-< guid >. This is an internal service account used by vRealize Suite Lifecycle Manager to make vCenter Server API calls and is rotated automatically by SDDC Manager.

This duplication of accounts happens due to the fact that there is no way to update the existing record and so SDDC Manager has to create a new account when the rotation process occurs. In theory it should then remove the previous account, I checked with a member of the engineering team and this would appear to be a bug which I have reported.

However, all is not lost as the extra accounts can be safely deleted without any impact to the system. vRealize Suite Lifecycle Manager has a neat implementation here that can help us easily identify which accounts are no longer required through an '*In Use*' flag which blocks a user from removing an account that is referenced by another object.

## Removing an Account from the Password Locker

### UI Procedure

1. Log in to vRealize Suite Lifecycle Manager at `https://<vrealize_suite_lifecycle_manager_fqdn>` as vcfadmin@local.

2. On the **My services** page, click **Locker**.

3. In the left pane, click **Passwords**.

4. Locate the password alias with `VCF-password-<guid>`, click the ellipses at the end of the row and select **Delete Password**.

Chances are your looking at this blog post because you don't just have one or two of these old accounts hanging around in the Password Locker but a significant amount or perhaps you want to add some automation to perform regular clean up if so then here is a very simple PowerShell scripts I've put together.

---
**NOTE**

This script requires the PowerShell Module PowerValidatedSolution which can be installed directly from the Microsoft PSGallery. This modules provides the `Request-vRSLCMToken`, `Get-vRSLCMLockerPassword`, and `Remove-vRSLCMLockerPassword` functions that interact with the vRealize Suite Lifecycle Manager APIs.

``` powershell
Install-Module -Name PowerValidatedSolutions

Import-Module -Name PowerValidatedSolutions
```
---

### PowerShell Procedure

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of vRealize Suite Lifecycle Manager and run the commands in the PowerShell console.

``` powershell
$vrslcmFqdn = "xint-vrslcm01.rainpole.io"
$vrslcmUser = "vcfadmin@local"
$vrslcmPass = "VMw@re1!"
```

3. Perform the configuration by running the command in the PowerShell console.

``` powershell
Request-vRSLCMToken -fqdn $vrslcmFqdn -username $vrslcmUser -password $vrslcmPass
$unsedVcfAccounts = Get-vRSLCMLockerPassword | Where-Object {$_.alias -like "VCF-password*" -and $_.referenced -eq $false}
if ($unsedVcfAccounts) {
	foreach ($account in $unsedVcfAccounts) {
		$aliasName = (Get-vRSLCMLockerPassword -vmid $account.vmid).alias
		Write-Output " Found Unused Password with alias ($aliasName)"
		Remove-vRSLCMLockerPassword -vmid $account.vmid | Out-Null
		if (!(Get-vRSLCMLockerPassword | Where-Object {$_.alias -eq $account.name})) {
			Write-Output " Deleting Unused Password with alias ($aliasName): SUCCESSFUL"
		} else {
			Write-Error " Failed to Delete Unused Password with alias ($aliasName)"
		}
	}
} else {
	Write-Warning " No Unused Passwords Found in vRealize Suite Lifecycle Manager ($vrslcmFqdn)"
}
```

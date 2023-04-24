+++
author = "GaryJBlake"
title = "Introducing a PowerShell Module for VMware Cloud Foundation Password Management"
date = "2023-04-25"
description = "Introducing a PowerShell Module for VMware Cloud Foundation Password Management"
tags = [
    "API",
    "PowerShell",
    "VCF"
]
categories = [
    "VMware Cloud Foundation"
]
series = [

]
+++

### Background

In January 2023 through the VMware Validated Solution programme we released both documentation and PowerShell cmdlets to help with the configuration of password policies across the VMware Cloud Foundation platform, enabling our customers to report and configure the password expiration, password complexity, and account lockout policies at scale.

The positive feedback received to date has blown us away and so last month during one of our planning sessions we discussed the merits
for spinning out the cmdlets into their own dedicated open-source PowerShell module, during that discussion it was agreed that this would provide us and our customers the following benefits:

* Dedicated module to support all password management operations at scale.
* Flexible release cycle as not tied directly to PowerValidatedSolution releases.
* Aligned with other Validated Operations initiatives where we have.

As a result I have the pleasure of announcing today the release of the new [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management) which can be downloaded from the Microsoft PowerShell Gallery as with all of our open-source modules where it's known as [VMware.CloudFoundation.PasswordManagement](https://www.powershellgallery.com/packages/VMware.CloudFoundation.PasswordManagement)

For this initial release we have focused on transitioning all of the functions from `PowerValidatedSolutions` to `VMware.CloudFoundation.PasswordManagement` but we have plans to enhance further in the coming months.

### Installing the PowerShell Module

Installing `VMware.CloudFoundation.PasswordManagement` is very simple just like other PowerShell modules you use the `Install-Module` cmdlet.

``` PowerShell
Install-Module -Name VMware.CloudFoundation.PasswordManagement
```

However if you have previously used `PowerValidatedSolutions` then you should be aware that you will need to remove all existing versions from your system to avoid any conflicts between the exported function names as we have simply removed them from `PowerValidatedSolutions` and added them into the new `VMware.CloudFoundation.PasswordManagement` module. This can be done using the `Uninstall-Module` cmdlet.

``` PowerShell
Uninstall-Module -Name PowerValidatedSolutions -RequiredVersion 2.1.1.1000
```

You supply the full version during the uninstall process, if your not sure what versions are installed on your system for Windows you can look in the C:\Program Files\WindowsPowerShell\Modules\PowerValidatedSolutions folder, this assumes you are using the default path to install PowerShell modules.

### Verifying Module Prerequisites

The usage of the `VMware.CloudFoundation.PasswordManagement` module requires a number of other supporting PowerShell modules to also be installed, this is documented within the GitHub [README.md](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management/blob/main/README.md) but as part of the switch to a dedicated module we have also introduced the new `Test-VcfPasswordManagementPrereq` cmdlet which you can run to check these prerequisites before attempting to use the main cmdlets to generate reports or perform the configuration.

``` PowerShell
Test-VcfPasswordManagementPrereq
```

![](/post/vcf/vcf-password-prereq.png)

### Execution of the PowerShell Module

From an execution perspective this remains unchanged from the same as it was in January, I've already written a few blogs which you can check out:

* [Password Policy Configuration for VMware Cloud Foundation Overview](/post/vvs/vvs-password-policy)
* [Generating Password Policy Reports for VMware Cloud Foundation](/post/vvs/vvs-password-policy-reports)
* [Configure Password Policies for VMware Cloud Foundation](/post/vvs/vvs-password-policy-config)

### Support and Feedback

To report issues, obtain support, or suggest enhancements to the open-source PowerShell Module, use [GitHub Issues](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management/issues/new/choose) in the GitHub repository.

### Other Open-source Modules

* [PowerShell Module for the VMware Cloud Foundation 4.x API](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation)
* [PowerShell Module for VMware Validated Solutions](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)
* [PowerShell Module for VMware Cloud Foundation Reporting](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting)
* [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management)
* [PowerShell Module for VMware Cloud Foundation Power Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-power-management)

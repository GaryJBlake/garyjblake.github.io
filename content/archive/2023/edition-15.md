+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #15 (Apr 2023)"
date = "2023-04-25"
description = "What's New for VMware Validated Solutions - Edition #15 (Apr 2023)"
tags = [
    "VVS"
]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS Whats New",
]
+++

**Last Updated:** 25-Apr-2023

Welcome to Edition #15 of the **What's New for VMware Validated Solutions**, today we announced the following updates:

* Update to [Cloud-Based Intelligent Logging for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-logging-vmware-cloud-foundation)
* Release of the [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management)
* Updated release of [PowerShell Module for VMware Cloud Foundation APIs](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation)
* Updated release of [PowerShell Module for VMware Validated Solutions](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)

### Cloud-Based Intelligent Logging for VMware Cloud Foundation

A minor design decision updated in the [Cloud-Based Intelligent Logging for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-logging-vmware-cloud-foundation) validated solution:

**Design Decisions on Cloud Proxy Appliance**

* CBL-CDP-CFG-001 - Deploy the Cloud Proxy appliance in the default management vSphere cluster. - Added a new design implication: The Cloud Proxy appliance must not be shared with other Cloud Services, such as vRealize Automation Cloud.

### PowerShell Module for VMware Cloud Foundation Password Management

Following all the positive feedback from January’s update where we introduced the **Password Policy Configuration** covering password expiration, password complexity and account lockout policies across the ESXi, vCenter Server, NSX, SDDC Manager and Workspace ONE Access components we are delighted to announce the introduction of a dedicated open-source PowerShell module [VMware.CloudFoundation.PasswordManagement](https://www.powershellgallery.com/packages/VMware.CloudFoundation.PasswordManagement).

**NOTE**: As part of this work, we have removed the original cmdlets from `PowerValidatedSolutions`.
If you plan to give `VMware.CloudFoundation.PasswordManagement` a try, make sure that you remove all previous versions of `PowerValidatedSolutions` and install the latest before installing and using this new module to avoid cmdlet name conflicts.

### PowerShell Module for VMware Cloud Foundation APIs (PowerVCF)

It’s been almost a year since the last release, but this month sees an update to [PowerVCF](https://www.powershellgallery.com/packages/PowerVCF), a full list of changes can be found in the CHANGELOG.md within the open-source repository but here’s a quick summary of updates:

* Added GitHub Pages Documentation for PowerVCF.
* Added `Get-VCFFipsMode` cmdlet to return the status for FIPS mode.
* Added `Get-VCFRelease` cmdlet to retrieve details for releases.
* Added `Get-VCFCredentialExpiry` cmdlet to retrieve the password expiry details for credentials.
* Added `Get-VCFLicenseMode` cmdlet to retrieve the current license mode of the system & each workload domain.
* Added `New-VCFPersonality` cmdlet to add a new vSphere Lifecycle Manager personality/image in the SDDC Manager inventory from an existing vLCM image based cluster.

### General Availability of PowerValidatedSolutions v2.2.0

Release of [PowerValidatedSolutions v2.2.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.2.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness. Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

* Moved all Password Policy Configuration Functions to new `VMware.CloudFoundation.PasswordManagement` module.
* Fixed `New-vRLIDeployment` cmdlet where in some scenarios it was failing to find the license alias.
* Enhanced `Test-VCFConnection` cmdlet to use `Test-NetConnection` with ports 443 (HTTPS) and 22 (SSH) instead of ICMP.
* Enhanced `Get-vCenterServerDetail` cmdlet with examples and utilizing `Test-VCFConnection` and `Test-VCFAuthentication`.
* Enhanced `Get-NsxtServerDetail` cmdlet with examples and utilizing `Test-VCFConnection` and `Test-VCFAuthentication`.
* Enhanced `Get-vRSLCMServerDetail` cmdlet with a synopsis and examples.
* Enhanced `Get-WSAServerDetail` cmdlet with a synopsis and examples.
* Enhanced `Get-vRAServerDetail` cmdlet with a synopsis and examples.
* Enhanced `Get-vROPsServerDetail` cmdlet with a synopsis and examples.
* Enhanced `Get-vRLIServerDetail` cmdlet with a synopsis and examples.
* Added `Test-PowerValidatedSolutionsPrereq` cmdlet to perform a check for the installation of prerequisite PowerShell modules.
* Added `Show-PowerValidatedSolutionsOutput` cmdlet to handle formatting of output to the console when PowerVCF is not installed.

### Deprecation

* Removed `Get-EsxiPasswordPolicy`
* Removed `Set-EsxiPasswordExpirationPeriod`
* Removed `Set-EsxiPasswordPolicy`
* Removed `Get-VCServerPasswordPolicy`
* Removed `Get-SsoPasswordPolicies`
* Removed `Get-NsxtManagerAuthenticationPolicy`
* Removed `Set-NsxtManagerAuthenticationPolicy`
* Removed `Get-NsxtEdgeNodeAuthenticationPolicy`
* Removed `Set-NsxtEdgeNodeAuthenticationPolicy`
* Removed `Confirm-PSModule`

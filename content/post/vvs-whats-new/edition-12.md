+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #12 (Jan 2023)"
date = "2023-01-31"
description = "What's New for VMware Validated Solutions - Edition #12 (Jan 2023)"
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

**Last Updated:** 31-Jan-2023

Welcome to Edition #12 of the What's New for VMware Validated Solutions, today we announced the following updates:

* **New Solution** - [Cloud-Based Intelligent Operations for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-operations-vmware-cloud-foundation)
* Enhancements to Password Policy Configuration within Identity and Access Management for VMware Cloud Foundation
* Release of [PowerValidatedSolutions v2.0.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.0.0), our PowerShell module developed to ensure robustness, consistency, and accelerate implementation

### Cloud-Based Intelligent Operations for VMware Cloud Foundation
Delighted to announce the release of this brand new VMware Validated Solution.

The [Cloud-Based Intelligent Operations for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-operations-vmware-cloud-foundation) validated solution enables customers to use the vRealize Operations Cloud service with on-premises VMware Cloud Foundation platforms. The solution can be extended to support public cloud operations and covers recommended operational practices and considerations, where applicable.

### Password Policy Configuration within Identity and Access Management for VMware Cloud Foundation

Fully reviewed and reworked the coverage around Password Policy Configuration for ESXi, vCenter Server, NSX, SDDC Manager and Workspace ONE Access through the introduction of three consistent elements:

* Password Expiration
* Password Complexity
* Account Lockout

Updates to the documentation include:

* New design decisions covering each if the three elements.
* Removed Password Policy Configuration from implementation procedures.
* Updated the Password Management section to include Password Policy Configuration.
* Added full automation capabilities to PowerValidatedSolutions including:
  * `Invoke-PasswordPolicyManager` a dedicated cmdlet to generate an HTML report showing the existing configuration across the platform with out without configuration drift.
  * `Start-PasswordPolicyConfig` a dedicated cmdlet to configure your organizations policy requirements across the platform.


### General Availability of PowerValidatedSolutions v2.0.0

Release of [PowerValidatedSolutions v2.0.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.0.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Added `Request-EsxiPasswordExpiration` cmdlet to retrieve the password expiration policy for all ESXi hosts in a cluster.
- Added `Request-EsxiPasswordComplexity` cmdlet to retrieve the password complexity policy for all ESXi hosts in a cluster.
- Added `Request-EsxiAccountLockout` cmdlet to retrieve the account lockout policy for all ESXi hosts in a cluster.
- Added `Update-EsxiPasswordExpiration` cmdlet to update the password expiration policy for all ESXi hosts in a cluster.
- Added `Update-EsxiPasswordComplexity` cmdlet to update the password complexity policy for all ESXi hosts in a cluster.
- Added `Update-EsxiAccountLockout` cmdlet to update the account lockout policy for all ESXi hosts in a cluster.
- Added `Request-SsoPasswordExpiration` cmdlet to retrieve the password expiration policy for vCenter Single Sign-On domain.
- Added `Request-SsoPasswordComplexity` cmdlet to retrieve the password complexity policy for vCenter Single Sign-On domain.
- Added `Request-SsoAccountLockout` cmdlet to retrieve the account lockout policy for vCenter Single Sign-On domain.
- Added `Update-SsoPasswordExpiration` cmdlet to update the password expiration policy for vCenter Single Sign-On domain.
- Added `Update-SsoPasswordComplexity` cmdlet to update the password complexity policy for vCenter Single Sign-On domain.
- Added `Update-SsoAccountLockout` cmdlet to update the account lockout policy for vCenter Single Sign-On domain.
- Added `Request-VcenterPasswordExpiration` cmdlet to retrieve the global password expiration policy for vCenter Server.
- Added `Request-VcenterRootPasswordExpiration` cmdlet to retrieve the root user password expiration policy for vCenter Server.
- Added `Update-VcenterPasswordExpiration` cmdlet to update the global password expiration policy for vCenter Server.
- Added `Update-VcenterRootPasswordExpiration` cmdlet to update the root user password expiration policy for vCenter Server.
- Added `Get-LocalUserPasswordExpiration` cmdlet to retrieve the password expiration policy for a local user.
- Added `Set-LocalUserPasswordExpiration` cmdlet to configure the password expiration policy for a local user.
- Added `Request-LocalUserPasswordExpiration` cmdlet to retrieve the password expiration policy for a local user from any virtual machine.
- Added `Update-LocalUserPasswordExpiration` cmdlet to configure the password expiration policy for a local user from any virtual machine.
- Added `Request-WsaPasswordExpiration` cmdlet to retrieve the password expiration policy for Workspace ONE Access.
- Added `Request-WsaPasswordComplexity` cmdlet to retrieve the password complexity policy for Workspace ONE Access.
- Added `Request-WsaAccountLockout` cmdlet to retrieve the account lockout policy for Workspace ONE Access.
- Added `Update-WsaPasswordExpiration` cmdlet to update the password expiration policy for Workspace ONE Access.
- Added `Update-WsaPasswordComplexity` cmdlet to update the password complexity policy for Workspace ONE Access.
- Added `Update-WsaAccountLockout` cmdlet to update the account lockout policy for Workspace ONE Access.
- Added `Request-NsxtEdgePasswordExpiration` cmdlet to retrieve password expiration policy for NSX Manager nodes.
- Added `Update-NsxtEdgePasswordExpiration` cmdlet to updated password expiration policy for NSX Manager nodes.
- Added `Request-NsxtManagerAccountLockout` cmdlet to retrieve the account lockout policy for NSX Manager nodes.
- Added `Update-NsxtManagerAccountLockout` cmdlet to update the account lockout policy for NSX Manager nodes.
- Added `Request-NsxtEdgeAccountLockout` cmdlet to retrieve the account lockout policy for NSX Edge nodes.
- Added `Update-NsxtEdgeAccountLockout` cmdlet to update the account lockout policy for NSX Edge nodes.
- Added `Get-LocalPasswordComplexity` cmdlet to retrieve the password complexity in `/etc/pam.d/system-password`.
- Added `Set-LocalPasswordComplexity` cmdlet to configure the password complexity in `/etc/pam.d/system-password`.
- Added `Request-VcenterPasswordComplexity` cmdlet to retrieve the password complexity for a vCenter Server.
- Added `Update-VcenterPasswordComplexity` cmdlet to update the password complexity for a vCenter Server.
- Added `Request-NsxtManagerPasswordExpiration` cmdlet to retrieve the password expiration for NSX Local Manager Local Users.
- Added `Update-NsxtManagerPasswordExpiration` cmdlet to update the password expiration for NSX Local Manager Local Users.
- Added `Request-NsxtManagerPasswordComplexity` cmdlet to retrieve the password complexity for NSX Local Manager nodes.
- Added `Update-NsxtManagerPasswordComplexity` cmdlet to update the password complexity for NSX Local Manager nodes.
- Added `Request-NsxtEdgePasswordComplexity` cmdlet to retrieve the password complexity for NSX Edge nodes.
- Added `Update-NsxtEdgePasswordComplexity` cmdlet to update the password complexity for NSX Edge nodes.
- Added `Request-SddcManagerPasswordComplexity` cmdlet to retrieve the password complexity for SDDC Manager.
- Added `Update-SddcManagerPasswordComplexity` cmdlet to update the password complexity for SDDC Manager.
- Added `Request-WsaLocalUserPasswordComplexity` cmdlet to retrieve the local user password complexity for Workspace ONE Access.
- Added `Update-WsaLocalUserPasswordComplexity` cmdlet to update the local user password complexity for Workspace ONE Access.
- Added `Get-LocalAccountLockout` cmdlet to retrieve the local user account lockout policy from a virtual machine.
- Added `Set-LocalAccountLockout` cmdlet to update the local user account lockout policy from a virtual machine.
- Added `Request-VcenterAccountLockout` cmdlet to retrieve the local user account lockout policy for vCenter Server.
- Added `Update-VcenterAccountLockout` cmdlet to update  the local user account lockout policy for vCenter Server.
- Added `Request-SddcManagerAccountLockout` cmdlet to retrieve the local user account lockout policy for SDDC Manager.
- Added `Update-SddcManagerAccountLockout` cmdlet to update the local user account lockout policy for SDDC Manager.
- Added `Request-WsaLocalUserAccountLockout` cmdlet to retrieve the local user account lockout policy for Workspace ONE Access.
- Added `Update-WsaLocalUserAccountLockout` cmdlet to update the local user account lockout policy for Workspace ONE Access.
- Added `Publish-EsxiPasswordPolicy` cmdlet to retrieve the requested password policy for all ESXi hosts and output the details.
- Added `Invoke-PasswordPolicyManager` cmdlet to generate the Password Policy Manager report.
- Added `Publish-SddcManagerPasswordExpiration` cmdlet to retrieve password expiration policy for SDDC Manager and output the details.
- Added `Publish-SddcManagerPasswordComplexity` cmdlet to retrieve password complexity policy for SDDC Manager and output the details.
- Added `Publish-SddcManagerAccountLockout` cmdlet to retrieve account lockout policy for SDDC Manager and output the details.
- Added `Publish-SsoPasswordPolicy` cmdlet to retrieve the requested password policy for vCenter Single Sign-On and output the details.
- Added `Publish-VcenterPasswordExpiration` cmdlet to retrieve password expiration policy for vCenter Server and output the details.
- Added `Publish-VcenterLocalPasswordExpiration` cmdlet to retrieve password expiration policy for Local Users of vCenter Server and output the details.
- Added `Publish-VcenterLocalPasswordComplexity` cmdlet to retrieve password complexity policy for Local Users of vCenter Server and output the details.
- Added `Publish-VcenterLocalAccountLockout` cmdlet to retrieve account lockout policy for Local Users of vCenter Server and output the details.
- Added `Publish-NsxManagerPasswordExpiration` cmdlet to retrieve password expiration policy for NSX Manager and output the details.
- Added `Publish-NsxManagerPasswordComplexity` cmdlet to retrieve password complexity policy for NSX Manager and output the details.
- Added `Publish-NsxManagerAccountLockout` cmdlet to retrieve account lockout policy for NSX Manager and output the details.
- Added `Publish-NsxEdgePasswordExpiration` cmdlet to retrieve password expiration policy for NSX Edge and output the details.
- Added `Publish-NsxEdgePasswordComplexity` cmdlet to retrieve password complexity policy for NSX Edge and output the details.
- Added `Publish-NsxEdgeAccountLockout` cmdlet to retrieve account lockout policy for NSX Edge and output the details.
- Added `Get-PasswordPolicyDefault` cmdlet to retrieve the default password policy settings either to an output or JSON file.
- Added `Start-PasswordPolicyConfig` cmdlet to perform the configuration of password policy across a VMware Cloud Foundation instance.
- Added `Publish-WsaDirectoryPasswordPolicy` cmdlet to retrieve password policies for Workspace ONE Access Local Directory Users and output the details.
- Added `Publish-WsaLocalPasswordPolicy` cmdlet to retrieve password policies for Workspace ONE Access Local Users and output the details.
- Renamed `Get-VCPasswordPolicy` to `Get-VcenterPasswordExpiration` to support better naming for password expiration.  
- Renamed `Set-VCPasswordPolicy` to `Set-VcenterPasswordExpiration` to support better naming for password expiration.  
- Renamed `Get-VCRootPasswordExpiry` to `Get-VcenterRootPasswordExpiration` to support better naming for password expiration.  
- Renamed `Set-VCPasswordExpiry` to `Set-VcenterRootPasswordExpiration` to support better naming for password expiration.
- Renamed `Get-WSAPasswordLockout` to Get-WsaAccountLockout to support better naming for account lockout.
- Renamed `Set-WSAPasswordLockout` to Set-WsaAccountLockout to support better naming for account lockout.
- Enhanced `Set-WsaPasswordPolicy` cmdlet to improve the output from the API.

### Deprecation

- Removed `Get-VCPasswordExpiry`
- Removed `Join-ESXiActiveDirectory`
- Removed `Add-ESXiDomainUser`
- Removed `Set-SRMLicenseConfig`
- Removed `Undo-SRMLicenseConfig`
- Removed `New-vSRPortGroup`
- Removed `Undo-vSRPortGroup`
- Removed `Set-vSRNetworkConfig`
- Removed `Undo-vSRNetworkConfig`
- Removed `New-vSRVMkernelPort`
- Removed `Undo-vSRVMkernelPort`
- Removed `New-vSREsxiStaticRoute`
- Removed `Undo-vSREsxiStaticRoute`
- Removed `Set-vSRIncomingStorageTraffic`
- Removed `Get-vSRIncomingStorageTraffic`
- Removed `Set-DRSolutionNetworkAdapter`
- Removed `Get-DRSolutionSummary`
- Removed `Get-DRSolutionNetworkConfig`
- Removed `Register-DRSolutionTovCenter`
- Removed `Test-VAMIConnection`
- Removed `Test-VAMIAuthentication`
- Removed `createVAMIAuthHeader`
- Removed `Request-VAMISessionId`

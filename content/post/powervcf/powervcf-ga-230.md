+++
author = "GaryJBlake"
title = "PowerVCF v2.3.0 - General Availability"
date = "2023-04-25"
description = "PowerVCF v2.3.0 - General Availability"
tags = [
    "API",
    "PowerShell",
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "PowerVCF"
]
series = [

]
+++

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

It's been a while since the last update but I'm pleased to announce the general availability of PowerVCF v2.3.0 for download from the Microsoft PowerShell Library. PowerVCF is a open source project and the team works on adding support when time permits.

***Download It Here***: [PowerVCF v2.3.0 PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF/2.3.0)

## Additions

* Added region block identifiers for better developer and contributor experience when navigating the PowerShell module code.
* Added [GitHub Pages Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation/docs/) for PowerVCF.
* Added `Get-VCFFipsMode` cmdlet to return the status for FIPS mode.
* Added `Get-VCFRelease` cmdlet to retrieve details for releases.
* Added `Get-VCFCredentialExpiry` cmdlet to retrieve the password expiry details for credentials.
* Added `Get-VCFLicenseMode` cmdlet to retrieve the current license mode of the system & each domain
* Added `New-VCFPersonality` cmdlet to add a new vSphere Lifecycle Manager personality/image in the SDDC Manager inventory from an existing vLCM image based cluster

## Enhancements

* Enhanced `validateJsonInput` cmdlet for consistency across functions.
* Enhanced `Get-VCFDepotCredential` cmdlet to support retrieving the VxRail depot details.
* Updated `New-VCFCluster` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Add-VCFApplicationVirtualNetwork` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Set-VCFBackupConfiguration` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Start-VCFBundleUpload` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Set-VCFCluster` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Set-VCFCredential` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `New-VCFCluster` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Restart-VCFCredentialTask` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `New-VCFWorkloadDomain` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Set-VCFFederation` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `New-VCFCommissionedHost` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Remove-VCFCommissionedHost` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `New-VCFNetworkPool` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `New-VCFEdgeCluster` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Restart-CloudBuilderSDDC` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Start-VCFHealthSummary` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Start-VCFSupportBundle` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Start-VCFSystemPrecheck` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Start-VCFUpgrade` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Set-VCFConfigurationDNS` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Set-VCFConfigurationNTP` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `New-VCFvRSLCM` cmdlet to consume enhanced `validateJsonInput` function.
* Updated `Get-VCFManager` cmdlet synopsis, description and examples.
* Updated `Set-VCFFederation` cmdlet synopsis, description and examples.
* Updated `Get-VCFConfigurationDNSValidation` cmdlets synopsis, description and examples.
* Updated `Get-VCFCertificateCSR` cmdlets synopsis, description and examples.
* Updated `Get-VCFvRLI` cmdlets synopsis, description and examples.
* Updated `README.md`, and added module metadata.

### Release Contributors

**THANK YOU** to the following contributors who helped with this release:

* Ryan Johnson
* Brian O'Connell
* Giuliano Bertello
* Gary Blake

+++
author = "GaryJBlake"
title = "PowerVCF v2.2.0 - General Availability"
date = "2022-05-26"
description = "PowerVCF v2.2.0 - General Availability"
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

It's been a while since the last update but I'm pleased to announce the general availability of PowerVCF v2.2.0 for download from the PowerShell Library. PowerVCF is a open source project and the team works on adding support when time permits.

***Download It Here***: [PowerVCF v2.2.0 PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF/2.2.0)

## Fixes
- Fixed `Get-VCFApplicationVirtualNetwork` cmdlet when passing the ID of the Application Virtual Network the response was failing.

## Enhancements
- Updated `Get-VCFFederation` cmdlet to check the system version, multi-instance management is deprecated in VMware Cloud Foundation v4.4.0.
- Updated `Set-VCFFederation` cmdlet to check the system version, multi-instance management is deprecated in VMware Cloud Foundation v4.4.0.
- Updated `Remove-VCFFederation` cmdlet to check the system version, multi-instance management is deprecated in VMware Cloud Foundation v4.4.0.
- Updated `Get-VCFFederationMember` cmdlet to check the system version, multi-instance management is deprecated in VMware Cloud Foundation v4.4.0.
- Updated `New-VCFFederationInvite` cmdlet to check the system version, multi-instance management is deprecated in VMware Cloud Foundation v4.4.0.
- Updated `Join-VCFFederation` cmdlet to check the system version, multi-instance management is deprecated in VMware Cloud Foundation v4.4.0.
- Updated `Get-VCFFederationTask` cmdlet to check the system version, multi-instance management is deprecated in VMware Cloud Foundation v4.4.0.
- Updated `Request-VCFToken` cmdlet to support -skipCertificateCheck switch and removed the alias for Connect-VCFToken.
- Updated `Connect-CloudBuilder` cmdlet to support -skipCertificateCheck switch.
- Updated `Get-VCFCredentialTask` cmdlet to support -status validation set.

## Additions
- Added `Get-VCFHealthSummaryTask` cmdlet to retrieve health summary tasks
- Added `Start-VCFHealthSummary` cmdlet to start a health check
- Added `Request-VCFHealthSummaryBundle` cmdlet to download the health summary bundle
- Added `Get-VCFSupportBundleTask` cmdlet to retrieve support bundle tasks
- Added `Start-VCFSupportBundle` cmdlet to start a support bundle collection
- Added `Request-VCFSupportBundle` cmdlet to download the support bundle
- Added `Get-VCFPSC` cmdlet to support the retrieval of Platform Services Controllers from the SDDC Manager inventory.
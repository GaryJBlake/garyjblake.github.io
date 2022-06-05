+++
author = "GaryJBlake"
title = "PowerVCF v2.1.7 - General Availability"
date = "2021-11-30"
description = "PowerVCF v2.1.7 - General Availability"
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

I'm pleased to announce the general availability of PowerVCF v2.1.7 for download from the PowerShell Library. PowerVCF is a open source project and the team works on adding support when time permits.

***Download It Here***: [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)

## Fixes
- Fixed `New-VCFCluster`cmdlet where incorrect braces prevented the ability to retrieve response information.

## Enhancements
- Renamed `Set-VCFvRLIConnection` cmdlet from `Set-VCFvRLI` to align with new Get-VCFvRLIConnection cmdlet.
- Renamed `Set-VCFvROPSConnection` cmdlet from `Set-VCFvROPs` to align with new Get-VCFvROPSConnection cmdlet.
- Updated `New-VCFLicenseKey` cmdlet to support additonal license types "WCP", "NSXV", "HORIZON_VIEW".
- Updated `Get-VCFvROPs` cmdlet to display API output in an easier to read format.
- Updated `Get-VCFWSA` cmdlet to display API output in an easier to read format.
- Updated `Get-VCFvRA` cmdlet to display API output in an easier to read format.
- Updated `Get-VCFvRLI` cmdlet to display API output in an easier to read format.

## Additions
- Added `Get-VCFvRLIConnection` cmdlet to get the connection status of VI Workload Domains to vRealize Log Insight.
- Added `Get-VCFvROPSConnection` cmdlet to get the connection status of VI Workload Domains to vRealize Operations Manager.

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

- [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation)
- [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
- [PowerVCF v2.1.7 PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF/2.1.7)
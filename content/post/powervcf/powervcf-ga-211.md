+++
author = "GaryJBlake"
title = "PowerVCF v2.1.1 - General Availability"
date = "2020-12-01"
description = "PowerVCF v2.1.1 - General Availability"
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

I'm pleased to announce the general availability of PowerVCF v2.1.1 for download from the PowerShell Library. PowerVCF is a open source project and the team works on adding support when time permits.

***Download It Here***: [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)

The following table provides a detailed breakdown of all the cmdlet changes for this release.

<!-- wp:table {"className":"is-style-stripes"} -->
<figure class="wp-block-table is-style-stripes"><table><tbody><tr><td><strong>Category</strong></td><td><strong>cmdlet Name</strong></td><td><strong>Description</strong></td><td><strong>Comment</strong></td></tr><tr><td><strong>Users and Groups</strong></td><td>Get-VCFCredential</td><td>Retrieves a list of credentials.</td><td><strong>UPDATE</strong>: Added support for the vRealize credentials</td></tr><tr><td><strong>Bundles</strong></td><td>Start-VCFBundleUpload</td><td>Starts upload of bundle to SDDC Manager</td><td><strong>UPDATE</strong>: Allows the import of a bundle based on offline download.</td></tr><tr><td><strong>Federation</strong></td><td>New-VCFFederationInvite</td><td>Invite new member to VCF Federation</td><td><strong>UPDATE</strong>: Added support to specify if the new system is a MEMBER or CONTROLLER. </td></tr><tr><td><strong>SDDC</strong></td><td>Start-CloudBuilderSDDCValidation</td><td>Starts validation on VMware Cloud Builder</td><td><strong>UPDATE</strong>: Added support for individual validation tasks.</td></tr><tr><td><strong>Workspace ONE Access</strong></td><td>Get-VCFWSA</td><td>Get details of the existing Workspace ONE Access</td><td><strong>NEW</strong></td></tr><tr><td><strong>vRealize Automation</strong></td><td>Get-VCFvRA</td><td>Get details of the the existing vRealize Automation</td><td><strong>NEW</strong></td></tr><tr><td><strong>vRealize Operations</strong></td><td>Get-VCFvROPs</td><td>Get details of the existing vRealize Operations Manager</td><td><strong>NEW</strong></td></tr><tr><td><strong>vRealize Operations</strong></td><td>Set-VCFvROPs</td><td>Connect or disconnect Workload Domains to vRealize Operations Manager</td><td><strong>NEW</strong></td></tr><tr><td><strong>vRealize Log Insight</strong></td><td>Get-VCFvRLI</td><td>Get details of the existing vRealize Log Insight</td><td><strong>NEW</strong></td></tr><tr><td><strong>vRealize Log Insight</strong></td><td>Set-VCFvRLI</td><td>Connect or disconnect Workload Domains to vRealize Log Insight</td><td><strong>NEW</strong></td></tr><tr><td><strong>vRealize Suite Lifecycle</strong></td><td>Get-VCFvRSLCM</td><td>Get details of the existing vRealize Suite Lifecycle Manager</td><td><strong>UPDATE</strong>: Fixed an issue with the API URI and addressed response output</td></tr></tbody></table></figure>
<!-- /wp:table -->

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

- [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation)
- [VMware Cloud Foundation General FAQ](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf)
- [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
- [PowerVCF v2.1.1 PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF/2.1.1)
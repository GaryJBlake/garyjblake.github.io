+++
author = "GaryJBlake"
title = "PowerVCF v1.2.0 - General Availability"
date = "2020-02-29"
description = "PowerVCF v1.2.0 - General Availability"
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

If you follow my posts you will know that in January I posted about the release of PowerVCF which is a PowerShell based CLI that exposes the public APIs of VMware Cloud Foundation to be easily consumed by VI Admins (see [Introducing PowerVCF – Power to VI Admins](/post/powervcf/powervcf-intro)).

As mentioned before PowerVCF is a open source project and the team has been working hard in their spare time to continue to evolve the cmdlets it offers. I'm pleased to announce that as a result of all this hard work we have made v1.2.0 available on the PowerShell Library for download.

***Download It Here***: [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)

#### **What's New in PowerVCF v1.2.0**

The latest release introduces a number of new cmdlets:

<!-- wp:table {"className":"is-style-stripes"} -->
<figure class="wp-block-table is-style-stripes"><table><tbody><tr><td><strong>Category</strong></td><td><strong>cmdlet Name</strong></td><td><strong>Description</strong></td></tr><tr><td><strong>Backup and Restore</strong></td><td>Set-VCFBackupConfiguration</td><td>Configure backup settings for NSX and SDDC manager</td></tr><tr><td><strong>Credentials</strong></td><td>Retry-VCFCredentialTask</td><td>Connects to the specified SDDC Manager and retry a failed rotate/update passwords task</td></tr><tr><td><strong>Credentials</strong></td><td>Get-VCFCredentialTask</td><td>Connects to the specified SDDC Manager and retrieves a list of credential tasks in reverse chronological order</td></tr><tr><td><strong>Federation</strong></td><td>Set-VCFFederation</td><td>Bootstrap a VMware Cloud Foundation to form a federation</td></tr><tr><td><strong>System Prechecks</strong></td><td>Start-PreCheckVCFSystem</td><td>Performs system level health checks</td></tr><tr><td><strong>System Prechecks</strong></td><td>Get-PreCheckVCFSystemTask</td><td>Performs retrieval of a system precheck task that can be polled and monitored</td></tr><tr><td><strong>AVN</strong></td><td>Get-VCFApplicationVirtualNetwork</td><td>Retrieves all Application Virtual Networks</td></tr><tr><td><strong>vRSLCM</strong></td><td>New-VCFvRSLCM</td><td>Deploy vRealize Suite Lifecycle Manager</td></tr><tr><td><strong>vRSLCM</strong></td><td>Remove-VCFvRSLCM</td><td>Remove a failed vRealize Suite Lifecycle Manager deployment</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:list -->
- [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation/)
- [VMware Cloud Foundation General FAQ](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf)
- [VMware Cloud Foundation 3.9 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9/rn/VMware-Cloud-Foundation-39-Release-Notes.html)
- [VMware Cloud Foundation 3.9.1 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9.1/rn/VMware-Cloud-Foundation-391-Release-Notes.html)
- [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
- [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF/1.0)
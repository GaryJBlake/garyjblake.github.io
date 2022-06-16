+++
author = "GaryJBlake"
title = "PowerVCF v2.0.0 - General Availability"
date = "2020-04-28"
description = "PowerVCF v2.0.0 - General Availability"
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

I'm pleased to announce the general availability of PowerVCF v2.0.0 for download from the PowerShell Library. PowerVCF is a open source project and the team works on adding support when time permits.

***Download It Here***: [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)

### What's New in PowerVCF v2.0<

Along with a number of new or modified cmdlets the following enhancements have been made:

<!-- wp:list -->
<ul><li>Grouped cmdlets based on order of API documentation</li><li>Enhancements to reuse duplicate code</li><li>Updated for consistency in the use of code</li><li>Support for the new token-based authentication model</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>The following table provides a detailed breakdown of all the cmdlet changes for this release.</p>
<!-- /wp:paragraph -->

<!-- wp:table {"className":"is-style-stripes"} -->
<figure class="wp-block-table is-style-stripes"><table><tbody><tr><td><strong>Category</strong></td><td><strong>cmdlet Name</strong></td><td><strong>Description</strong></td><td><strong>Comment</strong></td></tr><tr><td><strong>Backup and Restore</strong></td><td>Start-VCFRestore</td><td>Starts the restore process of SDDC Manager</td><td>NEW</td></tr><tr><td><strong>Backup and Restore</strong></td><td>Get-VCFRestoreTasks</td><td>Gets the status of the restore process</td><td>NEW</td></tr><tr><td><strong>Connectivity</strong></td><td>Connect-VCFManager</td><td>Create authentication header for SDDC Manager appliance</td><td>UPDATED - Support the new token / bearer authentication model and basicAuth switch for restore process</td></tr><tr><td><strong>Connectivity</strong></td><td>Connect-CloudBuilder</td><td>Create authentication header for Cloud Builder appliance</td><td>NEW</td></tr><tr><td><strong>Certificates</strong></td><td>Get-VCFCertificateAuthority</td><td>Get Certificate Authority information</td><td>UPDATED - Added support for getting the details by id</td></tr><tr><td><strong>Certificates</strong></td><td>Remove-VCFCertificateAuthority</td><td>Deletes Certificate Authority configuration</td><td>NEW</td></tr><tr><td><strong>Certificates</strong></td><td>Get-VCFCertificate</td><td>View certificate of all the resources in a domain</td><td>UPDATED - Added support for get certificate details by resource</td></tr><tr><td><strong>Credentials</strong></td><td>Get-VCFCredential</td><td>Get the credentials</td><td>UPDATED- Added support for getting the details by id</td></tr><tr><td><strong>Credentials</strong></td><td>Stop-VCFCredentialTask</td><td>Cancels a failed update or rotate passwords task</td><td>RENAMED - From Cancel-VCFCredentialTask</td></tr><tr><td><strong>Credentials</strong></td><td>Restart-VCFCredentialTask</td><td>Retry a failed rotate/update passwords task</td><td>RENAMED - From Retry-VCFCredentialTask</td></tr><tr><td><strong>Hosts</strong></td><td>Commission-VCFHost</td><td>Commissions a list of hosts</td><td>UPDATED - Added support for validating the input spec for host operations (-validate switch)</td></tr><tr><td><strong>NSX-T Edge Clusters</strong></td><td>Get-VCFEdgeCluster</td><td>Get an Edge Cluster</td><td>NEW</td></tr><tr><td><strong>NSX-T Edge Clusters</strong></td><td>New-VCFEdgeCluster </td><td>creates an NSX-T edge cluster</td><td>NEW</td></tr><tr><td><strong>Personalities</strong></td><td>Get-VCFPersonality</td><td>Get the vSphere Lifecycle Manager Personalities</td><td>NEW</td></tr><tr><td><strong>SDDC (Cloud Builder)</strong></td><td>Get-CloudBuilderSDDC</td><td>Retrieve all SDDCs</td><td>NEW</td></tr><tr><td><strong>SDDC (Cloud Builder)</strong></td><td>Start-CloudBuilderSDDC</td><td>Create SDDC</td><td>NEW</td></tr><tr><td><strong>SDDC (Cloud Builder)</strong></td><td>Restart-CloudBuilderSDDC</td><td>Retry failed SDDC creation</td><td>NEW</td></tr><tr><td><strong>SDDC (Cloud Builder)</strong></td><td>Get-CloudBuilderSDDCValidation</td><td>Get all SDDC specification validations</td><td>NEW</td></tr><tr><td><strong>SDDC (Cloud Builder)</strong></td><td>Start-CloudBuilderSDDCValidation</td><td>Validate SDDC specification before creation</td><td>NEW</td></tr><tr><td><strong>SDDC (Cloud Builder)</strong></td><td>Stop-CloudBuilderSDDCValidation</td><td>Cancel SDDC specification validation</td><td>NEW</td></tr><tr><td><strong>SDDC (Cloud Builder)</strong></td><td>Restart-CloudBuilderSDDCValidation</td><td>Retry SDDC validation</td><td>NEW</td></tr><tr><td><strong>System Prechecks</strong></td><td>Start-VCFSystemPrecheck</td><td>Perform System Precheck</td><td>RENAMED - From Start-PreCheckVCFSystem</td></tr><tr><td><strong>System Prechecks</strong></td><td>Get-VCFSystemPrecheckTask</td><td>Get System Precheck Task</td><td>RENAMED - From Get-PreCheckVCFSystemTask</td></tr><tr><td><strong>Tasks</strong></td><td>Restart-VCFTask</td><td>Retry a previously failed task</td><td>RENAMED - From Retry-VCFTask</td></tr><tr><td><strong>Users</strong></td><td>Get-VCFRole</td><td>Get all roles</td><td>NEW</td></tr><tr><td><strong>Users</strong></td><td>Get-VCFUser</td><td>Get all Users</td><td>NEW</td></tr><tr><td><strong>Users</strong></td><td>New-VCFUser</td><td>Adds a new user</td><td>NEW</td></tr><tr><td><strong>Users</strong></td><td>New-VCFServiceUser</td><td>Adds a new service user</td><td>NEW</td></tr><tr><td><strong>Users</strong></td><td>Delete-VCFUser</td><td>Deletes a user</td><td>NEW</td></tr><tr><td><strong>vRealize Suite Lifecycle Manager</strong></td><td>Reset-VCFvRSLCM</td><td>Redeploy vRealize Suite Lifecycle Manager</td><td>NEW</td></tr><tr><td><strong>vRealize Suite Lifecycle Manager</strong></td><td>New-VCFvRSLCM</td><td>Validate the input specification for vRealize Suite Lifecycle Manager deployment</td><td>UPDATED - Added support for validating the json spec (-validate switch).</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li><a rel="noreferrer noopener" href="https://docs.vmware.com/en/VMware-Cloud-Foundation/" target="_blank">VMware Cloud Foundation Documentation</a></li><li><a rel="noreferrer noopener" href="https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf" target="_blank">VMware Cloud Foundation General FAQ</a></li><li><a rel="noreferrer noopener" href="https://docs.vmware.com/en/VMware-Cloud-Foundation/4.0/rn/VMware-Cloud-Foundation-40-Release-Notes.html" target="_blank">VMware Cloud Foundation 4.0 Release Notes</a></li><li><a href="https://powervcf.readthedocs.io/en/latest/" target="_blank" rel="noreferrer noopener">PowerVCF Documentation</a></li><li><a href="https://www.powershellgallery.com/packages/PowerVCF/2.0.0" target="_blank" rel="noreferrer noopener">PowerVCF v2.0 PowerShell Library Download</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->
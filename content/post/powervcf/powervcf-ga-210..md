+++
author = "GaryJBlake"
title = "PowerVCF v2.1.0 - General Availability"
date = "2020-07-23"
description = "PowerVCF v2.1.0 - General Availability"
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

I'm pleased to announce the general availability of PowerVCF v2.1.0 for download from the PowerShell Library. PowerVCF is a open source project and the team works on adding support when time permits.

***Download It Here***: [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)

<!-- wp:heading {"level":3} -->
<h3>What's New in PowerVCF v2.1.0</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Here's a run down of what's new in this release:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>Rename of a few existing cmdlets to align with approved verbs</li><li>Enhancements to execution response messages</li><li>Removal of the use of Write-Host </li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>The following table provides a detailed breakdown of all the cmdlet changes for this release.</p>
<!-- /wp:paragraph -->

<!-- wp:table {"className":"is-style-stripes"} -->
<figure class="wp-block-table is-style-stripes"><table><tbody><tr><td><strong>Category</strong></td><td><strong>cmdlet Name</strong></td><td><strong>Description</strong></td><td><strong>Comment</strong></td></tr><tr><td><strong>Users and Groups</strong></td><td>New-VCFGroup</td><td>Create a Group</td><td>NEW</td></tr><tr><td><strong><strong>Users and Groups</strong></strong></td><td>Get-VCFUser&nbsp;</td><td></td><td></td></tr><tr><td><strong><strong><strong><strong>Users and Groups</strong></strong></strong></strong></td><td>Get-VCFUser&nbsp;</td><td>Get all Users in SDDC Manager</td><td>UPDATED - Support input value of -type (USER, GROUP, SERVICE)</td></tr><tr><td><strong><strong><strong><strong>Users and Groups</strong></strong></strong></strong></td><td>Get-VCFUser</td><td>Get all Users in SDDC Manager</td><td>UPDATED -  Support input value of -domain to retrieve all accounts by domain</td></tr><tr><td><strong>Upgradables</strong></td><td>Get-VCFUpgradable</td><td>Get list of  upgradables</td><td>UPDATED - Improved output</td></tr><tr><td><strong>Upgrades</strong></td><td>Get-VCFUpgrade</td><td>Gets list of upgradable components in the System</td><td>NEW</td></tr><tr><td><strong>Upgrades</strong></td><td>Start-VCFUpgrade</td><td>Starts the upgrade</td><td>NEW</td></tr><tr><td><strong>SDDC</strong></td><td>Restart-CloudBuilderSDDC</td><td>Restarts deployment in Cl;oud </td><td></td></tr><tr><td><strong>General</strong></td><td>Request-VCFToken</td><td>Requests API access &amp; refresh tokens</td><td>UPDATED - Renamed from Connect-VCFManager</td></tr><tr><td><strong>Hosts</strong></td><td>New-VCFCommissionedHost</td><td>Commission a Host</td><td>UPDATED - Renamed from Commission-VCFHost</td></tr><tr><td><strong>Hosts</strong></td><td>Remove-VCFCommissionedHost</td><td>Decommission a Host</td><td>UPDATED - Renamed from Decommission-VCFHost</td></tr><tr><td><strong>DNS and NTP Configuration</strong></td><td>Get-VCFConfigurationDNS</td><td>Gets the current DNS Configuration</td><td>NEW</td></tr><tr><td><strong>DNS and NTP Configuration</strong></td><td>Get-VCFConfigurationDNSValidation</td><td>Get the status of the validation of the input for the DNS Configuration</td><td>NEW</td></tr><tr><td><strong>DNS and NTP Configuration</strong></td><td>Set-VCFConfigurationDNS</td><td>Configures DNS for all systems</td><td>NEW</td></tr><tr><td><strong>DNS and NTP Configuration</strong></td><td>Get-VCFConfigurationNTP&nbsp;</td><td>Gets the current NTP Configuration</td><td>NEW</td></tr><tr><td><strong>DNS and NTP Configuration</strong></td><td>Get-VCFConfigurationNTPValidation</td><td>et the status of the validation of the input for the NTP Configuration</td><td>NEW</td></tr><tr><td><strong><strong>DNS and NTP Configuration</strong></strong></td><td>Set-VCFConfigurationNTP</td><td>Configures NTP for all systems</td><td>NEW</td></tr><tr><td><strong>License Keys</strong></td><td>Get-VCFLicenseKey</td><td>Gets all License Keys in SDDC Manager</td><td>UPDATED - Added -productType and -status as command line inputs</td></tr><tr><td><strong>License Keys</strong></td><td>New-VCFLicenseKey</td><td>Adds a new License Key to SDDC Manager</td><td>UPDATED - No longer requires a JSON spec all command line</td></tr><tr><td><strong>Federation</strong></td><td>Set-VCFFederation</td><td>Bootstrap a VMware Cloud Foundation to form a federation</td><td>UPDATED - Now supports JSON file or a JSON variable as input</td></tr><tr><td><strong>CEIP</strong></td><td>Set-VCFCeip</td><td>Sets the CEIP status (Enabled/Disabled)</td><td>UPDATED - Code improvement and command line inputs for -ceipSetting</td></tr><tr><td><strong>Backup and Restore</strong></td><td>Set-VCFBackupConfiguration</td><td>Configure backup settings for NSX and SDDC manager</td><td>UPDATED - Now supports JSON file or a JSON variable as input</td></tr><tr><td><strong>System Prechecks</strong></td><td>Start-VCFSystemPrecheck</td><td>Starts system level health checks</td><td>UPDATED - Now supports JSON file or a JSON variable as input</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li><a rel="noreferrer noopener" href="https://docs.vmware.com/en/VMware-Cloud-Foundation/" target="_blank">VMware Cloud Foundation Documentation</a></li><li><a rel="noreferrer noopener" href="https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf" target="_blank">VMware Cloud Foundation General FAQ</a></li><li><a rel="noreferrer noopener" href="https://docs.vmware.com/en/VMware-Cloud-Foundation/4.0/rn/VMware-Cloud-Foundation-40-Release-Notes.html" target="_blank">VMware Cloud Foundation 4.0 Release Notes</a></li><li><a rel="noreferrer noopener" href="https://powervcf.readthedocs.io/en/latest/" target="_blank">PowerVCF Documentation</a></li><li><a rel="noreferrer noopener" href="https://www.powershellgallery.com/packages/PowerVCF/2.1.0" target="_blank">PowerVCF v2.1.</a><a href="https://www.powershellgallery.com/packages/PowerVCF/2.1.0" target="_blank" rel="noreferrer noopener">0</a><a rel="noreferrer noopener" href="https://www.powershellgallery.com/packages/PowerVCF/2.1.0" target="_blank"> PowerShell Library Download</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->
+++
author = "GaryJBlake"
title = "PowerVCF v2.0 - Backup and Restore of SDDC Manager - Backup (Part 2)"
date = "2020-05-05"
description = "PowerVCF v2.0 - Backup and Restore of SDDC Manager - Backup (Part 2)"
tags = [
    "API",
    "PowerShell",
    "VCF",
	"Backup",
	"Restore"
]
categories = [
    "VMware Cloud Foundation",
    "PowerVCF"
]
series = [
    "VCF Backup/Restore"
]
+++

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

<!-- wp:paragraph -->
<p>In part two of this blog series, I'm going to take a look at how you perform the backup of  SDDC Manager using PowerVCF v2.0.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Performing a Backup of SDDC Manager</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Procedure</strong></p>
<!-- /wp:paragraph -->

<!-- wp:group -->
<div class="wp-block-group"><!-- wp:paragraph -->
<p>1. Open a PowerShell console and connect to SDDC Manager using the PowerVCF cmdlet <a href="https://powervcf.readthedocs.io/en/latest/functions/Connect-VCFManager/" target="_blank" rel="noreferrer noopener">Connect-VCFManager</a>. Enter the following command:</p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Connect-VCFManager sfo-vcf01.sfo.rainpole.io administrator@vsphere.local VMw@re1!</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":397,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image.png?w=1024" alt="" class="wp-image-397"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>2. Trigger a backup using the PowerVCF cmdlet <a href="https://powervcf.readthedocs.io/en/latest/functions/Backup%20and%20Restore/Start-VCFBackup/" target="_blank" rel="noreferrer noopener">Start-VCFBackup</a>. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Start-VCFBackup</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":416,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-4.png?w=1024" alt="" class="wp-image-416"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>3. Check the status of the task by using the PowerVCF cmdlet <a href="https://powervcf.readthedocs.io/en/latest/functions/Tasks/Get-VCFTask/" target="_blank" rel="noreferrer noopener">Get-VCFTask</a>. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Get-VCFTask -id 5b396a6d-27c4-45d8-b0e5-a2b03b47f145</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":417,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-5.png?w=1024" alt="" class="wp-image-417"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>4. Locate the backup file from the external backup server. This will be located in the /tmp/backups/sddc-manager-backup folder.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":420,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-6.png?w=1024" alt="" class="wp-image-420"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>There you have it that completes the steps for triggering a backup of SDDC Manager with PowerVCF 2.0 using an external backup target.</p>
<!-- /wp:paragraph -->
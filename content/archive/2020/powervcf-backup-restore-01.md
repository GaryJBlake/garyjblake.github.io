+++
author = "GaryJBlake"
title = "PowerVCF v2.0 - Backup and Restore of SDDC Manager - Configuration (Part 1)"
date = "2020-05-04"
description = "PowerVCF v2.0 - Backup and Restore of SDDC Manager - Configuration (Part 1)"
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
<p>In this blog series, I'm going to take a look at how you perform the configuration, backup and restore of SDDC Manager using PowerVCF v2.0. Why use PowerVCF you might be asking well the simple answer is that in order to perform the backup and restore procedures of SDDC Manager you have to use the Public APIs for VMware Cloud Foundation. From a VMware Cloud Foundation documentation perspective the relevant information can be found at the following locations:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>Operations and Administration Guide - <a href="https://docs.vmware.com/en/VMware-Cloud-Foundation/4.0/com.vmware.vcf.admin.doc_40/GUID-E6C56382-1F5D-447E-A295-99684E378854.html" target="_blank" rel="noreferrer noopener">Backing Up and Restoring SDDC Manager and NSX Manager</a></li><li>API Documentation - <a href="https://vdc-download.vmware.com/vmwb-repository/dcr-public/1020677c-5d51-40dc-8967-256fc6429ba0/78a109b8-feea-4021-a095-71be503543c6/index.html#_backup_and_restore">Backup and Restore</a></li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3>Configuring a Backup Target for SDDC Manager</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Part one of this blog series will take a look at configuring SDDC Manager with an external backup target.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>By default following a successful deployment of VMware Cloud Foundation, SDDC Manager is configured to backup to itself, and when you log into the administration user interface a banner message is displayed stating that you should reconfigure. For the purpose of testing I use my VMware Cloud Builder appliance as this is enabled with an SFTP service but before performing the reconfiguration of SDDC Manager I need to perform some additional steps on the VMware Cloud Builder appliance itself.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Procedure</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>1. Connect to the VMware Cloud Builder appliance using and SSH client such as Putty and log in using the admin user.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>2. Create a new local service account called <strong><em>svc-vcf-bck</em></strong>. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo useradd -m -p $(openssl passwd -1 'VMw@re1!') svc-vcf-bck</pre>
<!-- /wp:preformatted -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p><strong>NOTE:</strong> There is a requirement in VMware Cloud Foundation 4.0 where you must have a home directory, this is becuase when the backup API is run it checks for the existence, this is something that will be addressed in the next release. </p></blockquote>
<!-- /wp:quote -->

<!-- wp:paragraph -->
<p>3. Sudo as the new service account and create the target folder for backups. Enter the following commands:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">sudo su - svc-vcf-bck<br>mkdir /tmp/backups</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>4. Create the JSON spec for configuring an external backup target in SDDC Manager. To obtain the sshFingerprint run the following command on the VMware Cloud Builder Appliance and copy / paste into the JSON spec:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">ssh-keygen -lf &lt;(ssh-keyscan -t ssh-rsa -p 22 172.28.211.60 2&gt;/dev/null)</pre>
<!-- /wp:preformatted -->

<!-- wp:group -->
<div class="wp-block-group"><!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "backupLocations": [ {
        "directoryPath": "/tmp/backups/",
        "password": "VMw@re1!",
        "port": 22,
        "protocol": "SFTP",
        "server": "172.28.211.60",
        "sshFingerprint": "SHA256:sptZq0mdjboC9AT8hZ8sz16c1JWIQxaFof/T407RnQg",
        "username": "svc-vcf-bck"
    } ],
    "encryption": {
        "passphrase": "VMw@re1!VMw@re1!"
    }
}</pre>
<!-- /wp:syntaxhighlighter/code --></div>
<!-- /wp:group -->

<!-- wp:paragraph -->
<p>5. Open a PowerShell console and connect to SDDC Manager using the PowerVCF cmdlet <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/Connect-CloudBuilder/" target="_blank" rel="noreferrer noopener">Connect-VCFManager</a></strong>. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Connect-VCFManager sfo-vcf01.sfo.rainpole.io administrator@vsphere.local VMw@re1!</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":397,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image.png?w=1024" alt="" class="wp-image-397"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>6. Configure SDDC Manager with the external backup target using the PowerVCF cmdlet <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/Backup%20and%20Restore/Set-VCFBackupConfiguration%20/" target="_blank" rel="noreferrer noopener">Set-VCFBackupConfiguration</a></strong>. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Set-VCFBackupConfiguration -json E:\MyLab\backupConfiguration.json</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":398,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-1.png?w=1024" alt="" class="wp-image-398"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>7. Check the status of the task by using the PowerVCF cmdlet <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/Tasks/Get-VCFTask/" target="_blank" rel="noreferrer noopener">Get-VCFTask</a></strong>. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Get-VCFTask -id 60f7fc20-ab69-4e51-8730-57258f9af7d7</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":400,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-2.png?w=1024" alt="" class="wp-image-400"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>8. Check the configuration using the PowerVCF cmdlet <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/Backup%20and%20Restore/Set-VCFBackupConfiguration%20/" target="_blank" rel="noreferrer noopener">Get-VCFBackupConfiguration</a></strong>. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Get-VCFBackupConfiguration</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":401,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-3.png?w=1024" alt="" class="wp-image-401"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>There you have it that completes the steps for configuring SDDC Manager to use an external backup source. In my next post I will walk through the process of performing the backup.</p>
<!-- /wp:paragraph -->
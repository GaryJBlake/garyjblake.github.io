+++
author = "GaryJBlake"
title = "PowerVCF v2.0 - Backup and Restore of SDDC Manager - Restore (Part 3)"
date = "2020-05-07"
description = "PowerVCF v2.0 - Backup and Restore of SDDC Manager - Restore (Part 3)"
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
<p>In this part three of this blog series, I'm going to take a look at how you perform the restore of  SDDC Manager using PowerVCF v2.0.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Prerequisites</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In order to perform the restore process you will need the following information:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>Backup file name and location of the backup file.</li><li>Encryption passphrase used to encrypt the backup file (this is the password you set when configuring the external backup target).</li></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3>Performing a Restore of SDDC Manager</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>Procedure</strong></p>
<!-- /wp:paragraph -->

<!-- wp:group -->
<div class="wp-block-group"><!-- wp:paragraph -->
<p>1. First power off the original SDDC Manager virtual appliance and rename the virtual machine in vCenter Server to something like sfo-vcf01-original.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>2. In order to restore SDDC Manager you have to deploy a clean OVA, see 2.14.5. Initiate Restore of SDDC Manager for details on how to obtain the correct OVA file. Then deploy a new SDDC Manager virtual appliance to the vCenter Server. I'm using the OVF Tool for speed, here is the syntax, copy and paste into a command window:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">"C:\Program Files\VMware\VMware OVF Tool\ovftool.exe" --noSSLVerify --skipManifestCheck --powerOn --diskMode=thin --acceptAllEulas --allowExtraConfig --ipProtocol=IPv4 --ipAllocationPolicy=fixedPolicy --prop:ROOT_PASSWORD="VMw@re1!" --prop:VCF_PASSWORD="VMw@re1!" --prop:BASIC_AUTH_PASSWORD="VMw@re1!" --prop:BACKUP_PASSWORD="VMw@re1!" --prop:vami.hostname="sfo-vcf01.sfo.rainpole.io" --prop:guestinfo.ntp="ntp.sfo.rainpole.io" --prop:vami.gateway.SDDC-Manager="172.28.211.1" --prop:vami.domain.SDDC-Manager="sfo.rainpole.io" --prop:vami.searchpath.SDDC-Manager="sfo.rainpole.io,rainpole.io" --prop:vami.DNS.SDDC-Manager="172.28.211.4,172.28.211.5" --prop:vami.ip0.SDDC-Manager="172.28.211.59" --prop:vami.netmask0.SDDC-Manager="255.255.255.0" --datastore="sfo-m01-cl01-ds-vsan01" --name="sfo-vcf01" --network="sfo-m01-cl01-vds01-pg-mgmt" --X:injectOvfEnv --X:waitForIp E:\VCF-SDDC-Manager-Appliance-4.0.0.0-15956695_OVF10.ova "vi://administrator@vsphere.local:VMw@re1!@sfo-m01-vc01.sfo.rainpole.io/sfo-m01-dc01/host/sfo-m01-cl01//Resources/sfo-m01-cl01-rp-sddc-mgmt"</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>3. Verify that the new SDDC Manager appliance has been deployed correctly, ssh in to the VM as the vcf user.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>4. Take a snapshot of the new SDDC Manager virtual appliance.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>5. Transfer into the new SDDC Manager the encrypted backup file to the /tmp directory. Because I'm using VMware Cloud Builder as my external backup target I can transfer directly into the new SDDC Manager virtual appliance. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">scp svc-vcf-bck@172.28.211.60:/tmp/backups/sddc-manager-backup/vcf-backup-sfo-vcf01-sfo-rainpole-io-2020-04-22-15-51-39.tar.gz /tmp</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":430,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-9.png?w=1024" alt="" class="wp-image-430"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>6. Open a PowerShell console and connect to SDDC Manager using the PowerVCF cmdlet Connect-VCFManager. Enter the following command:</p>
<!-- /wp:paragraph --></div>
<!-- /wp:group -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Connect-VCFManager sfo-vcf01.sfo.rainpole.io admin VMw@re1! -basicAuth</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":428,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-7.png?w=1024" alt="" class="wp-image-428"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>7. Trigger a restore using the PowerVCF cmdlet Start-VCFRestore. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Start-VCFRestore -backupFile "/tmp/vcf-backup-sfo-vcf01-sfo-rainpole-io-2020-04-22-15-51-39.tar.gz" -passphrase "VMw@re1!VMw@re1!" </pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":431,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-10.png?w=1024" alt="" class="wp-image-431"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>8. Check the status of the task by using the PowerVCF cmdlet Get-VCFRestoreTask. Enter the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Get-VCFRestoreTask -id 88e05f65-c388-41a2-8b14-4b3a9d6f22d4</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":432,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-11.png?w=1024" alt="" class="wp-image-432"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>9. The restore process takes a little bit if time but repeat step 3 until you have a status of Successful.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>There you have it that completes the steps for triggering a restore of SDDC Man</p>
<!-- /wp:paragraph -->
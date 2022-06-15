+++
author = "GaryJBlake"
title = "PowerVCF - Connect SDDC Manager to the Microsoft Certificate Authority (Part 2)"
date = "2020-01-23"
description = "PowerVCF - Connect SDDC Manager to the Microsoft Certificate Authority (Part 2)"
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
    "VCF Certificate Management"
]
+++

This is the second of five blogs in the series that discusses the process of Certificate Management with VMware Cloud Foundation.

In this post we will look at the process of configuring SDDC Manager integration with the Microsoft Certificate Authority. SDDC Manager must be configured with the Microsoft Certificate Authority so that you can automate the process of generating and replacing signed certificates across the deployed components.

### Connecting SDDC Manager to the Microsoft Certificate Authority using the User Interface

The following procedure demonstrates the process through the SDDC Manager User Interface.

**Procedure**

<!-- wp:list -->
<ul><li>Log in to SDDC Manager using a web browser.<ul><li>Open a Web browser and go to&nbsp;<a href="https://lax01vcf01.lax.rainpole.local/">https://lax01mgr01.lax.rainpole.local</a>.</li><li>Log in using the <a href="mailto:administrator@vsphere.local">administrator@vsphere.local</a> user account</li></ul></li></ul>
<!-- /wp:list -->

<!-- wp:list -->
<ul><li>Navigate to <strong>Administration &gt; Security &gt; Certificate Management</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":181,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-5.png?w=1024" alt="" class="wp-image-181"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><li>Configure the Microsoft Certificate Authority.<ul><li>Click <strong>Edit</strong>.</li><li>Configure the following values and click <strong>Save</strong>.</li></ul></li></ul>
<!-- /wp:list -->

<!-- wp:table -->
<figure class="wp-block-table"><table><tbody><tr><td>Certificate Authority </td><td>Microsoft</td></tr><tr><td>CA Server URL</td><td><a href="https://rpm-dc01.rainpole.local/certsrv">https://rpl-dc01.rainpole.local/certsrv</a></td></tr><tr><td>Username</td><td>administrator</td></tr><tr><td>Password</td><td><em>administrator_password</em></td></tr><tr><td>Template Name</td><td>VMware</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:list -->
<ul><li>In the CA Server Certificate Details dialog, click <strong>Accept</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":195,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-9.png?w=1024" alt="" class="wp-image-195"/></figure>
<!-- /wp:image -->

<!-- wp:heading {"level":4} -->
<h4><strong>Connect SDDC Manager to the Microsoft Certificate Authority using PowerVCF</strong></h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The following procedure demonstrates the process through PowerVCF.</p>
<!-- /wp:paragraph -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p>Assumption: You have already installed or imported PowerVCF on your system.</p></blockquote>
<!-- /wp:quote -->

<!-- wp:paragraph -->
<p><strong>Procedure</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Before performing any operations on SDDC Manager using PowerVCF you must enter the credentials, the PowerVCF cmdlet <strong>Connect-VCFManager</strong> takes these credentials and stores them as a base64 string which is then used for each subsequent cmdlet. Enter the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Connect-VCFManager -fqdn lax01mgr01.lax.rainpole.local -username admin -password "VMw@re1!"</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":189,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-6.png?w=746" alt="" class="wp-image-189"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>The configuration for the Microsoft Certificate Authority can be performed using the <strong>Set-VCFMicrosoftCA</strong> cmdlet. Enter the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Set-VCFMicrosoftCA -serverUrl https://rpl-dc01.rainpole.local/certsrv -username Administrator -password VMw@re1! -templateName VMware</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":190,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-7.png?w=999" alt="" class="wp-image-190"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>We can then verify the configuration using the Get-VCFCertificateAuthConfiguration cmdlet. Enter the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Get-VCFCertificateAuthConfiguration</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":200,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-10.png?w=995" alt="" class="wp-image-200"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>And there we have it, we’ve now configured the Microsoft Certificate Authority in SDDC Manager.</p>
<!-- /wp:paragraph -->

- - -
### Useful Links

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

* [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation/)
* [VMware Cloud Foundation General FAQ](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf)
* [VMware Cloud Foundation 3.9 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9/rn/VMware-Cloud-Foundation-39-Release-Notes.html)
* [VMware Cloud Foundation 3.9.1 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9.1/rn/VMware-Cloud-Foundation-391-Release-Notes.html)
* [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
* [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)
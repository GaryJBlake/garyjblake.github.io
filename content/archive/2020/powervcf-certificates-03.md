+++
author = "GaryJBlake"
title = "PowerVCF - Generate Certificate Signing Request (CSR) Files for Each Component Managed by SDDC Manager (Part 3)"
date = "2020-01-24"
description = "PowerVCF - Generate Certificate Signing Request (CSR) Files for Each Component Managed by SDDC Manager (Part 3)"
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

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

This is the third of five blogs in the series that discusses the process of Certificate Management with VMware Cloud Foundation. The series looks at the end to end process that you follow to take a freshly installed VMware Cloud Foundation platform (Management Domain) and replace the components with signed certificates using a Microsoft Certificate Authority.

In this post we will look at the process of generating the Certificate Signing Request (CSR) files using SDDC Manager.
### Generate Certificate Signing Request (CSR) Files using the User Interface

The following procedure demonstrates the process through the SDDC Manager User Interface.

**Procedure**

<!-- wp:list -->
<ul><li>Log in to SDDC Manager using a web browser.<ul><li>Open a Web browser and go to&nbsp;<a href="https://lax01vcf01.lax.rainpole.local/">https://lax01mgr01.lax.rainpole.local</a>.</li><li>Log in using the <a href="mailto:administrator@vsphere.local">administrator@vsphere.local</a> user account</li></ul></li><li>Navigate to <strong>Inventory &gt; Workload Domains</strong>.</li><li>In the <strong>Workload Domains</strong> window, under <strong>Virtual Infrastructure VI</strong> select <strong>View Details</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":210,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-11.png?w=1024" alt="" class="wp-image-210"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><li>In the <strong>Virtual Infrastructure (VI)</strong> window, select <strong>MGMT</strong> from the <strong>Domain</strong> column.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":211,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-12.png?w=1024" alt="" class="wp-image-211"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><li>Select the <strong>Security</strong> tab.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":212,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-13.png?w=1024" alt="" class="wp-image-212"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><li>Select the checkbox in the table header to select all resource types and click <strong>Generate CSR</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":214,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-14.png?w=1024" alt="" class="wp-image-214"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><li>In the Generate CSR dialog, configure the values as appropriate and click <strong>Generate CSR</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":220,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-16.png?w=497" alt="" class="wp-image-220"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once complete the User Interface is updated with a status message.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":238,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-22.png?w=1024" alt="" class="wp-image-238"/></figure>
<!-- /wp:image -->

<!-- wp:heading {"level":4} -->
<h4>Generate Certificate Signing Request (CSR) Files using using PowerVCF</h4>
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

<!-- wp:paragraph -->
<p>The process of generating the Certificate Signing Request (CSR) files via PowerVCF requires passing a JSON spec containing the required input details as follows:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "csrGenerationSpec": {
        "country": "",
        "email": "",
        "keyAlgorithm": "",
        "keySize": "",
        "locality": "",
        "organization": "",
        "organizationUnit": "",
        "state": ""
    },
    "resources": [ {
        "fqdn": "",
        "name": "",
        "resourceId": "",
        "type": ""
    } ]
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>The <strong>csrGenerationSpec</strong> maps directly to the same details we entered via the User Interface and would look like this:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "csrGenerationSpec": {
        "country": "US",
        "email": "",
        "keyAlgorithm": "RSA",
        "keySize": "2048",
        "locality": "Palo Alto",
        "organization": "VMware",
        "organizationUnit": "HCIBU",
        "state": "CA"
    }
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>Next we need to populate the <strong>resources</strong> part of the JSON spec for each component we want to generate a CSR for. To achieve this we need the following four elements of information for each component:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>fqdn - The fully distinguished domain name as it relates to the information stored in the SDDC Manager inventory.</li><li>name - The hostname which can be derived from the fqdn</li><li>resourceId - The unique id assigned to the component and stored in the SDDC Manager inventory.</li><li>type - The flag to identify what type of component the resources is, SDDC Manager has the following resource types SDDC_MANAGER, PSC, VCENTER, NSX_MANAGER, NSXT_MANAGER, VRA, VRLI, VROPS, VRSLCM, VXRAIL_MANAGER</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>In this example we are going to include VCENTER and SDDC_MANAGER resource types, and using the <strong>Get-VCFvCenter </strong>and <strong>Get-VCFManager </strong>cmdlets we can obtain the fqdn and resourceIds details.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>First lets look at the <strong>Get-VCFvCenter</strong> cmdlet. Enter the following syntax:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Get-VCFvCenter | select id,fqdn</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":227,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-18.png?w=893" alt="" class="wp-image-227"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Using the select command we can return just the id and fqdn details which is all we need for the JSON spec, using this information we can now build the resource section like this:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "csrGenerationSpec": {
        "country": "US",
        "email": "",
        "keyAlgorithm": "RSA",
        "keySize": "2048",
        "locality": "Palo Alto",
        "organization": "VMware",
        "organizationUnit": "HCIBU",
        "state": "CA"
    },
    "resources": [ {
        "fqdn": "lax01m01vc01.lax.rainpole.local",
        "name": "lax01m01vc01",
        "resourceId": "a0652869-dc9b-426a-a9f6-f2866830dceb",
        "type": "VCENTER"
    } ]
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>Next we want to do the same for SDDC Manager using the <strong>Get-VCFManager</strong> cmdlet. Enter the following syntax:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Get-VCFManager | select id,fqdn</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":228,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-19.png?w=894" alt="" class="wp-image-228"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Add this additional information to our JSON spec file as follows, and then save the file in this example I call it <strong>requestCsrSpec.json</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "csrGenerationSpec": {
        "country": "US",
        "email": "",
        "keyAlgorithm": "RSA",
        "keySize": "2048",
        "locality": "Palo Alto",
        "organization": "VMware",
        "organizationUnit": "HCIBU",
        "state": "CA"
    },
    "resources": [ {
        "fqdn": "lax01m01vc01.lax.rainpole.local",
        "name": "lax01m01vc01",
        "resourceId": "a0652869-dc9b-426a-a9f6-f2866830dceb",
        "type": "VCENTER"
    },{
        "fqdn": "lax01mgr01.lax.rainpole.local",
        "name": "lax01mgr01",
        "resourceId": "41290562-a6a5-4d3b-8f3c-25b0dd5535f6",
        "type": "SDDC_MANAGER" 
    } ]
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>Now we have our JSON spec ready we can perform the process of creating the Certificate Signing Request (CSR) files using the <strong>Request-VCFCertificateCSRs</strong> cmdlet. When executing this cmdlet we need to provide two inputs, first the name of the Workload Domain, in this example we are using <strong>MGMT</strong> and the json file we have just created. Enter the following syntax:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Request-VCFCertificateCSRs -domainName MGMT -json E:\MyLab\requestCsrSpec.json</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":234,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-20.png?w=792" alt="" class="wp-image-234"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>After executing this command you are presented with a response which relates to a  Task ID and the status, the generation is pretty quick but you can check the status of the task using the <strong>Get-VCFTask</strong> cmdlet. Enter the following synatx:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Get-VCFTask e87379ea-ad57-422d-bbfa-bff8c39c810a | select id,name,status</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":236,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-21.png?w=994" alt="" class="wp-image-236"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Here we can see a task is named <strong><em>Certificate Operation: GENERATE_CSR</em></strong> and it has a status of <strong><em>SUCCESSFUL</em></strong>. So there you have it we have successfully generated the Certificate Signing Request (CSR) files using PowerVCF.</p>
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
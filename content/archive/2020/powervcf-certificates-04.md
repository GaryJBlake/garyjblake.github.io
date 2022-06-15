+++
author = "GaryJBlake"
title = "PowerVCF - Request Signed Certificates from Microsoft Certificate Authority (Part 4)"
date = "2020-01-29"
description = "PowerVCF - Request Signed Certificates from Microsoft Certificate Authority (Part 4)"
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

This is the fourth of five blogs in the series that discusses the process of Certificate Management with VMware Cloud Foundation.

In this post we will look at the process of requesting the signed certificates from the Microsoft Certificate Authority using SDDC Manager. The high-level process looks like this:

- [Generate Signed Certificates using the User Interface](#generate-signed-certificates-using-the-user-interface)
- [Generate Signed Certificates using using PowerVCF](#generate-signed-certificates-using-using-powervcf)
- [Useful Links](#useful-links)

### Generate Signed Certificates using the User Interface

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
<ul><li>Select the checkbox in the table header to select all resource types and click <strong>Generate Signed Certificates</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":255,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-23.png?w=1024" alt="" class="wp-image-255"/></figure>
<!-- /wp:image -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p><strong>NOTE</strong>: If you have not completed the Generate CSR step then the Generate Signed Certificates option is not available. See my <a href="https://my-cloudy-world.com/2020/01/24/generate-certificate-signing-request-csr-files-for-each-component-managed-by-sddc-manager/">PowerVCF - Generate Certificate Signing Request (CSR) Files for Each Component Managed by SDDC Manager (Part 3)</a> post.</p></blockquote>
<!-- /wp:quote -->

<!-- wp:list -->
<ul><li>In the <strong>Generate Certificates</strong> dialog, using the <strong>Select Certificate Authority</strong> dropdown and select <strong>Microsoft</strong>, then click <strong>Generate Certificates</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":257,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-24.png?w=648" alt="" class="wp-image-257"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once complete the User Interface is updated with a status message of <em>Certificate Generation is successful</em>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":261,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-27.png?w=1024" alt="" class="wp-image-261"/></figure>
<!-- /wp:image -->

### Generate Signed Certificates using using PowerVCF
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
<p>The process of generating the signed certificates via PowerVCF requires passing a JSON spec containing the required input details as follows:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "caType": "",
    "resources": [ {
        "fqdn": "",
        "name": "",
        "resourceId": "",
        "type": ""
    } ]
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>The <strong>caType</strong> element supports only Microsoft or OpenSSL. In this example we will enter Microsoft as follows.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "caType": "Microsoft",
    "resources": [ {
        "fqdn": "",
        "name": "",
        "resourceId": "",
        "type": ""
    } ]
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>Next we need to populate the <strong>resources</strong> part of the JSON spec for each component we want to generate the certificate for. To achieve this we need the following four elements of information for each component (just like we did for generating the CSR files):</p>
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
    "caType": "Microsoft",
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
<p>Add this additional information to our JSON spec file as follows, and then save the file in this example I call it <strong>requestCertificateSpec.json</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "caType": "Microsoft",
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
<p>Now we have our JSON spec ready we can perform the process of creating the signed certificates using the <strong>Request-VCFCertificates</strong> cmdlet. When executing this cmdlet we need to provide two inputs, first the name of the Workload Domain, in this example we are using <strong>MGMT</strong> and the json file we have just created. Enter the following syntax:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Request-VCFCertificate -domainName MGMT -json E:\MyLab\requestCertificateSpec.json</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":259,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-25.png?w=803" alt="" class="wp-image-259"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>After executing this command you are presented with a response which relates to a Task ID and the status of the request, you can check the status of the request using the <strong>Get-VCFTask</strong> cmdlet. Enter the following synatx:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Get-VCFTask 4b8f38fc-3c8f-4df5-9228-639a5af5b5d3 | select id,name,status</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":260,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image-26.png?w=805" alt="" class="wp-image-260"/></figure>
<!-- /wp:image -->

Here we can see a task is named ***Certificate Operation: GENERATE_CERTIFICATE*** and it has a status of ***SUCCESSFUL***. So there you have it we have successfully generated the signed certificates using PowerVCF.

- - -
### Useful Links

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

* [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation/)
* [VMware Cloud Foundation General FAQ](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf)
* [VMware Cloud Foundation 3.9 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9/rn/VMware-Cloud-Foundation-39-Release-Notes.html)
* [VMware Cloud Foundation 3.9.1 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9.1/rn/VMware-Cloud-Foundation-391-Release-Notes.html)
* [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
* [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)
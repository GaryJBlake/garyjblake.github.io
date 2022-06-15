+++
author = "GaryJBlake"
title = "PowerVCF - Install Signed Certificates on Each Component Managed by SDDC Manager (Part 5)"
date = "2020-02-06"
description = "PowerVCF - Install Signed Certificates on Each Component Managed by SDDC Manager (Part 5)"
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

This is the fifth and final blog in this series that discusses the process of Certificate Management with VMware Cloud Foundation.

In this post we will look at the process of installing the signed certificates using SDDC Manager.

### Install Signed Certificates using the User Interface

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
<ul><li>Select the checkbox in the table header to select all resource types and click <strong>Install Certificates</strong>.</li></ul>
<!-- /wp:list -->

<!-- wp:image {"id":274,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image.png?w=1024" alt="" class="wp-image-274"/></figure>
<!-- /wp:image -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p><strong>NOTE</strong>: If you have not completed the Generate CSR and Generate Signed Certificates steps then refer to Parts 3 and Part 4 of this series.</p></blockquote>
<!-- /wp:quote -->

<!-- wp:paragraph -->
<p>Once complete the User Interface is updated with a status message of <em>Certificate Installation is successful</em> along with the message <em>Added root certificate chain to the SDDC Manager keystore, you need to restart the SDDC Manager services manually (refer documentation)</em>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":277,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-1.png?w=1024" alt="" class="wp-image-277"/></figure>
<!-- /wp:image -->

<!-- wp:list -->
<ul><li>Connect to SDDC Manager <a href="http://lax01mgr01.lax.rainpole.local">lax01mgr01.lax.rainpole.local</a> using an SSH client such as Putty.<ul><li>Log in using the <em>vcf</em> user account.</li></ul></li><li>Switch to root using the <em>su</em> command.</li><li>Restart all the SDDC Manager services. Enter the following command and enter Y.</li></ul>
<!-- /wp:list -->

<!-- wp:syntaxhighlighter/code {"lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">/opt/vmware/vcf/operationsmanager/scripts/cli/sddcmanager_restart_services.sh</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":282,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-3.png?w=971" alt="" class="wp-image-282"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Wait for the services to restart, then on logging back into the User Interface you will see the warning message has gone and just the <em>Certificate Installation is successful</em> remains.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":283,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-4.png?w=1024" alt="" class="wp-image-283"/></figure>
<!-- /wp:image -->

<!-- wp:heading {"level":4} -->
<h4>Install Signed Certificates using using PowerVCF</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The following procedure demonstrates the process through PowerVCF.</p>
<!-- /wp:paragraph -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p>Assumption: You have already installed or imported PowerVCF on your system.</p></blockquote>
<!-- /wp:quote -->

**Procedure**

Before performing any operations on SDDC Manager using PowerVCF you must enter the credentials, the PowerVCF cmdlet **Request-VCFToken** takes these credentials and stores them as a base64 string which is then used for each subsequent cmdlet. Enter the following syntax.

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Connect-VCFManager -fqdn lax01mgr01.lax.rainpole.local -username admin -password "VMw@re1!"</pre>
<!-- /wp:syntaxhighlighter/code -->

The process of generating the signed certificates via PowerVCF requires passing a JSON spec containing the required input details as follows:

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "operationType": "",
    "resources": [
        {
            "fqdn": "",
            "name": "",
            "resourceId": "",
	    "type": ""
        }]
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>The <strong>operationType</strong> element supports INSTALL. In our example we will now enter INSTALL as follows.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "operationType": "INSTALL",
    "resources": [
        {
            "fqdn": "",
            "name": "",
            "resourceId": "",
	    "type": ""
        }]
}</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p>Next we need to populate the <strong>resources</strong> part of the JSON spec for each component we want to install the certificate for. To achieve this we need the following four elements of information for each component (just like we did for generating the CSR files and creating the signed certificates):</p>
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
    "operationType": "INSTALL",
    "resources": [
        {
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
<p>Add this additional information to our JSON spec file as follows, and then save the file in this example I call it <strong>updateCertificateSpec.json</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"groovy","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">{
    "operationType": "INSTALL",
    "resources": [
        {
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
<p>Now we have our JSON spec ready we can perform the process of installing the signed certificates using the <strong>Set-VCFCertificate</strong> cmdlet. When executing this cmdlet we need to provide two inputs, first the name of the Workload Domain, in this example we are using <strong>MGMT</strong> and the json file we have just created. Enter the following syntax:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Set-VCFCertificate -domainName MGMT -json E:\MyLab\updateCertificateSpec.json</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":286,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-5.png?w=868" alt="" class="wp-image-286"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>After executing this command you are presented with a response which relates to a Task ID and the status of the request, you can check the status of the request using the <strong>Get-VCFTask</strong> cmdlet. Enter the following syntax:</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell","lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">Get-VCFTask d6c66f48-e95f-4382-8945-45ca2efc12e0 | select id,name,status</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":287,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-6.png?w=792" alt="" class="wp-image-287"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Here we can see a task is named <strong><em>Certificate Operation: REPLACE_CERTIFICATE</em></strong> and it has a status of <strong><em>IN_PROGRESS</em></strong>. This step takes some time as it cycles through the components, you can issue the same <strong>Get-VCFTask</strong> command over and over until the status changes to <em><strong>SUCCESSFUL</strong></em> as follows.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":288,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-7.png?w=805" alt="" class="wp-image-288"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>The final step in the process is to restart the SDDC Manager services.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>Connect to SDDC Manager <a href="http://lax01mgr01.lax.rainpole.local">lax01mgr01.lax.rainpole.local</a> using an SSH client such as Putty.<ul><li>Log in using the <em>vcf</em> user account.</li></ul></li><li>Switch to root using the <em>su</em> command.</li><li>Restart all the SDDC Manager services. Enter the following command and enter Y.</li></ul>
<!-- /wp:list -->

<!-- wp:syntaxhighlighter/code {"lineNumbers":false,"makeURLsClickable":false} -->
<pre class="wp-block-syntaxhighlighter-code">/opt/vmware/vcf/operationsmanager/scripts/cli/sddcmanager_restart_services.sh</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"id":293,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-8.png?w=971" alt="" class="wp-image-293"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>And there you have it we have successfully replaced the vCenter Server and SDDC Manager systems with CA Signed Certificates using both the User Interface and PowerVCF.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>I hope you have found this series of posts helpful.</p>
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
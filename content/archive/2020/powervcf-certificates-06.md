+++
author = "GaryJBlake"
title = "Creating a Service Account for Certificate Management with VMware Cloud Foundation"
date = "2020-02-10"
description = "Creating a Service Account for Certificate Management with VMware Cloud Foundation"
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

Whilst working with VMware Cloud Foundation recently I wanted to implement an additional level of security around the process of certificate management. For those that don't know in the current release in order to integrate SDDC Manager with your Microsoft Certificate Authority you have to enable basic authentication (see [PowerVCF – Configure the Microsoft Certificate Authority for VMware Cloud Foundation Integration (Part 1)](powervcf-certificates-01.md) on reviewing the official documentation I found nothing to explain the minimum requirements as is it related to least privilege access so I set about trying to figure it out. 

What I found is that it is indeed possible but it has to be done in two specific locations as follows:

- [Configure Microsoft Certificate Authority Server](#configure-microsoft-certificate-authority-server)
- [Configure Microsoft Certificate Authority Template](#configure-microsoft-certificate-authority-template)

Let's now take a look at what you need to do. In this example I'm using a dedicated service account called ***svc-mgr-ca*** which is just a Domain User.

### Configure Microsoft Certificate Authority Server

<ul><li>Log in to the Microsoft Certificate Authority server by using a Remote Desktop Protocol (RDP) client.</li><li>Configure least privilege access for svc-mgr-ca on the Microsoft Certificate Authority.<ul><li>Click <strong>Start &gt; Run</strong>, enter <strong>certsrv.msc</strong>, and click <strong>OK</strong>.</li><li>Right-click the certificate authority and click <strong>Properties</strong>.</li><li>Click the <strong>Security</strong> tab, and click <strong>Add</strong>.</li><li>Enter the <em><strong>svc-mgr-ca</strong></em> service account and click <strong>OK</strong>.</li><li>In the <strong>Permissions for svc-mgr-ca</strong> section configure the following permissions and click <strong>OK</strong>.</li></ul></li></ul>
<!-- /wp:list -->

<!-- wp:image {"align":"center","id":304,"sizeSlug":"large"} -->
<figure class="wp-block-image aligncenter size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-11.png?w=403" alt="" class="wp-image-304"/></figure>
<!-- /wp:image -->

### Configure Microsoft Certificate Authority Template

<!-- wp:list -->
<ul><li>Configure least privilege access for svc-mgr-ca on the Microsoft Certificate Authority Template.<ul><li>Click <strong>Start &gt; Run</strong>, enter <strong>certtmpl.msc</strong>, and click <strong>OK</strong>.</li><li>Right-click the <strong>VMware</strong> template and click <strong>Properties</strong>.</li><li>Click the <strong>Security</strong> tab, and click <strong>Add</strong>.</li><li>Enter the <strong><em>svc-mgr-ca</em></strong> service account and click <strong>OK</strong>.</li><li>In the <strong>Permissions for svc-mgr-ca</strong> section configure the following permissions and click <strong>OK</strong>.</li></ul></li></ul>
<!-- /wp:list -->

<!-- wp:image {"align":"center","id":302,"sizeSlug":"large"} -->
<figure class="wp-block-image aligncenter size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/02/image-9.png?w=400" alt="" class="wp-image-302"/></figure>
<!-- /wp:image -->

Now you should be able to configure SDDC Manager to use the svc-mgr-ca service account and perform all certificate operations.

- - -
### Useful Links

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

* [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation/)
* [VMware Cloud Foundation General FAQ](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf)
* [VMware Cloud Foundation 3.9 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9/rn/VMware-Cloud-Foundation-39-Release-Notes.html)
* [VMware Cloud Foundation 3.9.1 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9.1/rn/VMware-Cloud-Foundation-391-Release-Notes.html)
* [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
* [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)
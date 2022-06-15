+++
author = "GaryJBlake"
title = "PowerVCF - Configure the Microsoft Certificate Authority for VMware Cloud Foundation Integration (Part 1)"
date = "2020-01-22"
description = "PowerVCF - Configure the Microsoft Certificate Authority for VMware Cloud Foundation Integration (Part 1)"
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

This is the first of five blogs in a series that discusses Certificate Management with VMware Cloud Foundation.

In this post we will look at the configuration requirements on the Microsoft Certificate Authority server itself, failure to perform these additional configuration steps prior to attempting any procedures within the SDDC Manager User Interface or PowerVCF cmdlets will result in failures.

From a high level this involves performing the following prerequisite configuration tasks:

- [Configure the Microsoft Certificate Authority for Basic Authentication](#configure-the-microsoft-certificate-authority-for-basic-authentication)
- [Create and Add a Microsoft Certificate Authority Template](#create-and-add-a-microsoft-certificate-authority-template)

### Configure the Microsoft Certificate Authority for Basic Authentication

Configure the Microsoft Certificate Authority for Certification Authority Web Enrollment and Basic Authentication, this is a requirement of SDDC Manager to allow it to talk to the Microsoft Certificate Authority to generate the signed certificates automatically.

**Procedure**

1. Log in to the Active Directory server by using a Remote Desktop Protocol (RDP) client.
2. Add Active Directory Certificate Services.
   - Click **Start > Run**, enter **ServerManager**, and click **OK**.
   - From the **Dashboard**, select **Add roles and features**.
   - In the **Before you begin** dialog, click **Next**.
   - In the **Select installation type** dialog, click **Next**.
   - In the **Select destination server** dialog, click **Next**.
   - In the **Select server roles** dialog.
   - Expand **Active Directory Certificate Services**, select **Certification Authority** and **Certification Authority Web Enrollment**.

![](/archive/2020/windows-roles-wizard.png) <figcaption>Add Roles and Features Wizard - Active Directory Certificate Services</figcaption> 

3. Add Basic Authentication Feature to the Web Server (IIS).
   - Expand **Web Server (IIS) > Web Server > Security**, select **Basic Authentication**.
   - Click **Next**.

![](/archive/2020/windows-roles-basicauth.png) <figcaption>Add Roles and Features Wizard - Web Server</figcaption> 

   - In the **Select features** dialog, click **Next**. 
   - In the **Confirm installation selections** dialog, click **Install**.

3. Configure the Certificate Authority Web Service and all sites (including default web site) for basic authentication.
   - Click <strong>Start &gt; Run</strong>, enter&nbsp;<strong>Inetmgr.exe</strong> and click <strong>OK</strong>.
   - Expand <strong>Server &gt; Sites &gt; Default Web Site</strong>, and select <strong>CertSrv.</strong>
   - Under the <strong>IIS</strong> section double-click <strong>Authentication</strong>.
   - Under the <strong>Authentication</strong> widow, right-click <strong>Basic Authentication</strong> and select <strong>Enable</strong>.

4. Restart the site to enable the basic authentication change.
   - In the navigator select <strong>Default Web Site</strong>.
   - In the <strong>Actions</strong> window, under <strong>Manage Website</strong> click <strong>Restart</strong>.

### Create and Add a Microsoft Certificate Authority Template

Next we need to set up a Microsoft Certificate Authority template on the Active Directory (AD) server. The template contains the certificate authority (CA) attributes for signing certificates for the SDDC components. After you create the template, you add it to the certificate templates of the Microsoft Certificate Authority.

**Procedure**

<!-- wp:list -->
<ul><li>Log in to the Active Directory server by using a Remote Desktop Protocol (RDP) client.</li><li>Click <strong>Start &gt; Run</strong>, enter <strong>certtmpl.msc</strong>, and click <strong>OK</strong>.</li><li>In the <strong>Certificate Template Console</strong> window, under <strong>Template Display Name</strong>, right-click <strong>Web Server</strong> and select <strong>Duplicate Template</strong>.</li><li>In the <strong>Duplicate Template</strong> dialog box, and click <strong>OK</strong>.</li><li>In the <strong>Properties of New Template</strong> dialog box, click the <strong>General</strong> tab.</li><li>In the <strong>Template</strong> display name text box, enter <strong>VMware</strong>.</li><li>Click the <strong>Extensions</strong> tab and configure the following.<ul><li>Select <strong>Application Policies</strong> and click <strong>Edit.</strong></li><li>Select <strong>Server Authentication</strong>, click <strong>Remove</strong>, and click <strong>OK</strong>.</li><li>If present, select the <strong>Client Authentication policy</strong>, click <strong>Remove</strong>, and click <strong>OK</strong>.</li><li>Select <strong>Key Usage</strong> and click <strong>Edit.</strong></li><li>Select the <strong>Signature is proof of origin (nonrepudiation)</strong> check box.</li><li>Leave the defaults for all other options.</li><li>Click <strong>OK.</strong></li></ul></li><li>Click the <strong>Subject Name</strong> tab, ensure that the <strong>Supply in the request</strong> option is selected, and click <strong>OK</strong> to save the template.</li><li>Add the new template to the certificate templates of the Microsoft CA.<ul><li>Click <strong>Start &gt; Run</strong>, enter <strong>certsrv.msc</strong>, and click <strong>OK</strong>.</li><li>In the <strong>Certification Authority</strong> window, expand the left pane, right-click <strong>Certificate Templates</strong>, and select <strong>New &gt; Certificate Template to Issue</strong>.</li><li>In the <strong>Enable Certificate Templates</strong> dialog box, select <strong>VMware</strong>, and click <strong>OK</strong>.</li></ul></li></ul>
<!-- /wp:list -->

And there we have it, we've now configured the Microsoft Certificate Authority server with the required configuration changes to allow SDDC Manager the ability to connect and interact.

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

* [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation/)
* [VMware Cloud Foundation General FAQ](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf)
* [VMware Cloud Foundation 3.9 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9/rn/VMware-Cloud-Foundation-39-Release-Notes.html)
* [VMware Cloud Foundation 3.9.1 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9.1/rn/VMware-Cloud-Foundation-391-Release-Notes.html)
* [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
* [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)
+++
author = "GaryJBlake"
title = "PowerVCF - Introduction to Certificate Management with VMware Cloud Foundation"
date = "2020-01-22"
description = "PowerVCF - Introduction to Certificate Management with VMware Cloud Foundation"
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

In this blog series I’m going to explore the capabilities provided in VMware Cloud Foundation that allow you to perform certificate management across components managed by SDDC Manager.

The capability to manage certificates was introduced a number of releases ago but with the release of version 3.9 the ability to perform these same operations were exposed via a number Public APs and now with the introduction of PowerVCF (see [Introducing PowerVCF - Power to VI Admins](/archive/2020/powervcf-intro)) these operations can now be scripted using PowerShell.

This series of blogs will look at the end to end process that you follow to take a freshly installed VMware Cloud Foundation platform (Management Domain) and replace the components with signed certificates from a Microsoft Certificate Authority, this process is valid for other components deployed but for simplicity I’m going to focus on the Management Domain only. From a high-level the process is as follows:

1. [Configure the Microsoft Certificate Authority for VMware Cloud Foundation Integration (Part 1)](/archive/2020/powervcf-certificates-01)
2. [Connect SDDC Manager to the Microsoft Certificate Authority (Part 2)](/archive/2020/powervcf-certificates-02) 
3. [Generate Certificate Signing Request (CSR) Files for Each Component Managed by SDDC Manager (Part 3)](/archive/2020/powervcf-certificates-03)
4. [Request Signed Certificates from Microsoft Certificate Authority (Part 4)](/archive/2020/powervcf-certificates-04)
5. [Install Signed Certificates on Each Component Managed by SDDC Manager (Part 5)](/archive/2020/powervcf-certificates-05)

Each post in the series will focus on one of the specific steps from the above list and will provide the steps as it pertains to both the SDDC Manager User Interface and then the corresponding process using the PowerVCF cmdlets.

- - -
### Useful Links

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

* [VMware Cloud Foundation Documentation](https://docs.vmware.com/en/VMware-Cloud-Foundation/)
* [VMware Cloud Foundation General FAQ](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf)
* [VMware Cloud Foundation 3.9 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9/rn/VMware-Cloud-Foundation-39-Release-Notes.html)
* [VMware Cloud Foundation 3.9.1 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.9.1/rn/VMware-Cloud-Foundation-391-Release-Notes.html)
* [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)
* [PowerVCF PowerShell Library Download](https://www.powershellgallery.com/packages/PowerVCF)
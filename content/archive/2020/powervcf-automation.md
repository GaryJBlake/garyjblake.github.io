+++
author = "GaryJBlake"
title = "Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell"
date = "2020-05-09"
description = "Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell"
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
    "VCF Automation"
]
+++

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

Deploying VMware Cloud Foundation using the Public APIs allows customers to automate tasks, with PowerVCF the capabilities are extended to PowerShell / PowerCLI experts.

As part of an internal project I've been working on recently we have been using PowerShell to help automate some of the repetitive steps whilst performing validation and testing of VMware Cloud Foundation and VMware Validated Design. A key part of this has involved using the cmdlets within PowerVCF, but one of the challenges we face is that a lot of the VMware Cloud Foundation APIs require a JSON spec to be passed as part of the API call.

This means that for each of our physical test beds we have to maintain separate JSON spec files, and some of the JSON specs additionally require unique IDs that have to be obtained from the fresh deployment of VMware Cloud Foundation.

Another disadvantage is that each time we deploy to save on the effort around maintaining these JSON specs the team rely on using the same naming conventions over and over.

This got me thinking that there must be a better way where we could maintain a single source of input dedicated to each physical environment and remove those silly keying mistakes at the same time.

With VMware Cloud Foundation v4.0 / VMware Validated Design v6.0 we introduced a new approach around the Planning and Preparation content where we replaced static web content with an Excel Workbook known as the Planning and Preparation Workbook, the idea behind the Workbook is that it can now be used as a tool for capturing all the input data needed to be successful when deploying either just VMware Cloud Foundation or extending it further with the VMware Validated Design capabilities. For a more detailed explanation check out my friend and colleague [Ken Gould's](https://twitter.com/feardamhan) blog on the topic [VMware Validated Design 6.0 / VMware Cloud Foundation 4.0 Planning & Preparation](https://feardamhan.com/2020/04/17/vmware-validated-design-6-0-vmware-cloud-foundation-4-0-planning-preparation/).

As this pretty much contains everything we need except for passwords I decided to look at ways of generating the JSON specs directly from it.

In the interests of sharing with the wider community, I thought I would write a series of blog posts on the topic and share my code snippets in the hope it may help or inspire others. I hope you find the information useful.

Here are a list of the topics covered:

* [Automating VCF - Deploy Management Domain](/archive/2020/powervcf-automation-01)
* [Automating VCF - Create Network Pool](/archive/2020/powervcf-automation-02)
* [Automating VCF - Commission Hosts](/archive/2020/powervcf-automation-03)
* [Automating VCF - Deploy Workload Domain](/archive/2020/powervcf-automation-04)
* [Automating VCF - Deploy NSX-T Edge Cluster](/archive/2020/powervcf-automation-05)
* [Automating VCF - Deploy vRealize Suite Lifecycle Manager](/archive/2020/powervcf-automation-06)
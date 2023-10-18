+++
author = "GaryJBlake"
title = "Automating the Upgrade of VMware Cloud Foundation with APIs/PowerVCF/PowerShell"
date = "2023-08-24"
description = "Automating the Upgrade of VMware Cloud Foundation with APIs/PowerVCF/PowerShell"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "PowerVCF",
    "PowerShell"
]
series = [
    "VCF Upgrade Automation"
]
+++

**Last Updated:** 21-Sep-2023

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

A couple of years ago I wrote a series of blogs ([see here](/archive/2020/powervcf-automation)) which discussed the process of automating the deployment procedures of VMware Cloud Foundation using the Public APIs, in this new series we will take a look at how we can automate the steps involved in upgrading VMware Cloud Foundation from one release to another.

But before we can begin performing any actual upgrade steps we must carry out some prerequisites which include:

* [Automating VCF Upgrade - Download Release Bundles](/post/vcf/vcf-automated-upgrade-01)
* [Automating VCF Upgrade - Perform Health Checks](/post/vcf/vcf-automated-upgrade-02)

Once these prerequisites are complete we can begin the upgrade process.

* [Automating VCF Upgrade - SDDC Manager](/post/vcf/vcf-automated-upgrade-03)
* [Automating VCF Upgrade - Workload Domains](/post/vcf/vcf-automated-upgrade-04)

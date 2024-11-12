+++
author = "GaryJBlake"
title = "VMware Cloud Foundation and vRealize Suite Flexibility"
date = "2022-07-05"
description = "VMware Cloud Foundation and vRealize Suite Flexibility"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation"
]
series = [

]
+++

With the release of VMware Cloud Foundation 4.4.0, VMware removed a number of the vRealize Suite of products from the Bill of Materials (BoM) with the intent of providing customers more flexibility. For more details refer to **Flexible vRealize Suite product upgrades** of the ***What's New*** section of the [release notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/4.4/rn/vmware-cloud-foundation-44-release-notes/index.html).

Whilst this is great news for our customers, it has led to a bit of confusion. The release notes simply state:

---
**Quote**

*You can use vRealize Suite Lifecycle Manager to deploy vRealize Automation, vRealize Operations Manager, vRealize Log Insight, and Workspace ONE Access. vRealize Suite Lifecycle Manager determines which versions of these products are compatible and only allows you to install/upgrade to supported versions.*
---

The underlying issue here is that customers can no longer use the [Product Interoperability Matrix](https://interopmatrix.vmware.com/Interoperability) to easily identify the correct version mix between VMware Cloud Foundation itself and anything greater than vRealize Suite Lifecycle Manager 8.6.2, this is due to that fact that patches for vRealize Suite Lifecycle Manager are required and these are not part of the search criteria.

In an attempt to help drive clarity a new VMware KB article has been created [KB88829](https://kb.vmware.com/s/article/88829), this can be used to work out the upgrade path for vRealize Suite Lifecycle Manager that is needed to then be able to deploy a later release of vRealize Suite product on top of VMware Cloud Foundation.

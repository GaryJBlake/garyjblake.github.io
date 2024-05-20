+++
author = "GaryJBlake"
title = "VMware Cloud Builder 2.0 - What's New"
date = "2019-03-19"
description = "VMware Cloud Builder 2.0 - What's New"
tags = [
    "Cloud Builder",
    "VVD",
    "VCF"
]
categories = [
    "VMware Cloud Builder",
    "VMware Cloud Foundation",
    "VMware Validated Design"
]
series = [

]
+++

Back in January VMware released VMware Cloud Builder v1.0, today March 19th VMware Cloud Builder v2.0 went GA, this is just a quick write up on the main What's New items for this release. If you didn't see my initial blog article on VMware Cloud Builder v1.0 you can find it [here](/archive/2019/cb-vvd-automation).

### What's New

1. Supports for VMware Cloud Foundation v3.7 and VMware Validated Design v5.0.1 using the same OVA.

With the release of VMware Cloud Builder v2.0 the biggest change is that we now support the automated deployment of both VMware Cloud Foundation and VMware Validated Designs using the same base OVA. When you deploy the OVA you pass a SKU value of vcf for VMware Cloud Foundation, vcf-vxrail for VMware Cloud Foundation on VxRail and vvd for VMware Validated Designs, depending on the value chosen the appliance on first boot will install and configured the correct user interface.

2. Multiple software bundles. In this release we have broken down iso bundle from a single 24GB file into multiple files.

- Contained within the VMware Cloud Builder OVA itself we have the sddc-foundation-bundle.x.x.x.x-xxxxxxxx.iso file which contains the binaries for the foundation layer including ESXi, vCenter, NSX and SDDC Manager. This is used by both VMware Cloud Foundation and VMware Validated Designs.
- The sddc-vrealize-bundle.x.x.x.x-xxxxxxxx.iso file is downloaded separately and contains the binaries for the vRealize Suite and is used by the VMware Validated Designs workflows.
- The sddc-dr-bundle.x.x.x.x-xxxxxxxx.iso file is also downloaded separately and contains the binaries for Site Recovery Manager and vSphere Replication.

### Useful Links

- [VMware Cloud Foundation 3.7 Release Notes](https://docs.vmware.com/en/VMware-Cloud-Foundation/3.7/rn/VMware-Cloud-Foundation-37-Release-Notes.html)
- [VMware Cloud Foundation 3.7.0 Downloads](https://my.vmware.com/web/vmware/details?downloadGroup=VCF370&productId=865&rPId=31418)
- [VMware Validated Design for Software-Defined Data Center 5.0.1 Release Notes](https://docs.vmware.com/en/VMware-Validated-Design/5.0.1/rn/vmware-validated-design-501-release-notes.html)
- [VMware Validated Design 5.0.1 Downloads](https://my.vmware.com/group/vmware/details?downloadGroup=VVD501&productId=845&rPId=31419)
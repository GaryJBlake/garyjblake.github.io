+++
author = "GaryJBlake"
title = "VMware Cloud Builder - Logging and Log Collection"
date = "2019-04-24"
description = "VMware Cloud Builder - Logging and Log Collection"
tags = [
    "Cloud Builder"
]
categories = [
    "VMware Cloud Builder"
]
series = [

]
+++

Back in January VMware released VMware Cloud Builder v1.0, today March 19th VMware Cloud Builder v2.0 went GA, this is just a quick write up on the main What's New items for this relase. If you didn't see my initial blog article on VMware Cloud Builder v1.0 you can find it here https://vmland.blogspot.com/2019/01/introducing-vmware-cloud-builder.html.

What's New
1. Supports for VMware Cloud Foundation 3.7 and VMware Validated Design 5.0.1 using the same OVA. With the release of VMware Cloud Builder v2.0 the biggest change is that we now support the automated deployment of both VMware Cloud Foundation and VMware Validated Designs using the same base OVA. When you deploy the OVA you pass a SKU value of vcf for VMware Cloud Foundation, vcf-vxrail for VMware Cloud Foundation on VxRail and vvd for VMware Validated Designs, depending on the value chosen the appliance on first boot will install and configured the correct user interface.

2. Multiple software bundles. In this release we have broken down iso bundle from a single 24GB file into multiple files.

    Contained within the VMware Cloud Builder OVA itself we have the sddc-foundation-bundle.x.x.x.x-xxxxxxxx.iso file which contains the binaries for the foundation layer including ESXi, vCenter, NSX and SDDC Manager. This is used by both VMware Cloud Foundation and VMware Validated Designs
    The sddc-vrealize-bundle.x.x.x.x-xxxxxxxx.iso file is downloaded separately and contains the binaries for the vRealize Suite and is used by the VMware Validated Designs workflows.
    The sddc-dr-bundle.x.x.x.x-xxxxxxxx.iso file is also downloaded separately and contains the binaries for Site Recovery Manager and vSphere Replication.


Useful Links
VMware Cloud Foundation 3.7 Release Notes
VMware Cloud Foundation 3.7.0 Downloads
VMware Validated Design for Software-Defined Data Center 5.0.1 Release Notes 
VMware Validated Design 5.0.1 Downloads


+++
author = "GaryJBlake"
title = "VMware Validated Design 6.0 - What’s New"
date = "2020-04-14"
description = "VMware Validated Design 6.0 - What’s New"
tags = [
    "VVD"
]
categories = [
    "VMware Validated Design"
]
series = [
    
]
+++

<img align="left" width="200" height="200" src="/images/vvd-icon.png" style="float:left; padding-right:30px" >

On April 14, VMware made VMware Validated Design 6.0 Generally Available (GA), but how does this latest release differ to those before it?

VMware Validated Design is a family of solutions for data center designs that span compute, storage, networking, and management, serving as a blueprint for your Software-Defined Data Center (SDDC) implementation

I will provide a high-level run down of what’s new across the design as follows:

- [Greenfield Deployments Only](#greenfield-deployments-only)
- [Bill of Materials](#bill-of-materials)
- [Planning and Preparation Workbook](#planning-and-preparation-workbook)
- [vSphere 7.0 Design](#vsphere-70-design)
- [vSAN 7.0 Design](#vsan-70-design)
- [NSX-T Data Center 3.0 Design](#nsx-t-data-center-30-design)
- [vRealize Suite 8.1](#vrealize-suite-81)
- [Workspace ONE Access 3.3](#workspace-one-access-33)
- [VMware Cloud Foundation 4.0](#vmware-cloud-foundation-40)
- [Anything Else to be Aware of?](#anything-else-to-be-aware-of)

### Greenfield Deployments Only

The first thing to note is that this release is only for greenfield deployments and does not include an upgrade process from previous versions of the VMware Validated Design at this current time. There are a number of reasons for this but read on to find out more.

### Bill of Materials

One of the most significant changes relates to the Bill of Materials (BoM) and this centers around, vSphere 7.0, NSX-T Data Center 3.0, vRealize Suite 8.1, Workspace ONE Access 3.3, and the most significant change the inclusion of VMware Cloud Foundation 4.0 at the heart of the solution.

### Planning and Preparation Workbook

Starting with this release the static Planning and Preparation document has been ported over into an Excel Workbook, this has been done to enable customers to use it as more of a tool allowing customer inputs along side the VMware Validated Design examples to aid with the deployment process. The workbook is also shared between VMware Cloud Foundation and VMware Validated Design.

### vSphere 7.0 Design

From an vSphere 7.0 architecture perspective the biggest change is the deprecation of external Platform Services Controllers in vCenter Server and as a result all vCenter Servers now use an embedded Platform Services Controller which also means there is no longer a requirement for an NSX based Load Balancer.

### vSAN 7.0 Design

The design changes for VSAN include All-Flash by default and a minimum of two disk groups in line with VMware best practices.

### NSX-T Data Center 3.0 Design

NSX-V has been completely removed, both the Management Domain and Workload Domains now use NSX-T Data Center for all Software-Defined Networking capabilities.

### vRealize Suite 8.1

The design to the vRealize Suite includes vRealize Suite Lifecycle Manager, vRealize Operations Manager, vRealize Log Insight, and vRealize Automation.

The biggest change here is in relation to vRealize Automation where the Windows based DEMs, Orchestrators, and Agents are gone so is the requirement for a Microsoft SQL Server.

There are minimal changes for vRealize Operations Manager and vRealize Log Insight but a point of note is that vRealize Business for Cloud is no longer a part of the solution.

### Workspace ONE Access 3.3

New to the VMware Validated Design we have included Workspace ONE Access to provide a single entry point for authentication from an external provider such as Active Directory. Workspace ONE Access is also used to deliver Role Based Access Control (RBAC) for NSX-T Data Center specifically as without there is no way to provide such controls.

### VMware Cloud Foundation 4.0

Whilst I’ve not mentioned anything about VMware Cloud Foundation 4.0 until now this is probably the most significant change to the VMware Validation Design. From this release forward the design will include VMware Cloud Foundation at the heart, which means that all architecture design elements between what VMware Cloud Foundation implements are 100% aligned with the VMware Validated Design. In a nutshell this means where VMware Cloud Foundation has an automated workflow the end state maps directly to the architecture design documented in the VMware Validated Design Architecture and Design documentation.

More importantly where VMware Cloud Foundation has no automated workflow then the VMware Validated Design will contain complimentary architecture design and deployment guidance covering the gaps

### Anything Else to be Aware of?

- **Multi-Region** - Unfortunately due to constraints in underlying products this release of the VMware Validated Design is only applicable for a single region, the plan is to add multi region support in a future release once support is available.

- **Modular Documentation Structure** - The Architecture and Design, and Deployment Guides are broken up into modular components covering Management Domain, Workload Domain and Cloud Operations and Automation Solution which should make it easier to consume.

- - -
### Useful Links

- [VMware Validated Design Documentation](https://docs.vmware.com/en/VMware-Validated-Design/index.html) 
- [VMware Validated Design 6.0 Release Notes](https://docs.vmware.com/en/VMware-Validated-Design/6.0/rn/vmware-validated-design-60-release-notes.html)
- [Planning and Preparation Workbook](https://docs.vmware.com/en/VMware-Validated-Design/6.0/vmware-validated-design-60-vmware-cloud-foundation-40-sddc-planning-and-preparation-workbook.zip)
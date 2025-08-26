+++
author = "GaryJBlake"
title = "VCF Installer: Streamlining VMware Cloud Foundation Deployments"
date = "2025-06-18"
description = "VCF Installer: Streamlining VMware Cloud Foundation Deployments"
tags = [
    "VCF",
    "VCF Installer"
]
categories = [
    "VMware Cloud Foundation 9.0"
]
series = [

]
+++

### What is the VCF Installer Appliance?

The VCF Installer is a new unified appliance for VMware Cloud Foundation 9.0 which is a direct replacement for VMware Cloud Builder used in previous versions. Developed and delivered as part of the same OVA as SDDC Manager the bring-up capabilities of VMware Cloud Builder have been ported over.

In addition the Deployment Parameter Workbook has been completely deprecated and replaced with a new VCF Installer User Interface.

### What new capabilities does the VCF Installer provide?

One of the main goals of the VCF Installer has been to provide a unified experience across the VMware Cloud Foundation and VMware vSphere Foundation licensing models, and to that end the first capability it provides is the ability to do just that. Either through the Deployment Wizard or via an imported JSON specification file you can perform the initial bring-up of either.

Being a unified installer it’s not just about fresh installations (referred to as greenfield) the VCF Installer also has the capabilities to perform other workflows like expanding your VMware Cloud Foundation platform or converting your existing vSphere platform (referred to as brownfield) into VMware Cloud Foundation. 

And because of this multi-workflow support the VCF Installer can now be used multiple times so if your organisation has a rigorous and time consuming process for adding new applications/appliances into the environment you need only go through that process once.

By introducing a new User Interface at long last the Deployment Parameter Workbook is finally gone and replaced with a user friendly Deployment Wizard providing the ability to perform much needed input validation to help reduce failures during the validation stage.

The scope of what gets deployed by the VCF Installer has also expanded, because VMware Cloud Foundation and VMware vSphere Foundation provide you a license with increased capabilities as part of your purchase VCF Operations and VCF Automation (VMware Cloud Foundation license only) are also deployed during the bring-up process. And because these components are deployed at bring-up time the VCF Installer handles integration automatically drastically reducing post bring-up configuration tasks.

Unified bundle management is a new feature provided with VCF Installer which drastically reduces the overall size of the initial OVA downloaded. In previous versions of VMware Cloud Foundation, VMware Cloud Builder contained all the required binaries to perform bring-up which made the OVA very large and as mentioned with the expanded scope of bring-up it was critical to deliver an alternative way to populate the depot. This new capability not only enables support for downloading only the required binaries for a license model but also means an already deployed VCF Installer maybe able to deploy future releases without the need to replace it (as long as a future release does not require new bring-up functionality).

In addition the binary management component supports online and offline depots with or without proxy requirements as well as full offline binary support for dark sites offering greater support for our most secure customer environments.

### Conclusion

VMware Cloud Foundation 9.0, with the new VCF Installer offers Broadcom customers a far more streamlined deployment process with new capabilities such as:

- Unified experience for VMware Cloud Foundation and VMware vSphere Foundation customers
- Flexible binary management
- Flexible greenfield deployment scenarios
- Support for converting vSphere environments to VMware Cloud Foundation
- Single reusable VCF Installer appliance
- User Interface with improved input validation using a Deployment Wizard
- Support for JSON Specification file uploads

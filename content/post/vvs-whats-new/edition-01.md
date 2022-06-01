+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #1"
date = "2021-10-05"
description = "What's New for VMware Validated Solutions - Edition #1"
tags = [

]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS Whats New",
]
+++

**Last Updated:** 05-Oct-2021

Last month we released VMware Validated Solutions for background reading check out my original post here, this fundamental shift in developing VMware Validated Solutions now allows us to deliver incremental value over time, this is just the first of what I hope to be many updates but I'm really excited to share the following announcements with you all today:

### General Availability of [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)

The Site Protection and Disaster Recovery for VMware Cloud Foundation Validated Solution, illustrates adapting a dual-instance software-defined data center (SDDC), deployed on top of VMware Cloud Foundation, to provide disaster recovery of the vRealize Automation and vRealize Operations Manager components within the Management Domain as well as lay the foundation to protected customer workloads within the VI Workload Domain.

Check out the following blog posts from my colleagues Brian O'Connell and Ken Gould who are the driving force behind the development and delivery of this Validated Solution:

* Ken Gould Blog: [Planning & Preparation for Site Protection and Disaster Recovery with VMware Cloud Foundation](https://feardamhan.com/2021/10/05/planning-and-preparation-for-site-protection-and-disaster-recovery-with-vmware-cloud-foundation/)
* Brian O'Connell Blog: [Site Protection & Disaster Recovery for VMware Cloud Foundation Validated Solution](https://lifeofbrianoc.com/2021/10/05/site-protection-disaster-recovery-for-vmware-cloud-foundation-validated-solution/)

### VMworld Sessions

If you're registered for VMworld 2021, then check out the following sessions for more information on a few of our Validated Solutions, if your not registered for VMworld what are you doing get signed up now!

* [MCL2371] Enabling Security and Automation Services in VMware Cloud Foundation Fleets
* [MCL1544] Meet the Experts: Site Protection and Disaster Recovery for VMware Cloud Foundation
* [MCL1543] Meet the Experts: Intelligent Operations Management for VMware Cloud Foundation

### Added Support for VMware Cloud Foundation 4.3.1

Since the initial release of VMware Validated Solutions, VMware has shipped an updated version of VMware Cloud Foundation. The team has been validating each solution based on VMware Cloud Foundation 4.3.1 and has officially updated the support matrix accordingly for the following Validated Solutions:

* Identity and Access Management for VMware Cloud Foundation
* Develop Ready Infrastructure for VMware Cloud Foundation
* Intelligent Logging and Analytics for VMware Cloud Foundation
* Intelligent Operations Management for VMware Cloud Foundation
* Private Cloud Automation for VMware Cloud Foundation

### Added Support for VMware Cloud Foundation 4.3.0 / 4.3.1 on VxRail

In addition to updated support for VMware Cloud Foundation 4.3.1 we are also delighted to announce support of the following Validated Solutions running on Dell VxRail based systems in addition to vSAN Ready Nodes. We plan to validate the remaining Validated Solutions and update the support status in due course.

* Identity and Access Management for VMware Cloud Foundation
* Develop Ready Infrastructure for VMware Cloud Foundation

### General Availability of PowerValidatedSolutions v1.1.0

And finally I'm excited to share the release of PowerValidatedSolutions v1.1.0, which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed:

* A number of new functions have been added to support automation of the Site Protection and Disaster Recovery solution:
    * `Install-SiteRecoveryManager`
    * `Install-vSphereReplicationManager`
    * `Connect-DRSolutionTovCenter`
    * `Install-VAMICertificate`
    * `Backup-VMOvfProperties`
    * `Restore-VMOvfProperties`
    * `Copy-vRealizeLoadBalancer`
* Added `New-vRSLCMLockerPassword` cmdlet to support adding passwords to the vRealize Lifecycle Suite Manager Locker
* Added `New-vRSLCMLockerLicense` cmdlet to support adding licenses to the vRealize Lifecycle Suite Manager Locker
* Enhanced `Add-VmStartupRule` to check both VM Groups exists before attempting to create the VM-to-VM Group
* Enhanced `Add-ContentLibrary` to support creation of both Published and Subscription Content Libraries
* Added `Add-VmGroup` cmdlet to support adding Virtual Machines to existing VM Groups (Availability Zones in particular)
* Fixed `Set-vCenterPermission` where a failure can occur if the workload domain does not follow the same naming as the vCenter Server
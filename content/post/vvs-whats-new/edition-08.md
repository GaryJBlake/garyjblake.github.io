+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #8"
date = "2022-05-31"
description = "What's New for VMware Validated Solutions - Edition #8"
tags = [

]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS Whats New",
]
+++

**Last Updated:** 31-May-2022

Welcome to Edition #8 of the What's New for VMware Validated Solutions, today we are announcing the following updates:

* Added support for VMware Cloud Foundation 4.4.1
* Additional automation based on the PowerValidatedSolutions v1.7.0 release
* Release of PowerValidatedSolutions v1.7.0, our PowerShell module developed to ensure robustness, consistency, and accelerate implementation

### Added Support for VMware Cloud Foundation 4.4.1
Delighted to announce support for VMware Cloud Foundation 4.4.1.

* [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation)
* [Developer Ready Infrastructure for VMware Cloud Foundation](https://core.vmware.com/developer-ready-infrastructure-vmware-cloud-foundation)
* [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation)
* [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)


### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates

##### [Implementation](https://core.vmware.com/implementation-site-protection-and-disaster-recovery)

**Additional PowerValidatedSolutions Automation**
* Add a Network Adapter and Configure Static Routes for vSphere Replication (***Set-vSRNetworkConfig***)
* Create a VMkernel Adapter on the ESXi Hosts for vSphere Replication Traffic (***New-vSRVMkernelPort***)
* Configure ESXi Host Static Routes for vSphere Replication (***New-vSREsxiStaticRoute***)
* Assign Licenses to Site Recovery Manager (***Set-SRMLicenseConfig***)


### General Availability of PowerValidatedSolutions v1.7.0

Release of [PowerValidatedSolutions v1.7.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.7.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Added `Set-vSRNetworkConfig` cmdlet to configure a secondary ethernet adapter and the required routing for vSphere Replication appliances in the protected and recovery sites
- Added `Undo-vSRNetworkConfig` cmdlet to remove the secondary ethernet adapter and its configuration from vSphere Replication appliances in the protected and recovery sites
- Added `New-vSRVMkernelPort` cmdlet to create VMkernel ports on ESXi hosts for vSphere Replication traffic in the protected and recovery sites.
- Added `Undo-vSRVMkernelPort` cmdlet to remove VMkernel ports on ESXi hosts for vSphere Replication traffic in the protected and recovery sites.
- Added `New-vSREsxiStaticRoute` cmdlet to create a static route on ESXi hosts for vSphere Replication traffic in the protected and recovery sites.
- Added `Undo-vSREsxiStaticRoute` cmdlet to remove a static route on ESXi hosts for vSphere Replication traffic in the protected and recovery sites.
- Added `Set-SRMLicenseConfig` cmdlet to configure the license for Site Recovery Manager in the protected and recovery sites.
- Added `Undo-SRMLicenseConfig` cmdlet to remove the license configuration from Site Recovery Manager in the protected and recovery sites.
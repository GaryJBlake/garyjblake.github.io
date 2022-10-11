+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #10 (Oct 2022)"
date = "2022-10-06"
description = "What's New for VMware Validated Solutions - Edition #10 (Oct 2022)"
tags = [
    "VVS"
]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS Whats New",
]
+++

**Last Updated:** 25-Oct-2022

Welcome to Edition #10 of the What's New for VMware Validated Solutions, today we announced the following updates:

* Added support for VMware Cloud Foundation 4.5.0
* Added automation based on the PowerValidatedSolutions v1.9.0 release
* Release of [PowerValidatedSolutions v1.9.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.9.0), our PowerShell module developed to ensure robustness, consistency, and accelerate implementation

### Added Support for VMware Cloud Foundation 4.5.0

Delighted to announce support for VMware Cloud Foundation 4.5.0.

* Identity and Access Management for VMware Cloud Foundation
* Developer Ready Infrastructure for VMware Cloud Foundation
* Intelligent Logging and Analytics for VMware Cloud Foundation
* Intelligent Operations Management for VMware Cloud Foundation
* Private Cloud Automation for VMware Cloud Foundation
* Site Protection and Disaster Recovery for VMware Cloud Foundation
* Cloud-Based Automation for VMware Cloud Foundation

### Cloud-Based Automation for VMware Cloud Foundation

Delighted to announce the release of a this brand new VMware Validated Solution.

The [Cloud-Based Automation for VMware Cloud Foundation](https://core.vmware.com/cloud-based-automation-vmware-cloud-foundation) validated solution enables customers to consume a cloud-based infrastructure automation platform that delivers an agnostic self-service catalog for VMware Cloud Foundation and multi-cloud environments.

Following the solution guide customers can easily and quickly connect vRealize Automation Cloud to their on-prem VMware Cloud Foundation infrastructure for the provisioning of services. As with all VMware Validated Solutions implementation automation is provided, for this solution through the use of Terraform plans that can be pulled from the [GitHub repository](https://github.com/vmware-samples/validated-solutions-for-cloud-foundation/tree/main/cba)


### Intelligent Operations Management for VMware Cloud Foundation Updates

##### [Implementation](https://core.vmware.com/implementation-intelligent-operations-management)

**Additional PowerValidatedSolutions Automation**
* Create a vCenter Server Single Sign-On User for Integration with vRealize Suite Lifecycle Manager (***Add-SsoUser***)
* Configure Service Account Permissions in vSphere for Integration with vRealize Suite Lifecycle Manager (***Add-vCenterGlobalPermission***)
* Add the vCenter Server Password for the Additional VMware Cloud Foundation Instance to vRealize Suite Lifecycle Manager (***New-vRSLCMLockerPassword***)
* Import the New Certificate for vRealize Operations Manager to vRealize Suite Lifecycle Manager (***Import-vRSLCMLockerCertificate***)


### Private Cloud Automation for VMware Cloud Foundation Updates

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-private-cloud-automation)

**Additional PowerValidatedSolutions Automation**
* Integrate vRealize Automation with vRealize Operations Manager (***New-vRAvROPSIntegrationItem***)
* Update Placement Policy for Cloud Zones in vRealize Automation (***Update-vRACloudAccountZone***)
* Update the vRealize Automation Integration in vRealize Operations Manager (***Update-vROPSvRAAdapterCredential***)
* Verify the Integration of vRealize Operations Manager with vRealize Automation (***Test-vROPsAdapterStatusByType***)


### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates

##### [Detailed Design](https://core.vmware.com/detailed-design-site-protection-and-disaster-recovery)

* Added design decisions on network segments, IP addressing scheme, name resolution, and time synchronization.

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-site-protection-and-disaster-recovery)

**Additional PowerValidatedSolutions Automation**
* Create vSphere Single Sign-On Users for Integration of vRealize Operations Manager with Site Protection and Disaster Recovery Solution Components (***Add-SsoUser***)
* Configure Service Account Permissions in vSphere for the Integration of vRealize Operations Manager with Site Protection and Disaster Recovery Solution Components (***Add-vCenterGlobalPermission***)
* Install the vRealize Operations Manager Management Packs for vSphere Replication and Site Recovery Manager (***Enable-vROPSManagementPack***)


### General Availability of PowerValidatedSolutions v1.9.0

Release of [PowerValidatedSolutions v1.8.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.9.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):


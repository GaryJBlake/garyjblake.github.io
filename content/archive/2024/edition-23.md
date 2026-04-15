+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #23 (March 2024)"
date = "2024-03-25"
description = "What's New for VMware Validated Solutions - Edition #23 (March 2024)"
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

**Last Updated:** 26-Mar-2024

Welcome to Edition #23 of the **What's New for VMware Validated Solutions**, this is the update for March 2024, the highlights of which are:

* Added support for VMware Cloud Foundation 5.1.1 for all VMware Validated Solutions
* Update to password management for the latest Photon OS
* Various enhancements to [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* Various enhancements to [Intelligent Network Visibility for VMware Cloud Foundation](https://core.vmware.com/intelligent-network-visibility-vmware-cloud-foundation)
* Various enhancements to [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* Various enhancements to [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)
* Various enhancements to [Cloud-Based Workload Protection for VMware Cloud Foundation](https://core.vmware.com/cloud-based-workload-protection-vmware-cloud-foundation)
* Various enhancements to [Cloud-Based Ransomware Recovery for VMware Cloud Foundation](https://core.vmware.com/cloud-based-ransomware-recovery-vmware-cloud-foundation)
* Various enhancements to [Cross Cloud Mobility for VMware Cloud Foundation](https://core.vmware.com/cross-cloud-mobility-vmware-cloud-foundation)
* Release of [PowerValidatedSolutions v2.9.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.9.0)

### Added Support for VMware Cloud Foundation 5.1.1

Delighted to announce support for VMware Cloud Foundation 5.1.1 for the following VMware Validated Solutions:

* [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation)
* [Developer Ready Infrastructure for VMware Cloud Foundation](https://core.vmware.com/developer-ready-infrastructure-vmware-cloud-foundation)
* [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation)
* [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* [Intelligent Network Visibility for VMware Cloud Foundation](https://core.vmware.com/intelligent-network-visibility-vmware-cloud-foundation)
* [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)
* [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-and-monitoring-vmware-cloud-foundation)
* [Cloud-Based Workload Protection for VMware Cloud Foundation](https://core.vmware.com/cloud-based-workload-protection-vmware-cloud-foundation)
* [Cloud-Based Ransomware Recovery for VMware Cloud Foundation](https://core.vmware.com/cloud-based-ransomware-recovery-vmware-cloud-foundation)
* [Cross Cloud Mobility for VMware Cloud Foundation](https://core.vmware.com/cross-cloud-mobility-vmware-cloud-foundation)

### Password Management Updates

Several of the virtual appliances have moved from Photon v3 to v4 resulting in changes to the way password complexity and account lockout policies are configured as a result the relevant sections of each validated solution have been modified to reflect the new configuration files. The following VMware Validated Solutions have been updated:

* [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation)
* [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* [Intelligent Network Visibility for VMware Cloud Foundation](https://core.vmware.com/intelligent-network-visibility-vmware-cloud-foundation)
* [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* [Cloud-Based Workload Protection for VMware Cloud Foundation](https://core.vmware.com/cloud-based-workload-protection-vmware-cloud-foundation)

### Intelligent Operations Management for VMware Cloud Foundation

The [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation) validated solution has updated the *Deploy VMware Aria Operations by Using VMware Aria Suite Lifecycle for Intelligent Operations Management for VMware Cloud Foundation* procedure to automatically configure the vSphere Anti-Affinity Rule and removed the manual step *Configure vSphere DRS Anti-Affinity Rules for the VMware Aria Operations Appliances for Intelligent Operations Management for VMware Cloud Foundation*.

The [Implementation](https://core.vmware.com/implementation-intelligent-operations-management) procedures have additional automation provided by PowerValidatedSolutions:

* Configure the VMware Cloud Foundation Integration for Intelligent Operations Management for VMware Cloud Foundation (***Add-vROPSAdapterVcf***)

### Intelligent Network Visibility for VMware Cloud Foundation

The [Intelligent Network Visibility for VMware Cloud Foundation](https://core.vmware.com/intelligent-network-visibility-vmware-cloud-foundation) validated solution now provides guidance on deploying VMware Aria Suite Lifecycle in a disconnected environment. See the following:

* Apply a Product Support Pack to VMware Aria Suite Lifecycle for Intelligent Operations Management for VMware Cloud Foundation

### Private Cloud Automation for VMware Cloud Foundation

The [Implementation](https://core.vmware.com/implementation-private-cloud-automation) procedures have additional automation provided by PowerValidatedSolutions:

* Define Custom Roles in vSphere for VMware Aria Automation and VMware Aria Automation Orchestrator for Private Cloud Automation for VMware Cloud Foundation (***Copy-vSphereRole***)

### Site Protection and Disaster Recovery for VMware Cloud Foundation

The [Implementation](https://core.vmware.com/implementation-site-protection-and-disaster-recovery) procedures have additional automation provided by PowerValidatedSolutions:

* Configure Replication, Create a Protection Group and a Recovery Plan for VMware Aria Suite Lifecycle and Clustered Workspace ONE Access for Site Protection and Disaster Recovery for VMware Cloud Foundation (***Add-vSphereReplication***, ***Add-ProtectionGroup*** and ***Add-RecoveryPlan***)
* Customize the Recovery Plan for VMware Aria Suite Lifecycle and the Clustered Workspace ONE Access for Site Protection and Disaster Recovery for VMware Cloud Foundation (***Set-RecoveryPlan***)
* Configure Replication, Create a Protection Group and a Recovery Plan for VMware Aria Operations Analytics Cluster for Site Protection and Disaster Recovery for VMware Cloud Foundation (***Add-vSphereReplication***, ***Add-ProtectionGroup*** and ***Add-RecoveryPlan***)
* Customize the Recovery Plan for VMware Aria Operations for Site Protection and Disaster Recovery for VMware Cloud Foundation (***Set-RecoveryPlan***)
* Configure Replication, Create a Protection Group and a Recovery Plan for VMware Aria Automation for Site Protection and Disaster Recovery for VMware Cloud Foundation (***Add-vSphereReplication***, ***Add-ProtectionGroup*** and ***Add-RecoveryPlan***)
* Customize the Recovery Plan for VMware Aria Automation for Site Protection and Disaster Recovery for VMware Cloud Foundation (***Set-RecoveryPlan***)

### Cloud-Based Workload Protection for VMware Cloud Foundation

The following updates have been made:

* With the release of VMware Live Recovery, there has been a rebrand across the Validated Solution.
* Added a new section Best Practices for Cloud-Based Workload Protection for VMware Cloud Foundation.

### Cloud-Based Ransomware Recovery for VMware Cloud Foundation

The following updates have been made:

* With the release of VMware Live Recovery, there has been a rebrand across the Validated Solution.
* Added a new section Best Practices for Cloud-Based Ransomware Recovery for VMware Cloud Foundation.

### Cross Cloud Mobility for VMware Cloud Foundation

The [Implementation](https://core.vmware.com/implementation-cross-cloud-mobility) procedures have additional automation provided by PowerValidatedSolutions:

* Define Custom Roles in vSphere for Cross Cloud Mobility for VMware Cloud Foundation (Copy-vSphereRole)

### General Availability of PowerValidatedSolutions v2.9.0

* [Documentation](https://vmware-samples.github.io/power-validated-solutions-for-cloud-foundation/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.9.0)
* [GitHub Project](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)

A PowerShell module that has been written to support the automation of many procedures associated with the implementation of the [VMware Validated Solutions](https://vmware.com/go/vvs) for [VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation).

The module helps reduce human error, delivers consistency and robustness, and accelerates the time-to-deploy these solutions. The module's cmdlets reduce complexity by automating the deployment and configuration steps using the product APIs or command-line tools.

**Release Highlights**

* Added new cmdlets to support OneClick deployments of VMware Validated Solutions
* Various fixes and enhancements

For a full list of changes see the [GitHub Changelog](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation/blob/main/CHANGELOG.md).

+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #22 (January 2024)"
date = "2024-01-30"
description = "What's New for VMware Validated Solutions - Edition #22 (January 2024)"
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

**Last Updated:** 30-January-2024

Welcome to Edition #22 of the **What's New for VMware Validated Solutions**, this is a our first update for 2024 and the team has been busy over the festive period. Highlights include:

* **New Solution** – [Intelligent Network Visibility for VMware Cloud Foundation](https://core.vmware.com/instelligent-network-visibility-vmware-cloud-foundation)
* Architectural change to [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation)
* Multi-instance support for [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-and-monitoring-vmware-cloud-foundation)
* Various enhancements to [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation)
* Various enhancements to [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* Various enhancements to [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* Various enhancements to [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)
* Deprecation of VMware Aria SaaS based validated solutions.
* Release of [PowerValidatedSolutions v2.8.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.8.0)

### Intelligent Network Visibility for VMware Cloud Foundation

Delighted to announce the release of this brand-new VMware Validated Solution.

The [Intelligent Network Visibility for VMware Cloud Foundation](https://core.vmware.com/instelligent-network-visibility-vmware-cloud-foundation) is a well-architected validated solutions that provides information on the use of a network analysis tool, that helps you build an optimized, highly available and secure network infrastructure. The solution provides network visibility and analytics to accelerate micro-segmentation security, minimize risk during application migration, optimize network performance, and confidently manage and scale VMware NSX, VMware SD-WAN, and Kubernetes deployments.

### Identity and Access Management for VMware Cloud Foundation

The [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation) validated solution now updates the design, the implementation, and the operational guidance for the use of Active Directory over LDAP instead of Workspace ONE Access for the authentication provider in NSX.

**NOTE** If you previously deployed this validated solution using Workspace ONE Access for authentication, to reconfigure the authentication provider, see [Authentication Transition for Identity and Access Management for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-identity-and-access-management-v1/GUID-ECEFBA65-96E3-4FA1-85CC-D1E73269D855.html).

### Health Reporting and Monitoring for VMware Cloud Foundation

The [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-and-monitoring-vmware-cloud-foundation) validated solution now supports multiple instances of VMware Cloud Foundation. This is achieved by configuring the second instance of the Python Module for VMware Cloud Foundation Health Monitoring.

<img src="/post/vvs-whats-new/hrm-logical-design.png" alt="Health Reporting and Monitoring for VMware Cloud Foundation - Logical Design" width="600"/>

[Implementation](https://core.vmware.com/implementation-health-reporting-and-monitoring)

The following procedures have been updated accordingly:

* Install and Configure the Python Module for VMware Cloud Foundation Health Monitoring in VMware Aria Operations
* Manually Run the Python Module for VMware Cloud Foundation Health Monitoring in VMware Aria Operations
* Schedule the Python Module for VMware Cloud Foundation Health Reporting in VMware Aria Operations to Run Daily

### Intelligent Logging and Analytics for VMware Cloud Foundation

The [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation) validated solution now updates the design, the implementation, and the operational guidance for the use of Active Directory over LDAP instead of Workspace ONE Access for authentication to VMware Aria Operations for Logs.

**NOTE** If you previously deployed this validated solution using Workspace ONE Access for authentication, to reconfigure the authentication provider, see [Authentication Transition for Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-39802089-E545-4505-9A2D-65FEC7EAF036.html).

The [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation) validated solution now provides guidance on deploying VMware Aria Suite Lifecycle in a disconnected environment. See the following procedures:

* [Implementation of Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-81771A14-7B6F-4280-8904-4A5A34D555EB.html)
* [Deployment of VMware Aria Suite Lifecycle for Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-F078BD7C-AC33-4077-A34E-301070AFD3C6.html)
* [Apply a Product Support Pack to VMware Aria Suite Lifecycle for Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-FBC78C77-F3CD-4848-816F-FCB099EFE27B.html)
* [Install Workspace ONE Access Content Pack for Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-382B19FE-83FC-4375-A5E2-0BF02847F0CC.html)

The [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation) validated solution now updates the password complexity policy configuration for the use of the `pam_pwquality.so` file. See [Configure the Local User Password Complexity Policy for the Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-2C7B6B7A-9F61-4989-9839-68F0C9684D00.html).

The [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation) validated solution now includes [Scale Management for Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-589C5B7B-9363-49FE-AB5E-3A68A63A7FA9.html).

[Implementation](https://core.vmware.com/implementation-intelligent-logging-and-analytics)

Added PowerValidatedSolutions automation to the following procedures:

* Assign VMware Aria Operations for Logs Roles to Active Directory Groups for Intelligent Logging and Analytics for VMware Cloud Foundation (***Add-vRLIAuthenticationGroup***)
* Create a vSphere Content Library for Operational Management for Intelligent Logging and Analytics for VMware Cloud Foundation (***Add-ContentLibrary***)
* Apply a Product Support Pack to VMware Aria Suite Lifecycle for Intelligent Logging and Analytics for VMware Cloud Foundation (***Update-vRSLCMPSPack***)
* Install Workspace ONE Access Content Pack for Intelligent Logging and Analytics for VMware Cloud Foundation (***Enable-vRLIContentPack***)

### Intelligent Operations Management for VMware Cloud Foundation

The [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation) validated solution now provides guidance on deploying VMware Aria Suite Lifecycle in a disconnected environment. See the following:

* [Implementation of Intelligent Operations Management for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-operations-management-v1/GUID-459AFD5B-8B4C-4943-A61D-3AF21693EAF9.html)
* [Deployment of VMware Aria Suite Lifecycle and Workspace ONE Access for Intelligent Operations Management for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-operations-management-v1/GUID-131C1836-1C90-4657-86A0-F80E613B726B.html)
* [Apply a Product Support Pack to VMware Aria Suite Lifecycle for Intelligent Operations Management for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-operations-management-v1/GUID-E7667AE6-BC17-4DE2-A211-95D62C80DE83.html)

The [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation) validated solution now updates the Deploy VMware Aria Operations by Using VMware Aria Suite Lifecycle for Intelligent Operations Management for VMware Cloud Foundation procedure, adding automatic configuration of a Load Balancer for VMware Aria Operations.

The [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation) validated solution now updates the password complexity policy configuration for the use of the `pam_pwquality.so file. See [Configure the Local User Password Complexity Policy for Intelligent Operations Management for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-operations-management-v1/GUID-0413FF2C-0911-41EE-B157-CED471A88539.html).

[Implementation](https://core.vmware.com/implementation-intelligent-operations-management)

Added PowerValidatedSolutions automation to the following procedures:

* Create a vSphere Content Library for Intelligent Operations Management for VMware Cloud Foundation (***Add-ContentLibrary***)
* Apply a Product Support Pack to VMware Aria Suite Lifecycle for Intelligent Operations Management for VMware Cloud Foundation (***Update-vRSLCMPSPack***)
* Prepare the NSX to VMware Aria Operations Integration for Intelligent Operations Management for VMware Cloud Foundation (***Add-NsxtPrincipalIdentity***)

### Private Cloud Automation for VMware Cloud Foundation

The [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation) validated solution now provides guidance on deploying VMware Aria Suite Lifecycle in a disconnected environment. See the following:

* [Implementation of Private Cloud Automation for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-private-cloud-automation-v1/GUID-01B06797-B673-4FB9-9881-FF1C5A8038F1.html)
* [Deployment of VMware Aria Suite Lifecycle and Workspace ONE Access for Private Cloud Automation for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-private-cloud-automation-v1/GUID-F9232A8B-69C8-4358-BC64-F9F186C04968.html)
* [Apply a Product Support Pack to VMware Aria Suite Lifecycle for Private Cloud Automation for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-private-cloud-automation-v1/GUID-B6679F8F-9519-421F-A3B9-A63F600E09FC.html)

The [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation) validated solution now includes guidance on password policy management and configuration.

The [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation) validated solution now updates the Deploy VMware Aria Automation by Using VMware Aria Suite Lifecycle for Private Cloud Automation for VMware Cloud Foundation procedure, adding an automated configuration of a Load Balancer for VMware Aria Automation.

[Implementation](https://core.vmware.com/implementation-private-cloud-automation)

Added PowerValidatedSolutions automation to the following procedures:

* Create a vSphere Content Library for Operational Management for Private Cloud Automation for VMware Cloud Foundation (***Add-ContentLibrary***)
* Apply a Product Support Pack to VMware Aria Suite Lifecycle for Private Cloud Automation for VMware Cloud Foundation (***Update-vRSLCMPSPack***)
* Configure Service Account Permissions for the VMware Aria Automation to NSX Integration on the VI Workload Domain NSX Manager Cluster for Private Cloud Automation (***Add-NsxtPrincipalIdentity***)

### Site Protection and Disaster Recovery for VMware Cloud Foundation

The [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation) validated solution now includes guidance on password policy management and configuration.

### Deprecation of VMware Aria SaaS based validated solutions

Following recent announcements from VMware concerning the simplifiation of packaging (see [Dramatic Simplification of VMware Aria as part of VMware Cloud Foundation](https://blogs.vmware.com/management/2024/01/dramatic-simplification-of-vmware-aria-as-part-of-vmware-cloud-foundation.html)) with immediate effect we have deprecated the following validated solutions:

* Cloud-Based Intelligent Logging for VMware Cloud Foundation
* Cloud-Based Intelligent Operations for VMware Cloud Foundation
* Cloud-Based Network Visibility for VMware Cloud Foundation
* Cloud-Based Automation for VMware Cloud Foundation

### General Availability of PowerValidatedSolutions v2.8.0

* [Documentation](https://vmware-samples.github.io/power-validated-solutions-for-cloud-foundation/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.8.0)
* [GitHub Project](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)

A PowerShell module that has been written to support the automation of many procedures associated with the implementation of the [VMware Validated Solutions](https://vmware.com/go/vvs) for [VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation).

The module helps reduce human error, delivers consistency and robustness, and accelerates the time-to-deploy these solutions. The module's cmdlets reduce complexity by automating the deployment and configuration steps using the product APIs or command-line tools.

**Release Highlights**

* Added documentation for each cmdlet available from `Get-Help` and the module's [online documentation](https://vmware.github.io/power-validated-solutions-for-cloud-foundation/).
* Added new cmdlets to support OneClick deployments of VMware Validated Solutions.
* Added new cmdlets to support creating NSX LDAP Identity Providers and NSX Principal Identity management.
* Added new cmdlets to support creating LDAP identity source for VMware Aria Operations for Logs.
* Added new cmdlets to support the creating of a Load Balancer in VMware Aria Suite Lifecycle.
* Added new cmdlets to support system management tasks for VMware Aria Suite Lifecycle.
* Added new cmdlets to support replication, protection group and recovery plan creation for vSphere Replication and Site Recovery Manager.

For a full list of changes see the [GitHub Changelog](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation/blob/main/CHANGELOG.md).

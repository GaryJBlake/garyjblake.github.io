+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #19 (August 2023)"
date = "2023-08-25"
description = "What's New for VMware Validated Solutions - Edition #19 (August 2023)"
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

**Last Updated:** 29-August-2023

Welcome to Edition #19 of the **What's New for VMware Validated Solutions**, today we announced the following updates:

* **New Solution** – [Cloud-Based Workload Protection for VMware Cloud Foundation](https://core.vmware.com/cloud-based-workload-protection-vmware-cloud-foundation)
* Added support for VMware Cloud Foundation 4.5.2 for all VMware Validated Solutions
* Enhancements to [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
  * Added password policy management design and operational guidance
  * Added use of VMware Cloud Foundation management pack design and implementation
* Enhancements to [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-and-monitoring-vmware-cloud-foundation)
  * Utilization of VMware Cloud Foundation management pack metrics and dashboards
  * Release of Python Module for VMware Cloud Foundation Health Monitoring in vRealize Operations v2.0.0
* Open-source Projects
  * Release of [PowerValidatedSolutions v2.6.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.6.0)
  * Release of [VMware.CloudFoundation.Reporting v2.4.0](https://www.powershellgallery.com/packages/VMware.CloudFoundation.Reporting/2.4.0)
  * Release of [VMware.CloudFoundation.CertificateManagement v1.3.0](https://www.powershellgallery.com/packages/VMware.CloudFoundation.CertificateManagement/1.3.0)
  * Release of [VMware.CloudFoundation.PasswordManagement v1.4.0](https://www.powershellgallery.com/packages/VMware.CloudFoundation.PasswordManagement/1.4.0)

### Cloud-Based Workload Protection for VMware Cloud Foundation

We are delighted to announce the release of this brand-new VMware Validated Solution.

The [Cloud-Based Workload Protection for VMware Cloud Foundation](https://core.vmware.com/cloud-based-workload-protection-vmware-cloud-foundation) is a VMware Cloud Well-Architected Validated Solutions that enables customers to protect and recover business workloads running on a VMware Cloud Foundation instance to VMware Cloud on AWS using the VMware Cloud Disaster Recovery and VMware HCX.

### Added Support for VMware Cloud Foundation 4.5.2

Delighted to announce support for VMware Cloud Foundation 4.5.2 for all VMware Validated Solutions:

* [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation)
* [Developer Ready Infrastructure for VMware Cloud Foundation](https://core.vmware.com/developer-ready-infrastructure-vmware-cloud-foundation)
* [Cloud-Based Intelligent Logging for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-logging-vmware-cloud-foundation)
* [Cloud-Based Intelligent Operations for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-operations-vmware-cloud-foundation)
* [Cloud-Based Automation for VMware Cloud Foundation](https://core.vmware.com/cloud-based-automation-vmware-cloud-foundation)
* [Cloud-Based Network Visibility for VMware Cloud Foundation](https://core.vmware.com/cloud-based-network-visibility-vmware-cloud-foundation)
* [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation)
* [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)
* [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-and-monitoring-vmware-cloud-foundation)

### Intelligent Operations Management for VMware Cloud Foundation

[Detailed Design](https://core.vmware.com/detailed-design-intelligent-logging-and-analytics)

Updated the design to cover:

* VMware Cloud Foundation integration using the VMware Cloud Foundation management pack.
* Service account configuration in conjunction with the VMware Cloud Foundation management pack
* Password Policy for vRealize Operations covering password expiration, password complexity and account lockout.

And removed design around using the SDDC Health Monitoring Solution and associated design aspects.

[Implementation](https://core.vmware.com/implementation-intelligent-logging-and-analytics)

Added the following procedures:

* Prepare the VMware Cloud Foundation Instance for Intelligence Operations Management
  * Assign SDDC Manager Role to a Service Account for Intelligent Operations Management for VMware Cloud Foundation
  * Define a Custom Role in vSphere for Intelligent Operations Management for VMware Cloud Foundation
  * Configure Service Account Permissions for vSphere Integration for Intelligent Operations Management for VMware Cloud Foundation
  * Prepare the NSX to vRealize Operations Integration for Intelligent Operations Management for VMware Cloud Foundation
* Activate the VMware Cloud Foundation Functionality in vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation
  * Remove Existing vCenter Server Adapter in vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation
  * Activate the VMware Cloud Foundation Integration for Intelligent Operations Management for VMware Cloud Foundation
  * Configure Credentials for SDDC Components in vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation
  * Configure the VMware Cloud Foundation Integration for Intelligent Operations Management for VMware Cloud Foundation
* Enable VMware Cloud Foundation Integration for the Additional VMware Cloud Foundation Instance in vRealize Operations

Removed the following procedures:

* Connect vRealize Operations to the VI Workload Domains in the First VMware Cloud Foundation Instance
* Modify the vCenter Server Adapters for the First VMware Cloud Foundation Instance in vRealize Operations
* Add NSX Adapters in vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation
* Activate SDDC Health Monitoring in vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation
* Install the SDDC Health Monitoring Solution in vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation
* Rename the SDDC Health Adapters for the vRealize Operations Analytics Cluster Nodes for Intelligent Operations Management for VMware Cloud Foundation
* Add SDDC Health Adapters for the vRealize Operations Cloud Proxy Appliances for Intelligent Operations Management for VMware Cloud Foundation

[Operational Guidance](https://core.vmware.com/operational-guidance-intelligent-logging-and-analytics)

Added the following procedures:

* Configuring Password Policies for Intelligent Operations Management for VMware Cloud Foundation
  * Configure the Local User Password Expiration Policy for Intelligent Operations Management for VMware Cloud Foundation
  * Configure the Local User Password Complexity Policy for Intelligent Operations Management for VMware Cloud Foundation
  * Configure the Local User Account Lockout Policy for Intelligent Operations Management for VMware Cloud Foundation
* Password Rotation and Remediation for Intelligent Operations Management for VMware Cloud Foundation
  * Schedule Password Rotation for Intelligent Operations Management for VMware Cloud Foundation
  * Rotate an Account Password by Using SDDC Manager for Intelligent Operations Management for VMware Cloud Foundation
  * Update an Account Password Using SDDC Manager for Intelligent Operations Management for VMware Cloud Foundation
  * Password Remediation for Intelligent Operations Management for VMware Cloud Foundation
* Verify the Collection Status of Adapters in vRealize Operations

### General Availability of PowerValidatedSolutions v2.6.0

* [Documentation](https://vmware-samples.github.io/power-validated-solutions-for-cloud-foundation/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.6.0)
* [GitHub Project](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)

A PowerShell module that has been written to support the automation of many procedures associated with the implementation of the [VMware Validated Solutions](https://vmware.com/go/vvs) for [VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation).

The module helps reduce human error, delivers consistency and robustness, and accelerates the time-to-deploy these solutions. The module's cmdlets reduce complexity by automating the deployment and configuration steps using the product APIs or command-line tools.

**Release Highlights**

* Added VMware Cloud Foundation 4.5.2 support to vRealize Suite functions
* Added functions to support vRealize Log Insight alert configuration
* Bug fixes

For a full list of changes see the [GitHub Changelog](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation/blob/main/CHANGELOG.md).

### General Availability of VMware.CloudFoundation.Reporting v2.4.0

* [Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation-reporting/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/VMware.CloudFoundation.Reporting/2.4.0)
* [GitHub Project](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting)

A PowerShell module that has been written to support the ability to provide insight to the operational state of VMware Cloud Foundation using PowerShell cmdlets. These cmdlets provide quick access to information from the PowerShell console as well as the ability to publish pre-defined HTML reports.

**Release Highlights**

* Bug fixes

For a full list of changes see the [GitHub Changelog](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting/blob/main/CHANGELOG.md).

### General Availability of VMware.CloudFoundation.CertificateManagement v1.3.0

* [Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation-certificate-management/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/VMware.CloudFoundation.CertificateManagement/1.3.0)
* [GitHub Project](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-certificate-management/)

A PowerShell module that has been written to support the ability to manage ESXi host certificates across your VMware Cloud Foundatiоn instance.

**Release Highlights**

* Enhancements to test functions
* Added support for configuring Microsoft Certificate Authority in SDDC Manager
* Added support for replacing certificates for components managed by SDDC Manager

For a full list of changes see the [GitHub Changelog](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-certificate-management/blob/main/CHANGELOG.md).

### General Availability of VMware.CloudFoundation.PasswordManagement v1.4.0

* [Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation-password-management/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/VMware.CloudFoundation.PasswordManagement/1.4.0)
* [GitHub Project](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management/)

A PowerShell module that has been written to support the ability to report and configure the password policy settings across your VMware Cloud Foundation instance.

**Release Highlights**

* Enhancements for managing SDDC Manager password expiration policy
* Bug fixes

For a full list of changes see the [GitHub Changelog](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management/blob/main/CHANGELOG.md).

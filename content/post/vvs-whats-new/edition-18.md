+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #18 (July 2023)"
date = "2023-07-25"
description = "What's New for VMware Validated Solutions - Edition #18 (July 2023)"
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

**Last Updated:** 25-July-2023

Welcome to Edition #18 of the **What's New for VMware Validated Solutions**, today we announced the following updates:

* Added support for VMware Cloud Foundation 5.0.0 for the remaining VMware Validated Solutions
* Added guidance for vRealize Suite Lifecycle Manager Upgrade to vRealize Suite based VMware Validated Solutions
* Added enhancements to [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* Open-source Projects
  * Release of [PowerValidatedSolutions v2.5.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.5.0)
  * Release of [VMware.CloudFoundation.Reporting v2.3.0](https://www.powershellgallery.com/packages/VMware.CloudFoundation.Reporting/2.3.0)
  * Release of [VMware.CloudFoundation.CertificateManagement v1.2.0](https://www.powershellgallery.com/packages/VMware.CloudFoundation.CertificateManagement/1.2.0)
  * Release of [VMware.CloudFoundation.PowerManagement v1.2.0](https://www.powershellgallery.com/packages/VMware.CloudFoundation.PowerManagement/1.2.0)

### Added Support for VMware Cloud Foundation 5.0.0

Delighted to announce support for VMware Cloud Foundation 5.0.0 for the remaining VMware Validated Solutions:

* [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation)
* [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation)
* [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)
* [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-monitoring-vmware-cloud-foundation)

### vRealize Suite Lifecycle Manager Upgrade

Almost a year ago now VMware Cloud Foundation introduced the concept of a flexible bill of materials (BoM) for the vRealize Suite of products, what this essential meant was that other than vRealize Suite Lifecycle Manager no other vRealize Suite product are defined based on the VMware Cloud Foundation release BoM. This has been great for customers as they have been able to move faster through releases without the need to wait for an upgrade of VMware Cloud Foundation, the only limitation being that they are tied to what vRealize Suite Lifecycle Manager supports based on what product support pack is installed.

Getting a customer to the latest supported product is now confusing with multiple releases and product support packs that are available and for the VMware Validated Solutions its getting hard to keep track of the various procedures based on product versions as minor changes come in around the UI procedures.

For this release we took the decision to provide additional content to help customers get to a defined starting point regardless of VMware Cloud Foundation they are implementing (v4.5.1 or v5.0.0), for this a new section has been added prior to implementing the main components of the solution where we direct you to the correct content for performing the tasks required to get vRealize Suite Lifecycle Manager to v8.10.0 Patch 1 with product support pack 14.

### Intelligent Operations Management for VMware Cloud Foundation

[Detailed Design](https://core.vmware.com/detailed-design-intelligent-logging-and-analytics)

Updates to the following design decisions:

* Moved from Remote Collectors to Cloud Proxies
* Enable Data Persistency on the Cloud Proxies

### General Availability of PowerValidatedSolutions v2.5.0

* [Documentation](https://vmware-samples.github.io/power-validated-solutions-for-cloud-foundation/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.5.0)
* [GitHub Project](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)

A PowerShell module that has been written to support the automation of many procedures associated with the implementation of the [VMware Validated Solutions](https://vmware.com/go/vvs) for [VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation).

The module helps reduce human error, delivers consistency and robustness, and accelerates the time-to-deploy these solutions. The module's cmdlets reduce complexity by automating the deployment and configuration steps using the product APIs or command-line tools.

**Release Highlights**

* Support for API token bearer authentication for vRealize Log Insight
* Enhancements to connection tests to avoid ICMP
* Updates to sample scripts to support VMware Cloud Foundation 5.0

For a full list of changes see the [GitHub Changelog](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation/blob/main/CHANGELOG.md).

### General Availability of VMware.CloudFoundation.Reporting v2.3.0

* [Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation-reporting/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/VMware.CloudFoundation.Reporting/2.3.0)
* [GitHub Project](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting)

A PowerShell module that has been written to support the ability to provide insight to the operational state of VMware Cloud Foundation using PowerShell cmdlets. These cmdlets provide quick access to information from the PowerShell console as well as the ability to publish pre-defined HTML reports.

**Release Highlights**

* Documentation updates
* Improvements concerning loading and checking of required modules
* Bug fixes

For a full list of changes see the [GitHub Changelog](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting/blob/main/CHANGELOG.md).

### General Availability of VMware.CloudFoundation.CertificateManagement v1.2.0

* [Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation-certificate-management/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/VMware.CloudFoundation.CertificateManagement/1.2.0)
* [GitHub Project](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-certificate-management/)

A PowerShell module that has been written to support the ability to manage ESXi host certificates across your VMware Cloud Foundatiоn instance.

**Release Highlights**

* Documentation updates
* Support for PowerShell Core
* Enhancements to connection tests to avoid ICMP

For a full list of changes see the [GitHub Changelog](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-certificate-management/blob/main/CHANGELOG.md).

### General Availability of VMware.CloudFoundation.PowerManagement v1.2.0

* [Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation-power-management/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/VMware.CloudFoundation.PowerManagement/1.2.0)
* [GitHub Project](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-power-management)

A PowerShell module that supports the ability to automate the shut down and start-up of the VMware Cloud Foundation management domain or VI workload domains using a PowerShell script.

**Release Highlights**

* Added support for VMware Cloud Foundation 5.0
* Documentation updates

For a full list of changes see the [GitHub Changelog](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-power-management/blob/main/CHANGELOG.md).

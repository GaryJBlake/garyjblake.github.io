+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #24 (May 2024)"
date = "2024-05-28"
description = "What's New for VMware Validated Solutions - Edition #24 (May 2024)"
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

**Last Updated:** 28-May-2024

Welcome to Edition #24 of the **What's New for VMware Validated Solutions**, this is the update for May 2024, the highlights of which are:

* **New Solution** – [Private AI Ready Infrastructure for VMware Cloud Foundation](https://core.vmware.com/private-ai-ready-infrastructure-vmware-cloud-foundation)
* Added Support for VxRail to [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-and-monitoring-vmware-cloud-foundation)
* Added Support for VMware Aria Automation 8.16.2 to [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation)
* Added Support for VMware Site Recovery Manager 9.0 and vSphere Replication 9.0 to [Site Protection and Disaster Recovery for VMware Cloud Foundation](https://core.vmware.com/site-protection-and-disaster-recovery-vmware-cloud-foundation)
* Updated automation steps for [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation)
* Release of [PowerValidatedSolutions v2.10.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.10.0)

### Private AI Ready Infrastructure for VMware Cloud Foundation

Delighted to announce the release of this brand-new VMware Validated Solution.

The [Private AI Ready Infrastructure for VMware Cloud Foundation](https://core.vmware.com/private-ai-ready-infrastructure-vmware-cloud-foundation) is a well-architected validated solutions that provides enterprise private AI GPU-enabled infrastructure to build an AI platform for data scientists and ML engineers using VMware Cloud Foundation as its foundational layer.

### Health Reporting and Monitoring for VMware Cloud Foundation

The Health Reporting and Monitoring for VMware Cloud Foundation validated solution now supports Dell VxRail nodes for both consolidated and standard architectures.

### Private Cloud Automation for VMware Cloud Foundation

The Private Cloud Automation for VMware Cloud Foundation validated solution now supports VMware Aria Automation 8.16.2.

### Site Protection and Disaster Recovery for VMware Cloud Foundation

The Site Protection and Disaster Recovery for VMware Cloud Foundation validated solution now supports VMware Site Recovery Manager 9.0 and vSphere Replication 9.0.

### Identity and Access Management for VMware Cloud Foundation

The Identity and Access Management for VMware Cloud Foundation validated solution now provides a procedure for end-to-end automation using the new validated solution menu provided by the PowerShell Module for VMware Validated Solutions. See [Implementation of Identity and Access Management Using PowerShell Automation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-identity-and-access-management-v1/GUID-C80C8684-3209-4861-88BE-849292C7013B.html)

### General Availability of PowerValidatedSolutions v2.10.0

* [Documentation](https://vmware-samples.github.io/power-validated-solutions-for-cloud-foundation/)
* [PowerShell Gallery](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.10.0)
* [GitHub Project](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)

A PowerShell module that has been written to support the automation of many procedures associated with the implementation of the [VMware Validated Solutions](https://vmware.com/go/vvs) for [VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation).

The module helps reduce human error, delivers consistency and robustness, and accelerates the time-to-deploy these solutions. The module's cmdlets reduce complexity by automating the deployment and configuration steps using the product APIs or command-line tools.

**Release Highlights**

* Added ***Start-ValidatedSolutionsMenu*** along with sub menus to make consumption easier and faster.
* Added functions to verify the prerequisites for each validation solution.
* Added functions to generate signed certificates from a Microsoft Certificate Authority for VMware Aria Suite and Site Recovery Manager removing the need to use CertGenVVS.
* Added support for configuring roles in VMware Aria Suite Lifecycle.
* Numerous enhancements across functions and solutions.

For a full list of changes see the [GitHub Changelog](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation/blob/main/CHANGELOG.md).

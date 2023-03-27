+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #14 (Mar 2023)"
date = "2023-03-28"
description = "What's New for VMware Validated Solutions - Edition #14 (Mar 2023)"
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

**Last Updated:** 28-Mar-2023

Welcome to Edition #14 of the **What's New for VMware Validated Solutions**, today we announced the following updates:

* **New Solution** - [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-monitoring-vmware-cloud-foundation)
* **New Solution** - [Cloud-Based Intelligent Logging for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-logging-vmware-cloud-foundation)
* Release of [PowerValidatedSolutions v2.1.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.1.0), our PowerShell module developed to ensure robustness, consistency, and accelerate implementation

Delighted to announce the release of two brand new VMware Validated Solutions this month.

### Health Reporting and Monitoring for VMware Cloud Foundation

The [Health Reporting and Monitoring for VMware Cloud Foundation](https://core.vmware.com/health-reporting-monitoring-vmware-cloud-foundation) validated solution provides health monitoring for VMware Cloud Foundation components using HTML reports and through custom dashboards, alerts, and notifications using vRealize Operations.

### Cloud-Based Intelligent Logging for VMware Cloud Foundation

The [Cloud-Based Intelligent Logging for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-logging-vmware-cloud-foundation) validated solution provides cloud-based logging, analytics and reporting for VMware Cloud Foundation infrastructure components using vRealize Log Insight Cloud.

### General Availability of PowerValidatedSolutions v2.1.0

Release of [PowerValidatedSolutions v2.1.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.1.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Enhanced `Get-vCenterServerDetail` cmdlet to to support VCF 5.0 and isolated workload domains.
- Enhanced `Add-IdentitySource` cmdlet to support VCF 5.0 and isolated workload domains.
- Enhanced `Undo-IdentitySource` cmdlet to support VCF 5.0 and isolated workload domains.
- Enhanced `Add-SsoPermission` cmdlet to support VCF 5.0 and isolated workload domains.
- Enhanced `Undo-SsoPermission` cmdlet to support VCF 5.0 and isolated workload domains.
- Enhanced `Add-vSphereRole` cmdlet to support VCF 5.0 and isolated workload domains.
- Enhanced `Undo-vSphereRole` cmdlet to support VCF 5.0 and isolated workload domains.
- Fixed `Get-GlobalPermission` cmdlet where UseBasicParsing was set to false but should be true.

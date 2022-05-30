+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #5"
date = "2022-02-22"
description = "What's New for VMware Validated Solutions - Edition #5"
tags = [

]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS Whats New",
]
+++

**Last Updated:** 22-Feb-2022

Welcome to Edition #5 of the What's New for VMware Validated Solutions, today we are announcing the following changes:

* Additional support for VMware Cloud Foundation 4.4.0
* Additional automation across solutions based on the PowerValidatedSolutions v1.4.0 release

### Added Support for VMware Cloud Foundation 4.4.0
Delighted to announce support for VMware Cloud Foundation 4.4.0.

* Identity and Access Management for VMware Cloud Foundation
* Developer Ready Infrastructure for VMware Cloud Foundation
* Intelligent Logging and Analytics for VMware Cloud Foundation
* Intelligent Operations Management for VMware Cloud Foundation
* Private Cloud Automation for VMware Cloud Foundation
* Site Protection and Disaster Recovery for VMware Cloud Foundation
* Advanced Load Balancer for VMware Cloud Foundation

### Identity and Access Management for VMware Cloud Foundation

* Added a procedure for configuring a Ping adapter for the standalone Workspace ONE Access.
* Uses PowerValidatedSolutions PowerShell module version 1.4.0.
* Validated solution now requires installation of the ImportExcel PowerShell module, when reading directly from the Planning and Preparation Workbook.

### Developer Ready Infrastructure for VMware Cloud Foundation

* Enhanced all Developer Ready Infrastructure Solution cmdlets for better error handling and message output
* Added Undo cmdlets to allow the rollback of procedures.
* Uses PowerValidatedSolutions PowerShell module version 1.4.0.
* Validated solution now requires installation of the ImportExcel PowerShell module, when reading directly from the Planning and Preparation Workbook.

### Intelligent Logging and Analytics for VMware Cloud Foundation Updates

* Added support for the Create Alerts in vRealize Log Insight procedure.
* Starting with VMware Cloud Foundation 4.4, installation and life cycle management of vRealize Log Insight is performed by using vRealize Suite Lifecycle Manager.
* Uses PowerValidatedSolutions PowerShell module version 1.4.0.
* Validated solution now requires installation of the ImportExcel PowerShell module, when reading directly from the Planning and Preparation Workbook.

### Intelligent Operations Management for VMware Cloud Foundation Updates

* Added a procedure for configuring Ping adapters for the clustered Workspace ONE Access.
* Starting with VMware Cloud Foundation 4.4, installation and life cycle management of vRealize Log Insight is performed by using vRealize Suite Lifecycle Manager.
* Uses PowerValidatedSolutions PowerShell module version 1.4.0.
* Validated solution now requires installation of the ImportExcel PowerShell module, when reading directly from the Planning and Preparation Workbook.

### Private Cloud Automation for VMware Cloud Foundation Updates

* Starting with VMware Cloud Foundation 4.4, installation and life cycle management of vRealize Log Insight is performed by using vRealize Suite Lifecycle Manager.
* Required storage for installation of vRealize Automation 8.6.2 is 738 GB compared to 708 GB for vRealize Automation 8.5 and earlier.
* Added design decision and procedure to install and use the vRealize Orchestrator content pack for vRealize Log Insight as part of the logging section in the solution.
* Uses PowerValidatedSolutions PowerShell module version 1.4.0.
* Validated solution now requires installation of the ImportExcel PowerShell module, when reading directly from the Planning and Preparation Workbook.

### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates

* Uses PowerValidatedSolutions PowerShell module version 1.4.0.

### Advanced Load Balancer for VMware Cloud Foundation Updates

* Extend support for VMware Cloud Foundation 4.3.1 and 4.4.0.
* Enable support for Avi with Cloud Services (SaaS subscription).

### General Availability of PowerValidatedSolutions v1.4.0

Release of [PowerValidatedSolutions v1.4.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.4.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Enhanced all Developer Ready Infrastructure Solution cmdlets for better error handling and message output.
- Added `Undo-NetworkSegment` cmdlet to remove an NSX segment from an NSX Management Cluster.
- Added `Undo-PrefixList` cmdlet to remove an NSX Prefix List from an NSX Management Cluster.
- Added `Undo-RouteMap` cmdlet to remove an NSX Route Map from an NSX Management Cluster.
- Added `Undo-DatastoreTag` cmdlet to remove the vSphere Tag and Category from a datastore in vCenter Server.
- Added `Undo-StoragePolicy` cmdlet to remove a VM vSphere Storage Policy from vCenter Server.
- Added `Undo-Registry` cmdlet to disable the Embedded Harbor Registry on the Supervisor Cluster.
- Added `Undo-SupervisorCluster` cmdlet to remove the Supervisor Cluster.
- Added `Undo-ContentLibrary` cmdlet to remove a Content Library from the Workload Domain vCenter Server.
- Added `Undo-Namespace` cmdlet to remove a Namespace from the Supervisor Cluster.
- Added `Undo-NamespacePermission` cmdlet to remove permissions from a Namespace.
- Added `Undo-TanzuKubernetesCluster` cmdlet to remove a Tanzu Kubernetes Cluster from the Supervisor Cluster.
- Added `Add-NsxtNodeProfileSyslogExporter` cmdlet to add a syslog exporter to the default node profile or specified node profile id.
- Added `Undo-NsxtNodeProfileSyslogExporter` cmdlet to remove all syslog exporter from the default node profile or specified node profile id.
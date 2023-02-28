+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #13 (Feb 2023)"
date = "2023-02-28"
description = "What's New for VMware Validated Solutions - Edition #13 (Feb 2023)"
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

**Last Updated:** 28-Feb-2023

Welcome to Edition #13 of the What's New for VMware Validated Solutions, today we announced the following updates:

* Added enhancements to [Cloud-Based Intelligent Operations for VMware Cloud Foundation](https://core.vmware.com/cloud-based-intelligent-operations-vmware-cloud-foundation)
* Added enhancements to [Cloud-Based Automation for VMware Cloud Foundation](https://core.vmware.com/cloud-based-automation-vmware-cloud-foundation)

### Cloud-Based Intelligent Operations for VMware Cloud Foundation

[Detailed Design](https://core.vmware.com/detailed-design-cloud-based-intelligent-operations)

Updates to the following design decisions:

**Design Decisions on Identity Management**
  * CBO-IAM-SEC-003 - Assign vRealize Operations Cloud service roles to designated users. **(NEW)**

**Design Decisions on Password Policies**
  * CBO-CDP-SEC-001 - Configure the local user password expiration policy for each Cloud Proxy instance. **(NEW)**
  * CBO-CDP-SEC-002 - Configure the local user password complexity policy for each Cloud Proxy instance. **(NEW)**
  * CBO-CDP-SEC-003 - Configure the local user account lockout policy for each Cloud Proxy instance. **(NEW)**

[Implementation](https://core.vmware.com/implementation-cloud-based-intelligent-operations)

Added PowerShell automation to the following procedures:

* Assign SDDC Manager Role to a Service Account for VMware Cloud Foundation Integration for Cloud-Based Intelligent Operations (`Add-SddcManagerRole`)
* Define a Custom Role in vSphere for vRealize Operations Cloud and VMware Cloud Foundation Integration for Cloud-Based Intelligent Operations (`Add-vSphereRole`)
* Assign vCenter Server Role to a Service Account for VMware Cloud Foundation Integration for Cloud-Based Intelligent Operations (`Add-vCenterGlobalPermission`)
* Create a Virtual Machine and Template Folder for Cloud Proxy Appliances for Cloud-Based Intelligent Operations (`Add-VMFolder`)
* Configure vSphere Anti-Affinity Rules for the Cloud Proxy Appliances for Cloud-Based Intelligent Operations (`Add-AntiAffinityRule`)
* Add the Cloud Proxy Appliances to the First Availability Zone VM Group for Cloud-Based Intelligent Operations (`Add-VmGroup`)

[Operational Guidance](https://core.vmware.com/operational-guidance-cloud-based-intelligent-operations)

Added the following procedures:

* Personas in Cloud-Based Intelligent Operations for VMware Cloud Foundation
* Configure the Local User Password Expiration Policy of the Cloud Proxy Appliance for Cloud-Based Intelligent Operations
* Configure the Local User Password Complexity Policy for the Cloud Proxy Appliance for Cloud-Based Intelligent Operations
* Configure the Local User Account Lockout Policy for the Cloud Proxy Appliance for Cloud-Based Intelligent Operations

### Cloud-Based Automation for VMware Cloud Foundation

[Detailed Design](https://core.vmware.com/detailed-design-cloud-based-automation)

Updates to the following design decisions:

**Design Decisions on Password Policies**
  * CBA-CDP-SEC-001 - Configure the local user password expiration policy for each Cloud Proxy instance. **(NEW)**
  * CBA-CDP-SEC-002 - Configure the local user password complexity policy for each Cloud Proxy instance. **(NEW)**
  * CBA-CDP-SEC-003 - Configure the local user account lockout policy for each Cloud Proxy instance. **(NEW)**
  * CBA-CEP-SEC-001 - Configure the local user password expiration policy for each Cloud Extensibility Proxy instance. **(NEW)**
  * CBA-CEP-SEC-002 - Configure the local user password complexity policy for each Cloud Extensibility Proxy instance. **(NEW)**
  * CBA-CEP-SEC-003 - Configure the local user account lockout policy for each Cloud Extensibility Proxy instance. **(NEW)**

[Operational Guidance](https://core.vmware.com/operational-guidance-cloud-based-automation)

Added the following procedures:

* Personas in Cloud-Based Automation for VMware Cloud Foundation.
* Configure the Local User Password Expiration Policy of the Cloud Proxy and Cloud Extensibility Proxy Appliances for Cloud-Based Automation
* Configure the Local User Password Complexity Policy for the Cloud Proxy and Cloud Extensibility Proxy Appliances for Cloud-Based Automation
* Configure the Local User Account Lockout Policy for the Cloud Proxy and Cloud Extensibility Proxy Appliances for Cloud-Based Automation
* Dashboard Management for Cloud-Based Intelligent Operations for VMware Cloud Foundation

### General Availability of PowerValidatedSolutions v2.0.1

Release of [PowerValidatedSolutions v2.0.1](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.0.1), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Added `Convert-CssClassStyle` cmdlet to modify the CSS Style in the HTML output.
- Fixed `Publish-*` cmdlets to use `Convert-CssClassStyle` rather than `Convert-CssClass` which is part of VMware Cloud Foundation reporting module.
- Added `cbl-vsphere-integration.role` role file to support adding the vRealize Log Insight Cloud to vSphere Integration role in vCenter Server.
- Added `cbo-vsphere-integration.role` role file to support adding the vRealize Operations Cloud to vSphere Integration role in vCenter Server.

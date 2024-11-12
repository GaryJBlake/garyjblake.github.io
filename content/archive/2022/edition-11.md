+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #11 (Nov 2022)"
date = "2022-11-29"
description = "What's New for VMware Validated Solutions - Edition #11 (Nov 2022)"
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

**Last Updated:** 29-Nov-2022

Welcome to Edition #11 of the What's New for VMware Validated Solutions, today we announced the following updates:

* Added improvements to the implementation prerequisites across all VMware Validated Solutions
* Added improvements to PowerShell functions for Site Protection and Disaster Recovery for VMware Cloud Foundation
* Added certificate replacement procedures for Cloud-Based Automation for VMware Cloud Foundation
* Release of [PowerValidatedSolutions v1.10.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.10.0), our PowerShell module developed to ensure robustness, consistency, and accelerate implementation

### Added Implementation Prerequisites Improvements

Following feedback we have incorporated improvements to the implementation prerequisites section of each solution guide. Each VMware Validated Solution now uses a consistent format consisting of two tables:

* Prerequisites for Implementation
* Prerequisites for CLI Implementation

The *Prerequisites for Implementation* provides general prerequisite information that must be read and understood by the reader before starting the implementation regardless of the method being used to perform the install (UI or CLI) and the *Prerequisites for CLI Implementation* provides additional prerequisite information for the reader if they plan to install using the CLI approach.

### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates

Added improvements to PowerShell functions:

* Added low level functions to support the public REST APIs with Site Recovery Manager / vSphere Replication 8.6
* Refactored functions to include better pre-validation steps
* Added new functions to allow flexibility for site specific configuration and VI Workload Domain support

[Implementation](https://core.vmware.com/implementation-site-protection-and-disaster-recovery)

* [Refactor]Deploy vSphere Replication (***Install-vSphereReplicationManager***)
* [Refactor]Replace the Certificate of vSphere Replication (***Install-VamiCertificate***)
* [Refactor]Register vSphere Replication with vCenter Single Sign-On (***Connect-DRSolutionTovCenter***)
* [New]Create a Port Group for vSphere Replication Traffic (***Add-VdsPortGroup***)
* [New]Add a Network Adapter and Configure Static Routes for vSphere Replication (***Add-VrmsNetworkAdapter***)
* [New]Create a VMkernel Adapter on the ESXi Hosts for vSphere Replication Traffic (***Add-EsxiVMkernelPort***)
* [New]Configure ESXi Host Static Routes for vSphere Replication (***Add-EsxiVrmsStaticRoute***)
* [Refactor]Deploy Site Recovery Manager (****Install-SiteRecoveryManager****)
* [Refactor]Replace the Certificate of Site Recovery Manager (***Install-VamiCertificate****)
* [Refactor]Register Site Recovery Manager with vCenter Single Sign-On (***Connect-DRSolutionTovCenter***)
* [New]Assign Licenses to Site Recovery Manager (***Add-SrmLicenseKey***)

### Cloud-Based Automation for VMware Cloud Foundation Updates

Added certificate replacement procedures:

[Implementation](https://core.vmware.com/implementation-cloud-based-automation)

* Replace the Certificate of the vRealize Orchestrator Instance within the Cloud Extensibility Proxy for Cloud-Based Automation

[Operational Guidance](https://core.vmware.com/operational-guidance-cloud-based-automation)

* Replace the Certificate for vRealize Orchestrator Within the Cloud Extensibility Proxy
* Retrust the New Certificate for the vRealize Orchestrator within the Cloud Extensibility Proxy with Cloud Assembly

### General Availability of PowerValidatedSolutions v1.10.0

Release of [PowerValidatedSolutions v1.10.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.10.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

* Enhanced `Install-SiteRecoveryManager` cmdlet to support an alternative path to the OVF Tool -vmwareOvfToolPath, and code improvements.
* Enhanced `Install-vSphereReplicationManager` cmdlet to support an alternative path to the OVF Tool -vmwareOvfToolPath and code improvements.
* Enhanced `Connect-DRSolutionTovCenter` cmdlet to support registration with any vCenter Server and code improvements and REST API function support.
* Added `Undo-DRSolutionTovCenter` cmdlet to support removing vCenter Server registration of vSphere Replication and Site Recovery Manager.
* Enhanced `Install-VamiCertificate` cmdlet to use new REST APIs for vSphere Replication and Site Recovery Manager appliances.
* Added `Add-VrmsNetworkAdapter` cmdlet to support adding a second nic to a vSphere Replication appliance.
* Added `Add-SrmLicenseKey` cmdlet to support adding and assigning a Site Recovery Manager license.
* Added `Undo-SrmLicenseKey` cmdlet to support removing a Site Recovery Manager license.
* Added `Add-VdsPortGroup` cmdlet to support creating a vSphere Distributed Switch port group and assigning a VLAN id.
* Added `Undo-VdsPortGroup` cmdlet to support removing a vSphere Distributed Switch port group.
* Added `internalCatchWriter` internal function to control and providing messages around API response codes.
* Added `Test-VrmsConnection` cmdlet to support checking the vSphere Replication appliance is responding.
* Added `Test-VrmsAuthentication` cmdlet to support checking authentication with the vSphere Replication appliance.
* Added `Request-VrmsToken` cmdlet to support requesting a session token for a vSphere Replication appliance.
* Added `Get-VrmsApplianceDetail` cmdlet to support getting information about a vSphere Replication appliance.
* Added `Set-VrmsApplianceState` cmdlet to restart or shutdown a vSphere Replication appliance.
* Added `Get-VrmsService` cmdlet to support retrieving the status of services running on the vSphere Replication appliance.
* Added `Set-VrmsService` cmdlet to start/stop/restart services running on a vSphere Replication appliance.
* Added `Get-VrmsNetworkAll` cmdlet to retrieve all network settings for a vSphere Replication appliance.
* Added `Get-VrmsNetworkDns` cmdlet to retrieve the DNS configuration for a vSphere Replication appliance.
* Added `Set-VrmsNetworkDns` cmdlet to configure DNS settings for a vSphere Replication appliance.
* Added `Get-VrmsNetworkInterface` cmdlet to retrieve the network interface configuration for a vSphere Replication appliance.
* Added `Set-VrmsNetworkInterface` cmdlet to configure a network interface for a vSphere Replication appliance.
* Added `Get-VrmsConfiguration` cmdlet to retrieve the registration configuration for a vSphere Replication appliance.
* Added `Set-VrmsConfiguration` cmdlet to register the vSphere Replication appliance with vCenter Server.
* Added `Remove-VrmsConfiguration` cmdlet to remove the vCenter Server registration for a vSphere Replication appliance.
* Added `Set-VrmsReplication` cmdlet to configure the replication filter IP Address for a vSphere Replication appliance.
* Added `Get-VrmsTask` cmdlet to retrieve tasks from a vSphere Replication appliance.
* Added `Get-VrmsVamiCertificate` cmdlet to retrieve the certificate of the VAMI interface of a vSphere Replication appliance
* Added `Set-VrmsVamiCertificate` cmdlet to install a new certificate for the VAMI interface of a vSphere Replication appliance.
* Added `Test-SrmConnection` cmdlet to support checking the Site Recovery Manager appliance is responding.
* Added `Test-SrmAuthentication` cmdlet to support checking authentication with the Site Recovery Manager appliance.
* Added `Request-SrmToken` cmdlet to support requesting a session token for a Site Recovery Manager appliance.
* Added `Get-SrmApplianceDetail` cmdlet to support getting information about a Site Recovery Manager appliance.
* Added `Set-SrmApplianceState` cmdlet to restart or shutdown a Site Recovery Manager appliance.
* Added `Get-SrmService` cmdlet to support retrieving the status of services running on the Site Recovery Manager appliance.
* Added `Set-SrmService` cmdlet to start/stop/restart services running on a Site Recovery Manager appliance.
* Added `Get-SrmNetworkAll` cmdlet to retrieve all network settings for a Site Recovery Manager appliance.
* Added `Get-SrmNetworkDns` cmdlet to retrieve the DNS configuration for a Site Recovery Manager appliance.
* Added `Set-SrmNetworkDns` cmdlet to configure DNS settings for a Site Recovery Manager appliance.
* Added `Get-SrmNetworkInterface` cmdlet to retrieve the network interface configuration for a Site Recovery Manager appliance.
* Added `Set-SrmNetworkInterface` cmdlet to configure a network interface for a Site Recovery Manager appliance.
* Added `Get-SrmConfiguration` cmdlet to retrieve the registration configuration for a Site Recovery Manager appliance.
* Added `Set-SrmConfiguration` cmdlet to register the Site Recovery Manager appliance with vCenter Server.
* Added `Remove-SrmConfiguration` cmdlet to remove the vCenter Server registration for a Site Recovery Manager appliance.
* Added `Get-SrmTask` cmdlet to retrieve tasks from a Site Recovery Manager appliance.
* Added `Get-SrmVamiCertificate` cmdlet to retrieve the certificate of the VAMI interface of a Site Recovery Manager appliance.
* Added `Set-SrmVamiCertificate` cmdlet to install a new certificate for the VAMI interface of a Site Recovery Manager appliance.
* Added `Undo-SiteRecoveryManager` to remove the Site Recovery Manager virtual appliance.
* Added `Undo-vSphereReplicationManager` to remove the vSphere Replication virtual appliance.
* Added `Add-EsxiVMkernelPort` cmdlet to create ESXi VMKernel port for vSphere Replication Traffic flexibility.
* Added `Undo-EsxiVMkernelPort` cmdlet to remove ESXi VMKernel port for vSphere Replication Traffic flexibility.
* Added `Add-EsxiVrmsStaticRoute` cmdlet to provide ESXi static route configuration flexibility.
* Added `Undo-EsxiVrmsStaticRoute` cmdlet to provide ESXi static route removal flexibility.

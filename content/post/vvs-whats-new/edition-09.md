+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #9 (Sep 2022)"
date = "2022-09-27"
description = "What's New for VMware Validated Solutions - Edition #9 (Sep 2022)"
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

**Last Updated:** 27-Sep-2022

Welcome to Edition #9 of the What's New for VMware Validated Solutions, today we announced the following updates:

* **New Solution** - [Cloud-Based Automation for VMware Cloud Foundation](https://core.vmware.com/cloud-based-automation-vmware-cloud-foundation)
* Added automation based on the PowerValidatedSolutions v1.8.0 release
* Release of [PowerValidatedSolutions v1.8.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.8.0), our PowerShell module developed to ensure robustness, consistency, and accelerate implementation

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


### General Availability of PowerValidatedSolutions v1.8.0

Release of [PowerValidatedSolutions v1.8.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.8.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Enhanced `Request-CSPToken` cmdlet to request a token from VMware Cloud.
- Enhanced `Update-vRACloudAccountZone` and `Update-vRACloudZone` cmdlets to support placement policy for cloud zones in vRealize Automation.
- Enhanced `Confirm-PSModule` cmdlet so its an exported function and can be executed on the command line.
- Enhanced `Enable-vROPSManagementPack` cmdlet to support Site Recovery Manager and vSphere Replication Management Packs.
- Renamed to `Get-CSPPoxyAppliance` cmdlet to `Get-CloudProxy` and added:
  - `-environment` switch to support Production and Staging VMC
  - Support for both Cloud Proxy and Cloud Extensibility Proxy.
  - Support for either downloading or simply providing the URL path.
  - Support for downloading on Core (Linux, Windows and Mac).
- Added region blocks for easier code navigation.
- Added the vRealize Automation Cloud to vSphere integration role for Cloud Assembly.
- Added the vRealize Suite Lifecycle Manager to vSphere integration role.
- Added `Test-vROPsAdapterStatus` and `Test-vROPsAdapterStatusByType` cmdlets to test the status vRealize Operations adapters.
- Added `New-vRAvROPSIntegrationItem` cmdlet to configure vRealize Operations Manager integration in vRealize Automation.
- Added `Undo-vRAvROPsIntegrationItem` cmdlet to remove vRealize Operations Manager integration from vRealize Automation.
- Added `Add-vRAIntegrationItem` cmdlet to add an external system to vRealize Automation.
- Added `Test-vRAIntegrationItem` cmdlet to test an integration item in vRealize Automation.
- Added `Remove-vRAIntegrationItem` cmdlet to remove an integration item from vRealize Automation.
- Added `Get-CloudProxyOtk` cmdlet to retrieve the One Time Key (OTK) for both the Cloud Proxy and the Cloud Extensibility Proxy.
- Added `Get-vROVersion` cmdlet with support for standalone, embedded, and cloud extensibility proxy vRealize Orchestrator instance.
- Added `Get-CEPWorkflow` cmdlet to return workflows from cloud extensibility proxy's vRealize Orchestrator instance.
- Added `Invoke-CEPWorkflow` cmdlet to start a Workflow on a cloud extensibility proxy's vRealize Orchestrator instance.
- Added `Get-CEPWorkflowExecution` cmdlet to return the Workflow Execution ID from a cloud extensibility proxy's vRealize Orchestrator instance.
- Added `Get-CEPWorkflowExecutionState` cmdlet to return the Workflow Execution State from a cloud extensibility proxy's vRealize Orchestrator instance.
- Added `Add-CEPTrustedCertificate` cmdlet to add a trusted cert to a cloud extensibility proxy's vRealize Orchestrator instance.
- Added `Add-CEPvCenterServer` cmdlet to add a vCenter server to a cloud extensibility proxy's vRealize Orchestrator instance.
- Added `Update-vROPSvRAAdapterCredential` cmdlet to support updating the vRealize Automation integration credential in vRealize Operations Manager.
- Added `Get-vRAAPIVersion` and `Get-vRAIntegrationDetail` cmdlets to support updating the placement policy for cloud zones in vRealize Automation.
- Added `Get-ESXiPasswordPolicy` cmdlet to return the password expiration policy for ESXi.
- Added `Get-VCServerPasswordPolicy` cmdlet to return the password expiration policy for vCenter Server.
- Added `Set-EsxiPasswordExpirationPeriod` cmdlet to set the password expiration period on an ESXi host in number of days.
- Added Sample Script in SampleScripts\ppm folder, Password Policy Manager to enable auditing and configuration of password policies across VMware Cloud Foundation.
  - `passwordPolicyManager.ps1` generates and audit report or configures the password policies.
  - `sampleConfigurationFull.json` configuration JSON covering all product configuration parameters.
  - `sampleConfigurationSimple.json` configuration JSON covering default configuration parameters.
  - `README.md` providing details on how to use Password Policy Manager.
- Added `Get-vRAvRLIConfig` cmdlet to retrieve the vRealize Log Insight logging configuration (CFAPI) on vRealize Automation.
- Added `Set-vRAvRLIConfig` cmdlet to configure the vRealize Log Insight logging configuration (CFAPI) on vRealize Automation.
- Added `Remove-vRAvRLIConfig` cmdlet to remove the vRealize Log Insight logging configuration (CFAPI) on vRealize Automation.
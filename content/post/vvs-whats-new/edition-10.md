+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #10 (Oct 2022)"
date = "2022-10-25"
description = "What's New for VMware Validated Solutions - Edition #10 (Oct 2022)"
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

**Last Updated:** 25-Oct-2022

Welcome to Edition #10 of the What's New for VMware Validated Solutions, today we announced the following updates:

* Added support for VMware Cloud Foundation 4.5.0
* Added automation based on the PowerValidatedSolutions v1.9.0 release
* Release of [PowerValidatedSolutions v1.9.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.9.0), our PowerShell module developed to ensure robustness, consistency, and accelerate implementation

### Added Support for VMware Cloud Foundation 4.5.0

Delighted to announce support for VMware Cloud Foundation 4.5.0.

* Identity and Access Management for VMware Cloud Foundation
* Developer Ready Infrastructure for VMware Cloud Foundation
* Intelligent Logging and Analytics for VMware Cloud Foundation
* Intelligent Operations Management for VMware Cloud Foundation
* Private Cloud Automation for VMware Cloud Foundation
* Site Protection and Disaster Recovery for VMware Cloud Foundation
* Cloud-Based Automation for VMware Cloud Foundation

### Intelligent Logging and Analytics for VMware Cloud Foundation Updates

Additional automation provided by PowerValidatedSolutions:

[Implementation](https://core.vmware.com/implementation-intelligent-logging-and-analytics)

* Configure Event Forwarding Between VMware Cloud Foundation Instances (***Add-vRLILogForwarder***)

[Solution Interoperability](https://core.vmware.com/solution-interoperability-intelligent-logging-and-analytics)

* Verify the Integration of vRealize Operations Manager with vRealize Log Insight (***Test-vROPsAdapterStatusByType***)

### Intelligent Operations Management for VMware Cloud Foundation Updates

Additional automation provided by PowerValidatedSolutions:

[Implementation](https://core.vmware.com/implementation-intelligent-operations-management)

* Add the Management Domain vCenter Server in the Additional VMware Cloud Foundation Instance to vRealize Suite Lifecycle Manager (***New-vRSLCMDatacenterVcenter***)

[Solution Interoperability](https://core.vmware.com/solution-interoperability-intelligent-operations-management)

* Verify the Log Forwarding Status of vRealize Operations Manager (***Get-vROpsLogForwardingConfig***)

### Private Cloud Automation for VMware Cloud Foundation Updates

Additional automation provided with PowerValidatedSolutions:

[Solution Interoperability](https://core.vmware.com/solution-interoperability-private-cloud-automation)

* Install the vRealize Orchestrator Content Pack for vRealize Log Insight (***Enable-vRLIContentPack***)

### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates

Additional automation provided with PowerValidatedSolutions:

[Solution Interoperability](https://core.vmware.com/solution-interoperability-site-protection-and-disaster-recovery)

* Add Site Recovery Manager Adapter Instances to vRealize Operations Manager (***Add-vROPSAdapterSrm***)
* Add vSphere Replication Adapter Instances to vRealize Operations Manager (***Add-vROPSAdapterVr***)
* Create Notifications in vRealize Operations Manager for Site Protection and Disaster Recovery Issues (***Import-vROPSNotification***)

### General Availability of PowerValidatedSolutions v1.9.0

Release of [PowerValidatedSolutions v1.9.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.9.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

* Fixed `ilaDeployVrealizeLogInsight.ps1` where the call for cmdlet named Add-vRLISmtpConfiguration had a typo.
* Enhanced `Export-WsaJsonSpec` cmdlet to support deploying a Standard (single node) Workspace ONE Access via vRealize Suite Lifecycle Manager.
* Enhanced `New-WSADeployment` cmdlet to support deploying a Standard (single node) Workspace ONE Access via vRealize Suite Lifecycle Manager.
* Enhanced `Export-vROPSJsonSpec` cmdlet to support deploying a smaller footprint of vRealize Operations for nested environments.
* Enhanced `New-vROPSDeployment` cmdlet to support smaller footprint of vRealize Operations for nested environments.
* Enhanced `ilaConfigureVrealizeLogInsight.ps1` Sample Script to detect Standard versus Clustered Workspace ONE.
* Enhanced `iomDeployVrealizeOperations.ps1` Sample Script to support smaller footprint of vRealize Operations for nested environments.
* Enhanced `ilaDeployVrealizeLogInsight.ps1` Sample Script to skip trying to configure Archive and Retention settings when no NFS details are provided.
* Enhanced `Enable-SupervisorCluster` cmdlet to check for the existence of the Supervisor Cluster.
* Added `Enable-vRLIContentPack` cmdlet to support install of content packs from the vRealize Log Insight in-product marketplace.
* Added `Update-vRLIContentPack` cmdlet to support update of content packs from the vRealize Log Insight in-product marketplace.
* Added `Get-vRLIMarketplaceMetadata` cmdlet to support install and upgrade of content packs from the vRealize Log Insight in-product marketplace.
* Added `Install-vRLIContentPack` cmdlet to support installation of content packs from the vRealize Log Insight in-product marketplace.
* Added `Get-vRLIContentPack` cmdlet to support install and upgrade of content packs from the vRealize Log Insight in-product marketplace.
* Added `Get-vROpsLogForwardingConfig` cmdlet to support verification of vRealize Operations log forwarding.
* Added `Get-vROpsLogForwarding` cmdlet to support verification of vRealize Operations log forwarding.
* Added `Add-vROPSAdapterVr` cmdlet to support adding a vSphere Replication adapter to vRealize Operations.
* Added `Add-vROPSAdapterSrm` cmdlet to support adding a Site Recovery Manager adapter to vRealize Operations.
* Added `Get-vROPSAlertDefinition` cmdlet a sub-function to obtain alert definition details from vRealize Operations.
* Added `vrops-srm-notifications.csv` Sample Notification file for configuring Site Recovery Manager alert notifications in vRealize Operations.
* Added `Remove-vRLIAgentGroup` cmdlet a sub-function to support removing agent groups from vRealize Log Insight.
* Added `Undo-vRLIAgentGroup` cmdlet to support removing an agent group from vRealize Log Insight.
* Added `Add-StorageFolder` cmdlet to support adding a storage folder in vCenter Server.
* Updated `Export-vRLIJsonSpec` cmdlet to define vRealize Log Insight v8.8.2 as the default install for VCF 4.5.
* Updated `Export-vRAJsonSpec` cmdlet to define vRealize Automation v8.8.2 as the default install for VCF 4.5.
* Updated `Undo-vROPSAdapter` cmdlet to support removing VrAdpater and SrmAdapter adapter types from vRealize Operations.
* Updated `Undo-vROPSCredential` cmdlet to support removing VrAdpater and SrmAdapter credentials from vRealize Operations.
* Updated Sample Scripts in the SampleScripts\ila folder, to support the VCF 4.5.x Planning and Prep Workbook:
  * `ilaDeployVrealizeLogInsight.ps1`
  * `ilaConfigureVrealizeLogInsight.ps1`
  * `ilaUndoVrealizeLogInsight.ps1`
* Updated Sample Scripts in the SampleScripts\iam folder, to support the VCF 4.5.x Planning and Prep Workbook:
  * `iamConfigureVsphere.ps1`
  * `iamConfigureNsx.ps1`
  * `iamConfigureWorkspaceOne.ps1`
  * `iamUndoDeployment.ps1`
* Updated Sample Scripts in the SampleScripts\dri folder, to support the VCF 4.5.x Planning and Prep Workbook:
  * `driConfigureSupervisorCluster.ps1`
  * `driDeployTanzuCluster.ps1`
  * `driUndoDeployment.ps1`
* Updated Sample Scripts in the SampleScripts\ila folder, to support the VCF 4.5.x Planning and Prep Workbook:
  * `ilaDeployVrealizeLogInsight.ps1`
  * `ilaConfigureVrealizeLogInsight.ps1`
  * `ilaUndoVrealizeLogInsight.ps1`
* Updated Sample Scripts in the SampleScripts\iom folder, to support the VCF 4.5.x Planning and Prep Workbook:
  * `iomConfigureVrealizeOperations.ps1`
  * `iomDeployVrealizeOperations.ps1`
* Added Sample Scripts in the SampleScripts\pca folder, uses the Planning and Preparation Workbook as the input source:
  * `pcaDeployVrealizeAutomation.ps1`
* Added Sample Scripts in the SampleScripts\iom folder, to configure Solution Interoperability for Intelligent Operations Management:
  * `iomSolutionInteroperability.ps1`
* Added Sample Scripts in the SampleScripts\ila folder, to configure Solution Interoperability for for Intelligent Logging and Analytics:
  * `ilaSolutionInteroperability.ps1`
  * `ilaUndoSolutionInteroperability.ps1`
* Added Sample Scripts in the SampleScripts\iam folder, to configure Solution Interoperability for Identity and Access Management:
  * `iamSolutionInteroperability.ps1`

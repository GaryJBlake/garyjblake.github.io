+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #4 (Jan 2022)"
date = "2022-01-25"
description = "What's New for VMware Validated Solutions - Edition #4 (Jan 2022)"
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

**Last Updated:** 25-Jan-2022

Welcome to Edition #4 of the What's New for VMware Validated Solutions, today we are announcing the following changes:

* Additional support for Dell VxRail
* Additional automation across solutions based on the [PowerValidatedSolutions v1.3.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.3.0) release

### Added Support for VMware Cloud Foundation 4.3.0 / 4.3.1 on VxRail
Delighted to announce support for the following Validated Solutions running on Dell VxRail based systems in addition to vSAN Ready Nodes.

* Site Protection and Disaster Recovery for VMware Cloud Foundation

### Intelligent Logging and Analytics for VMware Cloud Foundation Updates
##### Implementation

Added PowerValidatedSolutions automation to the following procedures:

* Create Alerts in vRealize Log Insight (***Add-vRLIAlertVirtualMachine*** and ***Add-vRLIAlertDatacenter***)

### Intelligent Operations Management for VMware Cloud Foundation Updates
##### Implementation

Added PowerValidatedSolutions automation to the following procedures:

* Configure User Access in vRealize Operations Manager (***Import-vROPSUserGroup***)
* Configure Email Alert Plug-in Settings for vRealize Operations Manager (***Add-vROPSAlertPluginEmail***)
* Install the SDDC Health Monitoring Solution in vRealize Operations Manager (***Enable-vROPSManagementPack***)
* Rename the SDDC Health Adapters for the vRealize Operations Manager Analytics Cluster Nodes (***Update-vROPSAdapterSddcHealth***)
* Add SDDC Health Adapters for the vRealize Operations Manager Remote Collector Nodes (***Add-vROPSAdapterSddcHealth***)
* Activate the Ping Management Pack in vRealize Operations Manager (***Register-vROPSManagementPack***)
* Add Ping Adapters for the vRealize Operations Manager Nodes (***Add-vROPSAdapterPing***)
* Create Notifications in vRealize Operations Manager for VMware Cloud Foundation Issues (***Import-vROPSNotification***)

### Private Cloud Automation for VMware Cloud Foundation Updates
##### Implementation

Added PowerValidatedSolutions automation to the following procedures:

* Create a Virtual Machine and Template Folder and a Resource Pool for the vRealize Automation-Managed Workloads on the VI Workload Domain vCenter Server (***Add-VMFolder*** and ***Add-ResourcePool***)
* Configure the Organization Name for vRealize Automation (***Update-vRAOrganizationDisplayName***)
* Add Cloud Accounts for the VI Workload Domains to vRealize Automation (***New-vRACloudAccount***)
* Configure the Cloud Zones in vRealize Automation (***Update-vRACloudAccountZone***)
* Import the Trusted Certificates to vRealize Orchestrator (***Add-vROTrustedCertificate***)
* Restrict the vRealize Automation and vRealize Orchestrator Service Accounts Access to Virtual Machine and Datastore Folders in the VI Workload Domain (***Set-vCenterPermission***)
* Configure Email Alerts in Service Broker (***Add-vRANotification***)
* Configure Service Account Permissions for the vRealize Automation to NSX-T Data Center Integration on the VI Workload Domain NSX Manager Cluster (***Add-NsxtVidmRole***)
* Add the VI Workload Domain vCenter Server to vRealize Orchestrator (***Add-vROvCenterServer***)
* Assign Organization and Service Roles to the vRealize Operations Manager Service Account in vRealize Automation (***Add-vRAUser***)
* Assign Organization and Service Roles to the Groups for vRealize Automation (***Add-vRAGroup***)

### Developer Ready Infrastructure for VMware Cloud Foundation Updates

##### Implementation
Updates to the following procedures based on PowerValidatedSolutions v1.3.0.

* Improvements to the pre-validation of the PowerShell procedure for Deploy a Supervisor Cluster for Developer Ready Infrastructure
* Updated the Replace the Supervisor Cluster Kubernetes API Endpoint Certificate for Developer Ready Infrastructure PowerShell procedure (***Enable-SupervisorCluster***)

### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates
##### Implementation

Added PowerValidatedSolutions automation to the following procedures:

* Create Anti-Affinity Rules for the Placeholder Virtual Machines in the Recovery VMware Cloud Foundation Instance (***Add-AntiAffinityRule***)
* Create Virtual Machine Groups and Restart Order in the Recovery VMware Cloud Foundation Instance (***Add-ClusterGroup*** and ***Add-VmStartupRule***)

### General Availability of PowerValidatedSolutions v1.3.0

Release of [PowerValidatedSolutions v1.3.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.3.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

##### Fixed
- Fixed `New-vRSLCMLockerLicense` cmdlet where depending on the speed of the system the license would be added but POST_VALIDATION would fail.

##### Enhancements
- Enhanced all Identity and Access Management Solution cmdlets for better error handling and message output. 
- Enhanced all vRealize Operations Manager cmdlets for better error handling and message output.
- Enhanced all vRealize Log Insight cmdlets for better error handling and message output.
- Enhanced all vRealize Automation cmdlets for better error handling and message output.
- Enhanced `Set-vCenterPermission` cmdlet to set permissions on non-nested folders.
- Enhanced `Enable-SupervisorCluster` cmdlet with better pre-validation.
- Renamed `Add-NsxtVidmGroupRole` cmdlet to `Add-NsxtVidmRole`, to add support for assigning both users and groups roles in NSX-T Data Center.

##### Additions
- Added `Add-ResourcePool` cmdlet to create a resource pool in the Workload Domain specified.
- Added `Undo-ResourcePool` cmdlet to remove a resource pool based on the Workload Domain specified.
- Added `Update-vRAOrganizationDisplayName` cmdlet to configure the Organization Display Name in vRealize Automation.
- Added `Add-vROPSAdapterPing` cmdlet to add a Ping Adapter to vRealize Operations Manager
- Added `Enable-vROPSManagementPack` cmdlet to upload and install the SDDC Health Management Pack to vRealize Operations Manager
- Added `Update-vROPSAdapterSddcHealth` cmdlet to rename the SDDC Health Adapters in vRealize Operations Manager
- Added `Add-vROPSAdapterSddcHealth` cmdlet to add SDDC Health Adapters for the Remote Collectors in vRealize Operations Manager
- Added `Add-vROPSAlertPluginEmail` cmdlet to add an Email Alert Plugin to vRealize Operations Manager
- Added `Register-vROPSManagementPack` cmdlet to activate / deactivate Native Management Packs in vRealize Operations Manager
- Added `Import-vROPSUserGroup` cmdlet to import a user group and assign access in vRealize Operations Manager
- Added `Add-vROvCenterServer` cmdlet to add a workload domain vCenter Server instance to the embedded vRealize Orchestrator.
- Added `Remove-vROvCenterServer` cmdlet to remove a workload domain vCenter Server instance from the embedded vRealize Orchestrator.
- Added `Add-vROTrustedCertificate` cmdlet to import a trusted certificate to the embedded vRealize Orchestrator using a PEM-encoded file.
- Added `Import-vROPSNotification` cmdlet to import notifications using comma separated value file to vRealize Operations Manager.
- Added `Add-vRANotification` cmdlet to configure the smtp notification settings in vRealize Automation.
- Added `New-vRACloudAccount` cmdlet to add Cloud Accounts for a Workload Domains vCenter Server and NSX Management Cluster in vRealize Automation.
- Added `Undo-vRACloudAccount` cmdlet to remove the Cloud Accounts for a Workload Domains vCenter Server and NSX Management Cluster in vRealize Automation.
- Added `Update-vRACloudAccountZone` cmdlet to update the configuration of the Cloud Account Zone for a Workload Domain in vRealize Automation.
- Added `Add-vRAUser` cmdlet to add an organization role and a service role to a user account in vRealize Automation.
- Added `Undo-vRAUser` cmdlet to remove an organization role and all service roles from a user account in vRealize Automation.
- Added `Add-vRAGroup` cmdlet to add an organization role and a service role to a group in vRealize Automation.
- Added `Undo-vRAGroup` cmdlet to remove an organization role and all service roles from a group account in vRealize Automation.
- Added `Undo-IdentitySource` cmdlet to remove an Identity Provider from vCenter Server.
- Added `Undo-SddcManagerRole` cmdlet to remove access for a user in SDDC Manager.
- Added `Add-SsoUser` cmdlet to add a Single Sign-On domain user.
- Added `New-vRSLCMDatacenter` cmdlet to add a datacenter in vRealize Suite Lifecycle Manager.
- Added `Undo-vRSLCMDatacenter` cmdlet to remove a datacenter from vRealize Suite Lifecycle Manager.
- Added `New-vRSLCMDatacenterVcenter` cmdlet to add a vCenter Server to a datacenter in vRealize Lifecycle Manager.
- Added `Export-WSAJsonSpec` cmdlet to generate the deployment JSON for Clustered Workspace ONE Access.
- Added `New-WSADeployment` cmdlet to trigger the deployment of Clustered Workspace ONE Access via vRealize Suite Lifecycle Maneger.
- Added `Add-WorkspaceOneDirectoryConnector` cmdlet to add a connector to the Identity Provider in Workspace ONE Access.
- Added `Add-vRLIAlertDatacenter` cmdlet to create vRealize Log Insight alerts by datacenter 
- Added `Add-vRLIAlertVirtualMachine` cmdlet to create vRealize Log Insight alerts by virtual machine
- Added `Undo-vRLIAlert` cmdlet to remove alerts from vRealize Log Insight.
- Added Sample Notification Templates in the SampleNotifications folder:
    - `vrli-vcf-datacenter.json` defines the vRealize Log Insight alerts that should be configured for VMware Cloud Foundation at the datacenter level
    - `vrli-vcf-vmVrslcm.json` defines the vRealize Log Insight alerts that should be configured for vRealize Suite Lifecycle Manager
- Added Sample Scripts in the SampleScripts\iom folder, each script uses the Planning and Preparation Workbook as the input source:
    - `iomDeployVrealizeOperations.ps1` automates the install and config of vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation.
    - `iomConfigureVrealizeOperations.ps1` automates the integration config of vRealize Operations for Intelligent Operations Management for VMware Cloud Foundation.

Check them out now at [https://vmware.com/go/vvs](https://vmware.com/go/vvs)
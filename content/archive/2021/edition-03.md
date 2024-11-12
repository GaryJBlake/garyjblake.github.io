+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #3 (Nov 2021)"
date = "2021-11-30"
description = "What's New for VMware Validated Solutions - Edition #3 (Nov 2021)"
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

**Last Updated:** 30-Nov-2021

Welcome to Edition #3 of the What's New for VMware Validated Solutions, today we are announcing the following changes:

### General Availability of PowerValidatedSolutions v1.2.0

Release of [PowerValidatedSolutions v1.2.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.2.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository [here](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation)):

- Fixed `Add-GlobalPermission` where an error is thrown when Internet Explorer has not been launched in the operating system.
- Fixed `Set-DatastoreTag` where it was failing to create a single tag and catagory when multiple vCenter Servers in the Single-Sign On domain.
- Fixed `Add-StoragePolicy` where is was failing to add the storage policy when multiple vCenter Servers in the Single-Sign On domain
- Enhanced `Move-VMtoFolder` cmdlet to check the name of VM provided and skip if it does not exist.
- Enhanced `Add-WorkspaceOneDirectory` cmdlet so that it can be used with Clustered Workspace ONE Access.
- Enhanced `Set-WorkspaceOneSmtpConfig` cmdlet to skip the configuration if the SMTP Server configuration is already performed.
- Added `Export-vRLIJsonSpec` cmdlet to generate the Json specification file needed to deploy vRealize Log Insight via vRealize Lifecycle Suite Manager.
- Added `New-vRLIDeployment` cmdlet to deploy vRealize Log Insight via vRealize Lifecycle Suite Manager in VMware Cloud Foundation aware mode.
- Added `Add-vRLIAuthenticationWSA` cmdlet to support configuring Workspace ONE Access integration with vRealize Log Insight.
- Added `Add-WorkspaceOneDirectoryGroup` cmdlet to Sync additional Active Directory groups with Workspace ONE Access.
- Added `Export-vROPSJsonSpec` cmdlet to generate the Json specification file needed to deploy vRealize Operations Manager via vRealize Lifecycle Suite Manager.
- Added `New-vROPSDeployment` cmdlet to deploy vRealize Operations Manager via vRealize Lifecycle Suite Manager in VMware Cloud Foundation aware mode.
- Added `Export-vRASJsonSpec` cmdlet to generate the Json specification file needed to deploy vRealize Automation via vRealize Lifecycle Suite Manager.
- Added `New-vRADeployment` cmdlet to deploy vRealize Automation via vRealize Lifecycle Suite Manager in VMware Cloud Foundation aware mode.
- Added `Install-vRLIPhotonAgent` cmdlet to download, install and configure the vRealize Log Insight Agent on Photon Operating System.
- Added `Add-vRLIAgentGroup` cmdlet to create an Agent Group in vRealize Log Insight
- Added `Register-vRLIWorkloadDomain` cmdlet to connect/disconnect a Workload Domain with vRealize Log Insight.
- Added `Set-vRLISyslogEdgeCluster` cmdlet to configure the Syslog settings for each NSX Edge node within a Workload Domains NSX Edge Cluster.
- Added `Add-vRLISmtpConfiguation` cmdlet to configure the SMTP Server settings for vRealize Log Insight
- Added `Add-vRLILogArchive` cmdlet to configure Email Notifications, Retention and Archive Location for vRealize Log Insight
- Added `Register-vROPSWorkloadDomain` cmdlet to connect/disconnect a Workload Domain with vRealize Operations Manager.
- Added `Add-vROPSCurrency` cmdlet to configure the currency for vRealize Opertations Manager
- Added `Add-vROPSGroupRemoteCollectors` cmdlet to create a Remote Collector Group and assign the remote collectors in vRealize Operations Manager
- Added `Update-vROPSAdapterVcenter` cmdlet to update the Remote Collector Group assignment for the vCenter Server Adapter in vRealize Operations Manager
- Added `Add-vROPSCredentialNsxt` cmdlet to create an NSX credential in vRealize Operations Manager
- Added `Add-vROPSAdapterNsxt` cmdlet to create an NSX Adapter and Start Collection in vRealize Operations Manager
- Added `Undo-vRSLCMLockerPassword` cmdlet to remove a password from the vRealize Suite Lifecycle Manager Locker.
- Added `Undo-vRSLCMLockerCertificate` cmdlet to remove a certificate from the vRealize Suite Lifecycle Manager Locker.
- Added `Undo-vRSLCMLockerLicense` cmdlet to remove a license from the vRealize Suite Lifecycle Manager Locker.
- Added `Undo-VMFolder` cmdlet to remove a folder from vCenter Server
- Added `Add-vRLIAuthenticationGroup` cmdlet to assign vRealize Log Insight roles to Workspace ONE Access Groups.
- Added Sample Scripts in the SampleScripts\iam folder, each script uses the Planning and Preparation Workbook as the input source:
    - `iamConfigureVsphere.ps1` automates all the configuration of vSphere/SDDC Manager elements for Identity and Access Management for VMware Cloud Foundation.
    - `iamConfigureWorkspaceOne.ps1` automates all the configuration of Workspace ONE Access elements for Identity and Access Management for VMware Cloud Foundation.
    - `iamConfigureNsx.ps1` automates all the configuration of the NSX elements for Identity and Access Management for VMware Cloud Foundation.
- Added Sample Scripts in the SampleScripts\ila folder, each script uses the Planning and Preparation Workbook as the input source:
    - `ilaDeployVrealizeLogInsight.ps1` automates the install and config of vRealize Log Insight for Intelligent Logging and Analytics for VMware Cloud Foundation.
    - `ilaConfigureVrealizeLogInsight.ps1` automates the integration config of vRealize Log Insight for Intelligent Logging and Analytics for VMware Cloud Foundation.
- Added `New-SupervisorClusterCSR` cmdlet to create a new certificate signing request for the defined Supervisor Cluster
- Added `Add-SupervisorClusterCertificate` cmdlet to add a signed TLS certificate for the defined Supervisor Cluster
- Added `Add-NamespaceVmClass` cmdlet to add an existing VM Class to a Supervisor Namespace
    
### Intelligent Logging and Analytics for VMware Cloud Foundation Updates
##### Implementation

Combined the following procedures:

* Download and Install the vRealize Log Insight Agent on the Clustered Workspace ONE Access Nodes
* Configure the vRealize Log Insight Agent on the Clustered Workspace ONE Access Nodes

Into a new single procedure:

* Download, Install and Configure the vRealize Log Insight Agent on the Clustered Workspace ONE Access Nodes

Added PowerValidatedSolutions automation to the following procedures:

* Deploy vRealize Log Insight by Using vRealize Suite Lifecycle Manager (***New-vRLIDeployment***)
* Configure SMTP for vRealize Log Insight (***New-vRLIDeployment***)
* Configure Log Retention and Archiving for vRealize Log Insight (***Add-vRLILogArchive***)
* Enable Authentication for vRealize Log Insight by Using Workspace ONE Access (***Add-vRLIAuthenticationWSA***)
* Sync Active Directory Groups to Workspace ONE Access (***Add-WorkspaceOneDirectoryGroup***)
* Assign vRealize Log Insight Roles to Active Directory Groups (***Add-vRLIAuthenticationGroup***)
* Connect a VI Workload Domain to vRealize Log Insight (***Register-vRLIWorkloadDomain***)
* Configure the NSX Edge Nodes to Forward Log Events to vRealize Log Insight (***Set-vRLISyslogEdgeCluster***)
* Download, Install and Configure the vRealize Log Insight Agent on the Clustered Workspace ONE Access Nodes (***Install-vRLIPhotonAgent***)
* Configure the vRealize Log Insight Agent Group for the Clustered Workspace ONE Access (***Add-vRLIAgentGroup***)
* Create a vRealize Log Insight Photon OS Agent Group for the Management Nodes (***Add-vRLIAgentGroup***)
 
### Intelligent Operations Management for VMware Cloud Foundation Updates
##### Implementation

Added PowerValidatedSolutions automation to the following procedures:

* Deploy vRealize Operations Manager by Using vRealize Suite Lifecycle Manager (***New-vROPSDeployment***)
* Synchronize the Groups for vRealize Operations Manager from the Identity Provider into Workspace ONE Access (***Add-WorkspaceOneDirectoryGroup***)
* Group the vRealize Operations Manager Remote Collector Nodes (***Add-vROPSGroupRemoteCollectorsy***)
* Set the Currency for Cost Calculation in vRealize Operations Manager (***Add-vROPSCurrency***)
* Connect vRealize Operations Manager to the VI Workload Domains in the First VMware Cloud Foundation Instance (***Register-vROPSWorkloadDomain***)
* Modify the vCenter Server Adapters for the First VMware Cloud Foundation Instance in vRealize Operations Manager (***Update-vROPSAdapterVcenter***)
* Add NSX-T Data Center Adapters in vRealize Operations Manager (***Add-vROPSAdapterNsxt***)

### Private Cloud Automation for VMware Cloud Foundation Updates
##### Implementation

Added PowerValidatedSolutions automation to the following procedures:

* Deploy vRealize Automation by Using vRealize Suite Lifecycle Manager (***New-vRADeployment***)
* Synchronize the Groups for vRealze Automation from the Identity Provider into Workspace ONE Access (***Add-WorkspaceOneDirectoryGroup***)

### Developer Ready Infrastructure for VMware Cloud Foundation Updates
##### Implementation

Added PowerValidatedSolutions automation to the following procedures:

* Replace the Supervisor Cluster Kubernetes API Endpoint Certificate (***New-SupervisorClusterCSR*** and ***Add-SupervisorClusterCertificate***)
* Enable a Virtual Machine Class for the Tanzu Kubernetes Cluster (***Add-NamespaceVmClass***)

### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates
##### Operational Guidance

* Added Shutdown and Startup procedures

### Navigation Improvements on core.vmware.com

And lastly based on feedback we are making a few adjustments to the navigation experience on core.vmware.com which is the marketplace for all VMware Validated Solutions, here’s a list of what’s new:

* ***Renamed Quick Links to Solution Quick Links*** - to remove confusion we have renamed the Quick Links menu bar to Solution Quick Links, so when your looking at a specific solution resource page there is a difference between this quick link label and the main VMware Validated Solutions landing page.
* ***Added Quick Link to Update History*** – each time the documentation for a VMware Validated Solution is updated, what’s changed is tracked in an Update History table within the solution documentation. This new Quick Link will take you directly to this section of the documentation.

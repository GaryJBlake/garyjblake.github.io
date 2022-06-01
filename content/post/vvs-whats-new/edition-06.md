+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #6 (Mar 2022)"
date = "2022-03-29"
description = "What's New for VMware Validated Solutions - Edition #6 (Mar 2022)"
tags = [

]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS Whats New",
]
+++

**Last Updated:** 29-Mar-2022

Welcome to Edition #6 of the What's New for VMware Validated Solutions, today we are announcing the following changes:

* Additional automation based on the PowerValidatedSolutions v1.5.0 release
* Additional Operational Guidance (example Personas)
* Additional automation for procedures within Solution Interoperability section

### Identity and Access Management for VMware Cloud Foundation

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-identity-and-access-management)

**Design Decision Changes**
* IAM-WSA-LOG-003 - Configure a dedicated Workspace ONE Access agent group and assign the standalone Workspace ONE Access FQDN **(NEW)**
* IAM-WSA-LOG-004 - Configure a dedicated Photon OS agent group and assign the standalone Workspace ONE Access FQDN. **(NEW)**

**Procedure Changes**
* Combined the below procedures into *`Install and Configure the vRealize Log Insight Agent on the Standalone Workspace ONE Access Appliance`*
    - *Download and Install the vRealize Log Insight Agent on the Standalone Workspace ONE Access Appliance*
    - *Configure the vRealize Log Insight Agent on the Standalone Workspace ONE Access Appliance*

**Additional PowerValidatedSolutions Automation**
* Install and Configure the vRealize Log Insight Agent on the Standalone Workspace ONE Access Appliance (***Install-vRLIPhotonAgent***)
* Create a vRealize Log Insight Identity Manager Agent Group for the Standalone Workspace ONE Access (***Add-vRLIAgentGroup***)
* Create a vRealize Log Insight Photon OS Agent Group for the Standalone Workspace ONE Access (***Add-vRLIAgentGroup***)


### Developer Ready Infrastructure for VMware Cloud Foundation

##### [Implementation](https://core.vmware.com/implementation-developer-ready-infrastructure)

**Additional PowerValidatedSolutions Automation**
* Replace the Supervisor Cluster Kubernetes API Endpoint Certificate (***Request-SignedCertificate***)
* License the Supervisor Cluster (***Add-SupervisorClusterLicense***)


### Intelligent Logging and Analytics for VMware Cloud Foundation Updates

##### [Operational Guidance](https://core.vmware.com/operational-guidance-intelligent-logging-and-analytics)

* Example Personas to illustrate product role to organization role assignments

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-intelligent-logging-and-analytics)

**Design Decision Changes**
* ILA-VRLI-MON-005 - Configure the vRealize Log Insight adapter to use the remote collector group **(NEW)**
* ILA-VRLI-MON-006 - Add a Ping adapter for the vRealize Log Insight cluster nodes **(NEW)**

**Additional PowerValidatedSolutions Automation**
* Add a Ping adapter for the vRealize Log Insight cluster nodes (***Add-vROPSAdapterPing***)


### Intelligent Operations Management for VMware Cloud Foundation Updates

##### [Operational Guidance](https://core.vmware.com/operational-guidance-intelligent-operations-management)

* Example Personas to illustrate product role to organization role assignments

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-intelligent-operations-management)

**Design Decision Changes**
* IOM-VROPS-LOG-005 - Configure a dedicated Photon OS agent group and assign the vRealize Operations Manager Cluster and Remote Collector Node FQDNs **(CHANGED)**

**Procedure Changes**
* Changed from *`Add the vRealize Operations Manager Nodes to the vRealize Log Insight Photon OS Agent Group`* to *`Create a vRealize Log Insight Photon OS Agent Group for the vRealize Operations Manager Nodes`*

**Additional PowerValidatedSolutions Automation**
* Create a vRealize Log Insight Photon OS Agent Group for the vRealize Operations Manager Nodes (***Add-vRLIAgentGroup***)


### Private Cloud Automation for VMware Cloud Foundation Updates

##### [Operational Guidance](https://core.vmware.com/operational-guidance-private-cloud-automation)

* Example Personas to illustrate product role to organization role assignments

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-private-cloud-automation)

**Design Decision Changes**
* PCA-VRA-MON-005 - Add a Ping adapter for the vRealize Automation cluster nodes **(NEW)**
* Original PCA-VRA-MON-005 becomes PCA-VRA-MON-006 **(CHANGED)**
* Original PCA-VRA-MON-006 becomes PCA-VRA-MON-007 **(CHANGED)**
* PCA-VRA-LOG-004 - Configure a dedicated Photon OS agent group and assign the vRealize Automation Cluster FQDNs **(CHANGED)**

**Procedure Changes**
* Changed from *`Add the vRealize Automation Cluster Nodes to the vRealize Log Insight Photon OS Agent Group`* to *`Create a vRealize Log Insight Photon OS Agent Group for the vRealize Automation Cluster Nodes`*

**Additional PowerValidatedSolutions Automation**
* Add a Ping adapter for the vRealize Automation cluster nodes (***Add-vROPSAdapterPing***)
* Create a vRealize Log Insight Photon OS Agent Group for the vRealize Automation Cluster Nodes (***Add-vRLIAgentGroup***)


### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates

##### [Implementation](https://core.vmware.com/implementation-site-protection-and-disaster-recovery)

**Additional PowerValidatedSolutions Automation**
* Reconfigure DNS and Domain Search on the vRealize Suite Lifecycle Manager Appliance (***Set-vRSLCMDnsConfig***)
* Reconfigure NTP on the vRealize Suite Lifecycle Manager Appliance (***Add-vRSLCMNtpServer***)
* Reconfigure DNS and Domain Search on the Clustered Workspace ONE Access Nodes (***Set-WorkspaceOneDnsConfig***)
* Reconfigure NTP on the Clustered Workspace ONE Access Nodes (***Set-WorkspaceOneNtpConfig***)
* Reconfigure DNS and Domain Search on the vRealize Operations Manager Analytics Cluster Nodes (***Set-vROPSDnsConfig***)
* Reconfigure NTP on the vRealize Operations Manager Analytics Cluster Nodes (***Add-vROPSNtpServer***)


##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-site-protection-and-disaster-recovery)

**Design Decision Changes**
* SPR-SRM-LOG-002 - Configure the vRealize Log Insight agent to transmit logs from the Site Recovery Manager instance to the adjacent vRealize Log Insight in the VMware Cloud Foundation instance using the vRealize Log Insight ingestion API, cfapi, on port 9000 **(NEW)**
* Original SPR-SRM-LOG-002 becomes SPR-SRM-LOG-003 **(CHANGED)**
* SPR-SRM-LOG-004 - Configure the vRealize Log Insight agent to transmit logs from the vSphere Replication instance to the adjacent vRealize Log Insight in the VMware Cloud Foundation instance using the vRealize Log Insight ingestion API, cfapi, on port 9000 **(NEW)**
* SPR-SRM-LOG-005 - Configure a dedicated Photon OS agent group and assign the Site Recovery Manager and vSphere Replication FQDNs **(CHANGED)** 

**Procedure Changes**
* Combined the below procedures into *`Install and Configure the vRealize Log Insight Agent on the Site Recovery Manager and vSphere Replication Appliances`*
    - *Download and Install the vRealize Log Insight Agent on the Site Recovery Manager and vSphere Replication Appliances*
    - *Configure the vRealize Log Insight Agent on the Site Recovery Manager and vSphere Replication Appliances*
* Changed from *`Add the Site Recovery Manager and the vSphere Replication Appliances to the vRealize Log Insight Photon OS Agent Group`* to *`Create a vRealize Log Insight Photon OS Agent Group for Site Recovery Manager and the vSphere Replication`*

**Additional PowerValidatedSolutions Automation**
* Install and Configure the vRealize Log Insight Agent on the Site Recovery Manager and vSphere Replication Appliances (***Install-vRLIPhotonAgent***)
* Create a vRealize Log Insight Photon OS Agent Group for Site Recovery Manager and the vSphere Replication (***Add-vRLIAgentGroup***)


### General Availability of PowerValidatedSolutions v1.5.0

Release of [PowerValidatedSolutions v1.5.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.5.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Enhanced `Add-SsoPermission` cmdlet to verify that the SSO Group exists in vCenter Single Sign-On.
- Enhanced `Enable-SupervisorCluster` cmdlet additional enhancements around pre-validation of inputs.
- Enhanced `Add-vRLIAgentGroup` cmdlet to support adding multiple Agent Groups of the same type.
- Enhanced `Add-vROPSAdapterNsxt` cmdlet to support defaulting to Default collector group rather than using custom remote collector group.
- Enhanced `Add-vROPSAdapterPing` cmdlet to support defaulting to Default collector group rather than using custom remote collector group.
- Enhanced `Set-WorkspaceOneNtpConfig` cmdlet to support updating NTP configuration for Clustered Workspace ONE Access
- Added `Undo-WorkspaceOneNsxtIntegration` cmdlet to disable the integration between NSX Manager and Workspace ONE Access.
- Added `Undo-SsoPermission` cmdlet to remove a user or group's access from vCenter Single Sign-On.
- Added `Undo-NsxtVidmRole` cmdlet to remove user or group's access from NSX-T Data Center.
- Added `Undo-ClusterGroup` cmdlet to remove a vSphere DRS Cluster Group.
- Added `Undo-vCenterGlobalPermission` cmdlet to remove vSphere Global Permissions from vCenter Server.
- Added `Undo-vSphereRole` cmdlet to remove a custom vSphere Role from vCenter Server.
- Added `Undo-AntiAffinityRule` cmdlet to remove an Anti-Affinity Rule from vCenter Server.
- Added `Undo-VmStartupRule` cmdlet to remove a VM to VM vSphere DRS Rule from vCenter Server.
- Added `Undo-WorkspaceOneDirectoryGroup` cmdlet to remove Active Directory Groups from Workspace ONE Access Directory sync.
- Added `Add-SupervisorClusterLicense` cmdlet to install and assign a license to a Supervisor Cluster.
- Added `Request-SignedCertificate` cmdlet to request a signed certificate from a Microsoft Certificate Authority.
- Added `Set-vRSLCMDnsConfig` cmdlet to update the DNS configuration of vRealize Suite Lifecycle Manager.
- Added `Undo-vRSLCMDnsConfig` cmdlet to revert the DNS configuration of vRealize Suite Lifecycle Manager to match SDDC Manager.
- Added `Add-vRSLCMNtpServer` cmdlet to add NTP Servers to vRealize Suite Lifecycle Manager.
- Added `Undo-vRSLCMNtpServer` cmdlet to revert the NTP configuration of vRealize Suite Lifecycle Manager to match SDDC Manager.
- Added `Set-WorkspaceOneDnsConfig` cmdlet to update the DNS configuration of Workspace ONE Access.
- Added `Undo-WorkspaceOneDnsConfig` cmdlet to revert the DNS configuration of Workspace ONE Access to match SDDC Manager.
- Added `Set-vROPSDnsConfig` cmdlet to update the DNS configuration of vRealize Operations Manager.
- Added `Undo-vROPSDnsConfig` cmdlet to revert the DNS configuration of vRealize Operations Manager to match SDDC Manager.
- Added `Add-vROPSNtpServer` cmdlet to add NTP Servers to vRealize Operations Manager.
- Added `Undo-vROPSNtpServer` cmdlet to revert the NTP configuration of vRealize Operations Manager to match SDDC Manager.
- Added Sample Scripts in the SampleScripts\iam folder, each script uses the Planning and Preparation Workbook as the input source:
    - `iamUndoDeployment.ps1` automates the removal of the Identity and Access Management for VMware Cloud Foundation validated solution.
- Updated Sample Scripts in the SampleScripts\iam folder, each script uses the Planning and Preparation Workbook as the input source:
    - `iamConfigureWorkspaceOne.ps1` updated input values to use latest VCF 4.4.x Planning and Prep Workbook.
- Added Sample Scripts in the SampleScripts\dri folder, each script uses the Planning and Preparation Workbook as the input source:
    - `driConfigureSupervisorCluster.ps1` automates the configuration of vSphere, NSX and enables the Supervisor Cluster.
    - `driDeployTanzuCluster.ps1` automates the the deployment of a Tanzu Kubernetes Cluster.
    - `driUndoDeployment.ps1` automates the removal of the Developer Ready Infrastructure for VMware Cloud Foundation validated solution.
- Added Sample Scripts in the SampleScripts\ila folder, each script uses the Planning and Preparation Workbook as the input source:
    - `ilaUndoVrealizeLogInsight.ps1` automates the removal of Intelligent Logging and Analytics for VMware Cloud Foundation validated solution.

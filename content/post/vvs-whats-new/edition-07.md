+++
author = "GaryJBlake"
title = "What's New for VMware Validated Solutions - Edition #7 (Apr 2022)"
date = "2022-04-28"
description = "What's New for VMware Validated Solutions - Edition #7 (Apr 2022)"
tags = [

]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS Whats New",
]
+++

**Last Updated:** 28-Apr-2022

Welcome to Edition #7 of the What's New for VMware Validated Solutions, today we are announcing the following updates:

* Additional automation based on the PowerValidatedSolutions v1.6.0 release
* Release of PowerValidatedSolutions v1.6.0, our PowerShell module developed to ensure robustness, consistency, and accelerate implementation


### Identity and Access Management for VMware Cloud Foundation

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-identity-and-access-management)

**Additional PowerValidatedSolutions Automation**
* Add a VMware Identity Manager Adapter for the Standalone Workspace ONE Access Instance (***Add-vROPSAdapterIdentityManager***)


### Intelligent Logging and Analytics for VMware Cloud Foundation Updates

##### [Solution Interoperability](https://core.vmware.com/solution-interoperability-intelligent-logging-and-analytics)

**Additional PowerValidatedSolutions Automation**
* Reconfigure the Remote Collector Group for the vRealize Log Insight Integration (***Update-vROPSAdapterCollecterGroup***)


### Site Protection and Disaster Recovery for VMware Cloud Foundation Updates

##### [Implementation](https://core.vmware.com/implementation-site-protection-and-disaster-recovery)

**Additional PowerValidatedSolutions Automation**
* Reconfigure DNS and Domain Search on the vRealize Automation Nodes (***Set-vRADnsConfig***)
* Reconfigure NTP on vRealize Automation (***Set-vRANtpConfig***)
* Create a Port Group for vSphere Replication Traffic (***New-vSRPortGroup***)
* Create a Site Pair Between the Protected and Recovery VMware Cloud Foundation Instances (***New-SRMSitePair***)
* Configure Mappings between the Protected and the Recovery VMware Cloud Foundation Instances (***Add-SRMMapping***)


### General Availability of PowerValidatedSolutions v1.6.0

Release of [PowerValidatedSolutions v1.6.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/1.6.0), which is a PowerShell module that we have developed to not only accelerate the implementation of Validated Solutions, but ensure consistency and robustness.  Here's a list of what's changed (this and previous updates can be tracked by reading the CHANGELOG.md file stored in the Git Hub repository):

- Fixed `Add-vROPSAdapterNsxt` cmdlet so that the description is maintained when validating the certificate of the NSX-T Adapter
- Added `Add-vROPSAdapterIdentityManager` cmdlet to support adding a new Identity Manager Adapter in vRealize Operations Manager.
- Added `Undo-vROPSAdapter` cmdlet to support the removal of an Adapter from vRealize Operations Manager.
- Added `Undo-vROPSCredential` cmdlet to support the removal of an Adapter Credential from vRealize Operations Manager.
- Added `Update-vROPSAdapterCollecterGroup` cmdlet tto support updating the collector group for an Adapter in vRealize Operations Manager
- Added `Set-vRADnsConfig` cmdlet to configure the DNS server(s) and DNS search domain(s) on vRealize Automation to use custom settings.
- Added `Undo-vRADnsConfig` cmdlet to revert the DNS configuration of vRealize Automation to match SDDC Manager.
- Added `Set-vRANtpConfig` cmdlet to configure the NTP server(s) on vRealize Automation to use custom settings.
- Added `Undo-vRANtpConfig` cmdlet to revert the NTP configuration of vRealize Automation to match SDDC Manager.
- Added `Add-SRMMapping` cmdlet to create a mapping between objects (folder, network, or compute resource) in the protected and failover VCF
instances in Site Recovery Manager
- Added `Undo-SRMMapping` cmdlet to remove a mapping between objects (folder, network, or compute resource) in the protected and failover VCF
instances in Site Recovery Manager
- Added `New-SRMSitePair` cmdlet to create a site pair between Site Recovery Manager instances
- Added `Undo-SRMSitePair` cmdlet to remove an existing site pair between Site Recovery Manager instances.
- Added `New-vSRPortGroup` cmdlet to create port groups for vSphere Replication appliances in the protected and recovery sites.
- Added `Undo-vSRPortGroup` cmdlet to remove port groups for vSphere Replication appliances in the protected and recovery sites.
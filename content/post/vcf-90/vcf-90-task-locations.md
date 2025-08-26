+++
author = "GaryJBlake"
title = "VMware Cloud Foundation 9.0: Transitioning from SDDC Manager to VCF Operations"
date = "2025-07-03"
description = "VMware Cloud Foundation 9.0: Transitioning from SDDC Manager to VCF Operations"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation 9.0"
]
series = [

]
+++

### Where Do I Perform Tasks in VMware Cloud Foundation 9.0

With the release of VMware Cloud Foundation 9.0 and if you’re familiar with previous releases there are some significant changes when it comes to navigating and performing various tasks.

If you’re not aware with VMware Cloud Foundation 9.0 Broadcom has announced that the SDDC Manager User Interface is deprecated and will be removed in a future release, the reason for this being that in order to deliver a truly integrated platform and simplified management VCF Operations is now the central console.

Whilst the SDDC Manager User Interface is still present and you can still perform many tasks from within, you should be aware that performing some tasks using it do not get immediately reflected within the VCF Operations User Interface and are dependant on syncing schedules (for example certificate replacement).

It’s for this reason that I would recommend getting use to performing such tasks using the VCF Operations User Interface, the following list can be used as a cheat sheet in helping to navigate to the correct location:

* Management Domain Bring-up:
  * **Primary Method:**
    * VCF Installer
* Network Pool Creation/Expansion/Deletion
  * **Primary Method:**
    * vCenter ( Global Inventory lists > Hosts > Network Pools )
  * **Alternative Method(s):**
    * SDDC Manager ( Administration > Network Settings > Network Pool )
* Host Commissioning:
  * **Primary Method:**
    * vCenter ( Global Inventory lists > Hosts > Unassigned Hosts > Commission Hosts )
  * **Alternative Method(s):**
    * SDDC Manager ( Inventory > Hosts > Commission Hosts )
* Host Decommissioning:
  * **Primary Method:**
    * vCenter ( Global Inventory lists > Hosts > Unassigned Hosts > Decommission Selected Hosts )
  * **Alternative Method(s):**
    * SDDC Manager ( Inventory > Hosts > Unassigned Hosts > Decommission Selected Hosts )
* Workload Domain Deployment:
  * **Primary Method:**
    * VCF Operations ( Inventory > VCF Instance > Add Workload Domain > Create New )
  * **Alternative Method(s):**
    * SDDC Manager ( Inventory > Workload Domains > Add Workload Domain )
* Cluster Creation:
  * **Primary Method:**
    * vCenter Server ( Hosts and Clusters > Datacenter Object > New Cluster > Create SDDC Cluster )
  * **Alternative Method(s):**
    * SDDC Manager ( Inventory > Workload Domains > Clusters > Add Cluster )
* Cluster Expansion:
  * **Primary Method:**
    * vCenter Server ( Hosts and Clusters > Datacenter Object > Cluster Object > Add Hosts > Add Unassigned Hosts )
  * **Alternative Method(s):** 
    * SDDC Manager ( Inventory > Workload Domains > Clusters > Add Hosts > Add Unassigned Hosts )
* Configure Backup;
  * **Primary Method:**
    * VCF Operations ( Fleet Management > Lifecycle > Settings > SFTP Settings / Backup Settings ) - Fleet, VCF Automation & VCF Identity Broker
    * VCF Operations ( Inventory > VCF Instance > Actions > Manage VCF Instance Settings > Backup Settings ) - VCF Instances
  * **Alternative Method(s):**
    * SDDC Manager ( Administration > Backup ) - SDDC Manager & NSX Manager
* Configure Network Settings (DNS & NTP)
  * **Primary Method:**
    * VCF Operations ( Inventory > VCF Instance > Actions > Manage VCF Instance Settings > Network Settings )
  * **Alternative Method(s):**
    * SDDC Manager ( Administration > Network Settings )
* Configure Certificate Authority
  * **Primary Method:**
    * VCF Operations ( Fleet Management > Certificates )
  * **Alternative Method(s):**
    * SDDC Manager ( Security > Certificate Authority )
* Certificate Management
  * **Primary Method:**
    * VCF Operations ( Fleet Management > Certificates )
  * **Alternative Method(s):**
    * SDDC Manager ( Inventory > Workload Domains > Workload > Certificates )
* Password Management
  * **Primary Method:**
    * VCF Operations ( Fleet Management > Passwords ) - No rotate / rotate all / schedule rotate password
  * **Alternative Method(s):**
    * SDDC Manager ( Security > Password Management ) - SDDC Manager managed accounts only
* Deploy NSX Edge Cluster
  * **Primary Method:**
    * vCenter ( vCenter Object > Networks > Network Connectivity > Configure Network Connectivity )
  * **Alternative Method(s):**
    * NSX Manager ( System > Quickstart > Setup Network Connectivity )
    * NSX Manager ( System > Fabric > Nodes )
    * SDDC Manager ( API Only )

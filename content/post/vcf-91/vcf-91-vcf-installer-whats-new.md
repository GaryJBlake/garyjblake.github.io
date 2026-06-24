+++
author = "GaryJBlake"
title = "VMware Cloud Foundation 9.1: VCF Installer What's New"
date = "2026-05-12"
description = "VMware Cloud Foundation 9.1: VCF Installer What's New"
tags = [
    "VCF 9.1",
    "VCF Installer"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Installer"
]
series = [
    "VMware Cloud Foundation 9.1: What's New"
]
+++

With the release of VMware Cloud Foundation 9.1, there comes a new version of the VCF Installer. This release introduces a lot of new capabilities so lets dig into the details of what's new. For the purpose of this post I've broken these down into the following key areas.

* [Progress Bar](#progress-bar)
* [Deployment Paths](#deployment-paths)
* [Plan Section](#plan-section)
* [Prepare Section](#prepare-section)

### Progress Bar

The first big change involves an overhaul of the general workflow where a new progress bar has been added covering four key stages **Introduction**, **Plan**, **Prepare** and **Deploy**. Once a stage has been completed, you move into the next stage of the progress bar. These stage markers can also be used as navigation allowing you to return to a previous stage if needed, this reduces the number backward clicks required compared to the previous release.

* **Introduction** - Provides an overview of the deployment wizard for either VMware Cloud Foundation or VMware vSphere Foundation and allows you to select the relevant deployment path (see [Deployment Paths](#deployment-paths)).
* **Plan** - Provides a central place for selecting various architecture decisions such as reusing existing components (see [Existing Components](#existing-components)), deployment sizing, network and storage options and prerequisites.
* **Prepare** - Within the prepare section you provide your configuration details for the deployment such as FQDS, VLANS, IP Addresses, hostnames etc.
* **Deploy** - Perform validation of your configuration and then start the deployment.

![](/post/vcf-91/vcf-91-vcf-installer-progress-bar.png)
*Figure 1. VCF Installer: Progress Bar*

### Deployment Paths

Within the **Introduction** section there is a new **Deployment Paths** step, from here depending on which product you're deploying (VMware Cloud Foundation or VMware vSphere Foundation) you are presented with a number of options as follows:

***VMware Cloud Foundation***
* **Deploy a new VCF fleet** - deploys a fresh platform also referred to as greenfield.
* **Deploy a new VCF Instance** - deploys an additional VCF Instance to an already deployed VCF fleet.
* **Deploy deferred components** - deploys the management components that were deferred during the initial deployment (VCF Operations and VCF Automation), this allows for additional network configuration options which was an API only method in VMware Cloud Foundation 9.1.

***VMware vSphere Foundation***
* **Deploy new VMware vSphere Foundation** - deplpys a fresh platform also referred to as Greenfield.
* **Deploy VCF Management Services** - deploy VCF management services within an existing VMware vSphere Foundation environment.

With these new options, the VCF Installer becomes even more a multi-purpose tool, meaning it can be used more than once and for different scenarios depending on your needs.

![](/post/vcf-91/vcf-91-vcf-installer-deployment-paths.png)
*Figure 2. VCF Installer: VMware Cloud Foundation Deployment Paths*

### Plan Section

For VCF Installer 9.1 a new **Plan** section within the deployment wizard has been introduced, the idea here is to present you with key planning decisions earlier in the process. Another aspect has been the consolidation of various questions into a single place. Let's take a look at each of the following sections:

* [Existing Components](#existing-components)
* [Size Options](#size-options)
* [Network Options](#network-options)
* [Storage Options](#storage-options)
* [Review Prerequisites](#review-prerequisites)

#### Existing Components

Depending on your current state and assuming your not performing full greenfield implementation you have the ability to reuse existing components from your current infrastructure. This is commonly referred to as **Converging** to VMware Cloud Foundation. The options available here are:

* **I have an existing VCF Operations 9.1 instance** - You select this option if you have a pre-existing instance of VCF Operations, this could be as a result of manually upgrading the instance prior to deploying VMware Cloud Foundation.
* **I have an existing vCenter instance** - You select this option when you have an existing vSphere environment where you want to transition the vCenter and its vSphere clusters into a management domain vCenter.
* **The vCenter instance is registered with NSX Manager** - You select this option if the vCenter instance being transitioned into a management domain vCenter has an NSX Manager instance registered to it. (If no NSX Manager instance is registered the VCF Installer will deploy one as part of the deployment).
* **I have an existing VCF Automation instance or I will deploy later** - You select this option if you want to import an existing VCF Automation instance.

![](/post/vcf-91/vcf-91-vcf-installer-existing-components.png)
*Figure 3. VCF Installer: VMware Cloud Foundation Existing Components*

#### Size Options

The **Size Options** page is a newly consolidated location for selecting the initial sizing of components, in the previous release you were required to set sizing on a component by component basis. For VMware Cloud Foundation 9.1 this has been simplified to one screen where you firstly select the **Deployment Model** of either **Simple** which deploys a single node for each component or **High Availability** which deploys three-nodes for each components that support the configuration (NSX Manager, VCF Operations, VCF Management Services and VCF Automation). Then you choose your size. Once you have made your selections the component sizes tables is updated to reflect your decisions providing a breakdown by component of vCPUs, RAM in GB and Disk in GB requirements.

![](/post/vcf-91/vcf-91-vcf-installer-sizing-options.png)
*Figure 4. VCF Installer: VMware Cloud Foundation Size Options*

#### Network Options

The **Network Options** page allows you to accept the default network configuration which is defined as:

* Management traffic requires two separate VLANs - one for the ESX host management network and one for the VM management network.
* VCF Automation, VCF Operations, VCF management services use the VM management network.
* A distributed Transit Gateway will be configured to make the domain VPC-ready, which requires a separate VLAN.
* Networking will be configured with IPv4 by default.

Alternatively your can click the customize button and make adjustments such as placing components on dedicated networks or choosing between Distributed or Centralized connectivity for VPC networking.

![](/post/vcf-91/vcf-91-vcf-installer-network-options.png)
*Figure 5. VCF Installer: VMware Cloud Foundation Network Options*

#### Storage Options

The **Storage Options** page allows you to select which principle storage is used for your management domain. Additionally you can select vSAN specific configuration such as Data-in-Transit encryption (ESA and OSA) or vSAN Deduplication and Compression (OSA only).

![](/post/vcf-91/vcf-91-vcf-installer-storage-options.png)
*Figure 6. VCF Installer: VMware Cloud Foundation Storage Options*

#### Review Prerequisites

The **Review Prerequisites** page provides detailed requirements for the deployment as follows:

* **Resource Requirements Details** - displays a breakdown of each component and the total vCPU, RAM (GB) and Disk (GB) requirements based on the selection. Figure 7, shows these requirements based on Medium, High Availability deployment model.

![](/post/vcf-91/vcf-91-vcf-installer-resource-requirements.png)
*Figure 7. VCF Installer: VMware Cloud Foundation Resource Requirements*

* **VLAN Requirements Details** - displays each VLAN network requirement for the deployment and along with a description of which components consume which VLAN.

![](/post/vcf-91/vcf-91-vcf-installer-vlan-requirements.png)
*Figure 8. VCF Installer: VMware Cloud Foundation VLAN Requirements*

* **FQDNs and IP Addresses** - displays the FQDN, IP Address and IP Scheme requirements for each component.

![](/post/vcf-91/vcf-91-vcf-installer-fqdns-requirements.png)
*Figure 9. VCF Installer: VMware Cloud Foundation FQDN and IP Addresses Requirements*

### Prepare Section

One of key theme for VCF Installer 9.1 has been about providing more guidance to the user as you populate the information required to perform the deployment. As previously mentioned the **Review Prerequisites** section (see [Review Prerequisites](#review-prerequisites)) includes the resource requirement details, this same information is shown at the top of the **Hosts** page as **Capacity Overview** and once you have added your host FQDNs, confirmed their fingerprints and clicked **Next**, the VCF Installer will collect the configuration of each host and check the total capacity of the physical hosts against the projected requirements to ensure enough capacity exists. If VCF Installer computes that there is less than 20% overhead capacity across the provided hardware it will display a warning, see **Figure 10**.

![](/post/vcf-91/vcf-91-vcf-installer-capacity-overview.png)
*Figure 10. VCF Installer: VMware Cloud Foundation Capacity Overview*

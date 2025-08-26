+++
author = "GaryJBlake"
title = "Understanding VMware Cloud Foundation 9.0: Key Terminology Explained"
date = "2025-06-17"
description = "Understanding VMware Cloud Foundation 9.0: Key Terminology Explained"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation 9.0"
]
series = [

]
+++

VMware Cloud Foundation 9.0 has finally arrived, this much anticipated release brings together what were a collection of individual products into what is now considered a single on-premies private cloud platform. In this post I'm going to help you understand some of the terminology and constructs behind VMware Cloud Foundation 9.0, if you can master these then your well on your way to getting your head around whats changed and the direction in which Broadcom is taking the product.

#### VCF Domains

The term VCF domains is the collective name for management and workload domains within a VCF Instance, in previous versions the collective name for them was simply workload domains. A VCF domain consists of the following components:

* One vCenter instance
* One or more vSphere clusters with vSphere HA and vSphere DRS enabled.
* One or more vSphere Distributed Switches per cluster used for system, storage and NSX traffic.
* One NSX instance (single node or three node cluster) for configuring and implementing software-defined networking.

***Management Domain***

The management domain is created during the deployment or convergence process by the VCF Installer. It contains the management components of the VCF Instance, VCF Operations and VCF Automation. In addition to the components that are common for each VCF domain, the management domain includes the SDDC Managaer appliance, that adds workflows for infrastructure management automation to the VCF Operations instance for the VCF fleet.

***Workload Domain***

You create workload domains (previously referred to as VI workload domains) in VCF Operations to run consumer workloads. For the first workload domain in your environment, VCF Operations deploys a vCenter instance and an NSX instance in the management domain. For each additional workload domain, VCF Operations deploys an additional vCenter instance. New workload domains can share the same NSX instance with an existing workload domain or you can deploy a new NSX instance. Workload domains cannot use the NSX instance for the management domain.

#### VCF Instance

If you're familiar with earlier versions of VMware Cloud Foundation then you will already be aware of the term a VCF Instance, this refers to the compute, storage, and network virtual infrastructure that run both management and consumer workloads. A VCF Instance consists of VCF domains, a management domain and, optionally one or more workload domains. The first vSphere cluster of a management domain hosts the management components for the VCF Instance, which include SDDC Manager, vCenter, and NSX.

#### VCF Fleet

A VCF fleet is an environment that is managed by a single set of fleet-level components which include VCF Operations and VCF Automation. A VCF fleet can contain one or more VCF Instances and might also contain one or more standalone vCenter instances, all managed by a single VCF Operations instance for the fleet. The management domain of the first VCF Instance in the VCF fleet hosts these fleet-level components.

#### VCF Private Cloud

A VCF private cloud is the highest level of management and consumption for the underlying software-defined data center resources. A VCF private cloud can contain one or more VCF fleets.

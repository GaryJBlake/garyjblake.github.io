+++
author = "GaryJBlake"
title = "vCloud Connector v1.5"
date = "2011-12-12"
description = "vCloud Connector v1.5"
tags = [
    "vCloud Director"
]
categories = [
    
]
series = [

]
+++

 In November 2011 VMware released the latest version of their free tool called vCloud Connector. The purpose of this application is to enable customers to migrate virtual machines between vSphere, Private vCloud and Public vCloud platforms. With the latest release there have been various enhancements which include:

- Direct connectivity to vcloud.vmware.com
- New architecture
With the release of v1.5 the vCloud Connector architecture has been re-designed. VMware has created three distinct components:
- vCloud Connector UI
The vCloud Connector UI is the user interface, this can be presented to the vSphere Client  or vcloud.vmware.com

- vCloud Connector Server
The vCloud Connection Server is a virtual appliance that is deployed to manage and coordinate tasks.

- vCloud Connector Node
The vCloud Connector Nodes are virtual appliances that handle the transfer of content from one cloud to another.

![](/archive/2011/vCloud-Connector-Architecture.png)
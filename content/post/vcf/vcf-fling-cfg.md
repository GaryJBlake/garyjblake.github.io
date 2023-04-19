+++
author = "GaryJBlake"
title = "New Fling - VMware Cloud Foundation Configuration File Generator"
date = "2023-04-19"
description = "New Fling - VMware Cloud Foundation Configuration File Generator"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation"
]
series = [

]
+++

This week we released a new VMware Fling, [VMware Cloud Foundation Configuration File Generator](https://flings.vmware.com/vmware-cloud-foundation-configuration-file-generator) which is a containerized web application developed to replace the Deployment Parameter Workbook used for performing the VMware Cloud Foundation Bring-up of the Management Domain.

VMware Cloud Builder supports providing either the Deployment Parameter Workbook an Excel workbook which is then converted into JSON format and used by the Bring-up engine or simply providing the JSON file already created. Using this web-based application you can import a previous JSON file, create a new JSON file from scratch and export ready for use with VMware Cloud Builder.

The big win here is that the web-based application also allows us to perform extensive validation across all inputs, something which is limited in the Deployment Parameter Workbook today due to not wanting to use VBScript which would introduce a security risk on the Excel workbook.

What this ultimately means is that when the JSON file is created using the web-based application and then passed to VMware Cloud Builder, you don't end up getting validation failures based on things like password complexity or IP subnet validations, instead all of these types of validation tasks should simply succeed leaving the physical infrastructure validations to proceed exposing real issues that may impact the Bring-up process.

As already mentioned [VMware Cloud Foundation Configuration File Generator](https://flings.vmware.com/vmware-cloud-foundation-configuration-file-generator) is shipped as a containerized web application which can be run on VMware Fusion/Workstation or Docker Desktop with ease.

With the initial release, we have provided two versions of the containerized application to support the current releases of VMware Cloud Foundation. This is required as between the releases some changes have occurred within the JSON specification so we decided to handle this through version specific releases, the idea being the the web-based application could be tied to a VMware Cloud Builder release. Versions supported are:

* VMware Cloud Foundation 4.4.x
* VMware Cloud Foundation 4.5.x

It's also worth calling out that with the current release of [VMware Cloud Foundation Configuration File Generator](https://flings.vmware.com/vmware-cloud-foundation-configuration-file-generator) we only support vSAN Ready Nodes and not VxRail Nodes, like any Fling we had to make some calls early in the development process to lock down the scope, otherwise these projects can become very open ended and nothing gets delivered.

We believe the work done on this Fling will provide our customers and partners significant value, of course time will tell so if you have feedback or comments please leave them on the Fling page. Don't delay download today!

A **BIG THANK YOU** to the team involved in making this happen, Bohdan Karabadzhak, Nikola Tomevski, Todor Todorov and Alexander Nenkov, its been a pleasure working with you all on this project.

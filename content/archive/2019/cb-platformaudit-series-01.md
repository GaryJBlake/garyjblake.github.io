+++
author = "GaryJBlake"
title = "Part 1 - What is PlatformAudit?"
date = "2019-09-30"
description = "Part 1 - What is PlatformAudit?"
tags = [
    "Cloud Builder"
]
categories = [
    "VMware Cloud Builder"
]
series = [
    "PlatformAudit"
]
+++

In order to implement a Software-Defined Data Center (SDDC) there are  many VMware components that get implemented along with a number of prerequisite requirements.  Some of the prerequisites we have full control over but many fall within the responsibility of the end customer. As a result in order to ensure the smoothest possible deployment its imperative that we have the ability to perform various pre-flight checks to help minimize and reduce the risk of costly failures during the deployment process.

For around 3 years within my business unit we had an internal deployment tool to automate the build out of the VMware Validated Design (VVD). Utilized by the VVD team, VMware Professional Services Organization and Certified Partners it has been used in numerous deployments both for internal and customer facing scenarios, during this time we have experienced first hand the impact of not having the ability to perform some level of pre-flight checking and as a direct result spent a lot of time developing auditing functionality built into the tool, with the shift to VMware Cloud Builder there was a gap as no such auditing functionality existed.

PlatformAudit was originally a command line only utility developed to perform these various validation tasks against the platform being prepared and the data provided in the Deployment Parameter XLS file which is converted into a JSON file. Later we extended the reach with the introduction of REST APIs to allow us to expose the functionality into the web based user interface for VMware Validated Designs and VMware Cloud Foundation.

There you have it, a quick intro into what PlatformAudit is and why it exists, I will add some further posts around this topic so stay tuned.
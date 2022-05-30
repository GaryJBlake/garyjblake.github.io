+++
author = "GaryJBlake"
title = "VVS-Tip - Unlocking Automation Capabilities with PowerValidatedSolutions"
date = "2021-12-09"
description = "VVS-Tip - Unlocking Automation Capabilities with PowerValidatedSolutions"
tags = [
    "PowerShell",
    "PowerVCF",
    "PowerCLI",
    "API",
]
categories = [
    "VMware Validated Solutions",
]
series = [
    "VVS-Tip",
]
+++

**Did you know that the PowerShell module PowerValidatedSolution can be used for more than implementing the VMware Validated Solutions?**

Whilst the primary goal for the PowerShell module has been to enable a robust and automated way to implement the various procedures across solutions, its very nature unlocks the power for cmdlet's to be used across the VMware portfolio. One of the fundamental directives for our development work was to minimize the reliance on other PowerShell modules. There are many community based modules on PS Gallery some of which already provided some of the functionality we required however because they are community based future development is not guaranteed and we have no direct control to fix issues in a timely manner.

We do utilise PowerCLI first and foremost and for VMware Cloud Foundation APIs PowerVCF both of which are VMware developed but beyond that we have created an array of functions which support the following products:

- vCenter Server
- NSX-T Data Center
- Workspace ONE Access
- vRealize Suite Lifecycle Manager
- vRealize Log Insight
- vRealize Operations Manager
- vRealize Automation

Download [PowerValidatedSolutions](https://www.powershellgallery.com/packages/PowerValidatedSolutions) and check them out.
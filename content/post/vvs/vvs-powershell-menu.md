+++
author = "GaryJBlake"
title = "Simplified Consumption of PowerShell Automation with VMware Validated Solutions"
date = "2024-06-13"
description = "Simplified Consumption of PowerShell Automation with VMware Validated Solutions"
tags = [
    "PowerShell",
    "PowerValidatedSolutions",
	  "VVS"
]
categories = [
    "VMware Validated Solutions"

]
series = [

]
+++
**Last Updated:** 13-Jun-2024

### Background

When we started on the VMware Validated Solution journey nearly three years ago, one of the main criteria we agreed on was to provide our customers with an automated way to deploy and configure whatever was defined within a solution. During the process we also did some analysis on tooling and came to the decision that we would use PowerShell as our automation tool of choice based on the flexibility it gave us.

Since the initial release of solutions like [Identity and Access Management](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation) in the solution guide we have included the automation as a PowerShell Procedure along-side UI Procedures to make it easy for the reader to switch between either method. One of the other reasons for doing this is that we didn't have full automation coverage for every procedure in every solution guide so it was an easy way for us to incrementally add the missing automation as it was developed.

For the most popular solutions we have had full coverage of automation for some time now and have recently been receiving feedback that the automation is great but there was frustration that in order to perform end-to-end deployments you either have to copy/paste procedure after procedure or create your own script to execute all steps in a single workflow. For a couple of years now we have included Sample Scripts to perform this kind of end-to-end workflow (I even wrote a number of blogs on the topic) but with them not contained within the PowerShell Module for VMware Validated Solutions itself they were not heavily tested release after release.

### Introducing Single Execution Functions

With the release of [PowerValidatedSolutions v2.10.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.10.0) we decided to rectify this by adding additional functionality to enable execution in a single cmdlet. This also presented a need to extract the input data directly from the Planning and Preparation Workbook as well as an opportunity to support performing prerequisite checks prior to commencing the deployment.

For each of the validated solutions we now have the following functions:

* `Export-???JsonSpec` - Extracts data from the Planning and Preparation Workbook to a JSON specification file.
* `Test-???Prerequisite` - Reads data from the JSON specification file and performs appropriate prerequisites checks.
* `Request-???MscaSignedCertificate` - Executes the required functions to obtain or create signed-certificates from a Microsoft Certificate Authority (not required by all validated solutions).
* `Invoke-???Deployment` - Reads data from the JSON specification file and performs the installation and configuration procedures as per the implementation section of the solution guide.
* `Invoke-Undo??Deployment` - Reads data from the JSON specification file and reverses the installation and configuration procedures as per the implementation section of the solution guide.

For each function we use an abbreviation for each solution see the menu screenshot below.

### Introducing Menu Driven Execution

Not only that we have built and included a simple menu to execute it all!! By executing a single command `Start-ValidatedSolutionMenu` you can perform all the aforementioned tasks without executing multiple command line actions.

```powershell
Start-ValidatedSolutionMenu -jsonPath F:\vvs\generatedJsons\ -certificatePath F:\vvs\certificates\ -binaryPath F:\vvs\binaries\ -protectedWorkbook F:\vvs\pnpWorkbook.xlsx -logPath F:\vvs\logs\
```

![](/post/vvs/vvs-powershell-menu.png)

### Conclusion

With the release of [PowerValidatedSolutions v2.10.0](https://www.powershellgallery.com/packages/PowerValidatedSolutions/2.10.0) we continue to innovate and simplify consumption of the purpose build automaton to help drive time to value through a repeatable process.

If your getting value from this PowerShell module or you have suggestions or finding issues then please open an issue or start a discussion on the [GitHub Project](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation) or leave a message on the post.

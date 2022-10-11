+++
author = "GaryJBlake"
title = "End-to-End Automation of Intelligent Logging and Analytics Validated Solution"
date = "2022-10-11"
description = "End-to-End Automation of Intelligent Logging and Analytics Validated Solution"
tags = [
    "API",
    "PowerShell",
	"VVS",
    "ILA"
]
categories = [
    "VMware Validated Solutions",
	"PowerVCF"
]
series = [

]
+++

If your not already familiar with the [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation) validated solution it’s primary purpose is to provide logging, analytics and reporting for VMware Cloud Foundation infrastructure components.

This is achieved through the deployment of vRealize Log Insight and the configuration of it's content packs to collect log data from ESXi, vCenter Server, NSX-T Data Center, SDDC Manager, vRealize Suite Lifecycle Manager, and Workspace ONE Access.

The roles and personas documented ([here](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-58C15E63-1B60-47EE-A7F4-B2B0B669196E.html)) should be considered as a minimum requirement when implementing the Intelligent Logging and Analytics validated solution but there is nothing stopping customers adding more granular roles where possible or even personas that better align with their own organizations roles and responsibilities.

Now you have a better understanding of what the Intelligent Logging and Analytics for VMware Cloud Foundation validated solution provides let’s look at how we can automate the implementation. Each validated solution provides both UI and Infrastructure-as-code based procedures. The Infrastructure-as-code method is delivered through the use of a PowerShell module specifically created to support validated solutions called [PowerValidatedSolutions](https://www.powershellgallery.com/packages/PowerValidatedSolutions), each UI based procedure has a PowerShell cmdlet equivalent that not only performs the operation but ensures pre and post validation checks are performed to provide robustness.

Included with the PowerValidatedSolution PowerShell module which can be installed directly from the Microsoft PS Gallery there is a **SampleScripts** folder and contained within that a folder named **ila** which contains sample **.ps1** script files. These sample scripts demonstrate linking multiple procedures into a single executable script using the Planning and Preparation Workbook as the input for all data.  

For the Intelligent Logging and Analytics validated solution this is broken down into the following two phases and therefore two scripts are provided:

- Deploy and Configure vRealize Log Insight
- Configure VMware Cloud Foundation Components

As already mentioned the scripts use the Planning and Preparation Workbook to obtain all the required inputs, this is the first step in the execution. The script checks that the path provided to the workbook is valid and then opens the workbook, reading the required information using named cells.

Once that step is complete it begins the process of executing each procedure based on the order of steps defined within the implementation guide.

In addition to providing the main cmdlets supporting the validated solution implementation procedures a number of cmdlets are included that provide supporting capabilities which are utilized by the scripts.

- ***Start-SetupLogFile*** - this cmdlet is used to configure a log file where the output of each step is logged.
- ***Write-LogMessage*** - this cmdlet is used to format the output of messages both to the console and log file.
- ***Debug-CatchWriter*** - this cmdlet is used to provide a consistent way of displaying exception errors should they occur.

For each procedure executed by the script, the output is captured into variables and then redirected to the Write-LogMessage cmdlet for display to the console and log in a consistent way. There are three types of output messages:

- **INFO** - Used for informational messages and successful execution of a procedure.
- **WARNING** - Used when a procedure is skipped due to the process already being executed.
- **ERROR** - Used to display a failure along with the failure reason.

Let’s now take a deeper look at the scripts.

## Deploy and Configure vRealize Log Insight (ilaDeployVrealizeLogInsight.ps1)

The **ilaDeployVrealizeLogInsight.ps1** script automates all the procedures associated with the deployment and configuration of vRealize Log Insight which includes:

- Adding vRealize Log Insight License to vRealize Suite Lifecycle Manager
- Importing the vRealize Log Insight Certificate to vRealize Suite Lifecycle Manager
- Adding the vRealize Log Insight Admin Password to vRealize Suite Lifecycle Manager
- Deploying vRealize Log Insight by Using vRealize Suite Lifecycle Manager
- Creating Virtual Machine and Template Folder for vRealize Log Insight
- Moving the vRealize Log Insight Virtual Machines to the Dedicated Folder
- Configuring a vSphere DRS Anti-Affinity Rule for vRealize Log Insight
- Creating a VM Group and Define the Startup Order of the vRealize Log Insight Cluster
- Adding the vRealize Log Insight Virtual Machines to the First Availability Zone VM Group
- Configuring SMTP for vRealize Log Insight
- Configuring Log Retention and Archiving for vRealize Log Insight
- Activating Authentication for vRealize Log Insight by Using Workspace ONE Access
- Syncing Active Directory Groups to Workspace ONE Access
- Assigning vRealize Log Insight Roles to Active Directory Groups

Execution of the **ilaDeployVrealizeLogInsight.ps1** script is performed by using the following command:

``` Powershell
.\SampleScripts\ila\ilaDeployVrealizeLogInsight.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

## Configure VMware Cloud Foundation Components (ilaConfigureVrealizeLogInsight.ps1)

The **ilaConfigureVrealizeLogInsight.ps1** script automates the deployment and configuration of the VMware Cloud Foundation components. This includes:

- Connecting a VI Workload Domain to vRealize Log Insight
- Configuring the NSX Edge Nodes to Forward Log Events to vRealize Log Insight
- Installing and Configuring the vRealize Log Insight Agent on the Clustered Workspace ONE Access Nodes
- Configuring the vRealize Log Insight Agent Group for the Clustered Workspace ONE Access
- Creating a vRealize Log Insight Photon OS Agent Group for the Management Nodes

Execution of the **ilaConfigureVrealizeLogInsight.ps1** script is performed by using the following command:

``` PowerShell
.\SampleScripts\ila\ilaConfigureVrealizeLogInsight.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

After execution of these scripts in the order described above, and assuming that each step completed successfully your environment is fully configured based on the design and [implementation procedures](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-81771A14-7B6F-4280-8904-4A5A34D555EB.html) documented within the [Intelligent Logging and Analytics for VMware Cloud Foundation](https://core.vmware.com/intelligent-logging-and-analytics-vmware-cloud-foundation) validated solution.

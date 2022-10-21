+++
author = "GaryJBlake"
title = "End-to-End Automation of Intelligent Operations Management Validated Solution"
date = "2022-10-12"
description = "End-to-End Automation of Intelligent Operations Management Validated Solution"
tags = [
    "API",
    "PowerShell",
	"VVS",
    "IOM"
]
categories = [
    "VMware Validated Solutions",
	"PowerVCF"
]
series = [

]
+++

If your not already familiar with the [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation) validated solution it’s primary purpose is to provide operations monitoring, analytics and reporting for VMware Cloud Foundation infrastructure components.

This is achieved through the deployment of vRealize Operations and the configuration of it's management packs to collect data from ESXi, vCenter Server, NSX-T Data Center, SDDC Manager, vRealize Suite Lifecycle Manager, and Workspace ONE Access.

The roles and personas documented ([here](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-operations-management-v1/GUID-4D64072D-7E73-48E9-9C0F-3640FCF3B1D0.html)) should be considered as a minimum requirement when implementing the Intelligent Operations Management validated solution but there is nothing stopping customers adding more granular roles where possible or even personas that better align with their own organizations roles and responsibilities.

Now you have a better understanding of what the Intelligent Operations Management for VMware Cloud Foundation validated solution provides let’s look at how we can automate the implementation. Each validated solution provides both UI and Infrastructure-as-code based procedures. The Infrastructure-as-code method is delivered through the use of a PowerShell module specifically created to support validated solutions called [PowerValidatedSolutions](https://www.powershellgallery.com/packages/PowerValidatedSolutions), each UI based procedure has a PowerShell cmdlet equivalent that not only performs the operation but ensures pre and post validation checks are performed to provide robustness.

Included with the PowerValidatedSolution PowerShell module which can be installed directly from the Microsoft PS Gallery there is a **SampleScripts** folder and contained within that a folder named **iom** which contains sample **.ps1** script files. These sample scripts demonstrate linking multiple procedures into a single executable script using the Planning and Preparation Workbook as the input for all data.  

For the Intelligent Operations Management validated solution this is broken down into the following two phases and therefore two scripts are provided:

- Deploy and Configure vRealize Operations
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

## Deploy and Configure vRealize Operations (iomDeployVrealizeOperations.ps1)

The **iomDeployVrealizeOperations.ps1** script automates all the procedures associated with the deployment and configuration of vRealize Operations which includes:

- Adding the vRealize Operations Manager License to vRealize Suite Lifecycle Manager
- Importing the Certificate for vRealize Operations Manager to vRealize Suite Lifecycle Manager
- Adding the vRealize Operations Manager Password to vRealize Suite Lifecycle Manager
- Deploying vRealize Operations Manager by Using vRealize Suite Lifecycle Manager
- Creating Virtual Machine and Template Folders for the vRealize Operations Manager Virtual Machines
- Moving the vRealize Operations Manager Virtual Machines to the Dedicated Folders
- Configuring vSphere DRS Anti-Affinity Rules for the vRealize Operations Manager Virtual Machines
- Creating a VM Group and Define the Startup Order of the vRealize Operations Manager Analytics Cluster Virtual Machines
- Creating a VM Group and Define the Startup Order of the vRealize Operations Manager Remote Collector Virtual Machines
- Adding the vRealize Operations Manager Virtual Machines to the First Availability Zone VM Group
- Grouping the vRealize Operations Manager Remote Collector Nodes
- Synchronizing the Active Directory Groups for vRealize Operations Manager in Workspace ONE Access
- Configuring User Access in vRealize Operations Manager
- Setting the Currency for Cost Calculation in vRealize Operations Manager
- Configuring Email Alert Plug-in Settings for vRealize Operations Manager

Execution of the **iomDeployVrealizeOperations.ps1** script is performed by using the following command:

``` Powershell
.\SampleScripts\iom\iomDeployVrealizeOperations.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

## Configure VMware Cloud Foundation Components (iomConfigureVrealizeOperations.ps1)

The **iomConfigureVrealizeOperations.ps1** script automates the deployment and configuration of the VMware Cloud Foundation components. This includes:

- Connecting vRealize Operations Manager to the VI Workload Domains in the First VMware Cloud Foundation Instance
- Modifying the vCenter Server Adapters for the First VMware Cloud Foundation Instance in vRealize Operations Manager
- Adding NSX-T Data Center Adapters in vRealize Operations Manager
- Installing the SDDC Health Monitoring Solution in vRealize Operations Manager
- Renaming the SDDC Health Adapters for the vRealize Operations Manager Analytics Cluster Nodes
- Adding SDDC Health Adapters for the vRealize Operations Manager Remote Collector Nodes
- Activating the Ping Management Pack in vRealize Operations Manager
- Adding Ping Adapters for the vRealize Operations Manager Nodes
- Adding Ping Adapters for the Clustered Workspace ONE Access
- Creating Notifications in vRealize Operations Manager for VMware Cloud Foundation Issues

Execution of the **iomConfigureVrealizeOperations.ps1** script is performed by using the following command:

``` PowerShell
.\SampleScripts\iom\iomConfigureVrealizeOperations.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

After execution of these scripts in the order described above, and assuming that each step completed successfully your environment is fully configured based on the design and [implementation procedures](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-81771A14-7B6F-4280-8904-4A5A34D555EB.html]) documented within the [Intelligent Operations Management for VMware Cloud Foundation](https://core.vmware.com/intelligent-operations-management-vmware-cloud-foundation) validated solution.

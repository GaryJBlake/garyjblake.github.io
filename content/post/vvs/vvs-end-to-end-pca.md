+++
author = "GaryJBlake"
title = "End-to-End Automation of Private Cloud Automation Validated Solution"
date = "2022-10-24"
description = "End-to-End Automation of Private Cloud Automation Validated Solution"
tags = [
    "API",
    "PowerShell",
	"VVS",
    "PCA"
]
categories = [
    "VMware Validated Solutions",
	"PowerVCF"
]
series = [

]
+++

If your not already familiar with the [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation) validated solution it’s primary purpose is to implement a modern cloud automation platform that delivers self-service automation, DevOps for infrastructure, and orchestration.

This is achieved through the deployment of vRealize Automation and the integration with one of more VMware Cloud Foundation instances.

The roles and personas documented ([here](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-private-cloud-automation-v1/GUID-A618FE5A-8140-4458-A13C-2CDF5A210D1A.html)) should be considered as a minimum requirement when implementing the Private Cloud Automation validated solution but there is nothing stopping customers adding more granular roles where possible or even personas that better align with their own organizations roles and responsibilities.

Now you have a better understanding of what the Private Cloud Automation for VMware Cloud Foundation validated solution provides let’s look at how we can automate the implementation. Each validated solution provides both UI and Infrastructure-as-code based procedures. The Infrastructure-as-code method is delivered through the use of a PowerShell module specifically created to support validated solutions called [PowerValidatedSolutions](https://www.powershellgallery.com/packages/PowerValidatedSolutions), each UI based procedure has a PowerShell cmdlet equivalent that not only performs the operation but ensures pre and post validation checks are performed to provide robustness.

Included with the PowerValidatedSolution PowerShell module which can be installed directly from the Microsoft PS Gallery there is a **SampleScripts** folder and contained within that a folder named **pca** which contains sample **.ps1** script files. These sample scripts demonstrate linking multiple procedures into a single executable script using the Planning and Preparation Workbook as the input for all data.  

For the Private Cloud Automation validated solution this is provided using a single script:

- Deploy and Configure vRealize Automation

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

## Deploy and Configure vRealize Automation (pcaDeployVrealizeAutomation.ps1)

The **pcaDeployVrealizeAutomation.ps1** script automates all the procedures associated with the deployment and configuration of vRealize Automation which includes:

- Adding the vRealize Automation License to vRealize Suite Lifecycle Manager
- Importing the Certificate for vRealize Automation to vRealize Suite Lifecycle Manager
- Adding the vRealize Automation Password to vRealize Suite Lifecycle Manager
- Deploying vRealize Automation by Using vRealize Suite Lifecycle Manager
- Creating a Virtual Machine and Template Folder for the vRealize Automation Cluster Virtual Machines
- Moving the vRealize Automation Cluster Virtual Machines to the Dedicated Folder
- Creating a Virtual Machine and Template Folder and a Resource Pool for the vRealize Automation-Managed Workloads on the VI Workload Domain vCenter Server
- Configuring a vSphere DRS Anti-Affinity Rule for the vRealize Automation Cluster Virtual Machines
- Creating a VM Group and Define the Startup Order of the vRealize Automation Cluster Virtual Machines
- Adding the vRealize Automation Cluster Virtual Machines to the First Availability Zone VM Group
- Configuring the Organization Name for vRealize Automation
- Synchronizing the Active Directory Groups for vRealize Automation in Workspace ONE Access
- Assigning Organization and Service Roles to the Groups for vRealize Automation
- Defining Custom Roles in vSphere for vRealize Automation and vRealize Orchestrator
- Configuring Service Account Permissions for the vRealize Automation and vRealize Orchestrator Integrations to vSphere
- Restricting the vRealize Automation and vRealize Orchestrator Service Accounts Access to the Management Domain
- Restricting the vRealize Automation and vRealize Orchestrator Service Accounts Access to Virtual Machine and Datastore Folders in the VI Workload Domain
- Configure Service Account Permissions for the vRealize Automation to NSX-T Data Center Integration on the VI Workload Domain NSX Manager Cluster
- Adding Cloud Accounts for the VI Workload Domains to vRealize Automation
- Configuring the Cloud Zones in vRealize Automation
- Configuring Email Alerts in Service Broker
- Importing the Trusted Certificates to vRealize Orchestrator
- Adding the VI Workload Domain vCenter Server to vRealize Orchestrator

Execution of the **pcaDeployVrealizeAutomation.ps1** script is performed by using the following command:

``` Powershell
.\SampleScripts\pca\pcaDeployVrealizeAutomation.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

After execution of the script, and assuming that each step completed successfully your environment is fully configured based on the design and [implementation procedures](https://core.vmware.com/implementation-private-cloud-automation]) documented within the [Private Cloud Automation for VMware Cloud Foundation](https://core.vmware.com/private-cloud-automation-vmware-cloud-foundation) validated solution.

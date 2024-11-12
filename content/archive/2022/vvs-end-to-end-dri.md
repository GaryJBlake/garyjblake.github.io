+++
author = "GaryJBlake"
title = "End-to-End Automation of Developer Ready Infrastructure Validated Solution"
date = "2022-10-06"
description = "End-to-End Automation of Developer Ready Infrastructure Validated Solution"
tags = [
    "API",
    "PowerShell",
	"VVS",
    "DRI"
]
categories = [
    "VMware Validated Solutions",
	"PowerVCF"
]
series = [

]
+++

If your not already familiar with the [Developer Ready Infrastructure for VMware Cloud Foundation](https://core.vmware.com/developer-ready-infrastructure-vmware-cloud-foundation) validated solution it’s primary purpose is to provide enterprise grade infrastructure, suitable for developers to consume for the deployment of modern applications, using VMware Cloud Foundation as its foundational layer.

The Developer Ready Infrastructure validated solution achieves this by walking you through the configuration of each of the required components including NSX-T Data Center, vSphere Storage Policies, vSphere Tanzu and more.

The roles and personas documented ([here](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-developer-ready-infrastructure-v1/GUID-B7E5346A-D83B-4593-B0C6-14DB62638B2D.html)) should be considered as a minimum requirement when implementing the Developer Ready Infrastructure validated solution but there is nothing stopping customers adding more granular roles where possible or even personas that better align with their own organizations roles and responsibilities.

Now you have a better understanding of what the Developer Ready Infrastructure for VMware Cloud Foundation validated solution provides let’s look at how we can automate the implementation. Each validated solution provides both UI and Infrastructure-as-code based procedures. The Infrastructure-as-code method is delivered through the use of a PowerShell module specifically created to support validated solutions called [PowerValidatedSolutions](https://www.powershellgallery.com/packages/PowerValidatedSolutions), each UI based procedure has a PowerShell cmdlet equivalent that not only performs the operation but ensures pre and post validation checks are performed to provide robustness.

Included with the PowerValidatedSolution PowerShell module which can be installed directly from the Microsoft PS Gallery there is a **SampleScripts** folder and contained within that a folder named **dri** which contains sample **.ps1** script files. These sample scripts demonstrate linking multiple procedures into a single executable script using the Planning and Preparation Workbook as the input for all data.  

For the Developer Ready Infrastructure validated solution this is broken down into the following two phases and therefore two scripts are provided:

- Deploy and Configure the Supervisor Cluster
- Deploy a Tanzu Kubernetes Cluster

As already mentioned the scripts use the Planning and Preparation Workbook to obtain all the required inputs, this is the first step in the execution. The script checks that the path provided to the workbook is valid and then opens the workbook, reading the required information using named cells.

Once that step is complete it begins the process of executing each procedure based on the order of steps defined within the implementation guide.

In addition to providing the main cmdlets supporting the validated solution implementation procedures a number of cmdlets are included that provide supporting capabilities which are utilised by the scripts.

- ***Start-SetupLogFile*** - this cmdlet is used to configure a log file where the output of each step is logged.
- ***Write-LogMessage*** - this cmdlet is used to format the output of messages both to the console and log file.
- ***Debug-CatchWriter*** - this cmdlet is used to provide a consistent way of displaying exception errors should they occur.

For each procedure executed by the script, the output is captured into variables and then redirected to the Write-LogMessage cmdlet for display to the console and log in a consistent way. There are three types of output messages:

- **INFO** - Used for informational messages and successful execution of a procedure.
- **WARNING** - Used when a procedure is skipped due to the process already being executed.
- **ERROR** - Used to display a failure along with the failure reason.

Let’s now take a deeper look at the scripts.

## Deploy and Configure the Supervisor Cluster (driConfigureSupervisorCluster.ps1)

The **driConfigureSupervisorCluster.ps1** script automates all the procedures associated with the configuration of vSphere, NSX-T Data Center and deploying the Supervisor Cluster. This includes:

**NSX-T Data Center**

- Adding a Network Segment
- Adding IP Prefix Lists
- Creating a Route Map on the Tier-0 Gateway

**vSphere**

- Assigning a New Tag to the vSAN Datastore
- Creating a Storage Policy that Uses the New vSphere Tag
- Creating a Subscribed Content Library

**Supervisor Cluster**

- Deploying a Supervisor Cluster
- Replacing the Supervisor Cluster Kubernetes API Endpoint Certificate
- Licensing the Supervisor Cluster
- Deploying a Supervisor Namespace
- Assigning the Supervisor Namespace Roles to Active Directory Groups
- Activating the Registry Service on the Supervisor Cluster

Execution of the **driConfigureSupervisorCluster.ps1** script is performed by using the following command:

``` powershell
.\SampleScripts\dri\driConfigureSupervisorCluster.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

## Deploy a Tanzu Kubernetes Cluster (driDeployTanzuCluster.ps1)

The **driDeployTanzuCluster.ps1** script automates the deployment and configuration of a Tanzu Kubernetes Cluster. This includes:

- Deploying a Namespace for the Tanzu Kubernetes Cluster
- Assigning the New Tanzu Cluster Namespace Roles to Active Directory Groups
- Adding a Virtual Machine Class for the Tanzu Kubernetes Cluster
- Provisioning a Tanzu Kubernetes Cluster

Execution of the **driDeployTanzuCluster.ps1** script is performed by using the following command:

``` powershell
.\SampleScripts\dri\driDeployTanzuCluster.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

After execution of these scripts in the order described above, and assuming that each step completed successfully your environment is fully configured based on the design and [implementation procedures](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-developer-ready-infrastructure-v1/GUID-E3C98B72-EE54-491E-AC71-C07F52AAF5E2.html) documented within the [Developer Ready Infrastructure for VMware Cloud Foundation](https://core.vmware.com/developer-ready-infrastructure-vmware-cloud-foundation) validated solution.

+++
author = "GaryJBlake"
title = "Automating VCF – Commission Hosts"
date = "2020-05-16"
description = "Automating VCF – Commission Hosts"
tags = [
    "API",
    "PowerShell",
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "PowerVCF"
]
series = [
    "VCF Automation"
]
+++

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

This is the third of six blogs in a series that discusses automating VMware Cloud Foundation using the Public APIs and PowerVCF. The series illustrates deploying the Management Domain, creating a Network Pool, commissioning ESXi host, deploying a Workload Domain including NSX-T Edge Cluster and vRealize Suite Lifecycle Manager.

In this post, we take a look at how to commission hosts in SDDC Manager, and consume the new network pool to support a workload domain deployment.

**VMware Cloud Foundation APIs Used**

* POST /v1/hosts
* GET /v1/network-pools
* GET /v1/tasks/{id}

**PowerVCF Cmdlets**

* Commission-VCFHost
* Get-VCFNetworkPool
* Get-VCFTask

**PowerShell Scripts**

* [createCommissionHostSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createCommissionHostSpec.ps1)

**Procedure**

1. Download and populate the Planning and Preparation Workbook for your target platform.

2. To generate the JSON spec using inputs from the Planning and Preparation Workbook run the following command:
``` powershell
.\createCommissionHostSpec.ps1 -Workbook "E:\MyLab\pnpWorkbook.xlsx" -Json "E:\MyLab\sfo\sfo-workloadCommissionHosts.json"
```

The [createCommissionHostSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createCommissionHostSpec.ps1) script will open the supplied Planning and Preparation Workbook, read the Workload Domain tab into a variable and then proceed to generate the JSON spec required by the Public API.

3. Authenticate to the SDDC Manager appliance by running the following command:
``` powershell
Request-VCFManager -fqdn "sfo-vcf01.sfo.rainpole.io" -username "administrator@vsphere.local" -password "VMw@re1!"
```

4. Obtain the details of the network pool by running the following command:
``` powershell
$networkPool = Get-VCFNetworkPool | Where {$_.name -eq $networkPoolName}
```

Using the **Get-VCFNetworkPool** cmdlet we want to retrieve the details of the new network pool from SDDC Manager and store them in a variable which is used in the next step. Here we are using the ***$networkPoolName*** variable which is created during the execution of the [createCommissionHostSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createCommissionHostSpec.ps1) script to identify the name of the network pool as defined in the Planning and Preparation Workbook.

5. Update the POOL-ID value in the JSON spec with the unique ID of the network pool by running the following command:
``` powershell
(Get-Content "E:\MyLab\sfo\sfo-workloadCommissionHosts.json") | Foreach-Object {$_ -replace 'POOL-ID', $($networkPool.id)} | Set-Content "E:\MyLab\sfo\sfo-workloadCommissionHosts.json"
```

In this procedure we are performing a search and replace in the ***sfo-workloadCommissionHosts.json*** where we replace **POOL-ID** with the unique id of the network pool contained in the $networkPool.id element of the variable from step 5.

6. Start the commissioning host workflow by running the following command:
``` powershell
$commissionHosts = Commission-VCFHost -json :E:\MyLab\sfo\sfo-workloadCommissionHosts.json"
```

Using the **Commission-VCFHosts** cmdlet, we trigger the commissioning hosts workflow, here I'm capturing the output of the command into a variable to be used in the next step.

7. Poll the status of the commission host workflow, by running the following command:
``` powershell
Do { $status = Get-VCFTask -id $commissionHosts.id} While ($status.status -eq "In Progress")
```

Here we are polling the status of the workflow, using the unique **ID** from the **Commission-VCFHost** cmdlet which we retrieve from the variable ***$commissionHosts.id*** and pass this time to the **Get-VCFTask** cmdlet. We perform a Do / While loop where we are looking for status of "In Progress", once the state changes from "In Progress" we break from the loop.

That completes the process of generating a commission hosts JSON spec used by the public API and running the commission hosts workflow in SDDC Manager.

- - - 

### Other Posts in Series

* [Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/archive/2020/powervcf-automation)
* [Automating VCF - Deploy Management Domain](/archive/2020/powervcf-automation-01)
* [Automating VCF - Create Network Pool](/archive/2020/powervcf-automation-02)
* [Automating VCF - Commission Hosts](/archive/2020/powervcf-automation-03)
* [Automating VCF - Deploy Workload Domain](/archive/2020/powervcf-automation-04)
* [Automating VCF - Deploy NSX-T Edge Cluster](/archive/2020/powervcf-automation-05)
* [Automating VCF - Deploy vRealize Suite Lifecycle Manager](/archive/2020/powervcf-automation-06)

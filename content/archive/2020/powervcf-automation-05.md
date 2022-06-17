+++
author = "GaryJBlake"
title = "Automating VCF – Deploy NSX-T Edge Cluster"
date = "2020-05-30"
description = "Automating VCF – Deploy NSX-T Edge Cluster"
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

This is the fifth of six blogs in a series that discusses automating VMware Cloud Foundation using the Public APIs and PowerVCF. The series illustrates deploying the Management Domain, creating a Network Pool, commissioning ESXi host, deploying a Workload Domain including NSX-T Edge Cluster and vRealize Suite Lifecycle Manager.

In this post,  we take a look at how to initiate the NSX-T edge cluster deployment in SDDC Manager.

**VMware Cloud Foundation APIs Used**

* GET /v1/clusters
* POST /v1/edge-clusters
* GET /v1/tasks/{id}

**PowerVCF Cmdlets

* Get-VCFCluster
* New-VCFEdgeCluster
* Get-VCFTask

**PowerShell Scripts**

* [createWorkloadEdgeSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createWorkloadEdgeSpec.ps1)

**Procedure**

1. Download and populate the Planning and Preparation Workbook for your target platform.

2. To generate the JSON spec using inputs from the Planning and Preparation Workbook run the following command:
``` powershell
.\createWorkloadEdgeSpec.ps1 -Workbook "E:\pnpWorkbook.xlsx" -Json "E:\MyLab\sfo\sfo-workloadEdge.json" -nsxtPassword "VMw@re1!VMw@re1!"
```

The [createWorkloadEdgeSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createWorkloadEdgeSpec.ps1) script will open the supplied Planning and Preparation Workbook, read the Workload Domain tab into a variable and then proceed to generate the JSON spec required by the Public API.

You will notice that we are passing in an additional value relating to passwords for NSX-T, this is because the Planning and Preparation Workbook does not store any passwords.

3. Authenticate to the SDDC Manager appliance by running the following command:
``` powershell
Request-VCFToken -fqdn "sfo-vcf01.sfo.rainpole.io" -username "administrator@vsphere.local" -password "VMw@re1!"
```

4. Obtain details around the workload domain from the JSON spec created during the workload domain workflow by running the following command:
``` powershell
$workloadDomain = (Get-Content "E:\MyLab\sfo\sfo-workloadDomain.json") | ConvertFrom-Json
```

In this step we are capturing all of the details from the JSON spec of the workload domain. We will use this in the next step to obtain the workload domain name.

5. Obtain the VCF Cluster details by running the following command:
``` powershell
$cluster = Get-VCFCluster | Where {$_.name -eq $($workloadDomain.computeSpec.clusterSpecs.name)}
```

In this procedure we are using the **Get-VCFCluster** cmdlet to obtain the cluster information with a name that matches the value from ***$workloadDomain.computeSpec.clusterSpecs.name***.

6. Update the **CLUSTER-ID** value in the JSON spec with the unique ID of the workload domain cluster by running the following command:
``` powershell
(Get-Content "E:\MyLab\sfo\sfo-workloadEdge.json") | Foreach-Object {$_ -replace ‘CLUSTER-ID', $($cluster.id)} | Set-Content "E:\MyLab\sfo\sfo-workloadEdge.json"
```

In this procedure we are performing a search and replace in the ***sfo-workloadEdge.json*** where we replace ***CLUSTER-ID*** with the unique id of the VMware Cloud Foundation Cluster contained in the ***$cluster.id*** element of the variable from step 5.

7. Start the edge cluster deployment workflow by running the following command:
``` powershell
$workloadEdge = New-VCFEdgeCluster -json "E:\MyLab\sfo\sfo-workloadEdge.json"
```

Using the **New-VCFEdgeCluster** cmdlet, we trigger the edge cluster deployment workflow, here I'm capturing the output of the command into a variable to be used in the next step.

As part of the **New-VCFEdgeCluster** cmdlet we also execute the validation API to check the JSON spec prior to actually triggering the workflow, if an error exists the process will abort allowing you fix things up before trying again.

8. Poll the status of the edge cluster deployment workflow, by running the following command:
``` powershell
Do { $status = Get-VCFTask -id $workloadEdge.id} While ($status.status -eq "In Progress")
```

Here we are polling the status of the workflow, using the unique **ID** from the **New-VCFEdgeCluster** cmdlet which we retrieve from the variable ***$workloadEdge.id*** and pass to the **Get-VCFTask** cmdlet. We perform a Do / While loop where we are looking for status of "In Progress", once the state changes from "In Progress" we break from the loop.

That completes the process of generating a edge cluster JSON spec used by the public API and running the edge cluster deployment workflow in SDDC Manager.

- - - 

### Other Posts in Series

* [Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/archive/2020/powervcf-automation)
* [Automating VCF - Deploy Management Domain](/archive/2020/powervcf-automation-01)
* [Automating VCF - Create Network Pool](/archive/2020/powervcf-automation-02)
* [Automating VCF - Commission Hosts](/archive/2020/powervcf-automation-03)
* [Automating VCF - Deploy Workload Domain](/archive/2020/powervcf-automation-04)
* [Automating VCF - Deploy NSX-T Edge Cluster](/archive/2020/powervcf-automation-05)
* [Automating VCF - Deploy vRealize Suite Lifecycle Manager](/archive/2020/powervcf-automation-06)
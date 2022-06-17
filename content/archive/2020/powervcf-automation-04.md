+++
author = "GaryJBlake"
title = "Automating VCF – Deploy Workload Domain"
date = "2020-05-19"
description = "Automating VCF – Deploy Workload Domain"
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

This is the fourth of six blogs in a series that discusses automating VMware Cloud Foundation using the Public APIs and PowerVCF. The series illustrates deploying the Management Domain, creating a Network Pool, commissioning ESXi host, deploying a Workload Domain including NSX-T Edge Cluster and vRealize Suite Lifecycle Manager.

In this post, we take a look at how to initiate the workload domain deployment in SDDC Manager.

**VMware Cloud Foundation APIs Used**

* POST /v1/domains
* POST /v1/domains/validations
* GET /v1/hosts
* GET /v1/tasks/{id}

**PowerVCF Cmdlets**

* New-VCFWorkloadDomain
* Get-VCFHost
* Get-VCFTask

**PowerShell Scripts**

* [createWorkloadDomainSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createWorkloadDomainSpec.ps1)

**Procedure**

1. Download and populate the Planning and Preparation Workbook for your target platform.

2. To generate the JSON spec using inputs from the Planning and Preparation Workbook run the following command:
``` powershell
.\createWorkloadDomainSpec.ps1 -Workbook "E:\pnpWorkbook.xlsx" -Json "E:\MyLab\sfo\sfo-workloadDomain.json" -vCenterPassword "VMw@re1!" -nsxtPassword "VMw@re1!VMw@re1!"
```

The [createWorkloadDomainSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createWorkloadDomainSpec.ps1) script will open the supplied Planning and Preparation Workbook, read the Workload Domain tab into a variable and then proceed to generate the JSON spec required by the Public API.

You will notice that we are passing in a couple of additional values relating to passwords for vCenter and NSX-T, this is because the Planning and Preparation Workbook does not store any passwords.

3. Authenticate to the SDDC Manager appliance by running the following command:
``` powershell
Request-VCFToken-fqdn "sfo-vcf01.sfo.rainpole.io" -username "administrator@vsphere.local" -password "VMw@re1!"
```

4. Obtain details about the ESXi host from SDDC Manager by running the following command:
``` powershell
$host01 = Get-VCFHost -Status UNASSIGNED_USEABLE | Select-Object fqdn,id | Where-Object {$_.fqdn -eq "sfo01-w01-esx01.sfo.rainpole.io"}
```

In this step we use the **Get-VCFHost** cmdlet to retrieve into the variable ***$host01*** details about the ESXi host stored in the SDDC Manager inventory with a status of UNASSIGNED_USEABLE, we only need the unique ID really but I'm using the **Select-Object** command to limit the details to fqdn and id. We will use the variable in the next step.

5. Update the HOST-1 value in the JSON spec with the unique ID of the first ESXi host by running the following command:
``` powershell
(Get-Content "E:\MyLab\sfo\sfo-workloadDomain.json") | Foreach-Object {$_ -replace "HOST-1", $($host01.id)} | Set-Content "E:\MyLab\sfo\sfo-workloadDomain.json"
```

In this procedure we are performing a search and replace in the ***sfo-workloadDomain.json*** where we replace ***HOST-1*** with the unique id of the ESXi host contained in the ***$host01.id*** element of the variable from step 4.

1. Repeat Step 4 and 5 for the remaining three ESXi hosts by running the following commands:
``` powershell
$host02 = Get-VCFHost -Status UNASSIGNED_USEABLE | Select-Object fqdn,id | Where-Object {$_.fqdn -eq "sfo01-w01-esx02.sfo.rainpole.io"}

(Get-Content "E:\MyLab\sfo\sfo-workloadDomain.json") | Foreach-Object {$_ -replace "HOST-2", $($host02.id)} | Set-Content "E:\MyLab\sfo\sfo-workloadDomain.json"

$host03 = Get-VCFHost -Status UNASSIGNED_USEABLE | Select-Object fqdn,id | Where-Object {$_.fqdn -eq "sfo01-w01-esx03.sfo.rainpole.io"}

(Get-Content "E:\MyLab\sfo\sfo-workloadDomain.json") | Foreach-Object {$_ -replace "HOST-3", $($host03.id)} | Set-Content "E:\MyLab\sfo\sfo-workloadDomain.json"

$host04 = Get-VCFHost -Status UNASSIGNED_USEABLE | Select-Object fqdn,id | Where-Object {$_.fqdn -eq "sfo01-w01-esx04.sfo.rainpole.io"}

(Get-Content "E:\MyLab\sfo\sfo-workloadDomain.json") | Foreach-Object {$_ -replace "HOST-4", $($host04.id)} | Set-Content "E:\MyLab\sfo\sfo-workloadDomain.json"
```

7. Start the workload domain deployment workflow by running the following command:
``` powershell
$workloadDeployment = New-VCFWorkloadDomain -json "E:\MyLab\sfo\sfo-workloadDomain.json"
```

Using the **New-VCFWorkloadDomain** cmdlet, we trigger the workload domain deployment workflow, here I'm capturing the output of the command into a variable to be used in the next step.

As part of the **New-VCFWorkloadDomain** cmdlet we also execute the validation API to check the JSON spec prior to actually triggering the workload domain deployment workflow, if an error exists the process will abort allowing you fix things up before trying again.

8. Poll the status of the workload domain deployment workflow, by running the following command:
``` powershell
Do { $status = Get-VCFTask -id $workloadDeployment.id} While ($status.status -eq "In Progress")
```

Here we are polling the status of the workflow, using the unique ID from the **New-VCFWorkloadDomain** cmdlet which we retrieve from the variable ***$workloadDeployment.id*** and pass to the **Get-VCFTask** cmdlet. We perform a Do / While loop where we are looking for status of "In Progress", once the state changes from "In Progress" we break from the loop.

That completes the process of generating a workload domain JSON spec used by the public API and running the workload domain deployment workflow in SDDC Manager.

- - - 

### Other Posts in Series

* [Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/archive/2020/powervcf-automation)
* [Automating VCF - Deploy Management Domain](/archive/2020/powervcf-automation-01)
* [Automating VCF - Create Network Pool](/archive/2020/powervcf-automation-02)
* [Automating VCF - Commission Hosts](/archive/2020/powervcf-automation-03)
* [Automating VCF - Deploy Workload Domain](/archive/2020/powervcf-automation-04)
* [Automating VCF - Deploy NSX-T Edge Cluster](/archive/2020/powervcf-automation-05)
* [Automating VCF - Deploy vRealize Suite Lifecycle Manager](/archive/2020/powervcf-automation-06)
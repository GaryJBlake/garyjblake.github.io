+++
author = "GaryJBlake"
title = "Automating VCF – Deploy vRealize Suite Lifecycle Manager"
date = "2020-08-11"
description = "Automating VCF – Deploy vRealize Suite Lifecycle Manager"
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

This is the six and final blog in a series that discusses automating VMware Cloud Foundation using the Public APIs and PowerVCF. The series illustrates deploying the Management Domain, creating a Network Pool, commissioning ESXi host, deploying a Workload Domain including NSX-T Edge Cluster and vRealize Suite Lifecycle Manager.

In this post,  we will take a look at how to initiate the vRealize Suite Lifecycle Manager deployment workflow in SDDC Manager.

**VMware Cloud Foundation APIs Used**

* GET /v1/bundles
* POST /v1/bundles
* POST /v1/vrslcms
* GET /v1/tasks/{id}

**PowerVCF Cmdlets**

* Get-VCFBundle
* Request-VCFBundle
* New-VCFvRSLCM
* Get-VCFTask

**PowerShell Scripts**

* [createDeployVrslcmAvnSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createDeployVrslcmAvnSpec.ps1)

**Procedure**

1. Download and populate the Planning and Preparation Workbook for your target platform.

2. To generate the JSON spec using inputs from the Planning and Preparation Workbook run the following command:
``` powershell
.\createDeployVrslcmAvnSpec.ps1 -Workbook "E:\pnpWorkbook.xlsx" -Json "E:\MyLab\sfo\sfo-vrslcmDeploy.json" -sshPassword "VMw@re1!" -apiPassword "VMw@re1!"
```

The [createDeployVrslcmAvnSpec.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createDeployVrslcmAvnSpec.ps1) script will open the supplied Planning and Preparation Workbook, read the 'Management Domain' tab into a variable and then proceed to generate the JSON spec required by the Public API.

3. Authenticate to the SDDC Manager appliance by running the following command:
``` powershell
Request-VCFToken -fqdn "sfo-vcf01.sfo.rainpole.io" -username "administrator@vsphere.local" -password "VMw@re1!"
```

4. Obtain the bundle ID of for vRealize Suite Lifecycle Manager  by running the following command:
``` powershell
$bundleDetails = Get-VCFBundle | Where {$_.description -Match "vRealize"}
```

In this step we use the **Get-VCFBundle** cmdlet to capture the bundle ID for vRealize Suite Lifecycle Manager. We will use this in the next step to download the bundle.

5. Obtain the vRealize Suite Lifecycle Manager bundle by running the following command:
``` powershell
Request-VCFBundle -id $bundleDetails.id
```

In this procedure we are using the **Request-VCFBundle** cmdlet to request the download of the vRealize Suite Lifecycle Manager bundle.

6. Poll the status of the bundle download, by running the following command:
``` powershell
Do { $status = Get-VCFBundle -id $bundleDetails.id} While ($status.downloadStatus -eq "IN_PROGRESS")
```

7. Start the vRealize Suite Lifecycle Manager deployment workflow by running the following command:
``` powershell
$deployVrslcm = New-VCFvRSLCM -json "E:\MyLab\sfo\sfo-vrslcmDeploy.json"
```

Using the **New-VCFvRSLCM** cmdlet, we trigger the vRealize Suite Lifecycle Manager deployment workflow, here I'm capturing the output of the command into a variable to be used in the next step.

8. Poll the status of the vRealize Suite Lifecycle Manager deployment workflow, by running the following command:
``` powershell
Do { $status = Get-VCFTask -id $deployVrslcm.id ;} While ($status.status -eq "In Progress")
```

Here we are polling the status of the workflow, using the unique **ID** from the **New-VCFvRSLCM** cmdlet which we retrieve from the variable ***$deployVrslcm.id*** and pass to the **Get-VCFTask** cmdlet. We perform a Do / While loop where we are looking for status of "In Progress", once the state changes from "In Progress" we break from the loop.

That completes the process of generating a vRealize Suite Lifecycle Manager JSON spec used by the public API and running the deployment workflow in SDDC Manager.

- - - 

### Other Posts in Series

* [Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/archive/2020/powervcf-automation)
* [Automating VCF - Deploy Management Domain](/archive/2020/powervcf-automation-01)
* [Automating VCF - Create Network Pool](/archive/2020/powervcf-automation-02)
* [Automating VCF - Commission Hosts](/archive/2020/powervcf-automation-03)
* [Automating VCF - Deploy Workload Domain](/archive/2020/powervcf-automation-04)
* [Automating VCF - Deploy NSX-T Edge Cluster](/archive/2020/powervcf-automation-05)
* [Automating VCF - Deploy vRealize Suite Lifecycle Manager](/archive/2020/powervcf-automation-06)
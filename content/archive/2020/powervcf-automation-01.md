+++
author = "GaryJBlake"
title = "Automating VCF – Deploy Management Domain"
date = "2020-05-09"
description = "Automating VCF – Deploy Management Domain"
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

This is the first of six blogs in a series that discusses automating VMware Cloud Foundation using the Public APIs and PowerVCF. The series illustrates deploying the Management Domain, creating a Network Pool, commissioning ESXi host, deploying a Workload Domain including NSX-T Edge Cluster and vRealize Suite Lifecycle Manager. 

In this post, we take a look at how to deploy the Management Domain using VMware Cloud Builder.

The first step would typically be to download and populate the Deployment Parameters Workbook that is provided as part of VMware Cloud Builder, but in this series of blog posts we are going to generate everything we need using the new Planning and Preparation Workbook.

**VMware Cloud Builder APIs Used**

* POST /v1/sddcs/validations
* GET /v1/sddcs/validations/{id}
* POST /v1/sddcs
* GET /v1/sddcs/validations/{id}

**PowerVCF Cmdlets**

* Connect-CloudBuilder
* Start-CloudBuilderSDDCValidation
* Get-CloudBuilderSDDCValidation
* Start-CloudBuilderSDDC
* Get-CloudBuilderSDDC

**PowerShell Scripts**

* [createManagementDomainSpec](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createManagementDomainSpec.ps1)

**Procedure**

1. Download and populate the Planning and Preparation Workbook for your target platform.

2. To generate the JSON spec using inputs from the Planning and Preparation Workbook run the following command:
``` powershell
.\createManagementDomainSpec.ps1 -Workbook "E:\MyLab\pnpWorkbook.xlsx" -Json "E:\MyLab\sfo\sfo-managementDomain.json" -defaultPassword "VMw@re1!" -nsxtPassword "VMw@re1!VMw@re1!"
```

The [createManagementDomainSpec](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createManagementDomainSpec.ps1) script will open the supplied Planning and Preparation Workbook, read the 'Workload Domain' tab into a variable and then proceed to generate the JSON spec required by the VMware Cloud Builder Public API. Because no passwords are stored in the Workbook we also need to pass default passwords for NSX-T (-nsxtPassword switch) and all other components (-defaultPassword switch), these are passed as part of the command line input of the script.

3. Authenticate to the VMware Cloud Builder appliance by running the following command:
``` powershell
Connect-CloudBuilder -fqdn "sfo-cb01.sfo.rainpole.io" -username "admin" -password "VMw@re1!"
```

4. Perform a validation of the JSON spec file and the target platform by running the following command:</p>
``` powershell
$sddcValidation = Start-CloudBuilderSDDCValidation -json "E:\MyLab\sfo\sfo-managementDomain.json"
```

Using the **Start-CloudBuilderSDDCValidation** cmdlet, we trigger the validation process, here I'm capturing the output of the command into a variable to be used in the next step.

5. Poll the status of the validation task, by running the following command:
``` powershell  
Do { $status = Get-CloudBuilderSDDCValidation -id $sddcValidation.id;} While ($status.executionStatus -eq "IN_PROGRESS")
```

Here we are using the unique ***ID*** from the **Start-CloudBuilderSDDCValidation** cmdlet which we retrieve from the variable ***$sddcValidation.id*** and then pass to the **Get-CloudBuilderSDDCValidation** cmdlet. Then we are doing a Do / While loop where we are looking for an executionStatus of "IN_PROGRESS", once the state changes from "IN_PROGRESS" we break from the loop.

6. Assuming the validation process completed without any issues, we can then start the actual deployment by running the following command:
``` powershell
$sddcDeployment = Start-CloudBuilderSDDC -json "E:\MyLab\sfo\sfo-managementDomain.json"
```

Using the **Start-CloudBuilderSDDC** cmdlet, we trigger the deployment process and again capture the output of the command into a variable which is used in the next step.

7. Poll the status of the deployment task, by running the following command:
``` powershell
Do { $status = Get-CloudBuilderSDDC -id $sddcDeployment.id} While ($status.status -eq "IN_PROGRESS")
```

Like before we are going to poll the status of the deployment, using the unique **ID** from the **Start-CloudBuilderSDDC** cmdlet which we retrieve from the variable ***$sddcDeployment.id*** and pass this time to the **Get-CloudBuilderSDDC** cmdlet. Again we are doing a Do / While loop where we are looking for an executionStatus of "IN_PROGRESS", once the state changes from "IN_PROGRESS" we break from the loop.

That completes the process of deploying the Management Domain using VMware Cloud Builder without using the User Interface.

- - - 

### Other Posts in Series

* [Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/archive/2020/powervcf-automation)
* [Automating VCF - Deploy Management Domain](/archive/2020/powervcf-automation-01)
* [Automating VCF - Create Network Pool](/archive/2020/powervcf-automation-02)
* [Automating VCF - Commission Hosts](/archive/2020/powervcf-automation-03)
* [Automating VCF - Deploy Workload Domain](/archive/2020/powervcf-automation-04)
* [Automating VCF - Deploy NSX-T Edge Cluster](/archive/2020/powervcf-automation-05)
* [Automating VCF - Deploy vRealize Suite Lifecycle Manager](/archive/2020/powervcf-automation-06)
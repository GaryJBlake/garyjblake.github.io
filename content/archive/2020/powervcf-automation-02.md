+++
author = "GaryJBlake"
title = "Automating VCF – Create Network Pool"
date = "2020-05-10"
description = "Automating VCF – Create Network Pool"
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

This is the second of six blogs in a series that discusses automating VMware Cloud Foundation using the Public APIs and PowerVCF. The series illustrates deploying the Management Domain, creating a Network Pool, commissioning ESXi host, deploying a Workload Domain including NSX-T Edge Cluster and vRealize Suite Lifecycle Manager.

In this post, we take a look at how to create a new network pool in SDDC Manager to support a workload domain deployment.

**VMware Cloud Foundation APIs Used**

* POST /v1/network-pools

**PowerVCF Cmdlets**

* New-VCFNetworkPool

**PowerShell Scripts**

* [createNetworkPool.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createNetworkPoolSpec.ps1)

**Procedure**

1. Download and populate the Planning and Preparation Workbook for your target platform.

2. To generate the JSON spec using inputs from the Planning and Preparation Workbook run the following command:
``` powershell
.\createNetworkPoolSpec.ps1 -Workbook "E:\MyLab\pnpWorkbook.xlsx" -Json "E:\MyLab\sfo\sfo-workloadNetworkPool.json"
```

The [createNetworkPool.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/createNetworkPoolSpec.ps1) script will open the supplied Planning and Preparation Workbook, read the Workload Domain tab into a variable and then proceed to generate the JSON spec required by the Public API.

3. Authenticate to the SDDC Manager appliance by running the following command:
``` powershell
Request-VCFToken -fqdn "sfo-vcf01.sfo.rainpole.io" -username "administrator@vsphere.local" -password "VMw@re1!"
```

4. Create the new network pool by running the following command:
``` powershell
New-VCFNetworkPool -json "E:\MyLab\sfo\sfo-workloadNetworkPool.json"
```

That completes the process of generating a network pool JSON spec used by the public API and creating the network pool in SDDC Manager.

- - - 

### Other Posts in Series

* [Automating VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/archive/2020/powervcf-automation)
* [Automating VCF - Deploy Management Domain](/archive/2020/powervcf-automation-01)
* [Automating VCF - Create Network Pool](/archive/2020/powervcf-automation-02)
* [Automating VCF - Commission Hosts](/archive/2020/powervcf-automation-03)
* [Automating VCF - Deploy Workload Domain](/archive/2020/powervcf-automation-04)
* [Automating VCF - Deploy NSX-T Edge Cluster](/archive/2020/powervcf-automation-05)
* [Automating VCF - Deploy vRealize Suite Lifecycle Manager](/archive/2020/powervcf-automation-06)

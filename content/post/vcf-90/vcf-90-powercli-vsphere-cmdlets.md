+++
author = "GaryJBlake"
title = "Using VMware.Sdk.Vsphere: Commands for vSphere"
date = "2025-07-22"
description = "Using VMware.Sdk.Vsphere: Commands for vSphere"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI",
    "vSphere 9.0"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI",
    "vSphere 9.0"
]
series = [

]
+++

VCF PowerCLI 9.0 now includes a module called `VMware.Sdk.Vsphere`, this modules contains auto-generated cmdlets to support vSphere Public APIs. Use can use this post as a quick reference guide.

### Connecting to a vCenter Instance with Local Credentials

1. Start a PowerShell session.

2. Connect to a vCenter instance using local credentials by running the following command:

``` powershell
Connect-VIServer -Server sfo-m01-vc01.sfo.rainpole.io -Username administrator@vsphere.local -Password VMw@re1!VMw@re1!
```

1. Once connected the following information is stored in `$global:DefaultVIServer`.

``` bash
Name    : sfo-m01-vc01.sfo.rainpole.io
Port    : 443
User    VSPHERE.LOCAL\Administrator
```

4. Disconnect from a vCenter instance by running the following command:

``` powershell
Disconnect-VIServer -Server sfo-m01-vc01.sfo.rainpole.io
```

---
**NOTE**

The `VMware.Sdk.Vsphere` module contains a lot of cmdlets which do not display well in a blog post so for this module you can view the commands within relevant text files located on my GitHub repository.

---

### Display All vCenter GET Command Details

1. Start a PowerShell session.

2. Display all GET cmdlets supported in `VMware.Sdk.Vsphere` by running the following command:

``` powershell
Get-vSphereOperation -Method Get | Select-Object CommandInfo, Path, Method
```

3. To view the output for all GET cmdlets in `VMware.Sdk.Vsphere` see [VMware.Sdk.Vsphere.GET.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Vsphere.GET.txt).

### Display All vCenter POST Command Details

1. Start a PowerShell session.

2. Display all POST cmdlets supported in `VMware.Sdk.Vsphere` by running the following command:

``` powershell
Get-vSphereOperation -Method Post | Select-Object CommandInfo, Path, Method
```

3. To view the output for all POST cmdlets in `VMware.Sdk.Vsphere` see [VMware.Sdk.Vsphere.POST.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Vsphere.POST.txt).

### Display All vCenter PUT Command Details

1. Start a PowerShell session.

2. Display all PUT cmdlets supported in `VMware.Sdk.Vsphere` by running the following command:

``` powershell
Get-vSphereOperation -Method Put | Select-Object CommandInfo, Path, Method
```

3. To view the output for all PUT cmdlets in `VMware.Sdk.Vsphere` see [VMware.Sdk.Vsphere.PUT.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Vsphere.PUT.txt).

### Display All vCenter PATCH Command Details

1. Start a PowerShell session.

2. Display all PATCH cmdlets supported in `VMware.Sdk.Vsphere` by running the following command:

``` powershell
Get-vSphereOperation -Method Patch | Select-Object CommandInfo, Path, Method
```

3. To view the output for all PATCH cmdlets in `VMware.Sdk.Vsphere` see [VMware.Sdk.Vsphere.PATCH.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Vsphere.PATCH.txt).

### Display All vCenter DELETE Command Details

1. Start a PowerShell session.
2. Display all DELETE cmdlets supported in `VMware.Sdk.Vsphere` by running the following command:

``` powershell
Get-vSphereOperation -Method Delete | Select-Object CommandInfo, Path, Method
```

3. To view the output for all DELETE cmdlets in `VMware.Sdk.Vsphere` see [VMware.Sdk.Vsphere.DELETE.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Vsphere.DELETE.txt).

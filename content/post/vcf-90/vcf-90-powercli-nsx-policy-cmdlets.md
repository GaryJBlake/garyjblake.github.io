+++
author = "GaryJBlake"
title = "Using VMware.Sdk.Nsx.Policy: Commands for NSX"
date = "2025-07-15"
description = "Using VMware.Sdk.Nsx.Policy: Commands for NSX"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI",
    "NSX 9.0"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI",
    "NSX 9.0"
]
series = [

]
+++

VCF PowerCLI 9.0 now includes a module called `VMware.Sdk.Nsx.Policy`, this modules contains auto-generated cmdlets to support NSX Policy Public APIs. Use can use this post as a quick reference guide.

### Connecting to a NSX Instance with Local Credentials

1. Start a PowerShell session.

2. Connect to a NSX instance using local credentials by running the following command:

``` powershell
Connect-NsxServer -Server sfo-m01-nsx01.sfo.rainpole.io -User admin -Password VMw@re1!VMw@re1!
```

1. Once connected the following information is stored in `$defaultNsxConnections`.

``` bash
ServiceUri     : https://sfo-m01-nsx01.sfo.rainpole.io/
SessionSecret  :
User           : admin
IsConnected    : True
Id             : /NsxServer=admin@sfo-m01-nsx01.sfo.rainpole.io:443/
Name           : sfo-m01-nsx01.sfo.rainpole.io
Uid            : /NsxServer=admin@sfo-m01-nsx01.sfo.rainpole.io:443/
ProductVersion : 9.0.0.0.24705144
ServerUri      : https://sfo-m01-nsx01.sfo.rainpole.io/
UUID           : /NsxServer=admin@sfo-m01-nsx01.sfo.rainpole.io:443/
Port           : 443
```

4. Disconnect from a NSX instance by running the following command:

``` powershell
Disconnect-NsxServer -Server sfo-m01-nsx01.sfo.rainpole.io
```

---
**NOTE**

The `VMware.Sdk.Nsx.Policy` module contains a lot of cmdlets which do not display well in a blog post so for this module you can view the commands within relevant text files located on my GitHub repository.

---

### Display All NSX GET Command Details

1. Start a PowerShell session.

2. Display all GET cmdlets supported in `VMware.Sdk.Nsx.Policy` by running the following command:

``` powershell
Get-NsxOperation -Method Get | Select-Object CommandInfo, Path, Method
```

3. To view the output for all GET cmdlets in `VMware.Sdk.Nsx.Policy` see [VMware.Sdk.Nsx.Policy.GET.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Nsx.Policy.GET.txt).

### Display All NSX POST Command Details

1. Start a PowerShell session.

2. Display all POST cmdlets supported in `VMware.Sdk.Nsx.Policy` by running the following command:

``` powershell
Get-NsxOperation -Method Post | Select-Object CommandInfo, Path, Method
```

3. To view the output for all POST cmdlets in `VMware.Sdk.Nsx.Policy` see [VMware.Sdk.Nsx.Policy.POST.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Nsx.Policy.POST.txt).

### Display All NSX PUT Command Details

1. Start a PowerShell session.

2. Display all PUT cmdlets supported in `VMware.Sdk.Nsx.Policy` by running the following command:

``` powershell
Get-NsxOperation -Method Put | Select-Object CommandInfo, Path, Method
```

3. To view the output for all PUT cmdlets in `VMware.Sdk.Nsx.Policy` see [VMware.Sdk.Nsx.Policy.PUT.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Nsx.Policy.PUT.txt).

### Display All NSX PATCH Command Details

1. Start a PowerShell session.

2. Display all PATCH cmdlets supported in `VMware.Sdk.Nsx.Policy` by running the following command:

``` powershell
Get-NsxOperation -Method Patch | Select-Object CommandInfo, Path, Method
```

3. To view the output for all PATCH cmdlets in `VMware.Sdk.Nsx.Policy` see [VMware.Sdk.Nsx.Policy.PATCH.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Nsx.Policy.PATCH.txt).

### Display All NSX DELETE Command Details

1. Start a PowerShell session.
2. Display all DELETE cmdlets supported in `VMware.Sdk.Nsx.Policy` by running the following command:

``` powershell
Get-NsxOperation -Method Delete | Select-Object CommandInfo, Path, Method
```

3. To view the output for all DELETE cmdlets in `VMware.Sdk.Nsx.Policy` see [VMware.Sdk.Nsx.Policy.DELETE.txt](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf.powercli/command-info/VMware.Sdk.Nsx.Policy.DELETE.txt).

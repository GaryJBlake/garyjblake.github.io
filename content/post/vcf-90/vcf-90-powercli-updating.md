+++
author = "GaryJBlake"
title = "How to Install VCF PowerCLI 9.0: Step-by-Step Guide"
date = "2025-07-08"
description = "How to Install VCF PowerCLI 9.0: Step-by-Step Guide"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI"
]
series = [

]
+++

The fastest and easiest way to start utilising [VCF PowerCLI 9.0](https://www.powershellgallery.com/packages/VCF.PowerCLI/9.0.0.24798382) is to first remove any old versions and then perform a fresh install.

### Remove Existing VMware PowerCLI Modules

1. Start a PowerShell session.

2. Uninstall all VMware modules by running the following command:

``` powershell
Get-Module VMware* -ListAvailable | Uninstall-Module -Force -AllVersions
```

3. Verify that all VMware modules have been uninstalled by running the following command:

``` powershell
Get-Module VMware* -ListAvailable
```

### Installing VCF PowerCLI 9.0

1. Start a PowerShell session.

2. Install by running the following command:

``` powershell
Install-Module VCF.PowerCLI -Scope AllUsers
```

3. Verify installation by running the following command:

``` powershell
Get-Module VMware* -ListAvailable
```

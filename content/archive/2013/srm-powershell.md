+++
author = "GaryJBlake"
title = " Enabling PowerShell Functions with SRM - DR of the Cloud"
date = "2013-11-12"
description = " Enabling PowerShell Functions with SRM - DR of the Cloud"
tags = [
    "SRM",
    "PowerShell"
]
categories = [
    "Site Recovery Manager"
]
series = [

]
+++

### Enabling PowerShell Functions with SRM - DR of the Cloud

When calling PowerShell functions as part of a Site Recovery Manager (SRM) v5.1 recovery plan, you need to perform some additional configurations within PowerShell. 

This can be achieved using the following procedures.

#### Step 1 - Set the execution level

1. Launch the 32-bit version of PowerShell.
2. Set the execution policy to RemoteSigned.
```
Set-ExecutionPolicy RemoteSigned
```

#### Step 2 - Create and configure a PowerShell profile

1. Verify if a profile already exists for the user. (assuming that one does not exist go to step 2)
```
Test-Path $profile
```

2. Force the creation of a new profile file.
```
New-Item $profile -type file -force
```

3. Open the new file in a Notepad session.
```
Notepad $profile
```

4. Enter the following syntax into the file, then save and close:
```
Import-Module vCloudDR
Add-PSSnapin -name VMware.VimAutomation.Core
```

Next time you start a new PowerShell session, it will load in our custom functions from the vCloudDR module and add in the VMware core cmdlets.

#### Step 3 - Install the custom modules for PowerShell to call
1. Locate the folder path 'C:\Windows\SysWOW64\WindowsPowerShell\v1.0\Modules'
2. Create a new folder called 'vCloudDR'.

---
**NOTE**

This folder name must match the name used for the Import-Module command used in the profile in Step 2.

---

3. Copy your custom module file into the newly created folder
4. To test that the module has been loaded correctly, restart PowerShell and verify your custom module is listed by running the following command:
```
Get-Module -ListAvailable
```
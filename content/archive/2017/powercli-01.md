+++
author = "GaryJBlake"
title = "Installing PowerCLI 6.5.1"
date = "2017-09-02"
description = "Installing PowerCLI 6.5.1"
tags = [
    "PowerShell"
]
categories = [
    "PowerCLI"
]
series = [

]
+++

I recently had a requirement to get VMware PowerCLI installed and configured in order to work on developing some scripts. VMware introduced a new way of performing the installation which is well documented on the VMware official blog post however its still took me a little bit of time to work out the actual procedure. After a bit of googling and experimenting I decided to document the steps for future reference.

**Platform:** Windows Server 2012 R2 & Windows Server 2016

1. Determine the version of PowerShell currently installed, if your not running PowerShell 5.1 then perform step 2.
```
$PSVersionTable.PSVersion
```

2. Update PowerShell, in order to install modules using the new PowerShell Library I needed to update the version of PowerShell, this is done by installing a newer WMF. Download and install the WMF 5.1 package. 

3. Set the PowerShell execution policy to 'RemoteSigned'
```
Set-ExecutionPolicy RemoteSigned -Confirm:$false -Force
```

4. To install the new PowerCLI for all users, open an administrative PowerShell session and use the -Scope command for AllUsers.
```
Install-Module -Name VMware.PowerCLI -Scope AllUsers
```

5.  To import the modules and start using them run the following command:
```
Get-Module -Name VMware* -ListAvailable | Import-Module
```

6. To remove the 'Customer Experience Improvement Program (CEIP)' message run the following command:
```
Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $true -Confirm:$false
```
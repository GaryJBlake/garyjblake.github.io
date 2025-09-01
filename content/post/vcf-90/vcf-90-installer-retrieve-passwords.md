+++
author = "GaryJBlake"
title = "VCF Installer: Retrieve Component Passwords from VCF Installer"
date = "2025-08-28"
description = "VCF Installer: Retrieve Component Passwords from VCF Installer"
tags = [
    "VCF",
    "VCF Installer",
    "PowerShell",
    "Public APIs"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF Installer"
]
series = [

]
+++

When the auto-generate passwords options is selected within the VCF Installer UI, there maybe a scenario where you need to perform troubleshooting and a need to login to one of the underlying component appliances. Of course this is only possible if you know the passwords that were auto-generated, its relatively simple to retrieve the JSON specification used to perform the implementation from the VCF Installer appliance itself.

The following procedure demonstrates how you can retrieve a specific section of the JSON specification.

**VCF Installer APIs Used**

* POST /v1/tokens
* GET /v1/sddcs/latest
* GET /v1/sddcs/{id}/spec

---
**NOTE**

Supported component deployment specs include: `vcfOperationsSpec`, `vcfOperationsFleetManagementSpec`, `vcfOperationsCollectorSpec`, `sddcManagerSpec`, `nsxtSpec`,`vcenterSpec`.

This PowerShell procedure assumes that you have VCF.PowerCLI 9.0 installed.

---

### Retrieve a Section of the Deployment Specification using Curl

**Procedure**

1. Connect to the VCF Installer appliance over SSH.

2. Replace the values in the sample code with values for your VCF Operations instance and run the commands in the SSH session.

``` bash
vcfInstallerFqdn=$'sfo-ins01.sfo.rainpole.io'
vcfInstallerUser=$'admin@local'
vcfInstallerPass=$'VMw@re1!VMw@re1!'
vcfComponentSpec=$'vcfOperationsSpec'
```

3. Authenticate to VCF Installer and obtain a token by running the following command:

``` bash
TOKEN=$(curl -k -X POST https://$vcfInstallerFqdn/v1/tokens -H 'Content-Type:application/json' -d '{"username": "'$vcfInstallerUser'","password": "'$vcfInstallerPass'"}' | jq -r '.accessToken')
```

4. Retrieve the ID of the latest deployment into the `$sddcId` variable by running the following command:

``` bash
sddcId=$(curl -k -X GET "https://$vcfInstallerFqdn/v1/sddcs/latest" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq -r '.id')
```

5. Retrieve the VCF Operations Deployment Specification by running the following command:

``` bash
curl -k -X GET "https://$vcfInstallerFqdn/v1/sddcs/$sddcId/spec" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq -r '.'$vcfComponentSpec''
```

6. Review the output, which will look something like below:

``` json
{
  "nodes": [
    {
      "hostname": "flt-ops01a.rainpole.io",
      "rootUserPassword": "VMw@re1!VMw@re1!",
      "type": "master"
    },
    {
      "hostname": "flt-ops01b.rainpole.io",
      "rootUserPassword": "VMw@re1!VMw@re1!",
      "type": "replica"
    },
    {
      "hostname": "flt-ops01c.rainpole.io",
      "rootUserPassword": "VMw@re1!VMw@re1!",
      "type": "data"
    }
  ],
  "adminUserPassword": "VMw@re1!VMw@re1!",
  "applianceSize": "medium",
  "loadBalancerFqdn": "flt-ops01.rainpole.io",
  "useExistingDeployment": false
}
```

### Retrieve a Section of the Deployment Specification using PowerShell

**Procedure**

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` powershell
$vcfInstallerFqdn = "sfo-ins01.sfo.rainpole.io"
$vcfInstallerUser = "admin@local"
$vcfInstallerPass = "VMw@re1!VMw@re1!"
$vcfComponentSpec = "vcfOperationsSpec"
```

3. Authenticate to the VCF Installer appliance by running the following command:

``` powershell
Connect-VcfInstallerServer -Server $vcfInstallerFqdn -User $vcfInstallerUser -Password $vcfInstallerPass | Select-Object Name, Version, IsConnected
```

4. Retrieve the VCF Operations Deployment Specification by running the following command:

``` powershell
Invoke-VcfInstallerGetSddcSpecByID -Id (Invoke-VcfInstallerGetLatestSddcTask).Id | Select-Object $vcfComponentSpec | ConvertTo-Json -Depth 10
```

5. Review the output, which will look something like below:

``` json
{
  "VcfOperationsSpec": {
    "Nodes": [
      {
        "Hostname": "flt-ops01a.rainpole.io",
        "RootUserPassword": "VMw@re1!VMw@re1!",
        "Type": "master",
        "SslThumbprint": null
      },
      {
        "Hostname": "flt-ops01b.rainpole.io",
        "RootUserPassword": "VMw@re1!VMw@re1!",
        "Type": "replica",
        "SslThumbprint": null
      },
      {
        "Hostname": "flt-ops01c.rainpole.io",
        "RootUserPassword": "VMw@re1!VMw@re1!",
        "Type": "data",
        "SslThumbprint": null
      }
    ],
    "AdminUserPassword": "VMw@re1!VMw@re1!",
    "ApplianceSize": "medium",
    "LoadBalancerFqdn": "flt-ops01.rainpole.io",
    "UseExistingDeployment": false,
    "Version": null
  }
}
```

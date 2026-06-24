+++
author = "GaryJBlake"
title = "VCF Installer APIs: Download Binaries from Broadcom Depot"
date = "2026-04-03"
description = "VCF Installer APIs: Download Binaries from Broadcom Depot"
tags = [
    "VCF 9.1",
    "VCF Installer",
    "APIs"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Installer"
]
series = [
    "VMware Cloud Foundation APIs",
    "VCF Installer APIs"
]
+++

Before you can begin deploying VMware Cloud Foundation, you first configure the VCF Installer to connect to the Broadcom Depot. In order to do this you must first obtain your unique download token from the [VCF Business Services Console](https://vcf.broadcom.com), once you have your download token you can proceed with setting up the VCF Installer.

**VCF Installer APIs Used**

* POST /v1/tokens
* 

[VCF Installer API Reference Guide](https://developer.broadcom.com/xapis/vcf-installer-api/latest/)

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Create your JSON specification file and ensure its available to your system. In my case the file is named `sfo-m01-domainSpec.json`.

3. Replace the values in the sample code with values for your VCF Installer instance and paste the commands in the console.

``` bash
vcfInstallerFqdn=$'sfo-ins01.sfo.rainpole.io'
vcfInstallerUser=$'admin@local'
vcfInstallerPass=$'VMw@re1!VMw@re1!'
broadcomDepotToken=$'<your-unique-token'
```

4. Authenticate to VCF Installer and obtain a token by running the following command:

``` bash
vcfInstallerToken=$(curl -k -X POST https://$vcfInstallerFqdn/v1/tokens -H 'Content-Type:application/json' -d '{"username": "'$vcfInstallerUser'","password": "'$vcfInstallerPass'"}' | jq -r '.accessToken')
```

5. Configure the VCF Installer depot settings by running the following command:

```bash
curl -k -X PUT https://$vcfInstallerFqdn/v1/system/settings/depot -H "Authorization: Bearer $vcfInstallerToken" -H -H 'Content-Type:application/json' -d '{"vmwareAccount": {"downloadToken": "'$broadcomDepotToken'"}}'
```

6. Verifiy the status of the VCF Installer depot configuration by running the following command:

```bash
curl -k -X GET https://$vcfInstallerFqdn/v1/system/settings/depot -H "Authorization: Bearer $vcfInstallerToken" -H 'Accept: application/json' -H "Content-Type:application/json" | json_pp
```

7. Verify the syncronization staus with the Broadcom Depot by running the following command:

```bash
curl -k -X GET https://$vcfInstallerFqdn/v1/system/settings/depot/depot-sync-info -H "Authorization: Bearer $vcfInstallerToken" -H "Accept: application/json" -H "Content-Type:application/json" | json_pp
```

8. (Optional) Force a syncronization of the metadat from the Broadcom Depot by running the following command:

```bash
curl -k -X PATCH https://$vcfInstallerFqdn/v1/system/settings/depot/depot-sync-info -H "Authorization: Bearer $vcfInstallerToken" -H "Accept: application/json" -H "Content-Type:application/json" | json_pp
```

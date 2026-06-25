+++
author = "GaryJBlake"
title = "VCF Installer APIs: Connect VCF Installer to the Broadcom Depot"
date = "2026-05-21"
description = "VCF Installer APIs: Connect VCF Installer to the Broadcom Depot"
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
* PUT /v1/system/settings/depot
* GET /v1/system/settings/depot
* GET /v1/system/settings/depot/depot-sync-info
* PATCH /v1/system/settings/depot/depot-sync-info

[VCF Installer API Reference Guide](https://developer.broadcom.com/xapis/vcf-installer-api/latest/)

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Installer instance and paste the commands in the console.

``` bash
export vcfInstallerFqdn='sfo-ins01.sfo.rainpole.io'
export vcfInstallerUser='admin@local'
export vcfInstallerPass='VMw@re1!VMw@re1!'
export broadcomDepotToken='<your-unique-token'
```

3. Authenticate to VCF Installer and obtain a token by running the following command:

``` bash
vcfInstallerToken=$(curl -k -X POST https://$vcfInstallerFqdn/v1/tokens \
    --header 'Content-Type:application/json' \
    -d '{"username": "'$vcfInstallerUser'","password": "'$vcfInstallerPass'"}' \
    | jq -r '.accessToken')
```

4. Configure the VCF Installer depot settings by running the following command:

```bash
curl -k -X PUT https://$vcfInstallerFqdn/v1/system/settings/depot \
    --header "Authorization: Bearer $vcfInstallerToken" \
    --header 'Content-Type:application/json' \
    -d '{"vmwareAccount": {"downloadToken": "'$broadcomDepotToken'"}}'
```

5. Verify the status of the VCF Installer depot configuration by running the following command:

```bash
curl -k -X GET https://$vcfInstallerFqdn/v1/system/settings/depot \
    --header "Authorization: Bearer $vcfInstallerToken" 
    --header 'Accept: application/json' \
    --header "Content-Type:application/json" \
    | json_pp
```

6. Verify the synchronization status with the Broadcom Depot by running the following command:

```bash
curl -k -X GET https://$vcfInstallerFqdn/v1/system/settings/depot/depot-sync-info \
    --header "Authorization: Bearer $vcfInstallerToken" \
    --header "Accept: application/json" \
    --header "Content-Type:application/json" \
    | json_pp
```

7. (Optional) Force a syncronization of the metadat from the Broadcom Depot by running the following command:

```bash
curl -k -X PATCH https://$vcfInstallerFqdn/v1/system/settings/depot/depot-sync-info \
    --header "Authorization: Bearer $vcfInstallerToken" \
    --header "Accept: application/json" \
    --header "Content-Type:application/json" \
    | json_pp
```

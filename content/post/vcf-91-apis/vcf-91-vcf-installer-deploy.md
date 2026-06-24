+++
author = "GaryJBlake"
title = "VCF Installer APIs: Deploying VMware Cloud Foundation JSON Using VCF Installer"
date = "2026-12-05"
description = "VCF Installer APIs: Deploying VMware Cloud Foundation JSON Using VCF Installer"
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

Once you have validated your JSON specification file, along with the infrastructure validation you can commence the deployment process.

**VCF Installer APIs Used**

* POST /v1/tokens
* GET /v1/sddcs
* GET /v1/sddcs/{id}
* POST /v1/sddcs

[VCF Installer API Reference Guide](https://developer.broadcom.com/xapis/vcf-installer-api/latest/)

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Create your JSON specification file and ensure its available to your system. In my case the file is named `sfo-m01-domainSpec.json`.

3. Replace the values in the sample code with values for your VCF Installer instance and paste the commands in the console.

``` bash
vcfInstallerFqdn=$'sfo-ins01.sfo.rainpole.io'
vcfInstallerUser=$'admin@local'
vcfInstallerPass=$'VMw@re1!VMw@re1!'
```

4. Authenticate to VCF Installer and obtain a token by running the following command:

``` bash
vcfInstallerToken=$(curl -k -X POST https://$vcfInstallerFqdn/v1/tokens -H 'Content-Type:application/json' -d '{"username": "'$vcfInstallerUser'","password": "'$vcfInstallerPass'"}' | jq -r '.accessToken')
```

5. If your validation completed without any issues you can start the deployment by running the following command:

```bash
deploymentId=$(curl -k -X POST https://$vcfInstallerFqdn/v1/sddcs -H "Authorization: Bearer $vcfInstallerToken" -H 'Content-Type:application/json' -d @'sfo-m01-domainSpec.json' | jq -r ".id")
```

6. Monitor the status of the deployment by running the following command:

```bash
curl -k -X GET "https://$vcfInstallerFqdn/v1/sddcs/$deploymentId" -H "Authorization: Bearer $vcfInstallerToken" -H "Accept: application/json" -H "Content-Type: application/json" | jq -r ".status"
```

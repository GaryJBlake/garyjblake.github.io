+++
author = "GaryJBlake"
title = "VCF Installer APIs: Validating Your JSON Using VCF Installer"
date = "2026-12-04"
description = "VCF Installer APIs: Validating Your JSON Using VCF Installer"
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

The first step to automating the deployment of a new VMware Cloud Foundation platform is the creation and validation of your JSON specification file. This JSON specification file describes the environment to be configured.

There are a few ways in which you can build your JSON specification file, probably the easiest is through the use of the Planning and Preparation Workbook and a PowerShell utility my friend and colleague [Ken Gould](https://www.linkedin.com/in/gouldken/) created called [VCF.JSONGenerator](https://www.powershellgallery.com/packages/VCF.JSONGenerator) (for a full rundown of the tool see Ken's blog post [Introducing the VCF.JSONGenerator PowerShell Module for VMware Cloud Foundation](https://feardamhan.com/2025/08/14/introducing-the-vcf-jsongenerator-powershell-module-for-vmware-cloud-foundation/)).

Once you have your JSON specification file created, its critical that you perform a validation step.

**VCF Installer APIs Used**

* POST /v1/tokens
* GET /v1/sddcs/validations
* GET /v1/sddcs/validations/{id}
* POST /v1/sddcs/validations

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

5. Start a validation task using your JSON specification file by running the following command:

```bash
validationId=$(curl -k -X POST https://$vcfInstallerFqdn/v1/sddcs/validations -H "Authorization: Bearer $vcfInstallerToken" -H 'Content-Type:application/json' -d @'sfo-m01-domainSpec.json' | jq -r ".id")
```

6. The validation will take some time but you can check its progress by running the following command:

```bash
curl -k -X GET "https://$vcfInstallerFqdn/v1/sddcs/validations/$validationId" -H "Authorization: Bearer $vcfInstallerToken" -H "Accept: application/json" -H "Content-Type: application/json" | jq -r ".executionStatus"
```

7. Once the execution status is complete you can check for the overall status of the validation task by running the following command:

```bash
curl -k -X GET "https://$vcfInstallerFqdn/v1/sddcs/validations/$validationId" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq -r ".resultStatus"
```

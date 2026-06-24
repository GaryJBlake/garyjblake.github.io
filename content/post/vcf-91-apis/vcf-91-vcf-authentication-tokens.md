+++
author = "GaryJBlake"
title = "VMware Cloud Foundation 9.1 APIs: Obtaining Authentication Tokens"
date = "2026-04-01"
description = "VMware Cloud Foundation 9.1 APIs: Obtaining Authentication Tokens"
tags = [
    "VCF 9.1",
    "VCF Installer",
    "VCF Operations",
    "SDDC Manager",
    "APIs"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Installer",
    "VCF Operations",
    "SDDC Manager",
    "APIs"
]
series = [
    "VMware Cloud Foundation APIs"
]
+++

Interacting with the public APIs of a VMware Cloud Foundation platform enables organizations to build custom end-to-end automation for their needs. The first step in the process involves obtaining an authentication token. A VMware Cloud Foundation platform consists of a number of core end points, each requiring slightly different parameters to carry out the interaction.

Whilst public API documentation is available across the VMware Cloud Foundation platform (see [developer.broadcom.com](https://developer.broadcom.com/xapis?tab=Cloud%2520Management&fireglass_rsn=true#fireglass_params&tabid=a9ffd1dabd48ea13&start_with_session_counter=3&application_server_address=isolation-2-europe-west2.prod.fire.glass)), concrete examples of how to consume the various APIs is either not consistent or lacking, for this reason I decided to pull together this post to help with the specifics, this post covers the following end-points:

- [VCF Installer](#vcf-installer)
- [VCF Operations](#vcf-operations)
- [SDDC Manager](#sddc-manager)
- [VCF Services Runtime](#vcf-runtime)

### VCF Installer {#vcf-installer}

**VCF Installer APIs Used**

* POST /v1/tokens

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Installer instance and run the commands in the console.

``` bash
export vcfInstallerFqdn='sfo-ins01.sfo.rainpole.io'
export vcfInstallerUser='admin@local'
export vcfInstallerPass='VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Installer and obtain a token by running the following command:

``` bash
vcfInstallerToken=$(curl -k -X POST "https://$vcfInstallerFqdn/v1/tokens" \
    --header 'Content-Type:application/json' \
    -d "{\"username\":\"$vcfInstallerUser\", \"password\":\"$vcfInstallerPass\"}" \
    | jq -r '.accessToken')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfInstallerToken
```

### VCF Operations {#vcf-operations}

**VCF Operations APIs Used**

* POST /suite-api/api/auth/token/acquire

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Operations instance and run the commands in the console.

``` bash
export vcfOperationsFqdn='flt-ops01a.rainpole.io'
export vcfOperationsUser='admin'
export vcfOperationsPass='VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Operations and obtain a token by running the following command:

``` bash
vcfOperationsToken=$(curl -k -X POST https://$vcfOperationsFqdn/suite-api/api/auth/token/acquire \
    --header 'Content-Type:application/json' \
    -d "{\"username\":\"$vcfOperationsUser\", \"password\":\"$vcfOperationsPass\", \"authSource\":\"LOCAL\"}" \
    | jq -r '.token')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfOperationsToken
```

### SDDC Manager {#sddc-manager}

**SDDC Manager APIs Used**

* POST /v1/tokens

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your SDDC Manager instance and run the commands in the console.

``` bash
sddcManagerFqdn=$'sfo-vcf01.sfo.rainpole.io'
sddcManagerUser=$'administrator@vsphere.local'
sddcManagerPass=$'VMw@re1!VMw@re1!'
```

3. Authenticate to SDDC Manager and obtain a token by running the following command:

``` bash
sddcManagerToken=$(curl -k -X POST https://$sddcManagerFqdn/v1/tokens \
    -H 'Content-Type:application/json' \
    --data "username=$sddcManagerUser" \
    --data "password=$sddcManagerPass" | jq -r '.accessToken')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $sddcManagerToken
```

### VCF Services Runtime {#vcf-runtime}

**VCF Services Runtim APIs Used**

* POST /v1/identity/token

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Services Runtime instance and run the commands in the console.

``` bash
vcfServiceRuntimeFqdn=$'sfo-sr01.sfo.rainpole.io'
vcfServiceRuntimeUser=$'admin@vsp.local'
vcfServiceRuntimePass=$'VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Services Runtime and obtain a token by running the following command:

``` bash
vcfServiceRuntimeToken=$(curl -k -X POST https://"$vcfServiceRuntimeFqdn"/api/v1/identity/token \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    --data "grant_type=password" \
    --data "username=$vcfServiceRuntimeUser" \
    --data "password=$vcfServiceRuntimePass" \
    | jq -r '.access_token')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfServiceRuntimeToken
```

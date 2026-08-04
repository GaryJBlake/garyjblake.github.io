+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Obtaining Authentication Tokens"
date = "2026-04-01"
description = "VMware Cloud Foundation APIs: Obtaining Authentication Tokens"
tags = [
    "VCF 9.1",
    "API"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Installer",
    "VCF Operations",
    "SDDC Manager",
]
series = [
    "VMware Cloud Foundation 9.1 APIs"
]
+++

**Last Updated:** 04-Aug-2026

Interacting with the public APIs of a VMware Cloud Foundation platform enables organizations to build custom end-to-end automation for their needs. The first step in the process involves obtaining an authentication token. A VMware Cloud Foundation platform consists of a number of core end points, each requiring slightly different parameters to carry out the interaction.

Whilst public API documentation is available across the VMware Cloud Foundation platform (see [developer.broadcom.com](https://developer.broadcom.com/xapis?tab=Cloud%2520Management&fireglass_rsn=true#fireglass_params&tabid=a9ffd1dabd48ea13&start_with_session_counter=3&application_server_address=isolation-2-europe-west2.prod.fire.glass)), concrete examples of how to consume the various APIs is either not consistent or lacking, for this reason I decided to pull together this post to help with the specifics, this post covers the following end-points:

- [VCF Installer](#vcf-installer)
- [VCF Operations](#vcf-operations)
- [SDDC Manager](#sddc-manager)
- [VCF Services Runtime](#vcf-services-runtime)
- [VCF Fleet Lifecycle Service](#vcf-fleet-lifecycle-service)
- [vCenter](#vcenter)

### VCF Installer

**VCF Installer APIs Used**

* POST /v1/tokens

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Installer instance and run the commands in the console.

```bash
export vcfInstallerFqdn='sfo-ins01.sfo.rainpole.io'
export vcfInstallerUser='admin@local'
export vcfInstallerPass='VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Installer and obtain a token by running the following command:

```bash
vcfInstallerToken=$(curl -k -X POST "https://${vcfInstallerFqdn}/v1/tokens" \
    --header "Content-Type:application/json" \
    -d "{\"username\":\"$vcfInstallerUser\", \"password\":\"$vcfInstallerPass\"}" \
    | jq -r '.accessToken')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfInstallerToken
```

Example Output:

```bash
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbkBsb2NhbCIsImF1ZCI6InNkZGMtc2VydmljZXMiLCJuYmYiOjE3ODU3NDUzMzgsInJvbGUiOlsiQURNSU4iXSwiaXNJc3N1ZWRGb3JKd3QiOmZhbHNlLCJzY29wZSI6WyJDUkVERU5USUFMX1JFQUQiLCJDUkVERU5USUFMX1dSSVRFIiwiQkFDS1VQX0NPTkZJR19SRUFEIiwiQkFDS1VQX0NPTkZJR19XUklURSIsIlVTRVJfUkVBRCIsIlVTRVJfV1JJVEUiLCJPVEhFUl9SRUFEIiwiT1RIRVJfV1JJVEUiLCJMSUNFTlNFX0tFWV9SRUFEIiwiTElDRU5TRV9LRVlfV1JJVEUiLCJDRVJUX1JFQUQiLCJDRVJUX1dSSVRFIiwiQ0FfUkVBRCIsIkNBX1dSSVRFIiwiTkVUV09SS19QT09MX1JFQUQiLCJORVRXT1JLX1BPT0xfV1JJVEUiLCJWUlNMQ01fUkVBRCIsIlZSU0xDTV9XUklURSIsIkNFSVBfUkVBRCIsIkNFSVBfV1JJVEUiLCJCQUNLVVBfUkVTVE9SRV9SRUFEIiwiQkFDS1VQX1JFU1RPUkVfV1JJVEUiLCJETlNfUkVBRCIsIkROU19XUklURSIsIk5UUF9SRUFEIiwiTlRQX1dSSVRFIiwiRURHRV9DTFVTVEVSX1JFQUQiLCJFREdFX0NMVVNURVJfV1JJVEUiLCJTRERDX0ZFREVSQVRJT05fUkVBRCIsIlNERENfRkVERVJBVElPTl9XUklURSIsIldDUF9SRUFEIiwiV0NQX1dSSVRFIiwiRE9NQUlOX1JFQUQiLCJET01BSU5fV1JJVEUiLCJTRERDX01BTkFHRVJfUkVBRCIsIlNERENfTUFOQUdFUl9XUklURSIsIkhPU1RfUkVBRCIsIkhPU1RfV1JJVEUiLCJDTFVTVEVSX1JFQUQiLCJDTFVTVEVSX1dSSVRFIiwiVVBHUkFERV9SRUFEIiwiVVBHUkFERV9XUklURSIsIkRFUE9UX0NPTkZJR19SRUFEIiwiREVQT1RfQ09ORklHX1dSSVRFIiwiVkFTQV9QUk9WSURFUl9SRUFEIiwiVkFTQV9QUk9WSURFUl9XUklURSIsIlNFUlZJQ0VfQUNDT1VOVF9SRUFEIiwiU0VSVklDRV9BQ0NPVU5UX1dSSVRFIiwiQVZOX1dSSVRFIiwiQVZOX1JFQUQiLCJTT1NfUkVBRCIsIlNPU19XUklURSIsIlNFQ1VSSVRZX0NPTkZJR19SRUFEIiwiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9SRUFEIiwiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9XUklURSIsIlRBR19SRUFEIiwiVEFHX1dSSVRFIiwiUkVTT1VSQ0VfTE9DS19SRUFEIiwiUkVTT1VSQ0VfTE9DS19XUklURSIsIkxJQ0VOU0lOR19JTkZPX1JFQUQiLCJMSUNFTlNJTkdfSU5GT19XUklURSIsIlNZU1RFTV9XUklURSIsIlNZU1RFTV9SRUFEIiwiTElDRU5TSU5HX1JFQUQiLCJMSUNFTlNJTkdfV1JJVEUiLCJFVkVOVF9SRUFEIiwiRVZFTlRfV1JJVEUiLCJBTEJfQ0xVU1RFUl9SRUFEIiwiQUxCX0NMVVNURVJfV1JJVEUiLCJDT01QTElBTkNFX1JFQUQiLCJDT01QTElBTkNFX1dSSVRFIiwiVkVSU0lPTl9TWU5DX1dSSVRFIiwiUkFfUkVBRCIsIlBPTElDWV9SRUFEIiwiUE9MSUNZX1dSSVRFIiwiTk9USUZJQ0FUSU9OX1JFQUQiLCJOT1RJRklDQVRJT05fV1JJVEUiLCJUT0tFTl9TSUdOSU5HX0tFWV9SRUFEIiwiVE9LRU5fU0lHTklOR19LRVlfV1JJVEUiLCJWU1BfQ0xVU1RFUl9SRUFEIiwiVlNQX0NMVVNURVJfV1JJVEUiXSwiaXNzIjoidmNmLWF1dGgiLCJuYW1lIjoiYWRtaW5AbG9jYWwiLCJleHAiOjE3ODU3NDg5MzgsImlhdCI6MTc4NTc0NTMzOCwidXNlciI6ImFkbWluQGxvY2FsIiwianRpIjoiYjkxNDczZmYtY2Y1MC00NmU2LTgzMDEtYzNhNzhjZDQwNDExIn0.C-iy2jGY1d-oCVc1_K74xxTWJRnr30wbYtF7V1-apdM
```

### VCF Operations

**VCF Operations APIs Used**

* POST /suite-api/api/auth/token/acquire

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Operations instance and run the commands in the console.

```bash
export vcfOperationsFqdn='flt-ops01a.rainpole.io'
export vcfOperationsUser='admin'
export vcfOperationsPass='VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Operations and obtain a token by running the following command:

```bash
vcfOperationsToken=$(curl -k -X POST "https://$vcfOperationsFqdn/suite-api/api/auth/token/acquire" \
    --header "Content-Type:application/json" \
    --header "Accept: application/json" \
    -d "{\"username\":\"$vcfOperationsUser\", \"password\":\"$vcfOperationsPass\"}" \
    | jq -r '.token')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfOperationsToken
```

Example Output:

```bash
75be8e3e-396d-439c-bd40-5f55b7f6b3c7::202feccb-f630-4702-9c91-1d58ebc80f0a
```

### SDDC Manager

**SDDC Manager APIs Used**

* POST /v1/tokens

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your SDDC Manager instance and run the commands in the console.

```bash
export sddcManagerFqdn='sfo-vcf01.sfo.rainpole.io'
export sddcManagerUser='administrator@vsphere.local'
export sddcManagerPass='VMw@re1!VMw@re1!'
```

3. Authenticate to SDDC Manager and obtain a token by running the following command:

```bash
sddcManagerToken=$(curl -k -X POST "https://$sddcManagerFqdn/v1/tokens" \
    --header "Content-Type:application/json" \
    -d "{\"username\":\"$sddcManagerUser\", \"password\":\"$sddcManagerPass\"}" \
    | jq -r '.accessToken')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $sddcManagerToken
```

Example Output:

```bash
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbmlzdHJhdG9yQHZzcGhlcmUubG9jYWwiLCJhdWQiOiJzZGRjLXNlcnZpY2VzIiwibmJmIjoxNzg1NzQ1MzgwLCJyb2xlIjpbIkFETUlOIl0sImlzSXNzdWVkRm9ySnd0IjpmYWxzZSwic2NvcGUiOlsiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9XUklURSIsIkxJQ0VOU0lOR19JTkZPX1JFQUQiLCJTRERDX0ZFREVSQVRJT05fV1JJVEUiLCJBVk5fV1JJVEUiLCJTRERDX01BTkFHRVJfUkVBRCIsIkNFUlRfV1JJVEUiLCJBTEJfQ0xVU1RFUl9SRUFEIiwiTElDRU5TRV9LRVlfUkVBRCIsIkVER0VfQ0xVU1RFUl9XUklURSIsIlVTRVJfUkVBRCIsIkNPTVBMSUFOQ0VfV1JJVEUiLCJQT0xJQ1lfV1JJVEUiLCJDUkVERU5USUFMX1dSSVRFIiwiQkFDS1VQX0NPTkZJR19SRUFEIiwiVlNQX0NMVVNURVJfUkVBRCIsIkNMVVNURVJfV1JJVEUiLCJBVk5fUkVBRCIsIlZBU0FfUFJPVklERVJfUkVBRCIsIkRPTUFJTl9XUklURSIsIkNFSVBfUkVBRCIsIlNPU19XUklURSIsIlBPTElDWV9SRUFEIiwiU0REQ19NQU5BR0VSX1dSSVRFIiwiUkFfUkVBRCIsIk5UUF9XUklURSIsIlRBR19XUklURSIsIkRFUE9UX0NPTkZJR19XUklURSIsIlNZU1RFTV9SRUFEIiwiREVQT1RfQ09ORklHX1JFQUQiLCJIT1NUX1dSSVRFIiwiUkVTT1VSQ0VfTE9DS19XUklURSIsIkJBQ0tVUF9SRVNUT1JFX1JFQUQiLCJDRVJUX1JFQUQiLCJOT1RJRklDQVRJT05fV1JJVEUiLCJVU0VSX1dSSVRFIiwiVE9LRU5fU0lHTklOR19LRVlfUkVBRCIsIkNPTVBMSUFOQ0VfUkVBRCIsIlVQR1JBREVfUkVBRCIsIk9USEVSX1JFQUQiLCJMSUNFTlNJTkdfV1JJVEUiLCJTT1NfUkVBRCIsIkVWRU5UX1dSSVRFIiwiU0VDVVJJVFlfQ09ORklHX1JFQUQiLCJDUkVERU5USUFMX1JFQUQiLCJIT1NUX1JFQUQiLCJBTEJfQ0xVU1RFUl9XUklURSIsIlZFUlNJT05fU1lOQ19XUklURSIsIkNFSVBfV1JJVEUiLCJSRVNPVVJDRV9MT0NLX1JFQUQiLCJPVEhFUl9XUklURSIsIkxJQ0VOU0VfS0VZX1dSSVRFIiwiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9SRUFEIiwiQ0FfUkVBRCIsIk5PVElGSUNBVElPTl9SRUFEIiwiVEFHX1JFQUQiLCJMSUNFTlNJTkdfUkVBRCIsIk5FVFdPUktfUE9PTF9XUklURSIsIldDUF9SRUFEIiwiTElDRU5TSU5HX0lORk9fV1JJVEUiLCJCQUNLVVBfUkVTVE9SRV9XUklURSIsIlRPS0VOX1NJR05JTkdfS0VZX1dSSVRFIiwiTlRQX1JFQUQiLCJFREdFX0NMVVNURVJfUkVBRCIsIkVWRU5UX1JFQUQiLCJCQUNLVVBfQ09ORklHX1dSSVRFIiwiV0NQX1dSSVRFIiwiU0VSVklDRV9BQ0NPVU5UX1dSSVRFIiwiTkVUV09SS19QT09MX1JFQUQiLCJDQV9XUklURSIsIkNMVVNURVJfUkVBRCIsIlZBU0FfUFJPVklERVJfV1JJVEUiLCJETlNfV1JJVEUiLCJTWVNURU1fV1JJVEUiLCJWUlNMQ01fV1JJVEUiLCJETlNfUkVBRCIsIlNFUlZJQ0VfQUNDT1VOVF9SRUFEIiwiU0REQ19GRURFUkFUSU9OX1JFQUQiLCJET01BSU5fUkVBRCIsIlZTUF9DTFVTVEVSX1dSSVRFIiwiVlJTTENNX1JFQUQiLCJVUEdSQURFX1dSSVRFIl0sImlzcyI6InZjZi1hdXRoIiwibmFtZSI6ImFkbWluaXN0cmF0b3JAdnNwaGVyZS5sb2NhbCIsImV4cCI6MTc4NTc0ODk4MCwiaWF0IjoxNzg1NzQ1MzgwLCJ1c2VyIjoiYWRtaW5pc3RyYXRvckB2c3BoZXJlLmxvY2FsIiwianRpIjoiYzYzZDA3NmEtOGE5Ny00OThhLWJkMjItZDQ4NTA4NDU4Y2FiIn0.fs7aQ-utsHQ_fA8oGbFLIEJFYjxjtdm8QEheHFJrBJA
```

### VCF Services Runtime

**VCF Services Runtim APIs Used**

* POST /v1/identity/token

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Services Runtime instance and run the commands in the console.

```bash
export vcfServiceRuntimeFqdn='sfo-sr01.sfo.rainpole.io'
export vcfServiceRuntimeUser='admin@vsp.local'
export vcfServiceRuntimePass='VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Services Runtime and obtain a token by running the following command:

```bash
vcfServiceRuntimeToken=$(curl -k -X POST "https://"$vcfServiceRuntimeFqdn"/api/v1/identity/token" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data "grant_type=password" \
    --data "username=$vcfServiceRuntimeUser" \
    --data "password=$vcfServiceRuntimePass" \
    | jq -r '.access_token')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfServiceRuntimeToken
```

Example Output:

```bash
eyJhbGciOiJFZERTQSIsImtpZCI6ImNsM3VfVHdaQ3JkTDVoOWctVkpzYklpREItMW1faUE5YjZTZTBfbTllejQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3Nmby1zcjAxLnNmby5yYWlucG9sZS5pbyIsInN1YiI6ImFkbWluQHZzcC5sb2NhbCIsImF1ZCI6WyJ2c3AiXSwiZXhwIjoxNzg1NzU5ODEwLCJpYXQiOjE3ODU3NDU0MTAsImp0aSI6IjIzZGViMTg4LTA0MDQtNGJiYi05ODg4LWM2ZjczZjUwOTAwYSIsImF6cCI6InBhc3N3b3JkX2dyYW50X2NsaWVudCIsImFjY3QiOiJhZG1pbkB2c3AubG9jYWwiLCJhdXRob3JpemF0aW9uX2RldGFpbHMiOm51bGx9.28UaxGRMwocvqCvV7bW46vpMdKLLCQZ6qCMCwkWL1lzi1UXZlAZBuAdwd58hEm2npc5YV9gMFcjKxK2O1OQjBQ
```

### VCF Fleet Lifecycle Service

**VCF Fleet Lifecycle Service APIs Used**

* POST /api/v1/identity/token

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Fleet Lifecycle Service and paste the commands in the console. If your not sure which endpoint this FQDN should be log into VCF Operations, go to ***Build > Lifecycle > VCF Management*** and select the ***Components*** tab and locate the component named ***Fleet lifecycle*** the FQDN is shown in the FQDN column.

```bash
export vcfFleetLifecycleFqdn='flt-fc01.rainpole.io'
export vcfFleetLifecycleUser='admin@vsp.local'
export vcfFleetLifecyclePass='VMw@re1!VMw@re1!'
```

3. Authenticate to the VCF Fleet Lifecycle Service and obtain a token by running the following command:

```bash
vcfFleetLifecycleToken=$(curl -k -X POST "https://$vcfFleetLifecycleFqdn/api/v1/identity/token" \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --data "grant_type=password" \
    --data "username=$vcfFleetLifecycleUser" \
    --data "password=$vcfFleetLifecyclePass" \
    | jq -r '.access_token')
```

4. Verify you successfully obtained an authentication token by running the following command:

```bash
echo $vcfFleetLifecycleToken
```

Example Output:

``` bash
eyJhbGciOiJFZERTQSIsImtpZCI6ImNsM3VfVHdaQ3JkTDVoOWctVkpzYklpREItMW1faUE5YjZTZTBfbTllejQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2ZsdC1mYzAxLnJhaW5wb2xlLmlvIiwic3ViIjoiYWRtaW5AdnNwLmxvY2FsIiwiYXVkIjpbInZzcCJdLCJleHAiOjE3ODU3NjAwNjAsImlhdCI6MTc4NTc0NTY2MCwianRpIjoiZDEwODNhYjctNmZjZC00YWZmLWE3YjItMTI3NGNiOTY5MmEzIiwiYXpwIjoicGFzc3dvcmRfZ3JhbnRfY2xpZW50IiwiYWNjdCI6ImFkbWluQHZzcC5sb2NhbCIsImF1dGhvcml6YXRpb25fZGV0YWlscyI6bnVsbH0.TE6WkRRGf8lmoKHAXgBPoECkScdwrS0GxWR6ur6rz-FLYUBAcrzwqQX3g0BjMw0t4FUOQnM6sngUlA6je6jQCQ
```

### vCenter

**vCenter APIs Used**

* POST /api/v1/identity/token

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your vCenter instance and paste the commands in the console.

```bash
export vcenterFqdn='sfo-m01-vc01.sfo.rainpole.io'
export vcenterUser='administrator@vsphere.local'
export vcenterPass='VMw@re1!VMw@re1!'
```

3. Authenticate to the vCenter intance and obtain a token by running the following command:

```bash
vcenterToken=$(curl -k -X POST "https://${vcenterFqdn}/api/session" \
    -u "$vcenterUser:$vcenterPass" \
    | tr -d '"')
```

4. Verify you successfully obtained an authentication token by running the following command:

```bash
echo $vcenterToken
```

Example Output:

``` bash
32118bd49ebe6cdebbd5e8d06b7fcfa0
```

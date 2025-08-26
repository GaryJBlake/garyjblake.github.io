+++
author = "GaryJBlake"
title = "Viewing Service Details Using Curl with SDDC Manager"
date = "2025-01-07"
description = "Viewing Service Details Using Curl with SDDC Manager"
tags = [
    "VCF",
    "Public APIs"
]
categories = [
    "SDDC Manager"
]
series = [

]
+++

In this procedure, we will use the **/v1/vcf-services** API to retrieve service details for a SDDC Manager instance.

**SDDC Manager APIs Used**

* POST /v1/tokens
* GET /v1/vcf-services

### Obtaining Service Details for all Services from SDDC Manager

**Procedure**

1. Connect to the SDDC Manager appliance over SSH.
2. Replace the values in the sample code with values for your SDDC Manager instance and run the commands SSH session.

``` bash
sddcManagerFqdn=$'sfo-vcf01.sfo.rainpole.io'
sddcManagerUser=$'admin@local'
sddcManagerPass=$'VMw@re1!VMw@re1!'
```

3. Authenticate to SDDC Manager and obtain a token by running the following command:

``` bash
TOKEN=$(curl -k -X POST https://$sddcManagerFqdn/v1/tokens -H 'Content-Type:application/json' -d '{"username": "'$sddcManagerUser'","password": "'$sddcManagerPass'"}' | jq -r '.accessToken')
```

4. Retrieve all service details from the SDDC Manager instance by running the following command:

``` bash
curl -k -X GET "https://$sddcManagerFqdn/v1/vcf-services" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq '.elements[]'
```

### Obtaining Service Details for a Specific Service from SDDC Manager

**Procedure**

1. Connect to the SDDC Manager appliance over SSH.
2. Replace the values in the sample code with values for your SDDC Manager instance and run the commands SSH session.

``` bash
sddcManagerFqdn=$'sfo-vcf01.sfo.rainpole.io'
sddcManagerUser=$'admin@local'
sddcManagerPass=$'VMw@re1!VMw@re1!'
sddcManagerService=$'LCM'
```

---
**NOTE**
Services available in SDDC Manager include COMMON_SERVICES, OPERATIONS_MANAGER, SDDC_MANAGER_UI, DOMAIN_MANAGER, and LCM.

1. Authenticate to SDDC Manager and obtain a token by running the following command:

``` bash
TOKEN=$(curl -k -X POST https://$sddcManagerFqdn/v1/tokens -H 'Content-Type:application/json' -d '{"username": "'$sddcManagerUser'","password": "'$sddcManagerPass'"}' | jq -r '.accessToken')
```

4. Retrieve service details for a specific service from the SDDC Manager instance by running the following command:

``` bash
curl -k -X GET "https://$sddcManagerFqdn/v1/vcf-services" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq '.elements[] | select(.name == "'$sddcManagerService'")'
```

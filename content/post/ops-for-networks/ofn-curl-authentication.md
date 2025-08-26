+++
author = "GaryJBlake"
title = "Obtaining a Token Using Curl for VCF Operations for Networks"
date = "2025-01-14"
description = "Obtaining a Token Using Curl for VCF Operations for Networks"
tags = [
    "VCF",
    "Public APIs",
    "operations-networks"
]
categories = [
    "VCF Operations for Networks"
]
series = [

]
+++

In this post we will look at the process of obtaining an authentication token from VCF Operations for networks which we can then use in subsequent API requests.

**VCF Operations for Networks APIs Used**

* POST /api/ni/auth/token
* DELETE /api/ni/auth/token
* GET /api/ni/info/version

### Obtaining an Authentication Token From VCF Operations for Networks

In this procedure, we will use the **/api/ni/auth/token** API passing valid credentials to perform the authentication process and obtain an authentication token for the session. Then reading the response from the curl request we will extract the *token* portion placing it into a variable named *TOKEN*. Once we have done this we will have a valid authentication token which can be used within future curl requests.

**Procedure**

1. Connect to a Linux based operating system over SSH.
2. Replace the values in the sample code with values for your VCF Operations for networks instance and run the following commands:

``` bash
vcfOpsForNetworksFqdn=$'flt-net01a.rainpole.io'
vcfOpsForNetworksUser=$'admin@local'
vcfOpsForNetworksPass=$'VMw@re1!VMw@re1!'
```

3. Authenticate to the VCF Operations for networks instance and obtain a token by running the following command:

``` bash
TOKEN=$(curl -k -X POST https://$vcfOpsForNetworksFqdn/api/ni/auth/token -H 'Content-Type:application/json' -d '{"username": "'$vcfOpsForNetworksUser'","password": "'$vcfOpsForNetworksPass'", "domain": {"domain_type": "LOCAL"}}' | jq -r '.token')
```

4. Verify the token works and retrieve the API version of VCF Operations for networks instance by running the following command:

``` bash
curl -k -X GET "https://$vcfOpsForNetworksFqdn/api/ni/info/version" -H "Authorization: NetworkInsight $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | json_pp
```

5. Delete the token by running the following command:

``` bash
curl -k -X DELETE "https://$vcfOpsForNetworksFqdn//api/ni/auth/token" -H "Authorization: NetworkInsight $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json"
```

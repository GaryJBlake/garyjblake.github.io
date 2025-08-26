+++
author = "GaryJBlake"
title = "Obtaining a Token Using Curl with SDDC Manager"
date = "2024-11-28"
description = "Obtaining a Token Using Curl with SDDC Manager"
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

Interacting with the Public APIs for SDDC Manager can be achieved in many ways, my normal goto is PowerCLI but that requires the installation of the required modules and of course PowerShell itself to be available on either the component your wanting to interact with or a remote management host. If your looking for a faster method for interacting with the Public APIs then *CURL* is your new best friend.

In this post we will look at the process of obtaining a token from SDDC Manager which is then used in subsequent API requests.

**SDDC Manager APIs Used**

* POST /v1/tokens
* GET /v1/sddc-managers

### Obtaining an Authentication Token From SDDC Manager

In this procedure, we will use the **/v1/tokens** API passing valid credentials to perform the authentication process and obtain a token for the session. Then reading the response from the curl request we will extract the accessToken portion placing it into a variable named TOKEN. Once we have done this we will have a valid access token which can be use within future curl requests.

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

### Verifing the Access Token

In this procedure we are going to use the access token obtained using the previous procedure and verify its valid by issuing a simple GET curl command against the **/v1/sddc-managers**. This will return details about the SDDC Manager we are connected to.

**Procedure**

1. Retrieve details about the SDDC Manager by running the following command:

``` bash
curl -k -X GET "https://$sddcManagerFqdn/v1/sddc-managers" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq '.elements[]'
```

If the access token is still valid you will get output similar to the following:

``` bash
{
    "domain": {
        "id": "635e7aeb-8cd6-44a5-b358-8573922049c4"
    },
    "id": "670d89d1-4f99-4877-8f9e-7cbfafde3796",
    "fqdn": "sfo-vcf01.sfo.rainpole.io",
    "version": "5.2.0.0.xxxxxxxx",
    "ipAddress": "10.11.10.59"
}
```

And that's it, very simple and easy to use method to interact with any Public API using *CURL* along with how to deal with the reuse of access tokens.
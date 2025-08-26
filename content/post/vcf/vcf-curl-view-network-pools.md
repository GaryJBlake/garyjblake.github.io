+++
author = "GaryJBlake"
title = "Viewing Network Pool Details Using Curl with SDDC Manager"
date = "2024-12-03"
description = "Viewing Network Pool Details Using Curl with SDDC Manager"
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

In this post we will use curl to view the details of a Network Pool in SDDC Manager.

**SDDC Manager APIs Used**

* POST /v1/tokens
* GET /v1/network-pools

### View All Network Pools Configured in SDDC Manager

In this procedure we will authenticate to SDDC Manager and then using the **/v1/network-pools** API we will retrieve a list of all the Network Pools configured within the SDDC Manager instance.

**Procedure**

1. Connect to the SDDC Manager appliance over SSH.
2. Replace the values in the sample code with values for your SDDC Manager instance and run the following commands:

``` bash
sddcManagerFqdn=$'sfo-vcf01.sfo.rainpole.io'
sddcManagerUser=$'admin@local'
sddcManagerPass=$'VMw@re1!VMw@re1!'
```

3. Authenticate to the SDDC Manager instance and obtain an authentication token by running the following command:

``` bash
TOKEN=$(curl -k -X POST https://$sddcManagerFqdn/v1/tokens -H 'Content-Type:application/json' -d '{"username": "'$sddcManagerUser'","password": "'$sddcManagerPass'"}' | jq -r '.accessToken')
```

4. Retrieve all Network Pools from your SDDC Manager instance by running the following command:

``` bash
curl -k -X GET "https://$sddcManagerFqdn/v1/network-pools" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq '.elements[]'
```

The output will look something like the following, here we can see that my platform has two network pools configured. Each containing two networks, but all we can see from this output are the ids so in order to get a more detailed information we will need to pass the id of one of the Network Pools into the **/v1/network-pools** API.

``` bash
{
    "id": "5b684061-f25b-4dd6-bde5-092172889b26",
    "name": "sfo-m01-np01",
    "networks": [
        {
        "id": "5c925f9f-82ae-46ad-b556-420728e8c4e0"
        },
        {
        "id": "b65bb915-d37f-45c6-a517-b9d3cfa2ba6f"
        }
    ],
    "hostsCount": 4
}
{
    "id": "5eb5cabe-cadf-4884-93d9-9f43223dd118",
    "name": "sfo-w01-r01-network-pool-01",
    "networks": [
        {
        "id": "1389cff1-0fb4-45e1-9881-5b4cf631fa2d"
        },
        {
        "id": "9bdae224-a96b-4f3d-85da-8242de699061"
        }
    ],
    "hostsCount": 3
}
```

### View Details of Specific Network Pool Configured in SDDC Manager

In this procedure we will once again use the **/v1/network-pools** API, only this time we will first pass the *$networkPoolName* variable where we have defined the human readable name of a Network Pool and based on the reponse we will extract the id of the Network Pool. Then we will use the **/v1/network-pools** API again only this time appending the id of the Network Pool to the API request in order to retrieve the specific details.

**Procedure**

1. Connect to the SDDC Manager appliance over SSH.
2. Replace the values in the sample code with values for your SDDC Manager instance and run the following commands:

``` bash
sddcManagerFqdn=$'sfo-vcf01.sfo.rainpole.io'
sddcManagerUser=$'admin@local'
sddcManagerPass=$'VMw@re1!VMw@re1!'
networkPoolName=$'sfo-m01-np01'
```

3. Authenticate to the SDDC Manager instance and obtain an authentication token by running the following command:

``` bash
TOKEN=$(curl -k -X POST https://$sddcManagerFqdn/v1/tokens -H 'Content-Type:application/json' -d '{"username": "'$sddcManagerUser'","password": "'$sddcManagerPass'"}' | jq -r '.accessToken')
```

4. Retrieve the id of a specific Network Pool from your SDDC Manager instance by running the following commands:

``` bash
networkPoolId=$(curl -k -X GET "https://$sddcManagerFqdn/v1/network-pools" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | jq -r '.elements[] | select(.name == "'$networkPoolName'") | .id')
```

5. Retrieve the details of a specific Network Pool from your SDDC Manager instance by running the following command:

``` bash
curl -k -X GET "https://$sddcManagerFqdn/v1/network-pools/$networkPoolId" -H "Authorization: Bearer $TOKEN" -H "Accept: application/json" -H "Content-Type: application/json" | json_pp
```

The output will look something like the following:

``` bash
{
    "hostsCount" : 4,
    "id" : "5b684061-f25b-4dd6-bde5-092172889b26",
    "name" : "sfo-m01-np01",
    "networks" : [
        {
            "id" : "5c925f9f-82ae-46ad-b556-420728e8c4e0"
        },
        {
            "id" : "b65bb915-d37f-45c6-a517-b9d3cfa2ba6f"
        }
    ]
}

```

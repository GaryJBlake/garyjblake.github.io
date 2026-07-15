+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Deploying VCF Operations for Networks"
date = "2026-07-16"
description = "VMware Cloud Foundation APIs: Deploying VCF Operations for Networks"
tags = [
    "VCF 9.1",
    "API"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Operations",
    "VCF Operations for Networks"
]
series = [
    "VMware Cloud Foundation APIs",
    "VCF Operations APIs"
]
+++

Your VMware Cloud Foundation platforms capabilities can be further enhanced with the deployment of VCF Operations for Networks which can be utilized to provides a comprehensive overview of the platforms network health and issues. Using VCF Operations for Networks you can analyzes you current vSphere network traffic and configurations, map out dependencies to transition workloads smoothly and continuously monitors the health, logs, and metrics.

In this post we will look at how the VCF Operations for Networks component can be deployed using the public APIs, this is achieved via the VCF Fleet Lifecycle Service which is tightly integrated into VCF Operations.

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* POST /api/v1/identity/token
* GET /fleet-lcm/v1/sddc-lcms
* POST /fleet-lcm/v1/components/validations
* POST /fleet-lcm/v1/components
* GET /fleet-lcm/v1/tasks/{taskId}

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Fleet Lifecycle Service and paste the commands in the console. If your not sure which endpoint this FQDN should be log into VCF Operations, go to ***Build > Lifecycle > VCF Management*** and select the ***Components*** tab and locate the component named ***Fleet lifecycle*** the FQDN is shown in the FQDN column.

``` bash
export vcfFleetLifecycleFqdn='flt-fc01.rainpole.io'
export vcfFleetLifecycleUser='admin@vsp.local'
export vcfFleetLifecyclePass='VMw@re1!VMw@re1!'
```

3. Authenticate to the VCF Fleet Lifecycle Service and obtain a token by running the following command:

``` bash
vcfFleetLifecycleToken=$(curl -k -X POST "https://$vcfFleetLifecycleFqdn/api/v1/identity/token" \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    --data "grant_type=password" \
    --data "username=$vcfFleetLifecycleUser" \
    --data "password=$vcfFleetLifecyclePass" \
    | jq -r '.access_token')
```

4. Verify you successfully obtained an authentication token by running the following command:

``` bash
echo $vcfFleetLifecycleToken
```

Example Output:

``` bash
eyJhbGciOiJFZERTQSIsImtpZCI6Ilg4Mk5veGNJRlVCVEFiY0xPM1NUdU12UTF6Qlo4d01xeUxDTGNuOGZYdFUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2ZsdC1mYzAxLnJhaW5wb2xlLmlvIiwic3ViIjoiYWRtaW5AdnNwLmxvY2FsIiwiYXVkIjpbInZzcCJdLCJleHAiOjE3ODM0MzU1NTIsImlhdCI6MTc4MzQyMTE1MiwianRpIjoiMjA3OTg0MDgtZGE3OC00N2UzLTgxMDctNDAyMThkNjM1ZThmIiwiYXpwIjoicGFzc3dvcmRfZ3JhbnRfY2xpZW50IiwiYWNjdCI6ImFkbWluQHZzcC5sb2NhbCIsImF1dGhvcml6YXRpb25fZGV0YWlscyI6bnVsbH0.OsXjW3cgwZaEMXwZC6MOqOped5MX1wdf3wpUmjZLaRiXeug4rtm9dnWHvPrp5pM74MNsVEjhbeT3u0TJjgIIBQ

```

5. First we retrieve the unique ID of the SDDC instance by running the following command:

``` bash
primarySddcLcms=$(curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/sddc-lcms" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '.sddcLcms[] | select(.isPrimary == true) | .id')
```

6. Verify you successfully obtained the SDDC instance by running the following command:

``` bash
echo $primarySddcLcms
```

Example Output:

``` bash
3e8d0034-906b-49cb-9c47-3afa8d919192
```

7. Replace the values in the sample code with values for the deployment of your VCF Operations for Networks instance and paste the commands in the console.

``` bash
export opsNetworksPlatformFqdn='flt-net01a.rainpole.io'
export opsNetworksPlatformIp='10.11.10.62'
export opsNetworksPlatformSize='medium'
export opsNetworksPlatformPass='VMw@re1!VMw@re1!'
export opsNetworksControllerFqdn='sfo-netc01.sfo.rainpole.io'
export opsNetworksControllerIp='10.11.10.14'
export opsNetworksControllerSize='medium'
export opsNetworksControllerPass='VMw@re1!VMw@re1!'
export opsNetworksAdminPassword='VMw@re1!VMw@re1!'
```

8. Create the JSON payload for the VCF Operations for Networks instance deployment by running the following command:

``` bash
cat << EOF > ops-networks-deploy.json
{
  "componentSpecs": [
    {
      "sddcLcmId": "${primarySddcLcms}",
      "componentType": "OPS_NETWORKS",
      "deploymentType": "OvaComponentSpec",
      "nodeSpecs": [
        {
          "nodeType": "PLATFORM",
          "version": "9.1.0.0",
          "deploymentSpec": {
            "fqdn": "${opsNetworksPlatformFqdn}",
            "deploymentOption": "${opsNetworksPlatformSize}",
            "password": "${opsNetworksPlatformPass}",
            "ipv4Settings": {
              "address": "${opsNetworksPlatformIp}"
            }
          }
        },
        {
          "nodeType": "COLLECTOR",
          "version": "9.1.0.0",
          "deploymentSpec": {
            "fqdn": "${opsNetworksControllerFqdn}",
            "deploymentOption": "${opsNetworksControllerSize}",
            "password": "${opsNetworksControllerPass}",
            "ipv4Settings": {
              "address": "${opsNetworksControllerIp}"
            }
          }
        }
      ],
      "configSpec": {
        "adminPassword": "${opsNetworksAdminPassword}"
      }
    }
  ]
}
EOF
```

9. Verify the JSON payload has been populated correctly by running the following command:

``` bash
cat ops-networks-deploy.json
```

Example Output:

``` json
{
  "componentSpecs": [
    {
      "sddcLcmId": "e35632dc-2777-432e-8985-7e1f0a32acf3",
      "componentType": "OPS_NETWORKS",
      "deploymentType": "OvaComponentSpec",
      "nodeSpecs": [
        {
          "nodeType": "PLATFORM",
          "version": "9.1.0.0",
          "deploymentSpec": {
            "fqdn": "flt-net01a.rainpole.io",
            "deploymentOption": "medium",
            "password": "VMw@re1!VMw@re1!",
            "ipv4Settings": {
              "address": "10.11.10.62"
            }
          }
        },
        {
          "nodeType": "COLLECTOR",
          "version": "9.1.0.0",
          "deploymentSpec": {
            "fqdn": "sfo-netc01.sfo.rainpole.io",
            "deploymentOption": "medium",
            "password": "VMw@re1!VMw@re1!",
            "ipv4Settings": {
              "address": "10.11.10.14"
            }
          }
        }
      ],
      "configSpec": {
        "adminPassword": "VMw@re1!VMw@re1!"
      }
    }
  ]
}
```

10.  Validate the JSON payload by running the following command:

```bash
validationId=$(curl -k -X POST "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/components/validations" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
   -d @ops-networks-deploy.json | jq -r ".id")
```

11. Check the status of the validation by running the following command:

``` bash
curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$validationId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

12. The command in step 11 may need to be run multiple times, alternatively you can run the command over and over by running the following command:

``` bash
while curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$validationId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 2 seconds."
    sleep 2
done
```

13. Start the deployment by running the following command:

```bash
deploymentId=$(curl -k -X POST "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/components" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @ops-networks-deploy.json | jq -r ".id")
```

14. Check the status of the deployment by running the following command:

``` bash
curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$deploymentId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

15. The command in step 11 would need to be run multiple times, alternatively you can run the command over and over by running the following command:

``` bash
while curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$deploymentId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 60 seconds."
    sleep 60
done
```

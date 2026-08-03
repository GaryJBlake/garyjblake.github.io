+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Deploy an Additional Cloud Proxy"
date = "2026-07-23"
description = "VMware Cloud Foundation APIs: Deploy an Additional Cloud Proxy"
tags = [
    "VCF 9.1",
    "API"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Operations"
]
series = [
    "VMware Cloud Foundation 9.1 APIs"
]
+++

During the initial deployment of your VMware Cloud Foundation platform, the VCF Installer deploys VCF Operations with a single Cloud Proxy. If you want to increase availability if metric and log collection you can deploy additional Cloud Proxies and then create a Cloud Proxy Group, this way if a Cloud Proxy goes offline the adapters will reconnect to the remaining Cloud Proxy and continue to collect data.

In this post we will look at how an additional Cloud Proxy can be deployed using the public APIs, this is achieved via the VCF Fleet Lifecycle Service which is tightly integrated into VCF Operations.

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* POST /api/v1/identity/token
* GET /fleet-lcm/v1/sddc-lcms
* GET /fleet-lcm/v1/components
* POST /fleet-lcm/v1/components/validations
* GET /fleet-lcm/v1/tasks/{taskId}
* PATCH /fleet-lcm/v1/components/{componentId}

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
    --header 'Content-Type: application/x-www-form-urlencoded' \
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

```bash
eyJhbGciOiJFZERTQSIsImtpZCI6InVDQnd3ME9IMDBMYzV6c1ZJSlRLUWd2Z0VpbjZrNW80dmpJa1A0NkhiMWsiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2ZsdC1mYzAxLnJhaW5wb2xlLmlvIiwic3ViIjoiYWRtaW5AdnNwLmxvY2FsIiwiYXVkIjpbInZzcCJdLCJleHAiOjE3ODM5NzM3MDEsImlhdCI6MTc4Mzk1OTMwMSwianRpIjoiMTBjYWRkZWQtMDVmZi00YTc0LWJhMWYtMWVlOTVlNzJjYWFkIiwiYXpwIjoicGFzc3dvcmRfZ3JhbnRfY2xpZW50IiwiYWNjdCI6ImFkbWluQHZzcC5sb2NhbCIsImF1dGhvcml6YXRpb25fZGV0YWlscyI6bnVsbH0.ssr0vXiaZqNqQeugUKMoK37--UwimGEN5otcsEyrUtakHFP8QLXwRA26cwp5XMw7deAsbdXp9aDlYl8LOGM7CQ
```

5. First we retrieve the unique ID of the SDDC instance by running the following command:

```bash
primarySddcLcms=$(curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/sddc-lcms" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '.sddcLcms[] | select(.isPrimary == true) | .id')
```

6. Verify you successfully obtained the SDDC instance ID by running the following command:

```bash
echo $primarySddcLcms
```

Example Output:

```bash
3e8d0034-906b-49cb-9c47-3afa8d919192
```

6. Next we retrieve the component ID of VCF Operations instance by running the following command:

```bash
vcfOperationsId=$(curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/components" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '.components[] | select(.componentTypeDescription == "VCF Operations") | .id')
```

7. Verify you successfully obtained the component ID of VCF Operations instance by running the following command:

```bash
echo $vcfOperationsId
```

Example Output:

```bash
32dfaec2-ff61-4d16-bfbd-4a3b929b1a16
```

8. Replace the values in the sample code with values for the deployment of your Cloud Proxy instance and paste the commands in the console.

```bash
export cloudProxyFqdn='sfo-cp02.sfo.rainpole.io'
export cloudProxyPass='VMw@re1!VMw@re1!'
export cloudProxyAdminPass='VMw@re1!VMw@re1!'
```

1. Create the JSON payload for the Cloud Proxy deployment by running the following command:

```bash
cat << EOF > cloud-proxy-deploy.json
{
  "deploymentType": "OvaComponentUpdateSpec",
  "componentType": "OPS",
  "nodeSpecs": [
    {
      "nodeType": "ONE_WAY_REMOTE_COLLECTOR",
      "sddcLcmId": "${primarySddcLcms}",
      "deploymentSpec": {
        "fqdn": "${cloudProxyFqdn}",
        "password": "${cloudProxyPass}",
        "deploymentOption": "standard"
      }
    }
  ],
  "configSpec": {
    "adminPassword": "${cloudProxyAdminPass}"
  }
}
EOF
```

10. Verify the JSON payload has been populated correctly by running the following command:

```bash
cat cloud-proxy-deploy.json
```

Example Output:

```json
{
  "deploymentType": "OvaComponentUpdateSpec",
  "componentType": "OPS",
  "nodeSpecs": [
    {
      "nodeType": "ONE_WAY_REMOTE_COLLECTOR",
      "sddcLcmId": "3e8d0034-906b-49cb-9c47-3afa8d919192",
      "deploymentSpec": {
        "fqdn": "sfo-cp02.sfo.rainpole.io",
        "password": "VMw@re1!VMw@re1!",
        "deploymentOption": "standard"
      }
    }
  ],
  "configSpec": {
    "adminPassword": "VMw@re1!VMw@re1!"
  }
}
```

11. Validate the JSON payload by running the following command:

```bash
validationId=$(curl -k -X POST "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/components/validations" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
   -d @cloud-proxy-deploy.json | jq -r ".id")
```

12. Check the status of the validation by running the following command:

```bash
curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$validationId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

13. The command in previous step may need to be run multiple times, alternatively you can run the command over and over by running the following command:

```bash
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

14. Start the deployment by running the following command:

```bash
deploymentId=$(curl -k -X PATCH "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/components/$vcfOperationsId" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @cloud-proxy-deploy.json | jq -r ".id")
```

15. Check the status of the deployment by running the following command:

```bash
curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$deploymentId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

16. The command in the previous step would need to be run multiple times, alternatively you can run the command over and over by running the following command:

```bash
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

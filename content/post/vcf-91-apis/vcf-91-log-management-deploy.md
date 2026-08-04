+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Deploying Log Management"
date = "2026-07-09"
description = "VMware Cloud Foundation APIs: Deploying Log Management"
tags = [
    "VCF 9.1",
    "API"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Operations",
    "Log Management"
]
series = [
    "VMware Cloud Foundation 9.1 APIs"
]
+++

Once your VCF fleet has successfully been deployed and is up and running you can configure or add additional capabilities to the VMware Cloud Foundation platform. The first capability we will look at is Log Management. It is no longer installed as a standalone, heavy virtual appliance. Instead, it is deployed as a native containerized service running inside the consolidated VCF Management Services framework.

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

```bash
export vcfFleetLifecycleFqdn='flt-fc01.rainpole.io'
export vcfFleetLifecycleUser='admin@vsp.local'
export vcfFleetLifecyclePass='VMw@re1!VMw@re1!'
```

3. Authenticate to the VCF Fleet Lifecycle Service and obtain a token by running the following command:

```bash
vcfFleetLifecycleToken=$(curl -k -X POST "https://${vcfFleetLifecycleFqdn}/api/v1/identity/token" \
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

```bash
eyJhbGciOiJFZERTQSIsImtpZCI6Ilg4Mk5veGNJRlVCVEFiY0xPM1NUdU12UTF6Qlo4d01xeUxDTGNuOGZYdFUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2ZsdC1mYzAxLnJhaW5wb2xlLmlvIiwic3ViIjoiYWRtaW5AdnNwLmxvY2FsIiwiYXVkIjpbInZzcCJdLCJleHAiOjE3ODM0MzU1NTIsImlhdCI6MTc4MzQyMTE1MiwianRpIjoiMjA3OTg0MDgtZGE3OC00N2UzLTgxMDctNDAyMThkNjM1ZThmIiwiYXpwIjoicGFzc3dvcmRfZ3JhbnRfY2xpZW50IiwiYWNjdCI6ImFkbWluQHZzcC5sb2NhbCIsImF1dGhvcml6YXRpb25fZGV0YWlscyI6bnVsbH0.OsXjW3cgwZaEMXwZC6MOqOped5MX1wdf3wpUmjZLaRiXeug4rtm9dnWHvPrp5pM74MNsVEjhbeT3u0TJjgIIBQ
```

5. First we retrieve the unique ID of the SDDC instance by running the following command:

```bash
primarySddcLcms=$(curl -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/sddc-lcms" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '.sddcLcms[] | select(.isPrimary == true) | .id')
```

6. Verify you successfully obtained the SDDC instance by running the following command:

```bash
echo $primarySddcLcms
```

Example Output:

```bash
e35632dc-2777-432e-8985-7e1f0a32acf3
```

7. Replace the values in the sample code with values for the deployment of your Log Management instance and paste the commands in the console.

```bash
export logManagementFqdn='flt-logs01.rainpole.io'
export logManagementSize='small'
export logManagementNodeCount='1'
```

8. Create the JSON payload for the Log Management instance deployment by running the following command:

```bash
cat << EOF > log-management-deploy.json
{
  "componentSpecs": [
    {
      "sddcLcmId": "${primarySddcLcms}",
      "componentType": "OPS_LOGS",
      "deploymentType": "VspComponentSpec",
      "version": "9.1.0.0",
      "fqdn": "${logManagementFqdn}",
      "configSpec": {
        "size": "${logManagementSize}",
        "numberOfNodes": ${logManagementNodeCount}
      }
    }
  ]
}
EOF
```

9. Verify the JSON payload has been populated correctly by running the following command:

```bash
 cat log-management-deploy.json
```

Example Output:

```json
{
  "componentSpecs": [
    {
      "sddcLcmId": "e35632dc-2777-432e-8985-7e1f0a32acf3",
      "componentType": "OPS_LOGS",
      "deploymentType": "VspComponentSpec",
      "version": "9.1.0.0",
      "fqdn": "flt-logs01a.rainpole.io",
      "configSpec": {
        "size": "small",
        "numberOfNodes": 1
      }
    }
  ]
}
```

10. Validate the JSON payload by running the following command:

```bash
validationId=$(curl -k -X POST "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/components/validations" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @log-management-deploy.json | jq -r ".id")
```

11. Check the status of the validation by running the following command:

```bash
curl -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${validationId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

12. The command in step 11 may need to be run multiple times, alternatively you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${validationId}" \
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
deploymentId=$(curl -k -X POST "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/components" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @log-management-deploy.json | jq -r ".id")
```

14. Check the status of the deployment by running the following command:

```bash
curl -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${deploymentId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

15. The command in step 11 would need to be run multiple times, alternatively you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${deploymentId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 60 seconds."
    sleep 60
done
```

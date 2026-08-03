+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Cancelling a VCF Fleet Lifecycle Task"
date = "2026-07-30"
description = "VMware Cloud Foundation APIs: Cancelling a VCF Fleet Lifecycle Task"
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

There maybe a number scenarios where you find yourself needing to cancel a running task, this is possible using the ***VCF Fleet Lifecycle Service*** APIs. It's important to note that the running stage will continue until it reaches a terminal state, and only then subsequent steps will not be executed.

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* POST /api/v1/identity/token
* GET /fleet-lcm/v1/tasks
* POST /fleet-lcm/v1/tasks/<taskId>?action=cancel

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Fleet Lifecycle Service and paste the commands in the console. If your not sure which endpoint this FQDN should be log into VCF Operations, go to ***Build > Lifecycle > VCF Management*** and select the ***Components*** tab and locate the component named ***Fleet lifecycle*** the FQDN is shown in the FQDN column.

```bash
export vcfFleetLifecycleFqdn='flt-fc01.rainpole.io'
export vcfFleetLifecycleUser='admin@vsp.local'
export vcfFleetLifecyclePass='VMw@re1!VMw@re1!'
```

3. Authenticate to the VCF Fleet Lifecycle service and obtain a token by running the following command:

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
eyJhbGciOiJFZERTQSIsImtpZCI6Ilg4Mk5veGNJRlVCVEFiY0xPM1NUdU12UTF6Qlo4d01xeUxDTGNuOGZYdFUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2ZsdC1mYzAxLnJhaW5wb2xlLmlvIiwic3ViIjoiYWRtaW5AdnNwLmxvY2FsIiwiYXVkIjpbInZzcCJdLCJleHAiOjE3ODUyNDk1MzIsImlhdCI6MTc4NTIzNTEzMiwianRpIjoiOThkMjE2NzYtZGRhYy00NmU2LWEyZWItMzdjNDYzNmI1NjQwIiwiYXpwIjoicGFzc3dvcmRfZ3JhbnRfY2xpZW50IiwiYWNjdCI6ImFkbWluQHZzcC5sb2NhbCIsImF1dGhvcml6YXRpb25fZGV0YWlscyI6bnVsbH0.CjyGod2F17Wz0Y4TmggHZieByeE80a6Uqe2S7trD1ycaPupzqZ19d_qLbiHjrMviV-ADDKc7RkGc27DoaChNBA
```

5. Retrieve the task ID of the running task by running the following command:

```bash
taskId=$(curl -ks -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '.elements[] | select(.status == "RUNNING") | .id')
```

6. Verify you successfully obtained the task ID by running the following command:

```bash
echo $taskId
```

Example Output:

```bash
019fa881-3b1f-7934-86d3-dd617eab2976
```

7. Cancel the task by running the following command:

```bash
curl -ks -X POST "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${taskId}?action=cancel" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json"
```

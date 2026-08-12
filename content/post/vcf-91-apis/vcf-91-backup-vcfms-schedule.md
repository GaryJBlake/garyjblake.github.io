+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Configure a Backup Schedule for VCF Management Services"
date = "2026-08-18"
description = "VMware Cloud Foundation APIs: Configure a Backup Schedule for VCF Management Services"
tags = [
    "VCF",
    "VCF 9.1",
    "API",
    "Backup"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Operations",
    "Backup and Restore"
]
series = [
    "VMware Cloud Foundation 9.1 APIs"
]
+++

Once you have configured an SFTP backup location for VCF Management Services you need to configure a schedule for performing regular backups.

In this post we will look at how this can be done using the public APIs, this is achieved via the VCF Fleet Lifecycle Service which is tightly integrated into VCF Operations.

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

- POST /api/v1/identity/token
- GET /fleet-lcm/v1/sddc-lcms
- PATCH /fleet-lcm/v1/sddc-lcms/{sddcLcms}
- GET /fleet-lcm/v1/tasks/{taskId}

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

``` bash
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
fcc8eb20-b07b-4671-8166-671346bcea12
```

7. Create the JSON payload for the backup schedule, adjusting settings to match your needs by running the following command:

```bash
cat << EOF > backup-schedule-vcfms.json
{
    "backupConfigSpec": {
        "fullSchedule": {
        "enabled": true,
        "schedule": {
            "days": ["MON", "TUE", "WED", "THU", "FRI"],
            "startTime": "23:00:00+01:00"
        }
    },
        "incrementalSchedule": { "enabled": false },
        "retention": { "maxBackups": 3 }
    }
}
EOF
```

8. Verify the JSON payload has been populated correctly by running the following command:

```bash
cat backup-schedule-vcfms.json
```

Example Output:

```json
{
    "backupConfigSpec": {
        "fullSchedule": {
        "enabled": true,
        "schedule": {
            "days": ["MON", "TUE", "WED", "THU", "FRI"],
            "startTime": "23:00:00+01:00"
        }
    },
        "incrementalSchedule": { "enabled": false },
        "retention": { "maxBackups": 3 }
    }
}
```

9. Configure a backup schedule by running the following command:

```bash
taskId=$(curl -k -X PATCH "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/sddc-lcms/${primarySddcLcms}" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @backup-schedule-vcfms.json \
  | jq -r '.id')
```

10. Check the status of the task by running the following command:

```bash
curl -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${taskId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

11. The task is long running so you would need to run the command in the previous step multiple times, alternatively you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${taskId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 60 seconds."
    sleep 60
done
```

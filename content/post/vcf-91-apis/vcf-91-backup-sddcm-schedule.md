+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Configure a Backup Schedule for SDDC Manager"
date = "2026-08-20"
description = "VMware Cloud Foundation APIs: Configure a Backup Schedule for SDDC Manager"
tags = [
    "VCF",
    "VCF 9.1",
    "API",
    "Backup"
]
categories = [
    "VMware Cloud Foundation",
    "NSX Manager",
    "Backup and Restore"
]
series = [
    "VMware Cloud Foundation 9.1 APIs"
]
+++

Once you have reconfigured the SFTP backup location which is defined using SDDC Manager and covers the configuration of both SDDC Manager and NSX Manager, you need to configure a schedule for SDDC Manager performing regular backups.

In this post we will look at how this can be done using the public APIs, this is achieved via SDDC Manager.

**SDDC Manager APIs Used**

[SDDC Manager API](https://developer.broadcom.com/xapis/sddc-manager-api/latest/)

- POST /v1/tokens
- PATCH /v1/system/backup-configuration

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
sddcManagerToken=$(curl -k -X POST "https://${sddcManagerFqdn}/v1/tokens" \
    --header "Content-Type:application/json" \
    -d "{\"username\":\"${sddcManagerUser}\", \"password\":\"${sddcManagerPass}\"}" \
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

5. Replace the values in the sample code with values for your backup schedule and paste the commands in the console.

```bash
export frequency='WEEKLY'
export hourOfDay='23'
export minuteOfDay='0'
export daysOfWeek='"TUESDAY", "THURSDAY"'
export numberMostRecent='3'
export numberHourly='3'
export numberDaily='3'
```

6. Create the JSON payload for the backup schedule, adjusting settings to match your needs by running the following command:

```bash
cat << EOF > backup-schedule-sddcm.json
{
    "backupSchedules": [
        {
            "resourceType": "SDDC_MANAGER",
            "frequency": "${frequency}",
            "hourOfDay": ${hourOfDay},
            "minuteOfHour": ${minuteOfDay},
            "daysOfWeek": [ ${daysOfWeek} ],
            "takeScheduledBackups": true,
            "takeBackupOnStateChange": false,
            "retentionPolicy": {
                "numberOfMostRecentBackups": ${numberMostRecent},
                "numberOfDaysOfHourlyBackups": ${numberHourly},
                "numberOfDaysOfDailyBackups": ${numberDaily}
            }
        }
    ]
}
EOF
```

7. Verify the JSON payload has been populated correctly by running the following command:

```bash
cat backup-schedule-sddcm.json
```

Example Output:

```json
{
    "backupSchedules": [
        {
            "resourceType": "SDDC_MANAGER",
            "frequency": "WEEKLY",
            "hourOfDay": 23,
            "minuteOfHour": 0,
            "daysOfWeek": [ "TUESDAY", "THURSDAY" ],
            "takeScheduledBackups": true,
            "takeBackupOnStateChange": false,
            "retentionPolicy": {
                "numberOfMostRecentBackups": 3,
                "numberOfDaysOfHourlyBackups": 3,
                "numberOfDaysOfDailyBackups": 3
            }
        }
    ]
}
```

8. Configure a backup schedule by running the following command:

```bash
taskId=$(curl -k -X PATCH "https://${sddcManagerFqdn}/v1/system/backup-configuration" \
  --header "Authorization: Bearer ${sddcManagerToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @backup-schedule-sddcm.json \
| jq -r '.id')
```

9. You can monitor the command in the previous step, alternatively you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://${sddcManagerFqdn}/v1/tasks/${taskId}" \
  --header "Authorization: Bearer ${sddcManagerToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq '{status: .status}' \
  | grep -q "In Progress"; do
  echo "Still in 'In Progress' state... waiting 10 seconds."
  sleep 10
done
```

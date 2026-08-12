+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Configure a Backup Schedule for NSX Manager"
date = "2026-08-25"
description = "VMware Cloud Foundation APIs: Configure a Backup Schedule for NSX Manager"
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

Once you have reconfigured the SFTP backup location which is defined using SDDC Manager and covers the configuration of both SDDC Manager and NSX Manager, you need to configure a schedule for NSX Manager performing regular backups.

In this post we will look at how this can be done using the public APIs, this is achieved via NSX Management cluster.

**NSX Manager APIs Used**

[NSX-T Data Center REST API](https://developer.broadcom.com/xapis/nsx-t-data-center-rest-api/9.1.0/)

- GET /api/v1/cluster/backups/config
- PUT /api/v1/cluster/backups/config

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your NSX Manager instance and paste the commands in the console.

```bash
export nsxManagerFqdn='sfo-m01-nsx01.sfo.rainpole.io'
export nsxManagerUser='admin'
export nsxManagerPass='VMw@re1!VMw@re1!'
```

3. Replace the values in the sample code with values for your backup schedule and paste the commands in the console.

```bash
export hourOfDay='23'
export minuteOfDay='0'
export daysOfWeek='1, 2, 3, 4, 5'
export inventoryInterval='240'
```

4. Retrieve the current configuration by using the following command:

```bash
currentConfig=$(curl -k -X GET "https://${nsxManagerFqdn}/api/v1/cluster/backups/config" \
    -u ${nsxManagerUser}:${nsxManagerPass} \
| jq)
```

5. Create the JSON payload for the backup schedule, adjusting settings to match your needs by running the following command:

```bash
cat << EOF > backup-schedule-nsx.json
{
    "remote_file_server": {
        "server": "$(jq -r '.remote_file_server.server' <<< "$currentConfig")",
        "port": $(jq -r '.remote_file_server.port' <<< "$currentConfig"),
        "protocol": {
            "protocol_name": "sftp",
            "ssh_fingerprint": "$(jq -r '.remote_file_server.protocol.ssh_fingerprint' <<< "$currentConfig")",
            "authentication_scheme": {
                "scheme_name": "PASSWORD",
                "username": "$(jq -r '.remote_file_server.protocol.authentication_scheme.username' <<< "$currentConfig")"
            }
        },
        "directory_path": "$(jq -r '.remote_file_server.directory_path' <<< "$currentConfig")"
    },
    "backup_enabled": true,
    "backup_schedule": {
        "resource_type": "WeeklyBackupSchedule",
        "hour_of_day": ${hourOfDay},
        "minute_of_day": ${minuteOfDay},
        "days_of_week": [ ${daysOfWeek} ]
    },
    "inventory_summary_interval": ${inventoryInterval}
}
EOF
```

6. Verify the JSON payload has been populated correctly by running the following command:

```bash
cat backup-schedule-nsx.json
```

Example Output:

```json
{
    "remote_file_server": {
        "server": "10.167.173.55",
        "port": 22,
        "protocol": {
            "protocol_name": "sftp",
            "ssh_fingerprint": "SHA256:HLXNPN/M3n/+zIjj0uMHPDa+WLRt87e7AimDKqlFFi0",
            "authentication_scheme": {
                "scheme_name": "PASSWORD",
                "username": "svc-vcf-bck"
            }
        },
        "directory_path": "/media/backups/sfo-m01-nsx01.sfo.rainpole.io"
    },
    "backup_enabled": true,
    "backup_schedule": {
        "resource_type": "WeeklyBackupSchedule",
        "hour_of_day": 23,
        "minute_of_day": 0,
        "days_of_week": [ 1, 2, 3, 4, 5 ]
    },
    "inventory_summary_interval": 240
}
```

7. Configure a backup schedule by running the following command:

```bash
curl -k -X PUT "https://${nsxManagerFqdn}/api/v1/cluster/backups/config" \
    --header "Content-Type: application/json" \
    -u ${nsxManagerUser}:${nsxManagerPass} \
    -d @backup-schedule-nsx.json
```

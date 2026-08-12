+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Configure SFTP Backup Location"
date = "2026-08-13"
description = "VMware Cloud Foundation APIs: Configure SFTP Backup Location"
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

One of the first tasks you should perform following the initial deployment of your VMware Cloud Foundation platform is to configure a backup location for your VCF Instance. Regularly backing up the management components ensures that in the event of data loss or system failure, you can efficiently restore critical services, minimizing downtime and maintaining operational integrity.

- [Configure SFTP Backup Location for VCF Management Services](#configure-sftp-backup-location-for-vcf-management-services)
- [Configure SFTP Backup Location for SDDC Manager and NSX Manager](#configure-sftp-backup-location-for-sddc-manager-and-nsx-manager)
- [Configure SFTP Backup Location for vCenter](#configure-sftp-backup-location-for-vcenter)

### Configure SFTP Backup Location for VCF Management Services

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

- POST /api/v1/identity/token
- GET /fleet-lcm/v1/sddc-lcms
- POST /fleet-lcm/v1/address-attributes?type=SSH_THUMBPRINT
- PATCH /fleet-lcm/v1/sddc-lcms/{sddcLcms}?action=apply
- GET /fleet-lcm/v1/tasks/{taskId}

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

7. Replace the values in the sample code with values for your SFTP server instance and run the commands in the console.

```bash
export sftpServerIp='10.167.173.55'
export sftpDirectory='/media/backups/'
export sftpUser='svc-vcf-bck'
export sftpPass='VMw@re1!'
export encryptionPassphrase='VMw@re1!VMw@re1!'
```

8. Retrieve the SFTP server fingerprint by running the following command:

```bash
sftpFingerprint=$(curl -k -X POST "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/address-attributes?type=SSH_THUMBPRINT" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  --data '[{"address":"10.167.173.55","port":22}]' \
| jq -r '.[].value')
```

> [!TIP]
> SSH fingerprints of type RSA and ED25519 are supported. The fingerprint format should be as follows: SHA256:yA3FHIQMbiMnansI4+lONYBASLP2IQhGZkGJIMZ2Pi8

9. Verify you were able to successfully obtain the SFTP server fingerprint by running the following command:

```bash
echo $sftpFingerprint
```

Example Output:

```bash
SHA256:pGLHaf7zhviq9ReTA75fj7wCHXftKKj6FLRbIcKp5xo
```

10. Create the JSON payload for the SFTP backup location by running the following command:

```bash
cat << EOF > sftp-backup-location.json
{
  "backupConfigSpec": {
    "storage": {
      "sftp": {
        "host": "${sftpServerIp}",
        "port": "22",
        "username": "${sftpUser}",
        "password": "${sftpPass}",
        "directory": "${sftpDirectory}",
        "thumbprint": "${sftpFingerprint}"
      }
    },
    "encryptionPassphrase": "VMw@re1!VMw@re1!"
  }
}
EOF
```

11. Verify the JSON payload has been populated correctly by running the following command:

```bash
cat sftp-backup-location.json
```

Example Output:

```json
{
  "backupConfigSpec": {
    "storage": {
      "sftp": {
        "host": "10.167.173.55",
        "port": "22",
        "username": "svc-vcf-bck",
        "password": "VMw@re1!",
        "directory": "/media/backups/",
        "thumbprint": "SHA256:pGLHaf7zhviq9ReTA75fj7wCHXftKKj6FLRbIcKp5xo"
      }
    },
    "encryptionPassphrase": "VMw@re1!VMw@re1!"
  }
}
```

12. Configure a an SFTP backup location by running the following command:

```bash
taskId=$(curl -k -X PATCH "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/sddc-lcms/${primarySddcLcms}?action=apply" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @sftp-backup-location.json \
| jq -r '.id')
```

13. Check the status of the task by running the following command:

```bash
curl -k -X GET "https://${vcfFleetLifecycleFqdn}/fleet-lcm/v1/tasks/${taskId}" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
| jq
```

14. The task is long running so you would need to run the command in the previous step multiple times, alternatively you can run the command over and over by running the following command:

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

### Configure SFTP Backup Location for SDDC Manager and NSX Manager

**SDDC Manager APIs Used**

[SDDC Manager APIs](https://developer.broadcom.com/xapis/vmware-cloud-foundation-api/latest/)

- POST /v1/tokens
- GET /v1/system/backup-configuration
- PUT /v1/system/backup-configuration
- GET /v1/tasks/<taskId>

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
sddcManagerToken=$(curl -k -X POST "https://$sddcManagerFqdn/v1/tokens" \
  --header "Content-Type:application/json" \
  -d "{\"username\":\"$sddcManagerUser\", \"password\":\"$sddcManagerPass\"}" \
| jq -r '.accessToken')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $sddcManagerToken
```

Example Output:

```bash
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbmlzdHJhdG9yQHZzcGhlcmUubG9jYWwiLCJhdWQiOiJzZGRjLXNlcnZpY2VzIiwibmJmIjoxNzg1ODMyNjM5LCJyb2xlIjpbIkFETUlOIl0sImlzSXNzdWVkRm9ySnd0IjpmYWxzZSwic2NvcGUiOlsiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9XUklURSIsIkxJQ0VOU0lOR19JTkZPX1JFQUQiLCJTRERDX0ZFREVSQVRJT05fV1JJVEUiLCJBVk5fV1JJVEUiLCJTRERDX01BTkFHRVJfUkVBRCIsIkNFUlRfV1JJVEUiLCJBTEJfQ0xVU1RFUl9SRUFEIiwiTElDRU5TRV9LRVlfUkVBRCIsIkVER0VfQ0xVU1RFUl9XUklURSIsIlVTRVJfUkVBRCIsIkNPTVBMSUFOQ0VfV1JJVEUiLCJQT0xJQ1lfV1JJVEUiLCJDUkVERU5USUFMX1dSSVRFIiwiQkFDS1VQX0NPTkZJR19SRUFEIiwiVlNQX0NMVVNURVJfUkVBRCIsIkNMVVNURVJfV1JJVEUiLCJBVk5fUkVBRCIsIlZBU0FfUFJPVklERVJfUkVBRCIsIkRPTUFJTl9XUklURSIsIkNFSVBfUkVBRCIsIlNPU19XUklURSIsIlBPTElDWV9SRUFEIiwiU0REQ19NQU5BR0VSX1dSSVRFIiwiUkFfUkVBRCIsIk5UUF9XUklURSIsIlRBR19XUklURSIsIkRFUE9UX0NPTkZJR19XUklURSIsIlNZU1RFTV9SRUFEIiwiREVQT1RfQ09ORklHX1JFQUQiLCJIT1NUX1dSSVRFIiwiUkVTT1VSQ0VfTE9DS19XUklURSIsIkJBQ0tVUF9SRVNUT1JFX1JFQUQiLCJDRVJUX1JFQUQiLCJOT1RJRklDQVRJT05fV1JJVEUiLCJVU0VSX1dSSVRFIiwiVE9LRU5fU0lHTklOR19LRVlfUkVBRCIsIkNPTVBMSUFOQ0VfUkVBRCIsIlVQR1JBREVfUkVBRCIsIk9USEVSX1JFQUQiLCJMSUNFTlNJTkdfV1JJVEUiLCJTT1NfUkVBRCIsIkVWRU5UX1dSSVRFIiwiU0VDVVJJVFlfQ09ORklHX1JFQUQiLCJDUkVERU5USUFMX1JFQUQiLCJIT1NUX1JFQUQiLCJBTEJfQ0xVU1RFUl9XUklURSIsIlZFUlNJT05fU1lOQ19XUklURSIsIkNFSVBfV1JJVEUiLCJSRVNPVVJDRV9MT0NLX1JFQUQiLCJPVEhFUl9XUklURSIsIkxJQ0VOU0VfS0VZX1dSSVRFIiwiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9SRUFEIiwiQ0FfUkVBRCIsIk5PVElGSUNBVElPTl9SRUFEIiwiVEFHX1JFQUQiLCJMSUNFTlNJTkdfUkVBRCIsIk5FVFdPUktfUE9PTF9XUklURSIsIldDUF9SRUFEIiwiTElDRU5TSU5HX0lORk9fV1JJVEUiLCJCQUNLVVBfUkVTVE9SRV9XUklURSIsIlRPS0VOX1NJR05JTkdfS0VZX1dSSVRFIiwiTlRQX1JFQUQiLCJFREdFX0NMVVNURVJfUkVBRCIsIkVWRU5UX1JFQUQiLCJCQUNLVVBfQ09ORklHX1dSSVRFIiwiV0NQX1dSSVRFIiwiU0VSVklDRV9BQ0NPVU5UX1dSSVRFIiwiTkVUV09SS19QT09MX1JFQUQiLCJDQV9XUklURSIsIkNMVVNURVJfUkVBRCIsIlZBU0FfUFJPVklERVJfV1JJVEUiLCJETlNfV1JJVEUiLCJTWVNURU1fV1JJVEUiLCJWUlNMQ01fV1JJVEUiLCJETlNfUkVBRCIsIlNFUlZJQ0VfQUNDT1VOVF9SRUFEIiwiU0REQ19GRURFUkFUSU9OX1JFQUQiLCJET01BSU5fUkVBRCIsIlZTUF9DTFVTVEVSX1dSSVRFIiwiVlJTTENNX1JFQUQiLCJVUEdSQURFX1dSSVRFIl0sImlzcyI6InZjZi1hdXRoIiwibmFtZSI6ImFkbWluaXN0cmF0b3JAdnNwaGVyZS5sb2NhbCIsImV4cCI6MTc4NTgzNjIzOSwiaWF0IjoxNzg1ODMyNjM5LCJ1c2VyIjoiYWRtaW5pc3RyYXRvckB2c3BoZXJlLmxvY2FsIiwianRpIjoiM2JhZjM5YWQtYmU1NS00MTk1LWFiMTAtZjRiNDhhNzA4MmUyIn0.7tJXf9t0wxb5Dy8KJIp3wLqPXrWD6gTUATdkmt0Szt4
```

5. Replace the values in the sample code with values for your SFTP server instance and run the commands in the console.

```bash
export sftpServerIp='10.167.173.55'
export sftpDirectory='/media/backups/'
export sftpUser='svc-vcf-bck'
export sftpPass='VMw@re1!'
export encryptionPassphrase='VMw@re1!VMw@re1!'
```

6. Retrieve the SFTP server fingerprint by running the following command:

```bash
sftpFingerprint=$(curl -k -X GET "https://${sddcManagerFqdn}/v1/system/backup-configuration/backup-locations?serverIp=${sftpServerIp}&port=22" \
  --header "Authorization: Bearer ${sddcManagerToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
| jq -r '.sshFingerprint')
```

> [!TIP]
> SSH fingerprints of type RSA and ED25519 are supported. The fingerprint format should be as follows: SHA256:yA3FHIQMbiMnansI4+lONYBASLP2IQhGZkGJIMZ2Pi8

7. Verify you were able to successfully obtain the SFTP server fingerprint by running the following command:

```bash
echo $sftpFingerprint
```

Example Output:

```bash
SHA256:pGLHaf7zhviq9ReTA75fj7wCHXftKKj6FLRbIcKp5xo
```

8. Create the JSON payload for the SFTP backup location by running the following command:

```bash
cat << EOF > sftp-backup-location-sddcm.json
{
  "backupLocations": [
  {
    "directoryPath": "${sftpDirectory}",
    "password": "${sftpPass}",
    "port": 22,
    "protocol": "SFTP",
    "server": "${sftpServerIp}",
    "sshFingerprint": "${sftpFingerprint}",
    "username": "${sftpUser}"
    }
  ],
  "encryption": {
    "passphrase": "${encryptionPassphrase}"
  }
}
EOF
```

9. Verify the JSON payload has been populated correctly by running the following command:

```bash
cat sftp-backup-location-sddcm.json
```

Example Output:

```json
{
  "backupLocations": [
  {
    "directoryPath": "/media/backups/",
    "password": "VMw@re1!",
    "port": 22,
    "protocol": "SFTP",
    "server": "10.167.173.55",
    "sshFingerprint": "SHA256:pGLHaf7zhviq9ReTA75fj7wCHXftKKj6FLRbIcKp5xo",
    "username": "svc-vcf-bck"
    }
  ],
  "encryption": {
    "passphrase": "VMw@re1!VMw@re1!"
  }
}
```

10. Configure a an SFTP backup location by running the following command:

```bash
taskId=$(curl -k -X PUT "https://${sddcManagerFqdn}/v1/system/backup-configuration" \
  --header "Authorization: Bearer ${sddcManagerToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @sftp-backup-location-sddcm.json \
| jq -r '.id')
```

11. Check the status of the task by running the following command:

```bash
curl -k -X GET "https://${sddcManagerFqdn}/v1/tasks/${taskId}" \
  --header "Authorization: Bearer ${sddcManagerToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
| jq
```

12. You can monitor the command in the previous step, alternatively you can run the command over and over by running the following command:

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

### Configure SFTP Backup Location for vCenter

**vCenter APIs Used**

[vCenter APIs](https://developer.broadcom.com/xapis/vsphere-automation-api/latest/)

- POST /api/session
- POST /api/appliance/recovery/backup/schedules

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your vCenter instance and paste the commands in the console.

```bash
export vcenterFqdn='sfo-m01-vc01.sfo.rainpole.io'
export vcenterUser='administrator@vsphere.local'
export vcenterPass='VMw@re1!VMw@re1!'
```

3. Authenticate to the vCenter instance and obtain a token by running the following command:

```bash
vcenterToken=$(curl -k -X POST "https://${vcenterFqdn}/api/session" \
  -u "$vcenterUser:$vcenterPass" \
| tr -d '"')
```

4. Verify you successfully obtained an authentication token by running the following command:

```bash
echo $vcenterToken
```

Example Output:

``` bash
32118bd49ebe6cdebbd5e8d06b7fcfa0
```

5. Replace the values in the sample code with values for your SFTP server instance and run the commands in the console.

```bash
export sftpServerIp='10.167.173.55'
export sftpDirectory='/media/backups/'
export sftpUser='svc-vcf-bck'
export sftpPass='VMw@re1!'
export encryptionPassphrase='VMw@re1!VMw@re1!'
```

6. Create the JSON payload for the SFTP backup location by running the following command:

```bash
cat << EOF > sftp-backup-location-vcenter.json
{
  "schedule": "default",
  "spec": {
    "location": "sftp://${sftpServerIp}${sftpDirectory}",
    "location_user": "${sftpUser}",
    "location_password": "${sftpPass}",
    "parts": ["supervisors", "seat", "common"],
    "backup_password": "${encryptionPassphrase}",
    "recurrence_info": { "days": [], "hour": 23, "minute": "0" },
    "retention_info": { "max_count": 3 }
  }
}
EOF
```

7. Verify the JSON payload has been populated correctly by running the following command:

```bash
cat sftp-backup-location-vcenter.json
```

Example Output:

```json
{
  "schedule": "default",
  "spec": {
    "location": "sftp://10.167.173.55/media/backups/",
    "location_user": "svc-vcf-bck",
    "location_password": "VMw@re1!",
    "parts": ["supervisors", "seat", "common"],
    "backup_password": "VMw@re1!VMw@re1!",
    "recurrence_info": { "days": [], "hour": 23, "minute": "0" },
    "retention_info": { "max_count": 3 }
  }
}
```

8. Configure a an SFTP backup location by running the following command:

```bash
curl -S -k -X POST "https://${vcenterFqdn}/api/appliance/recovery/backup/schedules" \
  --header "vmware-api-session-id: ${vcenterToken}" \
  --header "Content-Type: application/json" \
  --header "Accept: application/json" \
  -d @sftp-backup-location-vcenter.json \
| jq
```

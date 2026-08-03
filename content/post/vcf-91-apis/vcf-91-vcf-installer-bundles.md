+++
author = "GaryJBlake"
title = "VCF Installer APIs: Download Binaries from Broadcom Depot"
date = "2026-06-25"
description = "VCF Installer APIs: Download Binaries from Broadcom Depot"
tags = [
    "VCF 9.1",
    "API"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Installer"
]
series = [
    "VCF Installer APIs"
]
+++

After you have successfully configured the VCF Installer with a valid connection to the Broadcom Depot and synchronized the manifest, you can begin downloading the binaries required to implement VMware Cloud Foundation. Assuming your are deploying all components you will need to download 16 components as follows:

- Cloud proxy
- Fleet lifecycle
- Identity broker
- License server
- Migration service engine
- Salt master
- Salt RaaS
- SDDC lifecycle
- SDDC Manager
- Software depot
- Telemetry
- VCF Automation
- VCF Operations
- VCF services runtime
- VMware NSX
- VMware vCenter

**VCF Installer APIs Used**

* POST /v1/tokens
* GET /v1/bundles
* PATCH /v1/bundles/{id}

[VCF Installer API Reference Guide](https://developer.broadcom.com/xapis/vcf-installer-api/latest/)

**Procedure**

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Installer instance and paste the commands in the console.

```bash
export vcfInstallerFqdn='sfo-ins01.sfo.rainpole.io'
export vcfInstallerUser='admin@local'
export vcfInstallerPass='VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Installer and obtain a token by running the following command:

```bash
vcfInstallerToken=$(curl -k -X POST "https://${vcfInstallerFqdn}/v1/tokens" \
    --header "Content-Type:application/json" \
    -d '{"username": "'$vcfInstallerUser'","password": "'$vcfInstallerPass'"}' \
    | jq -r '.accessToken')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfInstallerToken
```

Example Output:

```bash
V1JJVEUiLCJMSUNFTlNFX0tFWV9SRUFEIiwiTElDRU5TRV9LRVlfV1JJVEUiLCJDRVJUX1JFQUQiLCJDRVJUX1dSSVRFIiwiQ0FfUkVBRCIsIkNBX1dSSVRFIiwiTkVUV09SS19QT09MX1JFQUQiLCJORVRXT1JLX1BPT0xfV1JJVEUiLCJWUlNMQ01fUkVBRCIsIlZSU0xDTV9XUklURSIsIkNFSVBfUkVBRCIsIkNFSVBfV1JJVEUiLCJCQUNLVVBfUkVTVE9SRV9SRUFEIiwiQkFDS1VQX1JFU1RPUkVfV1JJVEUiLCJETlNfUkVBRCIsIkROU19XUklURSIsIk5UUF9SRUFEIiwiTlRQX1dSSVRFIiwiRURHRV9DTFVTVEVSX1JFQUQiLCJFREdFX0NMVVNURVJfV1JJVEUiLCJTRERDX0ZFREVSQVRJT05fUkVBRCIsIlNERENfRkVERVJBVElPTl9XUklURSIsIldDUF9SRUFEIiwiV0NQX1dSSVRFIiwiRE9NQUlOX1JFQUQiLCJET01BSU5fV1JJVEUiLCJTRERDX01BTkFHRVJfUkVBRCIsIlNERENfTUFOQUdFUl9XUklURSIsIkhPU1RfUkVBRCIsIkhPU1RfV1JJVEUiLCJDTFVTVEVSX1JFQUQiLCJDTFVTVEVSX1dSSVRFIiwiVVBHUkFERV9SRUFEIiwiVVBHUkFERV9XUklURSIsIkRFUE9UX0NPTkZJR19SRUFEIiwiREVQT1RfQ09ORklHX1dSSVRFIiwiVkFTQV9QUk9WSURFUl9SRUFEIiwiVkFTQV9QUk9WSURFUl9XUklURSIsIlNFUlZJQ0VfQUNDT1VOVF9SRUFEIiwiU0VSVklDRV9BQ0NPVU5UX1dSSVRFIiwiQVZOX1dSSVRFIiwiQVZOX1JFQUQiLCJTT1NfUkVBRCIsIlNPU19XUklURSIsIlNFQ1VSSVRZX0NPTkZJR19SRUFEIiwiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9SRUFEIiwiUkVTT1VSQ0VfRlVOQ1RJT05BTElUWV9XUklURSIsIlRBR19SRUFEIiwiVEFHX1dSSVRFIiwiUkVTT1VSQ0VfTE9DS19SRUFEIiwiUkVTT1VSQ0VfTE9DS19XUklURSIsIkxJQ0VOU0lOR19JTkZPX1JFQUQiLCJMSUNFTlNJTkdfSU5GT19XUklURSIsIlNZU1RFTV9XUklURSIsIlNZU1RFTV9SRUFEIiwiTElDRU5TSU5HX1JFQUQiLCJMSUNFTlNJTkdfV1JJVEUiLCJFVkVOVF9SRUFEIiwiRVZFTlRfV1JJVEUiLCJBTEJfQ0xVU1RFUl9SRUFEIiwiQUxCX0NMVVNURVJfV1JJVEUiLCJDT01QTElBTkNFX1JFQUQiLCJDT01QTElBTkNFX1dSSVRFIiwiVkVSU0lPTl9TWU5DX1dSSVRFIiwiUkFfUkVBRCIsIlBPTElDWV9SRUFEIiwiUE9MSUNZX1dSSVRFIiwiTk9USUZJQ0FUSU9OX1JFQUQiLCJOT1RJRklDQVRJT05fV1JJVEUiLCJUT0tFTl9TSUdOSU5HX0tFWV9SRUFEIiwiVE9LRU5fU0lHTklOR19LRVlfV1JJVEUiLCJWU1BfQ0xVU1RFUl9SRUFEIiwiVlNQX0NMVVNURVJfV1JJVEUiXSwiaXNzIjoidmNmLWF1dGgiLCJuYW1lIjoiYWRtaW5AbG9jYWwiLCJleHAiOjE3ODU3NTc3MjEsImlhdCI6MTc4NTc1NDEyMSwidXNlciI6ImFkbWluQGxvY2FsIiwianRpIjoiYzEzMmZiMjEtYjZiNi00ZThmLTk5MDYtNTc2YTQxMWY4NmRjIn0.IsLPDYML0r79fqEVW51KOwyAKABrkohV21v9k1fBjpo
```

5. View all of the install binaries based on a specific version by running the following command:

```bash
curl -k -X GET "https://${vcfInstallerFqdn}/v1/bundles" \
    --header "Authorization: Bearer ${vcfInstallerToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '.elements[] | select(.version | startswith("9.1.0")) | .components[] | select(.imageType == "INSTALL")'
```

6. Trigger the download of the all required binaries to VCF Installer based on a specific version by running the following command:

```bash
curl -k -X GET "https://${vcfInstallerFqdn}/v1/bundles" \
    --header "Authorization: Bearer ${vcfInstallerToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq -r '.elements[] 
        | select(.version | startswith("9.1.0")) 
        | select(.downloadStatus != "SUCCESSFUL") 
        | select(.components[].imageType == "INSTALL") 
        | .id' \
    | while read -r id; do
        
        echo "--------------------------------------------------"
        echo "Starting download for ID: $id"
        echo "--------------------------------------------------"
        
        curl -k -X PATCH "https://${vcfInstallerFqdn}/v1/bundles/${id}" \
            --header "Authorization: Bearer ${vcfInstallerToken}" \
            --header "Accept: application/json" \
            --header "Content-Type: application/json" \
            --data '{
                "bundleDownloadSpec": {
                    "downloadNow": true
                }
            }'

        echo "--------------------------------------------------"
        echo -e "\nTriggered download for $id"
        echo "--------------------------------------------------"
    done
```

7. Verify the binaries have been downloaded successfully by running the following command:

```bash
curl -k -X GET "https://${vcfInstallerFqdn}/v1/bundles" \
    --header "Authorization: Bearer ${vcfInstallerToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq -r '["PARENT ID", "VERSION", "STATUS"], ["---------", "-------", "------"], (.elements[] 
        | select(.version | startswith("9.1")) 
        | select(.components[].imageType == "INSTALL") 
        | [.id, .version, .downloadStatus, .description]) 
        | @tsv'
```

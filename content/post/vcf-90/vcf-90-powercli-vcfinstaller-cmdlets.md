+++
author = "GaryJBlake"
title = "Using VMware.Sdk.Vcf.Installer: Commands for VCF Installer in PowerCLI"
date = "2025-07-15"
description = "Using VMware.Sdk.Vcf.Installer: Commands for VCF Installer in PowerCLI"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI",
    "VCF Installer"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI",
    "VCF Installer"
]
series = [

]
+++

VCF PowerCLI 9.0 now includes a module called `VMware.Sdk.Vcf.Installer`, this modules contains auto-generated cmdlets to support VCF Installer Public APIs. Use can use this post as a quick reference guide.

### Connecting to a VCF Installer Instance with Local Credentials

1. Start a PowerShell session.

2. Connect to a VCF Installer instance using local credentials by running the following command:

``` powershell
Connect-VcfInstallerServer -Server sfo-ins01.sfo.rainpole.io -User admin@local -Password VMw@re1!VMw@re1!
```

3. Once connected the following information is stored in `$defaultInstallerConnections`.

``` bash
ServiceUri     : https://sfo-ins01.sfo.rainpole.io/
SessionSecret  : <SessionSecret>
User           : admin@local
IsConnected    : True
Id             : /VcfInstallerServer=admin@local@sfo-ins01.sfo.rainpole.io:443/
Name           : sfo-ins01.sfo.rainpole.io
Uid            : /VcfInstallerServer=admin@local@sfo-ins01.sfo.rainpole.io:443/
ProductVersion : 9.0.0.0.24703748
ServerUri      : https://sfo-ins01.sfo.rainpole.io/
UUID           : /VcfInstallerServer=admin@local@sfo-ins01.sfo.rainpole.io:443/
Port           : 443
```

4. Disconnect from a VCF Installer instance by running the following command:

``` powershell
Disconnect-VcfInstallerServer -Server sfo-ins01.sfo.rainpole.io
```

### Display All VCF Installer GET Command Details

1. Start a PowerShell session.

2. Display all GET cmdlets supported in `VMware.Sdk.Vcf.Installer` by running the following command:

``` powershell
Get-VcfInstallerOperation -Method Get | Select-Object CommandInfo, Path, Method
```

3. Output for all GET cmdlets in `VMware.Sdk.Vcf.Installer`.

| Command Info                                        | Path                                            | Method
| ----------------------------------------------------| ------------------------------------------------| ------
| Invoke-VcfInstallerGetBundle                        | /v1/bundles/{id}                                | GET
| Invoke-VcfInstallerGetBundleDownloadStatus          | /v1/bundles/download-status                     | GET
| Invoke-VcfInstallerGetBundles                       | /v1/bundles                                     | GET
| Invoke-VcfInstallerGetBundlesForSkipUpgrade         | /v1/bundles/domains/{id}                        | GET
| Invoke-VcfInstallerGetCeipStatus                    | /v1/system/ceip                                 | GET
| Invoke-VcfInstallerGetDepotSettings                 | /v1/system/settings/depot                       | GET
| Invoke-VcfInstallerGetDepotSyncInfo                 | /v1/system/settings/depot/depot-sync-info       | GET
| Invoke-VcfInstallerGetCustomPatches                 | /v1/releases/domains/{domainId}/custom-patches  | GET
| Invoke-VcfInstallerGetCustomPatchesBySku            | /v1/releases/custom-patches                     | GET
| Invoke-VcfInstallerGetReleaseComponentsBySku        | /v1/releases/{sku}/release-components           | GET
| Invoke-VcfInstallerGetProxyConfiguration            | /v1/system/proxy-configuration                  | GET
| Invoke-VcfInstallerGetFutureReleases                | /v1/releases/domains/{domainId}/future-releases | GET
| Invoke-VcfInstallerGetReleases                      | /v1/releases                                    | GET
| Invoke-VcfInstallerGetSystemRelease                 | /v1/releases/system                             | GET
| Invoke-VcfInstallerGetApplianceInfo                 | /v1/system/appliance-info                       | GET
| Invoke-VcfInstallerGetSystemConfiguration           | /v1/system                                      | GET
| Invoke-VcfInstallerGetSystemVcfManagementComponents | /v1/system/vcf-management-components            | GET
| Invoke-VcfInstallerGetTask                          | /v1/tasks/{id}                                  | GET
| Invoke-VcfInstallerGetTasks                         | /v1/tasks                                       | GET
| Invoke-VcfInstallerGetTrustedCertificates           | /v1/sddc-manager/trusted-certificates           | GET
| Invoke-VcfInstallerGetLatestSddcSpecValidation      | /v1/sddcs/validations/latest                    | GET
| Invoke-VcfInstallerGetLatestSddcTask                | /v1/sddcs/latest                                | GET
| Invoke-VcfInstallerGetSddcSpecByID                  | /v1/sddcs/{id}/spec                             | GET
| Invoke-VcfInstallerGetSddcSpecValidation            | /v1/sddcs/validations/{id}                      | GET
| Invoke-VcfInstallerGetSddcSpecValidations           | /v1/sddcs/validations                           | GET
| Invoke-VcfInstallerGetSddcTaskByID                  | /v1/sddcs/{id}                                  | GET
| Invoke-VcfInstallerGetSddcTasks                     | /v1/sddcs                                       | GET
| Invoke-VcfInstallerGetVcfService                    | /v1/vcf-services/{id}                           | GET
| Invoke-VcfInstallerGetVcfServices                   | /v1/vcf-services                                | GET

### Display All VCF Installer POST Command Details

1. Start a PowerShell session.

2. Display all POST cmdlets supported in `VMware.Sdk.Vcf.Installer` by running the following command:

``` powershell
Get-VcfInstallerOperation -Method Post | Select-Object CommandInfo, Path, Method
```

3. Output for all POST cmdlets in `VMware.Sdk.Vcf.Installer`.

| Command Info                                | Path                                  | Method
| --------------------------------------------| --------------------------------------| ------
| Invoke-VcfInstallerUploadBundle             | /v1/bundles                           | POST
| Invoke-VcfInstallerCreateToken              | /v1/tokens                            | POST
| Invoke-VcfInstallerAddTrustedCertificate    | /v1/sddc-manager/trusted-certificates | POST
| Invoke-VcfInstallerDeploySddc               | /v1/sddcs                             | POST
| Invoke-VcfInstallerDiscoverVcenter          | /v1/sddcs/vcenter-discovery           | POST
| Invoke-VcfInstallerDiscoverVcfOps           | /v1/sddcs/vcfops-discovery            | POST
| Invoke-VcfInstallerGetInstallerType         | /v1/sddcs/installer-mode              | POST
| Invoke-VcfInstallerGetNetworkConfigProfiles | /v1/sddcs/network-config-profiles     | POST
| Invoke-VcfInstallerValidateSddcSpec         | /v1/sddcs/validations                 | POST

### Display All VCF Installer PUT Command Details

1. Start a PowerShell session.

2. Display all PUT cmdlets supported in `VMware.Sdk.Vcf.Installer` by running the following command:

``` powershell
Get-VcfInstallerOperation -Method Put | Select-Object CommandInfo, Path, Method
```

3. Output for all PUT cmdlets in `VMware.Sdk.Vcf.Installer`.

| Command Info                            | Path                      | Method
| ----------------------------------------| --------------------------| ------
| Invoke-VcfInstallerUpdateDepotSettings  | /v1/system/settings/depot | PUT

### Display All VCF Installer PATCH Command Details

1. Start a PowerShell session.

2. Display all PATCH cmdlets supported in `VMware.Sdk.Vcf.Installer` by running the following command:

``` powershell
Get-VcfInstallerOperation -Method Patch | Select-Object CommandInfo, Path, Method
```

3. Output for all PATCH cmdlets in `VMware.Sdk.Vcf.Installer`.

| Command Info                                 | Path                                      | Method
| ---------------------------------------------| ------------------------------------------| ------
| Invoke-VcfInstallerStartBundleDownloadByID   | /v1/bundles/{id}                          | PATCH
| Invoke-VcfInstallerSetCeipStatus             | /v1/system/ceip                           | PATCH
| Invoke-VcfInstallerSyncDepotMetadata         | /v1/system/settings/depot/depot-sync-info | PATCH
| Invoke-VcfInstallerUpdateProxyConfiguration  | /v1/system/proxy-configuration            | PATCH
| Invoke-VcfInstallerUpdateSystemConfiguration | /v1/system                                | PATCH
| Invoke-VcfInstallerRetryTask                 | /v1/tasks/{id}                            | PATCH
| Invoke-VcfInstallerRefreshAccessToken        | /v1/tokens/access-token/refresh           | PATCH
| Invoke-VcfInstallerRetrySddc                 | /v1/sddcs/{id}                            | PATCH

### Display All VCF Installer DELETE Command Details

1. Start a PowerShell session.

2. Display all DELETE cmdlets supported in `VMware.Sdk.Vcf.Installer` by running the following command:

``` powershell
Get-VcfInstallerOperation -Method Delete | Select-Object CommandInfo, Path, Method
```

3. Output for all DELETE cmdlets in `VMware.Sdk.Vcf.Installer`.

| Command Info                                | Path                                          | Method
| --------------------------------------------| ----------------------------------------------| ------
| Invoke-VcfInstallerDeleteBundle             | /v1/bundles/{id}                              | DELETE
| Invoke-VcfInstallerDeleteDepotSettings      | /v1/system/settings/depot                     | DELETE
| Invoke-VcfInstallerCancelTask               | /v1/tasks/{id}                                | DELETE
| Invoke-VcfInstallerInvalidateRefreshToken   | /v1/tokens/refresh-token                      | DELETE
| Invoke-VcfInstallerDeleteTrustedCertificate | /v1/sddc-manager/trusted-certificates/{alias} | DELETE

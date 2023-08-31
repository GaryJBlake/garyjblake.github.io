+++
author = "GaryJBlake"
title = "Automating VCF Upgrade - SDDC Manager"
date = "2023-09-12"
description = "Automating VCF Upgrade - SDDC Manager"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "PowerVCF",
    "PowerShell"
]
series = [
    "VCF Upgrade Automation"
]
+++

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

This is part three of a five part blog series in which I talk about automating the VMware Cloud Foundation upgrade process. If you have been following the series so far then you will have your bundles downloaded, and performed various health checks to confirm that all is well and will now be ready to start the upgrade process.

Upgrading VMware Cloud Foundation is a multi-stage process, this post will focus on upgrading SDDC Manager which in itself involves two step:

* Step 1 - Upgrade SDDC Manager
* Step 2 - Apply Configuration Drift to SDDC Manager

**VMware Cloud Foundation APIs Used**

* GET /v1/upgradables/domains/
* GET /v1/domains/
* GET /v1/bundles
* GET /v1/upgrades/

**PowerVCF Cmdlets**

* Get-VCFWorkloadDomain
* Get-VCFBundle
* Get-VCFUpgrade

**PowerShell Scripts**

* [upgradeSddcManager.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/upgradeSddcManager.ps1)

## Upgrade SDDC Manager

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$vcfRelease = "4.5.2.0"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` PowerShell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

3. Perform SDDC Manager upgrade by running the following command:

``` PowerShell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.type -eq "MANAGEMENT"}).id
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements)
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).type -eq "SDDC_MANAGER") {
    $jsonSpec = '{
        "bundleId": "'+ $bundle.bundleId +'",
        "resourceType": "DOMAIN",
        "resourceUpgradeSpecs": [ {
            "resourceId": "'+ $workloadDomain +'",
            "upgradeNow": true
        } ]}'
    $task = Start-VCFUpgrade -json $jsonSpec
    Write-Output " Waiting for Upgrade Task ($($task.name)) with Id ($($task.id)) to Complete"    
    Do { Start-Sleep 60; Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass | Out-Null; $status = Get-VCFUpgrade -id $task.id } While ($status.status -in "PENDING","SCHEDULED","INPROGRESS")
    Write-Output " Upgrade Task with Id ($($task.id)) completed with status ($($status.status))"
} else {
    Write-Warning " Upgrade Not Possible as Required Bundle ($bundleId) Not Downloaded to SDDC Manager"
}
```

In this step we use the **Get-VCFWorkloadDomain** cmdlet to get the Management Domain Id which we use in the JSON spec for performing the upgrade process, we also use the `/v1/upgradables/domains/` API to get the details of next available bundle for performing the SDDC Manager upgrade (This API is not currently in PowerVCF). We perform a few checks before starting the upgrade which include:

* Check that the next upgradable bundle has been physically downloaded to SDDC Manager
* Check that the next upgradable bundle has a type of SDDC_MANAGER

If both of these conditions are true we proceed using the **Start-VCFUpgrade** cmdlet to trigger the upgrade, capturing the API response in **$task** which we then use with the **Get-VCFUpgrade** cmdlet to perform a Do { } While { } loop on the upgrade task Id until the status is no longer in a Scheduled, Pending or In Progress state.

4. Perform SDDC Manager drift configuration by running the following command:

``` PowerShell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.type -eq "MANAGEMENT"}).id
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements)
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).type -eq "SDDC_MANAGER") {
    $jsonSpec = '{
        "bundleId": "'+ $bundle.bundleId +'",
        "resourceType": "DOMAIN",
        "resourceUpgradeSpecs": [ {
            "resourceId": "'+ $workloadDomain +'",
            "upgradeNow": true
        } ]}'
    $task = Start-VCFUpgrade -json $jsonSpec
    Write-Output " Waiting for Upgrade Task ($($task.name)) with Id ($($task.id)) to Complete"    
    Do { Start-Sleep 60; Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass | Out-Null; $status = Get-VCFUpgrade -id $task.id } While ($status.status -in "PENDING","SCHEDULED","INPROGRESS")
    Write-Output " Upgrade Task with Id ($($task.id)) completed with status ($($status.status))"
} else {
    Write-Warning " Upgrade Not Possible as Required Bundle ($bundleId) Not Downloaded to SDDC Manager"
}
```

For the configuration drift part we can execute the same process again.

Once complete that's it we have successfully upgraded SDDC Manager programmatically.

- - -

### Other Posts in Series

* [Automating the Upgrade of VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/post/vcf/vcf-automated-upgrade)
* [Automating VCF Upgrade - Download Release Bundles](/post/vcf/vcf-automated-upgrade-01)
* [Automating VCF Upgrade - Perform Health Checks](/post/vcf/vcf-automated-upgrade-02)
* [Automating VCF Upgrade - SDDC Manager](/post/vcf/vcf-automated-upgrade-03)
* Automating VCF Upgrade - Management Domain (***Coming Soon!***)
* Automating VCF Upgrade - VI Workload Domain (***Coming Soon!***)

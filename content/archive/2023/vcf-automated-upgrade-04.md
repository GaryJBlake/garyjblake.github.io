+++
author = "GaryJBlake"
title = "Automating VCF Upgrade - Workload Domains"
date = "2023-10-18"
description = "Automating VCF Upgrade - Workload Domains"
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

This is the final part of my blog series in which I talk about automating the VMware Cloud Foundation upgrade process. At this point you should have completed the following tasks:

* Downloaded All Bundles
* Initial Health Check
* SDDC Manager Upgrade
* SDDC Manager Configuration Drift Update

We are now ready to begin the process of upgrading the individual components within a Workload Domain, for this we must first start with the Management Domain before we can carry out any component upgrades of a VI Workload Domain. The actual process is performed in the following way:

* **Step 1 - Management Domain**
  * Step 1a - NSX
  * Step 1b - vCenter Server
  * Step 1c - ESXi
* **Step 2 - VI Workload Domain**
  * Step 2a - NSX
  * Step 2b - vCenter Server
  * Step 2c - ESXi

**VMware Cloud Foundation APIs Used**

* GET /v1/upgradables/domains/
* GET /v1/domains/
* GET /v1/bundles
* GET /v1/upgrades/

**PowerVCF Cmdlets**

* Get-VCFWorkloadDomain
* Get-VCFBundle
* Get-VCFUpgrade

# Management Domain
## Upgrade NSX

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` powershell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$vcfRelease = "4.5.2.0"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` powershell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Perform a Health Check of the Management Domain

``` powershell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.type -eq "MANAGEMENT"}).id
$jsonSpec = '{ "resources" : [ { "resourceId" : "'+ $workloadDomain +'", "type" : "DOMAIN" } ] }'
$task = Start-VCFSystemPrecheck -json $jsonSpec
Do { $status = Get-VCFSystemPrecheckTask -id $task.id } While ($status.status -eq "IN_PROGRESS")
$status.subtasks | Select-Object name, status
```

In this step we use the **Get-VCFWorkloadDomain** cmdlet to get the Management Domain Id and then using **Start-VCFSystemPrecheck** we trigger an upgrade pre-check.

5. Perform NSX upgrade of the Management Domain by running the following command:

``` powershell
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements) | Where-Object {$_.status -eq "AVAILABLE" }
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).components.type -eq "NSX_T_MANAGER") {
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

Here we us the Management Domain ID with `/v1/upgradables/domains/` API to get the details of next available bundle for upgrade (This API is not currently in PowerVCF). We perform a few checks before starting the upgrade which include:

* Check that the upgrade bundle has been physically downloaded to SDDC Manager
* Check that the upgrade bundle has a type of `NSX_T_MANAGER`

If both of these conditions are true we proceed using the **Start-VCFUpgrade** cmdlet to trigger the upgrade, capturing the API response in **$task** which we then use with the **Get-VCFUpgrade** cmdlet to perform a Do { } While { } loop on the upgrade task Id until the status is no longer in a Scheduled, Pending or In Progress state.

Once complete that's it we have successfully upgraded all NSX components within the Management Domain programmatically.

## Upgrade vCenter Server

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` powershell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$vcfRelease = "4.5.2.0"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` powershell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Perform a Health Check of the Management Domain

``` powershell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.type -eq "MANAGEMENT"}).id
$jsonSpec = '{ "resources" : [ { "resourceId" : "'+ $workloadDomain +'", "type" : "DOMAIN" } ] }'
$task = Start-VCFSystemPrecheck -json $jsonSpec
Do { $status = Get-VCFSystemPrecheckTask -id $task.id } While ($status.status -eq "IN_PROGRESS")
$status.subtasks | Select-Object name, status
```

5. Perform vCenter Server upgrade of the Management Domain by running the following command:

``` powershell
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements) | Where-Object {$_.status -eq "AVAILABLE" }
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).components.type -eq "VCENTER") {
    $jsonSpec = '{
        "bundleId": "'+ $bundle.bundleId +'",
        "resourceType": "DOMAIN",
        "resourceUpgradeSpecs": [ {
            "resourceId": "'+ $workloadDomain +'",
            "upgradeNow": true
        } ]}'
    $task = Start-VCFUpgrade -json $jsonSpec
    Write-Output " Waiting for Upgrade Task ($($task.name)) with Id ($($task.id)) to Complete"    
    Do { Start-Sleep 660; Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass | Out-Null; $status = Get-VCFUpgrade -id $task.id } While ($status.status -in "PENDING","SCHEDULED","INPROGRESS")
    Write-Output " Upgrade Task with Id ($($task.id)) completed with status ($($status.status))"
} else {
    Write-Warning " Upgrade Not Possible as Required Bundle ($bundleId) Not Downloaded to SDDC Manager"
}
```

Once complete that's it we have successfully upgraded vCenter Server for the Management Domain.

## Upgrade ESXi Hosts

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` powershell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$vcfRelease = "4.5.2.0"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` powershell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Perform a Health Check of the Management Domain

``` powershell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.type -eq "MANAGEMENT"}).id
$jsonSpec = '{ "resources" : [ { "resourceId" : "'+ $workloadDomain +'", "type" : "DOMAIN" } ] }'
$task = Start-VCFSystemPrecheck -json $jsonSpec
Do { $status = Get-VCFSystemPrecheckTask -id $task.id } While ($status.status -eq "IN_PROGRESS")
$status.subtasks | Select-Object name, status
```

5. Perform ESXi Host upgrade of the Management Domain by running the following command:

``` powershell
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements) | Where-Object {$_.status -eq "AVAILABLE" }
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).components.type -eq "HOST") {
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

Once complete that's it we have successfully upgraded the ESXi Hosts for the default cluster of the Management Domain.

# VI Workload Domain

To automate the upgrade of the VI Workload Domain we simply follow the same process.

## Upgrade NSX

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$sddcDomainName = "lax-w01"
$vcfRelease = "4.5.2.0"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` powershell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Perform a Health Check of the VI Workload Domain

``` powershell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.name -eq $sddcDomainName}).id
$jsonSpec = '{ "resources" : [ { "resourceId" : "'+ $workloadDomain +'", "type" : "DOMAIN" } ] }'
$task = Start-VCFSystemPrecheck -json $jsonSpec
Do { $status = Get-VCFSystemPrecheckTask -id $task.id } While ($status.status -eq "IN_PROGRESS")
$status.subtasks | Select-Object name, status
```

In this step we use the **Get-VCFWorkloadDomain** cmdlet to get the Management Domain Id and then using **Start-VCFSystemPrecheck** we trigger an upgrade pre-check.

5. Perform NSX upgrade of the VI Workload Domain by running the following command:

``` powershell
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements) | Where-Object {$_.status -eq "AVAILABLE" }
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).components.type -eq "NSX_T_MANAGER") {
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

## Upgrade vCenter Server

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$sddcDomainName = "lax-w01"
$vcfRelease = "4.5.2.0"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` PowerShell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Perform a Health Check of the VI Workload Domain

``` PowerShell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.name -eq $sddcDomainName}).id
$jsonSpec = '{ "resources" : [ { "resourceId" : "'+ $workloadDomain +'", "type" : "DOMAIN" } ] }'
$task = Start-VCFSystemPrecheck -json $jsonSpec
Do { $status = Get-VCFSystemPrecheckTask -id $task.id } While ($status.status -eq "IN_PROGRESS")
$status.subtasks | Select-Object name, status
```

5. Perform vCenter Server upgrade of the VI Workload Domain by running the following command:

``` PowerShell
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements) | Where-Object {$_.status -eq "AVAILABLE" }
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).components.type -eq "VCENTER") {
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

## Upgrade ESXi Hosts

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$sddcDomainName = "lax-w01"
$vcfRelease = "4.5.2.0"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` PowerShell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Perform a Health Check of the VI Workload Domain

``` PowerShell
$workloadDomain = (Get-VCFWorkloadDomain | Where-Object {$_.name -eq $sddcDomainName}).id
$jsonSpec = '{ "resources" : [ { "resourceId" : "'+ $workloadDomain +'", "type" : "DOMAIN" } ] }'
$task = Start-VCFSystemPrecheck -json $jsonSpec
Do { $status = Get-VCFSystemPrecheckTask -id $task.id } While ($status.status -eq "IN_PROGRESS")
$status.subtasks | Select-Object name, status
```

5. Perform ESXi Host upgrade of the VI Workload Domain by running the following command:

``` PowerShell
$uri = "https://$sddcManager/v1/upgradables/domains/$workloadDomain/?targetVersion=$vcfRelease"
$bundle = ((Invoke-RestMethod -Method GET -URI $uri -ContentType application/json -headers $headers).elements) | Where-Object {$_.status -eq "AVAILABLE" }
if ((Get-VCFBundle -id $bundle.bundleId).downloadStatus -eq "SUCCESSFUL" -and (Get-VCFBundle -id $bundle.bundleId).components.type -eq "HOST") {
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

# Conclusion

Using the above steps I've shown how its possible to automation the upgrade process of the underlying components that make up a Workload Domain.

I hope this blog series has been useful to help illustrate the potential in automating the end-to-end process of a VMware Cloud Foundation environment, if you have comments or feedback let me know.

- - -

### Other Posts in Series

* [Automating the Upgrade of VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/post/vcf/vcf-automated-upgrade)
* [Automating VCF Upgrade - Download Release Bundles](/post/vcf/vcf-automated-upgrade-01)
* [Automating VCF Upgrade - Perform Upgrade Pre-check](/post/vcf/vcf-automated-upgrade-02)
* [Automating VCF Upgrade - SDDC Manager](/post/vcf/vcf-automated-upgrade-03)
* [Automating VCF Upgrade - Workload Domains](/post/vcf/vcf-automated-upgrade-04)

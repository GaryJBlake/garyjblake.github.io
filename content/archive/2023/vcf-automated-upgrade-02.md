+++
author = "GaryJBlake"
title = "Automating VCF Upgrade - Perform Health Checks"
date = "2023-09-05"
description = "Automating VCF Upgrade - Perform Health Checks"
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

This is part two of a four part blog series in which I talk about automating the VMware Cloud Foundation upgrade process. In part one we discussed downloading the bundles to SDDC Manager to prepare the system for the upgrade process, in this post we discuss performing the upgrade pre-checks.

Ensuring your VMware Cloud Foundation instance is healthy prior to starting an upgrade is critical to a successful upgrade, SDDC Manager itself has a pre-check process which is executed on a per workload domain basis. Depending on the version of VMware Cloud Foundation your upgrading from this pre-check has seen some significant improvements over time. In addition to executing the specific workload domain pre-check at the SDDC Manager level our team released a PowerShell Module last year called `VMware.CloudFoundation.Reporting` which can be utilized in conjunction with the internal pre-check to perform additional health checks prior to starting an upgrade step.

My recommendation would be to carry out the following steps before commencing with the any upgrade:

* Step 1 - Run a Health Report using `Invoke-VcfHealthReport`
* Step 2 - Run an Alert Report using `Invoke-VcfAlertReport`
* Step 3 - Run an initial SDDC Manager System Pre-Check for each Workload Domain

For detailed instructions on installed and using `VMware.CloudFoundation.Reporting` refer to the [GitHub Documentation](https://vmware.github.io/powershell-module-for-vmware-cloud-foundation-reporting/).

**VMware Cloud Foundation APIs Used**

* GET /v1/system/prechecks/tasks/{id}
* POST /v1/system/prechecks

**PowerVCF Cmdlets**

* Start-VCFSystemPrecheck
* Get-VCFSystemPrecheckTask

**PowerShell Scripts**

* [startSystemPrecheck.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/startSystemPrecheck.ps1)

## Run a Health Report using `Invoke-VcfHealthReport`

**Procedure**

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$sddcManagerLocalUser = "vcf"  
$sddcManagerLocalPass = "VMw@re1!"
$reportPath = "F:\Reporting\LAX"
```

3. Run a Health Report by running the following command:

``` PowerShell
Invoke-VcfHealthReport -sddcManagerFqdn $sddcManagerFqdn -sddcManagerUser $sddcManagerUser -sddcManagerPass $sddcManagerPass -sddcManagerLocalUser $sddcManagerLocalUser -sddcManagerLocalPass $sddcManagerLocalPass -reportPath $reportPath -allDomains -failureOnly
```

4. Review the Health Report and investigate any issues identified.

## Run an Alert Report using `Invoke-VcfAlertReport`

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$reportPath = "F:\Reporting\LAX"
```

3. Run a Health Report by running the following command:

``` PowerShell
Invoke-VcfAlertReport -sddcManagerFqdn $sddcManagerFqdn -sddcManagerUser $sddcManagerUser -sddcManagerPass $sddcManagerPass -reportPath $reportPath -allDomains -failureOnly
```

4. Review the Alert Report and investigate any issues identified.

## Run an initial SDDC Manager System Pre-Check for each Workload Domain

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$workloadDomain = "lax-m01"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` PowerShell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Generate the JSON spec for a pre-check and trigger it by running the following command:

``` PowerShell
$jsonSpec = '{ "resources" : [ { "resourceId" : "'+ (Get-VCFWorkloadDomain | Where-Object {$_.name -eq $workloadDomain}).id+'", "type" : "DOMAIN" } ] }'
$task = Start-VCFSystemPrecheck -json $jsonSpec
```

In this step we use the **Start-VCFSystemPrecheck** cmdlet to start the workload domain pre-check workflow and we capture the task ID in task variable.

5. Generate the JSON spec for a pre-check and trigger it by running the following command:

``` PowerShell
Do { $status = Get-VCFSystemPrecheckTask -id $task.id } While ($status.status -eq "IN_PROGRESS")
$status.subtasks | Select-Object name, status
```

In this step we use the **Get-VCFSystemPrecheckTask** cmdlet to check on the status of the workflow and when complete display the summary of the tasks.

6. Repeat these steps for each additional Workload Domain.

That completes the process of executing a system pre-check for a Workload Domain. You can download my `startSystemPrecheck.ps1` script from [GitHub](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/startSystemPrecheck.ps1) to simply execute:

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$workloadDomain = "lax-m01"

.\startSystemPrecheck.ps1 -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -workloadDomain $workloadDomain
```

- - -

### Other Posts in Series

* [Automating the Upgrade of VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/post/vcf/vcf-automated-upgrade)
* [Automating VCF Upgrade - Download Release Bundles](/post/vcf/vcf-automated-upgrade-01)
* [Automating VCF Upgrade - Perform Upgrade Pre-check](/post/vcf/vcf-automated-upgrade-02)
* [Automating VCF Upgrade - SDDC Manager](/post/vcf/vcf-automated-upgrade-03)
* [Automating VCF Upgrade - Workload Domains](/post/vcf/vcf-automated-upgrade-04)

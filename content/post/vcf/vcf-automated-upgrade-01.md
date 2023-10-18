+++
author = "GaryJBlake"
title = "Automating VCF Upgrade - Download Release Bundles"
date = "2023-08-24"
description = "Automating VCF Upgrade - Download Release Bundles"
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

In order to upgrade VMware Cloud Foundation you must first download the upgrade bundles, I recently wrote a blog [Automating the Download of VCF Bundles for a Release](/post/vcf/vcf-bundle-download) on this topic which I shared a script ***vcfBundleDownload.ps1*** which can be downloaded from [GitHub](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/requestBundleDownloadList-4410.json) which we will utilize as part of the procedure here. The script takes a JSON as input where we define the bundle IDs for download but as part of this post I will share a way to automate that part too.

* Part 1 - Generate the bundle download JSON with Bundle IDs
* Part 2 - Download the bundles

**VMware Cloud Foundation APIs Used**

* GET /v1/bundles
* POST /v1/bundles
* GET /v1/tasks/{id}
* GET /v1/releases

**PowerVCF Cmdlets**

* Get-VCFBundle
* Request-VCFBundle
* Get-VCFTask
* Get-VCFRelease

**PowerShell Scripts**

* [generateBundleJson.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/generateBundleJson.ps1)
* [requestBundleDownload.ps1](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/requestBundleDownload.ps1)

## Generate the Bundle Download JSON with Bundle IDs

**Procedure**

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$vcfRelease = "4.5.1.0"
$jsonFile = "vcf4510Bundles.json"
```

3. Authenticate to the SDDC Manager appliance by running the following command:

``` PowerShell
Request-VCFToken -fqdn $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass
```

4. Obtain details from SDDC Manager about the release by running the following command:

``` PowerShell
$releases = Get-VCFRelease | Where-Object {$_.version -eq $vcfRelease}
```

In this step we use the **Get-VCFRelease** cmdlet to capture the details relating to the release version. We will use this in the next step work out what components are part of the Bill of Materials (BoM).

5. Collect the details relating to the BoM by running the following command:

``` PowerShell
$bundles = @()
foreach ($bom in $releases.bom) {
    $bundles += Get-VCFBundle | Where-Object {$_.components.description -match "Update" -and $_.components.toVersion -eq $bom.version}
}
```

In this procedure we are using the **Get-VCFBundle** cmdlet to request bundle details based on the release.

6. Construct the JSON specification file including the bundle ID and product details by running the following command:

``` PowerShell
$bundleList = @()
foreach ($bundle in $bundles) {
    $bundleId = New-Object -TypeName psobject
    $bundleId | Add-Member -notepropertyname 'bundleId' -notepropertyvalue $bundle.id
    $bundleId | Add-Member -notepropertyname 'product' -notepropertyvalue $bundle.components.type
    $bundleList += $bundleId
}
$json = New-Object -TypeName psobject
$json | Add-Member -notepropertyname 'bundles' -notepropertyvalue $bundleList
```

8. Convert the data to JSON format and output it to a file by running the following command:

``` PowerShell
$json | ConvertTo-Json | Out-File $outJson
```

That completes the process of generating the JSON spec used by the public API for downloading bundles, we are now ready to start the bundle download process.
Download the `generateBundleJson.ps1` script from [GitHub](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/generateBundleJson.ps1).

## Download the bundles

**Procedure**

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` PowerShell
$sddcManagerFqdn = "lax-vcf01.lax.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"
$jsonFile = "vcf4510Bundles.json"
```

3. Download the bundles by running the following command:

``` PowerShell
requestBundleDownload.ps1 -server $sddcManagerFqdn -user $sddcManagerUser -pass $sddcManagerPass -json $jsonFile
```

- - -

### Other Posts in Series

* [Automating the Upgrade of VMware Cloud Foundation with APIs/PowerVCF/PowerShell](/post/vcf/vcf-automated-upgrade)
* [Automating VCF Upgrade - Download Release Bundles](/post/vcf/vcf-automated-upgrade-01)
* [Automating VCF Upgrade - Perform Upgrade Pre-check](/post/vcf/vcf-automated-upgrade-02)
* [Automating VCF Upgrade - SDDC Manager](/post/vcf/vcf-automated-upgrade-03)
* [Automating VCF Upgrade - Workload Domains](/post/vcf/vcf-automated-upgrade-04)

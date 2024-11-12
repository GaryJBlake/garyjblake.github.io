+++
author = "GaryJBlake"
title = "Generating Health Reports for VMware Cloud Foundation"
date = "2022-12-22"
description = "Generating Health Reports for VMware Cloud Foundation"
tags = [
    "VCF",
    "PowerShell"
]
categories = [
    "VMware Cloud Foundation"
]
series = [

]
+++

VMware Cloud Foundation is an advanced hybrid cloud platform that provides a complete set of software-defined services for compute, storage, networking, security and cloud management to run enterprise apps.

By definition this means that VMware Cloud Foundation consists of a number products from across the VMware portfolio but how do you know your platform is healthy? The obvious answer is to include products such as vRealize Operations or vRealize Log Insight but what if there was a simpler way to gain some insights into the health without the need to implement and manage additional components?

Well now there is and its called [PowerShell Module for VMware Cloud Foundation Reporting](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting)!

Myself and number of colleagues earlier this year were working with one of our largest customers and were asked to investigate if there was anything we could do to help accelerate through automation the ability to perform a health check across a VMware Cloud Foundation instance, working with our Professional Services Organization they had already developed an extensive run book with manual procedures but the end-to-end process was very time consuming. As a team we had been working on the automation of VMware Validated Solutions for the last twelve months using PowerShell and it was immediately obvious that some of the work could be reused so we set about building a dedicated PowerShell module for reporting purposes.

### Introducing PowerShell Module for VMware Cloud Foundation Reporting

The [PowerShell Module for VMware Cloud Foundation Reporting](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting) is a VMware Open-source project located on Github, the PowerShell module is published to the Microsoft PS Gallery as [`VMware.CloudFoundation.Reporting`](https://www.powershellgallery.com/packages/VMware.CloudFoundation.Reporting) and earlier this week we released version [`v1.0.5`](https://www.powershellgallery.com/packages/VMware.CloudFoundation.Reporting) which adds some improvements and addresses some issues identified.

The module was initially developed to produce a Health Report, but after we had developed the framework for producing a clarity based HTML we decided that adding some additional report types further increased the value of our work. Here's what we provide:

#### 1. Overview Report

This report contains high-level information about the VMware Cloud Foundation instance and can provide a quick overview of the system to your VMware representative.
![](/archive/2022/vcf-reporting-overview.png)

#### 2. Health Report

This report combines the SoS Utility health checks with additional health checks not presently available in the SoS Utility for previous VMware Cloud Foundation releases. The report contains detailed information about the health of the VMware Cloud Foundation instance and its components.
![](/archive/2022/vcf-reporting-health.png)

#### 3. Alert Report

This report collects information about the system alerts that are currently active in the VMware Cloud Foundation instance for the platform components. This report reduces the need to login to multiple product interfaces to collect information about the system alerts.
![](/archive/2022/vcf-reporting-alert.png)

#### 4. Password Policy Report

This report collects information about the password policy settings in a VMware Cloud Foundation instance for the platform components.
![](/archive/2022/vcf-reporting-password.png)

#### 5. Configuration Report

This report collects information about the configuration settings in a VMware Cloud Foundation instance for the platform components.
![](/archive/2022/vcf-reporting-configuration.png)

#### 6. Upgrade Pre-Check Report

This report initiates an upgrade precheck of a workload domain using the REST API and presents the results in an HTML report. This allows you to start the precheck from the PowerShell console.
![](/archive/2022/vcf-reporting-precheck.png)

For further details on how to use [**VMware.CloudFoundation.Reporting**](https://www.powershellgallery.com/packages/VMware.CloudFoundation.Reporting) refer to the `README.md` within the installation folder on your system after you have installed using `Install-Module -Name VMware.CloudFoundation.Reporting` or review it directly on the [GitHub](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-reporting/blob/main/README.md) repository.

If you have suggestions or find any issues then please report them on the GitHub repository.

+++
author = "GaryJBlake"
title = "VMware Cloud Builder - Bringup Validation for VMware Cloud Foundation"
date = "2021-02-26"
description = "VMware Cloud Builder - Bringup Validation for VMware Cloud Foundation"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "VMware Cloud Builder"
]
series = [

]
+++

### Background 

For those of you who are not familiar with VMware Cloud Builder its a virtual appliance that is shipped as part of VMware Cloud Foundation. It's primary goal is to bootstrap the deployment and configuration of the Management Domain which includes ESXi, vCenter Server, NSX-T Data Center and SDDC Manager.

VMware Cloud Builder was first released to support the automated deployment of the VMware Validated Design 5.0 and as part of that development work the team started with a virtual appliance known as Cloud VM which was used by Service Providers to deploy a different version of VMware Cloud Foundation back in the 2.x days. There were two challenges that the team had to overcome with the Cloud VM and they were no User Interface for easy use as it was an API only driven tool and more importantly there was no validation capabilities.

As part of this validation development work I had the pleasure of leading a very small team which produced a Python based utility called PlatformAudit. It's purpose was to expose the ability to perform any validation requirements we could define in a modular way. When VMware Cloud Foundation 3.0 was released it too started to consume the VMware Cloud Builder virtual appliance and naturally we extended the capabilities of PlatformAudit to handle both VMware Cloud Foundation and VMware Cloud Foundation on VxRail.

As VMware Cloud Foundation has evolved in terms of features naturally the validation requirements evolved too but rather than add new validation tasks into the Python modules we took a decision some time ago to build any new validation directly into the Bring-up service. This decision was made for a number of reasons but the main driver was the ability to consolidate the tasks into a single framework and code-base that could then be consumed by both VMware Cloud Builder during bring-up but more importantly by SDDC Manager for day N workflows.

As you can imagine these types of changes don't happen over night so the team had to combine both methods for a period of time whilst they worked on the migration of all the existing Python based validation tasks. Frankly the team did a fantastic job of this, those reading this post that are already familiar with VMware Cloud Builder were probably not even aware this ongoing transition was happening.

The release of VMware Cloud Foundation v4.2 sees this transitional work conclude, and not only do we now have all validation tasks being completed by the Bring-up service directly we also now have the ability to trigger validations on an individual basis (via the API only) something which was a number one requirement for the Python modules when I started on the journey with the team back then. The ability to execute single modules helps with early validation of some areas and accelerates troubleshooting on specific failures as running all validations steps each time takes some time.

PlatformAudit is still present within VMware Cloud Builder for now but officially it has been deprecated, none of the new validation tasks exist within it and it will be removed in a future release.

### Triggering Individual Validations

Let's now take a look at how you trigger individual validations, as mentioned already this is possible only by using the API right now and this can be achieved either directly from the console of VMware Cloud Builder using a curl command or by using PowerVCF a PowerShell Module that has been written to support all VMware Cloud Foundation Public APIs.

For both methods **<PATH_TO_JSON_SPEC>** is the path to the VMware Cloud Builder JSON spec to be used and **<VALIDATION_NAME>** is the name of the validation module you want to execute.

Using CURL the format of the command is:
``` powershell
curl -d @<PATH_TO_JSON_SPEC> -X POST -H "Content-Type":"application/json" http://localhost:9080/bringup-app/v1/sddcs/validations?<VALIDATION_NAME>
```

Using PowerVCF (v2.1.1 or later) the format of the command is:<
``` powershell
Start-CloudBuilderSDDCValidation -json <PATH_TO_JSON_SPEC> -validation <VALIDATION_NAME>
```

### Validation Modules

We now have two methods that we can use to perform individual validations but what validation options do we have, use the following table to identity the validation module you want to execute (I'm planning a separate post with more details on what each validation module actually does in the near future):

| Validation Name for API                      | Validation Name in the UI                                      |
|--------------------------------------------- | -------------------------------------------------------------- |
| SECURE_PLATFORM_AUDIT                        | Preparing Security Requirements for Running Validation         |
| JSON_SPEC_VALIDATION                         | JSON Spec validation                                           |
| CLOUDBUILDER_READY_VALIDATION                | Cloud Builder Configuration Validation                         |
| LICENSE_KEY_VALIDATION                       | License Key Validation                                         | 
| PASSWORDS_VALIDATION                         | Password Validation                                            |
| NETWORK_IP_POOLS_VALIDATION                  | Network IP Pool Validation                                     |
| HOST_IP_DNS_VALIDATION                       | DNS Resolution Validation                                      |
| TIME_SYNC_VALIDATION                         | Time Synchronization Validation                                |
| NETWORK_CONFIG_VALIDATION                    | Network Configuration Validation                               |
| MANAGEMENT_NETWORKS_VALIDATION               | vMotion Network Connectivity Validation<br>vSAN Network Connectivity Validation |
| ESXI_VERSION_VALIDATION                      | ESXi Version Validation                                        |
| ESXI_HOST_READINESS_VALIDATION               | ESXi Host Configuration Validation                             |
| VSAN_AVAILABILITY_VALIDATION                 | vSAN Disk Availability Validation                              |
| NSXT_NETWORKS_VALIDATION                     | NSX-T Data Center Host Overlay Network Connectivity Validation |
| AVN_NETWORKS_VALIDATION                      | NSX-T Data Center Edge Overlay Network Connectivity Validation<br>NSX-T Data Center Uplink 1 Network Connectivity Validation<br>NSX-T Data Center Uplink 2 Network Connectivity Validation<br>NSX-T Data Center Host Overlay to Edge Overlay Network Connectivity Validation |

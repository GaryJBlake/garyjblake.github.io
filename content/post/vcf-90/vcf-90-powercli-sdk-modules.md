+++
author = "GaryJBlake"
title = "VCF PowerCLI 9.0: Understanding PowerCLI SDK Cmdlets"
date = "2025-07-10"
description = "VCF PowerCLI 9.0: Understanding PowerCLI SDK Cmdlets"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI"
]
series = [

]
+++

Along with the release of VMware Cloud Foundation 9.0 a new version of PowerCLI has also been shipped, for a full rundown of what's new I would suggest reading the official blog [Introducing VCF PowerCLI 9.0](https://blogs.vmware.com/cloud-foundation/2025/06/24/introducing-vcf-powercli-9-0), but here are the quick highlights:

* Name Change to VCF PowerCLI
* Performance  Improvements
* New Module for NSX Virtual Private Cloud
* New Module for SDDC Manager
* Usability improvements with PowerCLI SDK
* Global Authorization APIs and PowerCLI bindings
* Bug fixes

For the purposes of this blog I want to focus on the PowerCLI SDK improvements.

As mentioned in the official blog PowerCLI manages to offer near-immediate support for the latest VMware Cloud Foundation features right after a new version is released through the use of auto-generated API bindings offered by the PowerCLI SDK which are built using OpenAPI specifications.

Unlike traditional cmdlets like `Get-` or `New-`, the auto-generated cmdlets do not follow the standard Verb-Noun syntax. Instead the cmdlets only have 2 verbs-.

`Initialize-` cmdlets that prepare the data structure for your API call. These cmdlets function on the client side and do not communicate with API server.

`Invoke-` cmdlets that execute the operation on the server side.

The downside of this approach is that it can not only make the cmdlet names very long it can also make it harder to work out which cmdlet is needed to perform a particular task. To help with this, the PowerCLI team have however also introduced some helper cmdlets.

| Name                        | PowerCLI SDK Module                                                             | Description                                                                       |
| --------------------------- | --------------------------------------------------------------------------------| --------------------------------------------------------------------------------- |
| Get-NsxOperation            | [VMware.Sdk.Nsx.Policy](/post/vcf-90/vcf-90-powercli-nsx-policy-cmdlets/)       | Retrieves the cmdlets that correspond to one or more NSX API endpoints            |
| Get-SrmOperation            | [VMware.Sdk.Srm](/post/vcf-90/vcf-90-powercli-srm-cmdlets/)                     | Retrieves the cmdlets that correspond to one or more SRM API endpoints            |
| Get-VcfInstallerOperation   | [VMware.Sdk.Vcf.Installer](/post/vcf-90/vcf-90-powercli-vcfinstaller-cmdlets/)  | Retrieves the cmdlets that correspond to one or more VCF Installer API endpoints  |
| Get-VcfOpsOperation         | [VMware.Sdk.Vcf.Ops](/post/vcf-90/vcf-90-powercli-operations-cmdlets/)          | Retrieves the cmdlets that correspond to one or more VCF Operations API endpoints |
| Get-VcfSddcManagerOperation | [VMware.Sdk.Vcf.SddcManager](/post/vcf-90/vcf-90-powercli-sddcm-cmdlets/)       | Retrieves the cmdlets that correspond to one or more SDDC Manager API endpoints   |
| Get-vSphereOperation        | [VMware.Sdk.vSphere](/post/vcf-90/vcf-90-powercli-vsphere-cmdlets/)             | Retrieves the cmdlets that correspond to one or more vSphere API endpoints        |

As a quick reference you can use the hyperlink for each PowerCLI SDK Module for more details.

+++
author = "GaryJBlake"
title = "Automating the Download of VCF Bundles for a Release"
date = "2022-06-14"
description = "Automating the Download of VCF Bundles for a Release"
tags = [
    "API",
    "VCF",
    "PowerShell"
]
categories = [
    "VMware Cloud Foundation",
    "PowerVCF"
]
series = [

]
+++

If you have been through the process of performing an upgrade of VMware Cloud Foundation you will know the process involves downloading a number of bundles. VMware Cloud Foundation includes the following types of bundles.

- **Install Bundles**, An install bundle includes software binaries to install VI workload domains and vRealize Suite Lifecycle Manager.
- **Update or Upgrade Bundle**, An update or upgrade bundle includes software binaries to update the appropriate VMware Cloud Foundation software components. In most cases, an upgrade bundle must be applied to the management domain before it can be applied to VI workload domains.
- **Async Patch Bundle**, An async patch bundle allows you to apply critical patches to certain VMware Cloud Foundation components (NSX-T Manager, vCenter Server, and ESXi) when an update or upgrade bundle is not available. See [Async Patch Tool](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/ap-tool/GUID-49818DF1-94EA-4C85-8CB6-6EFFCE5F8060.html).

This process can be a little overwhelming if you are new to VMware Cloud Foundation due to the nature in which the bundles are displayed under the **Bundle Management** section of the SDDC Manager UI. One of my biggest gripes here is there is no way to filter the bundles based on VMware Cloud Foundation version, product or even date. This coupled with the way they are actually displayed in the UI from a layout perspective, a table list would be easier to consume in my opinion.
![](/images/vcf-bundle-management.png)

When you start the process of walking through the upgrade process itself, the SDDC Manager UI is actually very good at leading you down the ***What's Next*** path as you can actually only upgrade components in a particular order and this is illustrated when you select **Available Updates** from within a Workload Domain.
![](/images/vcf-available-updates.png)

If you have not pre-downloaded all the required bundles you then waste time within your change window completing this task before you can continue and so are back to needing to traverse the overwhelming **Bundle Management** section of the SDDC Manager UI again.

Its for this reason that I decided to put together a very simple PowerShell script that utilizes PowerVCF to automate the process of downloading all of the bundles required for a particular release.

Using a JSON file, you first populate it with the bundle IDs of each bundle required. This can be done by reviewing the details of each bundle in the **Bundle Management** section of the SDDC Manager UI for the release you wish to prepare for. Here is a sample for VMware Cloud Foundation 4.4.1.0. You can also download it from [GitHub](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/requestBundleDownloadList-4410.json).

``` json
{
    "bundles": [
        {
            "bundleId": "13d87a53-298d-4ee5-98ca-b9e10eece7a5",
            "product": "SDDC_MANAGER"
        },
        {
            "bundleId": "8c178f33-b28d-47d0-88da-aa94f309a042",
            "product": "SDDC_MANAGER_CONFIG_DRIFT"
        },
        {
            "bundleId": "05be2afd-990d-45bd-9472-fab032e8c696",
            "product": "VCENTER_SERVER_UPGRADE"
        },
        {
            "bundleId": "043e2b99-b36f-45b9-a4a2-1632a24764ef",
            "product": "ESXI_UPGRADE"
        },
        {
            "bundleId": "193486eb-53f5-40c7-8012-b5dcab515ebf",
            "product": "NSXT_UPGRADE"
        },
        {
            "bundleId": "05be2afd-990d-45bd-9472-fab032e8c696",
            "product": "VCENTER_SERVER"
        },
        {
            "bundleId": "3c32c5d6-b5e0-49c6-9a86-90bcd3de671e",
            "product": "NSXT_INSTALL"
        }
    ]
}
```

Next we simply execute the ***vcfBundleDownload.ps1*** script passing in the JSON file. The script reads the JSON, then loops through each entry first checking if the bundle has  been downloaded and if not requests a download. It then monitors the download until complete before moving onto the next bundle item. You can execute the the script over and over in case a download fails and you need to re-run safe in the knowledge that it will only download missing bundles.

``` powershell
.\vcfBundleDownload.ps1 -json .\vcfBundleDownloadList.json
```

Download the script from [GitHub](https://github.com/GaryJBlake/my-cloudy-world-scripts/blob/main/PowerShell/vcf/scripts/requestBundleDownload.ps1).
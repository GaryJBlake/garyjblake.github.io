+++
author = "GaryJBlake"
title = "Updating a vSAN License in VMware Cloud Foundation"
date = "2022-06-28"
description = "Updating a vSAN License in VMware Cloud Foundation"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation"
]
series = [

]
+++

Ever been in the situation where your licenses assigned in VMware Cloud Foundation are due to expire, well whilst doing some work this week in the lab I noticed that some of mine were coming up for expiration, which got me wondering what the process was to remedy. If you have been in this situation, you probably like me started by checking out the [License Management](https://docs.vmware.com/en/VMware-Cloud-Foundation/4.4/vcf-admin/GUID-5DA368B0-68CF-44D1-846F-68E36A9136C7.html) section of the VMware Cloud Foundation Administration Guide and like me ended up being disappointed to find that it only covers the following topics:

* Adding a License Key
* Editing a License Key Description
* Removing a License Key

Next I did a quick google which also turned up little to no information, challenge accepted!!

In this post we will take a look at the steps involved, my focus and testing has been isolated to the vSAN License. Time permitting I plan to look at other areas such as NSX-T Data Center and Tanzu.

First thing to call out here is that unfortunately the process is not automated from an SDDC Manager perspective, the only thing that SDDC Manager does do is automatically updates the assignment in its inventory once the new licenses are added to both vCenter Server and SDDC Manager.

So lets take a look at the detailed steps, from a high-level the process is as follows:

* [Identify the Expiring vSAN License](#identify-the-expiring-vsan-license)
* [Adding a New vSAN License to SDDC Manager](#adding-a-new-vsan-license-to-sddc-manager)
* [Adding a New vSAN License to vCenter Server](#adding-a-new-vsan-license-to-vcenter-server)
* [Reassign the vSAN License in vCenter Server](#reassign-the-vsan-license-in-vcenter-server)
* [Remove the Expiring vSAN License from vCenter Server](#remove-the-expiring-vsan-license-from-vcenter-server)
* [Remove the Expiring vSAN License from SDDC Manager](#remove-the-expiring-vsan-license-from-sddc-manager)

### Identify the Expiring vSAN License

1. Login to SDDC Manager UI.
2. From the navigation, expand **Administration** and select **Licensing**.
3. Identity the license that is expiring and make a note of the license key, and the current used allocation.
![](/archive/2022/vcf-licensing-current.png)

### Adding a New vSAN License to SDDC Manager

1. Login into the SDDC Manager UI.
2. From the navigation, expand **Administration** and select **Licensing**.
3. Click the **+ License Key** button.
4. On the **Add License Key** dialog, using the **Product Name** dropdown select **VMware vSAN**.
5. In the **License Key** text box, enter the new license key.
6. In the **Description** text box, enter a description for the key.
7. Click **Add**.

### Adding a New vSAN License to vCenter Server

1. Login into the Management Domain vCenter Server.
2. From the **Home** menu, select **Administration**.
3. Under **Licensing**, select **Licenses**.
4. Select the **License** tab, click **Add**.
5. On the **Enter License Keys** dialog, enter the new license key and click **Next**.
6. On the **Edit license names** dialog, enter a license name and click **Next**.
7. On the **Ready to Complete** dialog, click **Finish**.

### Reassign the vSAN License in vCenter Server

1. Login into the Management Domain vCenter Server.
2. From the **Home** menu, select **Administration**.
3. Under **Licensing**, select **Licenses**.
4. Select the **Assets** tab, and click **vSAN Clusters**.
5. Select the cluster you want to reassign the license for and click **Assign License**.
6. On the **Assign License** dialog, select te new license key and click **OK**.

### Remove the Expiring vSAN License from vCenter Server

1. Login into the Management Domain vCenter Server.
2. From the **Home** menu, select **Administration**.
3. Under **Licensing**, select **Licenses**.
4. Select the **License** tab.
5. Select the expiring license and click **Remove**.

### Remove the Expiring vSAN License from SDDC Manager

1. Login into the SDDC Manager UI.
2. From the navigation, expand **Administration** and select **Licensing**.
3. Verify that the old license now has a used count of zero and the new licenses used count has gone up.

![](/archive/2022/vcf-licensing-new.png)

4. Click the ellipses next to the expired license and select **Remove**.
5. On the **Remove license key** dialog, click **Remove**.

That's it, you have now successfully replaced and cleaned up the the expiring vSAN license.
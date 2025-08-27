+++
author = "GaryJBlake"
title = "Adjusting ESX Certificate Key Size in VMware Cloud Foundation"
date = "2025-08-26"
description = "Adjusting ESX Certificate Key Size in VMware Cloud Foundation"
tags = [
    "VCF",
    "Certificates"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "ESX"
]
series = [

]
+++

If you have VMware Cloud Foundation 9.0 deployed and you have been using the Certificate Management capability of Fleet Management you may have noticed that with the exception of ESX you're able to use a certificate key size greater than 2048 for components such as VCF Operations, VCF Automation, SDDC Manager, vCenter and NSX Manager whereas ESX is limited to 2048.

This was recently raised by one of my colleagues in the field, where their customer had a minimum requirement of 3072. Whilst this is a current limitation in VMware Cloud Foundation 9.0 and the User Interface of VCF Operations, there are enhancements planned for a future release but there is a way to adjust the key size to either 3072 or 4096 and use this new value as part of the CSR creation process.

### Configuring a Larger Key Size for ESX Certificate Replacement

1. Log in to the vCenter at *https://<_vcenter_server_fqdn>/ui* with a user assigned the Administrator role.

2. In the **Hosts and clusters** inventory, expand the vCenter tree and expand the data center.

3. Select the ESX host, and click the **Configure** tab.

4. In the left pane, select **System > Advanced System Settings**.

5. On the **Advanced System Settings** page, click **Edit**.

6. In the **Edit Advanced System Settings** dialog, click the filter icon in the **Key** column.

7. Enter **Config.HostAgent.ssl.minPrivateKeyLength**, modify the Value from RSA-2048 to either RSA-3072 or RSA 4096 and click **OK**.

### Replacing a Certificate of an ESX Hosts

1. Log in to the VCF Operations interface at *https://<aria_operations_fqdn>* with a user assigned the Administrator role.

2. In the navigation pane, select **Fleet Management > Certificates**.

3. On the **Certificate** navigation pane, expand **VCF Instances** and select your VCF Instance.

4. On the VCF Instance page, in the above the main widget click the **Show ESX Hosts** toggle.

5. Select the radio button next to the ESX host.

6. Click the ellipses (three dots) and select **Generate CSR**.

7. On the **Generate CSR** dialog, complete the inputs. You will only see a single Key Size of 2048, ignore this value as it will use the value defined in the earlier step. Click **Save**.

8. Wait for the CSR generation process to complete.

9. Click the ellipses (three dots) and select **Replace With Configured CA Certificate**.

10. On the **Replace With Configured CA Certificate** dialog, click **Replace**.

11. Wait for the certificate replacement process to complete.

12. Verify the ESX hosts new certificate by looking at the **Subject's Public Key** value which should show the value defined in the first step.

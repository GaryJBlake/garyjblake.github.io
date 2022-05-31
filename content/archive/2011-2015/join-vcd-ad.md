 +++
author = "GaryJBlake"
title = "Joining a VM to a Domain with vCloud Director"
date = "2012-06-12"
description = "Joining a VM to a Domain with vCloud Director"
tags = [
    "vCloud Director"
]
categories = [
    
]
series = [

]
+++

**Question.** According to this KB http://kb.vmware.com/kb/1026326, Windows VMs in vCloud Director need to be configured with DHCP to be able to join a Microsoft Active Directory domain. I have a VM with a static IP address. How do I get around this requirement?

**Answer.** The issue around DHCP is Microsoft-related and not VMware. The problem is that we rely on Sysprep to perform the customization and this is where the DHCP requirement comes in. As a workaround, we ran a script called *SetupCommand.cmd* which calls the *netdom.exe* command with the following syntax:

```shell
netdom.exe join %COMPUTERNAME% /Domain:vmware.com /OU:OU=vApp-VMs,DC=vmware,DC=com /Userd:???? /PasswordD:???? /Reboot
```

###### To configure this: 

1. Before submitting the vApp to the catalog.
2. Right click the VM and select **Properties**.
![](/archive/2011-2015/vcd-vapp-property.png)
3. Select the **Guest OS Customization** tab.
![](/archive/2011-2015/vcd-vapp-guest.png)
4. Scroll down to the **Customization Script** sections and enter the command.
![](/archive/2011-2015/vcd-vapp-script.png)
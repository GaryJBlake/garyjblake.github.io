+++
author = "GaryJBlake"
title = "Quick Fix - VMware Client Integration Plugin Stops Working (vSphere 6 U1)"
date = "2015-09-18"
description = "Quick Fix - VMware Client Integration Plugin Stops Working (vSphere 6 U1)"
tags = [
    "Plugin"
]
categories = [
    "vCenter Server"
]
series = [

]
+++

I recently had some issues trying to install the vCenter Server Appliance (VCSA) using the latest Update 1 release of vSphere.

The first problem I had was that even though I had the VMware Client Integration Plugin installed, on launching the install wizard it would not get detected. I had seen this issue in the past and started to do some research but was not able to find anything at the time to help fix it, but was able to overcome it by switching from Firefox to IE on that occasion, but this time I decided to have a dig around again and was pleasantly surprised to find a new KB2125623 article released on the 10-Sep-2015 with the fix.

With my second problem the issue itself did not appear when first launching the install wizard but rather after supplying the details for the target ESXi host in the Connect to target server dialog I got a yellow error banner across the top with no message.
![](/archive/2015/vcenter-ui-error.png)

On this occasion I reached out to William Lam as I knew he had been doing some testing himself and he made me aware of an issue he had found where VMware Client Integration Plugin stopped functioning after update 45 of Chrome see his post http://www.virtuallyghetto.com/2015/09/quick-tip-fix-for-cip-no-longer-functioning-in-vsphere-web-client-after-chrome-45-update.htm. It turned out that the issue had been already identified and an updated version of the VMware Client Integration Plugin was needed to address it, whilst his post includes the links I thought I would add here also.

- [Client Integration Plugin for Windows](http://vsphereclient.vmware.com/vsphereclient/2/9/9/4/0/4/1/VMware-ClientIntegrationPlugin-6.0.0.exe)
- [Client Integration Plugin for Mac OS X](http://vsphereclient.vmware.com/vsphereclient/2/9/9/4/0/4/1/VMware-ClientIntegrationPlugin-6.0.0.mac64.dmg)
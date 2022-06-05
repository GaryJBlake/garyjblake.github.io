+++
author = "GaryJBlake"
title = "vRealize Automation Infrastructure Tab Appears with Incorrect Name"
date = "2016-01-11"
description = "vRealize Automation Infrastructure Tab Appears with Incorrect Name"
tags = [
    "vRA"
]
categories = [
    "vRealize Automation"
]
series = [

]
+++

Its been some months since I've had the opportunity to spend much time with vRealize Automation and so I was not aware of this apparent known issue but I thought I would post this blog anyway because I've seen some small differences with some of the blogs out there.

Following the successful installation of vRealize Automation in a distributed configuration, when logging into the portal the Infrastructure tab displays the incorrect name as follows:
![](/archive/2016/vra-name-issue.png)

The workaround is to reboot the vRealize Automation Appliances. In some cases this may require a couple of reboots. My recommendation is to reboot one at a time waiting for the first appliance to come back up before rebooting the second appliance.
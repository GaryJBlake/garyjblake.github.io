+++
author = "GaryJBlake"
title = "vCloud Automation Center 5.x – Resource Intensive Limits"
date = "2013-11-21"
description = "vCloud Automation Center 5.x – Resource Intensive Limits "
tags = [
    "vCAC"
]
categories = [
    "vCloud Automation Center"
]
series = [

]
+++

 To help manage your vCAC implementation and the resources on which it depends, vCAC by default places limits on the number of concurrent instances of two particularly resource-intensive operations, machine provisioning and data collection. During a recent vCloud Suite implementation this particular default behavior caught my colleagues and I out as throughput when testing was very slow. On further investigation we established that the default value was two (2).
For our implementation, we were looking to ensure the largest amount of throughput we could possible achieve without unnecessary impact to the platform. We have successfully tested setting this limit to eight (8) which allows eight machines to be provisioned at once. In order to amend this value here’s what you need to do:
1. Log into your vCAC Server where the vCAC Manager Service (vCloud Automation Center) is running
2. Locate the file ‘MachineService.exe.config’ file which can be located in the following directory ‘%SystemDrive%\Program Files x86\DynamicOps\DCAC Server’
3. Locate the following value ‘MaxOutstandingResourceIntensiveWorkItems’ and amend the value to the desired requirement
4. Save the file
5. Restart the ‘vCloud Automation Center’ service

Remember if you’re running a High Availability implementation to amend the setting on the ‘Stand-by’ system.
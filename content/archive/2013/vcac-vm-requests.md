+++
author = "GaryJBlake"
title = "Limiting VMs per request within the vCAC 5.2 Self-Service Portal"
date = "2013-12-10"
description = "Limiting VMs per request within the vCAC 5.2 Self-Service Portal"
tags = [
    "vCAC"
]
categories = [
    "vCloud Automation Center"
]
series = [

]
+++

Ever wanted to limit the number of VMs being requested via the Self Service portal per request.  I had a customer who wanted to do this recently, their use case was to prevent user input mistakes when requesting services. The default value in vCloud Automation Center (vCAC) 5.x is 999.

Just to be clear this is not limiting the number of VMs a user can request based on a blueprint as a total or setting the number of VMs on a reservation.

---
**NOTE**

This procedure needs to be performed on all Web Servers if you have multiple deployed.

---

1. Browse to the folder D:\Program Files (x86)\VMware\vCAC\Self-Service Portal\Views\Shared
2. Make a copy of the ‘SpinEditRow.cshtml’ file and call it ‘SpinEditRow - vCAC 5.2 Original’
3. Edit the ‘SpinEditRow.cshtml’ file and amend the following line located on line 7:

From:             var spinnerMaxValue = this.Model.MaxValue.HasValue ? this.Model.MaxValue.Value : 999;
To:                 var spinnerMaxValue = this.Model.MaxValue.HasValue ? this.Model.MaxValue.Value : 5;

Then test the process of making a new request from the Self-Service portal, the ‘# of machines:’should now be restricted to a maximum of 5

---
**NOTE**

This is not officially support by VMware and careful consideration should be given before making this alteration. An upgrade of vCAC 5.2 would alter this change back to its default value.

---
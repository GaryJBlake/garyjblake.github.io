+++
author = "GaryJBlake"
title = "Upgrading vRealize Suite Lifecycle Manager with VMware Cloud Foundation"
date = "2023-07-27"
description = "Upgrading vRealize Suite Lifecycle Manager with VMware Cloud Foundation"
tags = [
    "Aria Suite Lifecycle",
    "vRealize Suite Lifecycle Manager",
	"VVS"
]
categories = [
    "VMware Validated Solutions"

]
series = [

]
+++

VMware Cloud Foundation has come a long way in recent years, one of the biggest developments introduced a few releases back centred around the relaxation of a strict Bill of Materials (BoM) as it pertained to the vRealize Suite ([see here](/archive/2022/vcf-vrealize-flexibility)), the intent being to enable our customers to update the underlying vRealize Suite components faster to adopt new features.

One of the largest and most complex challenges of any integrated software stack is ensuring that the latest and greatest products and features are available to our customers, this is especially so at VMware as we have a number of business groups who own the underlying products consumed by VMware Cloud Foundation. Not every VMware customer is a consumer of VMware Cloud Foundation and these products such as NSX and vRealize Suite can be consumed without VMware Cloud Foundation in the mix and so each of these business groups have their own drivers and commitments to keep on top of supporting and working with the VMware Cloud Foundation engineering teams. As a consequence of this and not forgetting a multitude of different release dates, all of these factors have an impact on the BoM that lands for VMware Cloud Foundation at its release date where a significant amount of workflow testing has to be carried out with the slightest of BoM changes.

**Why am I telling you all this?** Well, I think it’s important that you as a customer have an appreciation of the complex nature  in which the VMware Cloud Foundation engineering teams operate on a daily basis. With all of the aforementioned challenges around BoM interoperability and working on VMware Cloud Foundation features and enhancements sometimes tough decisions have to be made by the Product Management team, and such an example concerns VMware Cloud Foundation 4.5.1 and the version of vRealize Suite Lifecycle Manager it deploys.

I’m not privy to the background behind this particular decision, I myself just came to know recently based on some VMware Validated Solution related work, but if you're deploying VMware Cloud Foundation 4.5.1 you will be deploying vRealize Suite Lifecycle Manager 8.8.2 which as it turns out went what VMware calls End of General Support (EOGS) on 2023-04-28 ([see VMware Product Lifecycle Matrix](https://lifecycle.vmware.com/)).

**What does this all mean?** This basically means you as the customer must upgrade vRealize Suite Lifecycle Manager immediately to remain within the scope of general support before proceeding with deploying any additional vRealize Suite products.

This VMware KB article [KB88829](https://kb.vmware.com/s/article/88829) was created when the flexible BoM was introduced but if you have looked at it recently you will have noticed that its starting to look a little bit complex. As a result for the July 2023 update to the vRealize Suite based VMware Validated Solutions along with introducing support for VMware Cloud Foundation 5.0 we decided to include a new section to help navigate these complexities.

The basic essence is to direct the user on what needs to be done for either VMware Cloud Foundation 4.5.1 or VMware Cloud Foundation 5.0.0 to vRealize Suite Lifecycle Manager to upgrade or patch to a consistent version this being vRealize Suite Lifecycle Manager 8.10 PATCH1 with Product Support Pack 14.

Details for each [VMware Validated Solution](https://core.vmware.com/vmware-validated-solutions) can be found using the following links:

* Intelligent Logging and Analytics for VMware Cloud Foundation
  * [Deployment of vRealize Suite Lifecycle Manager for Intelligent Logging and Analytics for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-logging-and-analytics-v1/GUID-1B4ED70F-B95D-4988-8531-3F942A26BC06.html)
* Intelligent Operations Management for VMware Cloud Foundation
  * [Deployment of vRealize Suite Lifecycle Manager and Workspace ONE Access for Intelligent Operations Management for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-intelligent-operations-management-v1/GUID-E177B09A-74F6-45E5-9C7A-854888551207.html)
* Private Cloud Automation for VMware Cloud Foundation
  * [Deployment of vRealize Suite Lifecycle Manager and Workspace ONE Access for Private Cloud Automation for VMware Cloud Foundation](https://docs-staging.vmware.com/en/VMware-Cloud-Foundation/services/vcf-private-cloud-automation-v1/GUID-FD5C8968-55A8-463A-BE30-CC369A11EDCC.html)

Within these sections you will find a table for each VMware Cloud Foundation release which directs you through the steps that you follow to deploy and upgrade the relevant components consuming either content from the official VMware Cloud Foundation Administration Guide or a new library of procedures developed by the VMware Validated Solutions team directly in the solution guide.

After following these procedures the highest versions of the vRealize Suite components will be as follows:

| Component             | Version
|---------------------- | -------
| vRealize Log Insight  | <p style="text-align: center;">v8.10.2</p>
| vRealize Operations   | <p style="text-align: center;">v8.10.2</p>
| vRealize Automation   | <p style="text-align: center;">v8.11.2</p>

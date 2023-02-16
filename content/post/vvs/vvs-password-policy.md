+++
author = "GaryJBlake"
title = "Password Policy Configuration for VMware Cloud Foundation Overview"
date = "2023-02-16"
description = "Password Policy Configuration for VMware Cloud Foundation Overview"
tags = [
    "API",
    "PowerShell",
	"VVS"
]
categories = [
    "VMware Validated Solutions",
	"PowerVCF"
]
series = [

]
+++

Password Policy Configuration may not be that important to some but for security teams it’s critical for ensuring their organization is protected. If you have ever looked deep into this area when it comes to VMware Cloud Foundation and the components involved you will quickly realize that unfortunately VMware today does not make things easy for our customers. We have:

- lack of consistency with default values
- lack of consistency with common parameters
- lack of consistency with API methods
- lack of consistency with terminology and language

This is why with the January Update to VMware Validated Solutions ([see here](https://blogs.vmware.com/cloud-foundation/2023/01/31/vmware-validated-solutions-jan-2023-update/)) we have spent a significant amount of time reviewing and rewriting all aspects of our content as it relates to Password Policy Configuration.

The first hurdle we needed to address related to terminology, after digging through product documentation, user interfaces and general pocking around it became clear that Password Policies can be consistently thrown into three main buckets as follows:

- Password Expiration
- Password Complexity
- Account Lockout

Once we had this defined we found it much easier to understand and capture the specifics on a product by product basis.

The second hurdle involved establishing what methods were required in order to review or alter the various policy parameters by product.

The outcome of this work has resulted firstly in a completely new section, [Password Policy Configuration for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/4.5/vcf-operations/GUID-18A95158-30F5-460F-AF80-33F25B6533D0.html) being added into the [VMware Cloud Foundation Operations Guide](https://docs.vmware.com/en/VMware-Cloud-Foundation/4.5/vcf-operations/GUID-BE7C1509-709A-4A56-875B-EAC5EA61BB56.html). The new content includes procedures for configuring password expiration, password complexity and account lockout through the user interface and PowerShell using the [PowerShell Module for VMware Validated Solutions](https://github.com/vmware-samples/power-validated-solutions-for-cloud-foundation) providing coverage for:

- ESXi
- vCenter Server
- NSX
- SDDC Manager

And secondly from a VMware Validated Solution perspective enhancements have been included to the [Identity and Access Management for VMware Cloud Foundation](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-identity-and-access-management-v1/GUID-FF35966D-2225-4825-9E38-C7287B069D4D.html), these enhancements include:

- Design decisions for password expiration, password complexity and account lockout password policies for:
  - ESXi
  - vCenter Server
  - NSX
  - SDDC Manager
  - Workspace ONE Access
- Operational guidance for the configuration of password expiration, password complexity and account lockout password policies.
- Operational guidance for performing Password Policy Configuration with the Password Policy Manager in PowerShell.

#### What is Password Policy Manager?

Password Policy Manager essentially refers to the collection of PowerShell functions which when combined enable you to automate one of the following use cases:

- Generate a clarity based HTML report to capture the current state of the password expiration, password complexity and account lockout policies across a VMware Cloud Foundation instance.
- Generate a clarity based HTML report to compare the current state of the password expiration, password complexity and account lockout policies across a VMware Cloud Foundation instance with desired state config defined in a JSON file.
- Configure password expiration, password complexity and account lockout policies across a VMware Cloud Foundation instance using the desired state config defined in a JSON file.

In a future post I will provide more information on how to use Password Policy Manager specifically but for now the key functions to be aware of are:

* `Invoke-PasswordPolicyManager` – a dedicated cmdlet to generate the HTML reports with or without configuration drift.
* `Start-PasswordPolicyConfig` – a dedicated cmdlet to configure your organization’s password policy requirements across the platform.

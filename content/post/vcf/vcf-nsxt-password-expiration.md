+++
author = "GaryJBlake"
title = "Configure Password Expiration Policy for NSX Manager/Edge Nodes for a VMware Cloud Foundation Instance"
date = "2022-11-24"
description = "Configure Password Expiration Policy for NSX Manager/Edge Nodes for a VMware Cloud Foundation Instance"
tags = [
    "VCF",
    "NSX"
]
categories = [
    "VMware Cloud Foundation",
    "NSX-T Data Center"
]
series = [

]
+++

With the release of VMware Cloud Foundation 4.5.0 a welcome enhancement to *Password Management* comes the notification capability, with this new feature we have introduced firstly a new banner that appears in the SDDC Manager UI when an account is identified as disconnected either as a result of the password expiring or the component going offline and secondly a new widget that notifies you when passwords are due to expire.
![](/post/vcf/vcf-password-notifications.png)

Getting early visibility that passwords are due to expire has a significant impact on the workload of a Site Resiliency Engineer (SRE) in that it allows them to plan for password rotation operations ahead of time rather than dealing with a reactive situation where a password has actually expired.

Now whilst SDDC Manager enables you to perform manual or automated password rotation operations it still lacks the ability to view and configure password policies such as complexity, expiration and account lockout. The main point here being that whilst SDDC Manager can inform of an impending expiration if you have not altered the default password expiration policy for each products default setting you may be forced into rotating passwords inconsistently across the Software-Defined Data Center (SDDC).

It's not my place to advise customers on the password expiration policy they should be applying to the SDDC components, this should be defined by their compliance team. What I can do however is provide some guidance on how to be successful which is the purpose of this blog post.

Let's take a closer look at some of the details contained within the `Expiring within 14 days` widget in the SDDC Manager UI, in the image below you can see that we have 9 x NSX Edge and 4 x NSX Manager passwords that are flagged as expiring within the next 14 days.
![](/post/vcf/vcf-expiring-widget.png)

If we now take a closer look at the `NSXT Manager` and `NSXT Edge` component view under the Password Management section of the SDDC Manager UI we can see exactly which accounts and on which components are affected.

***NSXT Manager***
![](/post/vcf/vcf-expiring-nsx-manager.png)

***NSXT Edge***
![](/post/vcf/vcf-expiring-nsx-edge.png)

Great, so what next! Well you have two options really, you can either [Rotate Passwords](https://docs-staging.vmware.com/en/VMware-Cloud-Foundation/4.5/vcf-admin/GUID-28D29FFA-2D81-4781-AD79-85697497D45B.html) using the SDDC Manager UI or you could amend the password expiration policy. As this is our internal lab and we have full control to configure or define things how we like and rotating passwords often becomes more difficult to manage I wanted to investigate adjusting the password expiration policy so that I could apply a single consistent policy across all components.

The first step is to understand how NSX handles password expiration, this is a summary of my findings (see [here](https://docs.vmware.com/en/VMware-NSX-T-Data-Center/3.2/installation/GUID-89E9BD91-6FD4-481A-A76F-7A20DB5B916C.html)):

* Default max days is 90 across both NSX Manager and NSX Edge Nodes
* Max days value is configured on a per user basis (root, admin, audit, guestuser1 and guestuser2)
* Max days can be set using the `set user` nsxcli or via REST API

Armed with the above details I quickly realized that making this adjustment across my lab which contains two NSX Managers, four NSX Edge nodes each of which containing five accounts was not going to be a very quick process and knowing that some of our customers have many Workload Domains or VMware Cloud Foundation instances I decided to investigate automating the process.

The solution is a combination of VMware Cloud Foundation and NSX public REST APIs, combining them into a few functions we can deliver a single script that can automate applying a new Password Expiration Policy across a single VMware Cloud Foundation instance, Workload Domain and the your choice of accounts.

Download from Github the [`updateNsxtPasswordExpirationPolicy.ps1`]() script.

## Configuring the Password Expiration Policy for NSX Manager and Edge Nodes

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` powershell
$sddcManagerFqdn = "sfo-vcf01.sfo.rainpole.io"
$sddcManagerUser = "administrator@vsphere.local"
$sddcManagerPass = "VMw@re1!"

$sddcDomain = "sfo-m01"
$nsxtAccounts = @("root","admin","audit")
$passwordChangeFrequency = 999
```

3. Perform the configuration by running the command in the PowerShell console.

``` powershell
.\updateNsxtPasswordExpirationPolicy -server $sddcManagerFqdn -username $sddcManagerUser -password $sddcManagerPass -nsxtAccounts $nsxtAccounts -passwordChangeFrequency $passwordChangeFrequency
```

4. Refresh the Password Management section of the SDDC Manager UI, the NSXT Manager and NSXT Edge counters should no longer appear in the `Expiring within 14 days` widget.
![](/post/vcf/vcf-active-widgit.png)

And there you have it, I now have a single password expiration policy defined and applied to all NSX components managed by my SDDC Manager and the current password expiration warning are addressed. Next time I see the expiration warnings it really will be time for me to rotate my passwords to remain compliant.

+++
author = "GaryJBlake"
title = "Introducing PowerVCF - Power to VI Admins"
date = "2020-01-14"
description = "Introducing PowerVCF - Power to VI Admins"
tags = [
    "API",
    "PowerShell",
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "PowerVCF"
]
series = [

]
+++

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

Back in December I was chatting with my good friend and colleague [Brian O'Connell](https://twitter.com/LifeOfBrianOC) about automating a bunch of post configuration tasks within VMware Cloud Foundation using the new Public APIs, and it was during that conversation he shared a pet project he had been working on called [PowerVCF](https://www.powershellgallery.com/packages/PowerVCF/1.0), the idea behind PowerVCF being a way to allow VI Admin's to easily consume the new public APIs we began shipping with VMware Cloud Foundation much in the same way PowerNSX and PowerVRA come about.

---
**NOTE**

Contributors working on PowerVCF are doing so during their spare time, and have day jobs.

---

Brian started the project when v3.8.x was initially released but with v3.9 more Public APIs were added and he was struggling to find time to extend the capabilities of what he had started on his own. Based on my needs I agreed to roll up my sleeves and help out. Over the course of just over a month or so along with help from [Giuliano Berteo](https://twitter.com/GiulianoBerteo) we have added support for about 70% of the current Public APIs and to coincide with the release of VMware Cloud Foundation v3.9.1 have decided to release v1.0 of PowerVCF.

To make it easy to download and install, PowerVCF can be obtained from the [PowerShell Gallery](https://www.powershellgallery.com/packages/PowerVCF/1.0) and documentation can be found on [ReadTheDocs](https://readthedocs.org/) which is available at [https://powervcf.readthedocs.io](https://powervcf.readthedocs.io/).

---
**NOTE**

Please note that PowerVCF is not officially supported by VMware. It is provided without warranty and should not be used in a production environment without thoroughly testing first.

---

Once installed running the following command <strong><em>Get-Command -Module PowerVCF</em></strong>  you will presented with this list of cmdlets, we plan to add more capabilities over the coming months, if your interested in contributing then please reach out!
![](/archive/2019/power-vcf-functions.png)

### Useful Links

* [VMware Cloud Foundation API Documentation]()
* [PowerVCF GitHub Repository](https://github.com/PowerVCF/PowerVCF)
* [PowerVCF PowerShell Gallery Download](https://www.powershellgallery.com/packages/PowerVCF/1.0)
* [PowerVCF Documentation](https://powervcf.readthedocs.io/en/latest/)

### Other PowerVCF Blog Posts

* [Introducing PowerVCF – A PowerShell Module for the VMware Cloud Foundation API](https://lifeofbrianoc.com/2020/01/14/introducing-powervcf-a-powershell-module-for-the-vmware-cloud-foundation-api/) by Brian O'Connell
* [Introducing PowerVCF](https://blog.bertello.org/2020/01/introducing-powervcf/) by [Giuliano Berteo](https://twitter.com/GiulianoBerteo)
* [Automating VMware Cloud Foundation with PowerVCF](https://brandonwillmott.com/2020/01/13/automating-vmware-cloud-foundation-with-powervcf/) by by Brandon Willmott

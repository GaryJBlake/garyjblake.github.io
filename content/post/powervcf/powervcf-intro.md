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

<!-- wp:paragraph -->
<p>Back in December I was chatting with my good friend and colleague <a href="https://twitter.com/LifeOfBrianOC">Brian O'Connell</a> about automating a bunch of post configuration tasks within VMware Cloud Foundation using the new Public APIs, and it was during that conversation he shared a pet project he had been working on called <a href="https://www.powershellgallery.com/packages/PowerVCF/1.0">PowerVCF</a>, the idea behind PowerVCF being a way to allow VI Admin's to easily consume the new public APIs we began shipping with VMware Cloud Foundation much in the same way PowerNSX and PowerVRA come about.</p>
<!-- /wp:paragraph -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p>Contributors working on PowerVCF are doing so during their spare time, and have day jobs. </p></blockquote>
<!-- /wp:quote -->

<!-- wp:paragraph -->
<p>Brian started the project when v3.8.x was initially released but with v3.9 more Public APIs were added and he was struggling to find time to extend the capabilities of what he had started on his own. Based on my needs I agreed to roll up my sleeves and help out. Over the course of just over a month or so along with help from <a href="https://twitter.com/GiulianoBerteo">Giuliano Berteo</a> we have added support for about 70% of the current Public APIs and to coincide with the release of VMware Cloud Foundation v3.9.1 have decided to release v1.0 of PowerVCF.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>To make it easy to download and install, PowerVCF can be obtained from the <a href="https://www.powershellgallery.com/packages/PowerVCF/1.0">PowerShell Gallery</a> and documentation can be found on <a rel="noreferrer noopener" href="https://readthedocs.org/" target="_blank">ReadTheDocs</a> which is available at <a rel="noreferrer noopener" href="https://powervcf.readthedocs.io/" target="_blank">https://powervcf.readthedocs.io</a>. </p>
<!-- /wp:paragraph -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p>Please note that PowerVCF is not officially supported<strong> </strong>by VMware. It is provided without warranty and should not be used in a production environment without thoroughly testing first</p></blockquote>
<!-- /wp:quote -->

<!-- wp:paragraph -->
<p>Once installed running the following command <strong><em>Get-Command -Module PowerVCF</em></strong>  you will presented with this list of cmdlets, we plan to add more capabilities over the coming months, if your interested in contributing then please reach out!</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":114,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/01/image.png?w=611" alt="" class="wp-image-114"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>Useful Links</strong></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li><a href="https://github.com/PowerVCF/PowerVCF">VMware Cloud Foundation API Documentation</a></li><li><a href="https://github.com/PowerVCF/PowerVCF">PowerVCF GitHub Repository</a></li><li><a href="https://www.powershellgallery.com/packages/PowerVCF/1.0">PowerVCF PowerShell Gallery Download</a></li><li><a href="https://powervcf.readthedocs.io/en/latest/">PowerVCF Documentation</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>Other PowerVCF Blog Posts</strong></p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li><a href="https://lifeofbrianoc.com/2020/01/14/introducing-powervcf-a-powershell-module-for-the-vmware-cloud-foundation-api/">Introducing PowerVCF – A PowerShell Module for the VMware Cloud Foundation API</a> by Brian O'Connell</li><li><a href="https://blog.bertello.org/2020/01/introducing-powervcf/">Introducing PowerVCF</a> by <a href="https://twitter.com/GiulianoBerteo">Giuliano Berteo</a></li><li><a href="https://brandonwillmott.com/2020/01/13/automating-vmware-cloud-foundation-with-powervcf/">Automating VMware Cloud Foundation with PowerVCF</a> by Brandon Willmott</li></ul>
<!-- /wp:list -->
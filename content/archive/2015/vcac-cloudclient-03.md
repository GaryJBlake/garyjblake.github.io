+++
author = "GaryJBlake"
title = "Adding an Identity Store and Assigning Access to a Tenant - Part 3"
date = "2015-02-06"
description = "Adding an Identity Store and Assigning Access to a Tenant - Part 3"
tags = [
    "vCAC",
    "CloudClient"
]
categories = [
    "vCloud Automation Center"
]
series = [

]
+++

In my previous post, I covered the creation of a tenant using the CloudClient but before you can authenticate to the tenant you need to first assign the Identity Store that you want to use for assigning access rights, then you need to assign access for the two tenant roles 'Tenant Admin' and  'Infrastructure Admin'.

### Adding an Identity Store

1. Launch the CloudClient and authenticate to the vRealize Automation system. (Refer to my previous article here).
2. Enter the following command-line syntax to add an Identity Store to a tenant.
![](/archive/2015/cloudclient-add-identity-tenant.png)

In this example we used the 'vra tenant identitystore add' command. For easy reference here are the parameters explained.
![](/archive/2015/cloudclient-add-identity-tenant-syntax.png)

### Assigning access to a Tenant

3. Enter the following command-line syntax to assign access to the 'Tenant Admin' role of a tenant.
![](/archive/2015/cloudclient-assign-access-01.png)

4. Enter the following command-line syntax to assign access to the 'Infrastructure Admin' role of a tenant.
![](/archive/2015/cloudclient-assign-access-02.png)

In this example we used the 'vra tenant admin update' command. For easy reference here are the parameters explained.
![](/archive/2015/cloudclient-assign-access-syntax.png) 

---
**NOTE**

With the release of v3.x of CloudClient some of the old command-line syntax associated with the 'vra tenant admin update' command have been deprecated. See the official documentation for further details.

---
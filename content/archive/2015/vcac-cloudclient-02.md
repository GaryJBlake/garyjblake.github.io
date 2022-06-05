+++
author = "GaryJBlake"
title = "Creating and Deleting a Tenant with CloudClient - Part 2"
date = "2015-02-03"
description = "Creating and Deleting a Tenant with CloudClient - Part 2"
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

In this article I'm going to walk through the process of using CloudClient to create and delete tenants from vRealize Automation. I personally use this procedure to setup a consistent and repeatable environment when doing internal testing or building demo environments for developing our professional services offerings.

### Creating a Tenant

1. Launch the CloudClient and authenticate to the vRealize Automation system. (Refer to my previous article here).
2. Enter the following command-line syntax to create a new tenant.
![](/archive/2015/cloudclient-new-tenant.png)


 In this example we used the 'vra tenant add' command. For easy reference here are the parameters explained.
![](/archive/2015/cloudclient-new-tenant-syntax.png)

### Deleting a Tenant

1. To delete the tenant we just created, enter the following command-line syntax.
![](/archive/2015/cloudclient-delete-tenant.png)

In this example we used the 'vra tenant remove' command. We only need to use one parameter as defined below.
![](/archive/2015/cloudclient-delete-tenant-syntax.png)
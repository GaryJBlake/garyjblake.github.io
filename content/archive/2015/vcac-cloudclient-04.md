+++
author = "GaryJBlake"
title = "Creating a Fabric Group and Assigning a Compute Resource - Part 4"
date = "2015-02-12"
description = "Creating a Fabric Group and Assigning a Compute Resource - Part 4"
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

Now we have our tenant created, identity source added and roles assigned we can create a fabric group to assign access to the underlying computer resources.

1. The first step is to change the context of which we are connecting to the vRealize Automation system, this involves connecting to our newly created tenant instead of the system. Enter the following command-line syntax to authenticate to the tenant and the IaaS system.
![](/archive/2015/cloudclient-fabric-context.png)

In this example we used the 'vra login userpass' command. For easy reference here are the parameters explained. Notice in the example above we are specifying the same credentials for both the tenant and the IaaS Service, this is because we assigned both the 'Tenant Admin' and Infrastructure Admin' roles to the account in my previous post.
![](/archive/2015/cloudclient-fabric-context-syntax.png)

2. Now we are authenticated we can create the fabric group, enter the following command-line syntax:
![](/archive/2015/cloudclient-fabric-create.png)

In this example we used the 'vra fabricgroup add' command. For easy reference here are the parameters explained. Notice when you issue the command a hexadecimal value is returned, make a note of this value as we will need it later.
![](/archive/2015/cloudclient-fabric-create-syntax.png)

3. The previous step created the fabric group, but in order to allocate compute resources we need to perform a second step to tie the fabric group and compute resource together. For this we need to establish the unique identifier or Id for the compute resource. Enter the following command-line syntax to list all compute resources and make a note of the Id associated with the compute resource you want to assign.
![](/archive/2015/cloudclient-fabric-list.png)

4. Finally we need to issue an update command to the fabric group to link the compute resource, for this process we need to supply the Id of the fabric group (the hexadecimal value displayed on completion of step 2) and the Id of the compute resource from the table in step 3. For the purpose of this we are going to assign the compute resource Id associated with the Payload-01 friendly name which relates to my vSphere Cluster. Enter the following command-line syntax:
![](/archive/2015/cloudclient-fabric-update.png)

In this example we used the 'vra fabricgroup update' command. For easy reference here are the parameters explained.
![](/archive/2015/cloudclient-fabric-update-syntax.png)

Once complete this is what it look likes inside the vRealize Automation UI.
![](/archive/2015/cloudclient-fabric-vcacui.png)
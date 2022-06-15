+++
author = "GaryJBlake"
title = "vCenter Upgrade to v5.x Failed - Useful Tips"
date = "2013-11-22"
description = "vCenter Upgrade to v5.x Failed - Useful Tips"
tags = [

]
categories = [
    "vCenter Server"
]
series = [

]
+++

 Recently I had some fun and games with what should have been a pretty routine process of upgrading a customer’s vCenter 4.1 Server to vCenter 5.0 Update 1, as it turned out it was far from straightforward.
The main background to my issue was that when performing the upgrade of the database, the progress bar did not move after twenty minutes, which indicated that there was an issue somewhere. There are various VMware KB available in relation to the symptoms I observed but none that actually provided the solution. As a general rule before proceeding with an upgrade I would recommend the following:

- Check the Database Size and reduce where you can (The customer in question had a DB of 74GB and Transaction Log of 236GB)
- Run the upgrade logged in as the Service Account used to start the vCenter Services
- Elevate the Database account to ‘sysadmin’ for the purposes of the upgrade only
Some suggested VMware KB Articles include: Database Size [1007453](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1007453), Upgrade Issues [2011533](http://kb.vmware.com/selfservice/microsites/search.do?cmd=displayKC&docType=kc&externalId=2011533&sliceId=1&docTypeID=DT_KB_1_1&dialogID=307744199&stateId=0%200%20307746168), [1003960](http://kb.vmware.com/selfservice/microsites/search.do?cmd=displayKC&docType=kc&externalId=2011533&sliceId=1&docTypeID=DT_KB_1_1&dialogID=307744199&stateId=0%200%20307746168), [1025139](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1025139)
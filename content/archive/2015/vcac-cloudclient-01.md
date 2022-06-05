+++
author = "GaryJBlake"
title = "Launching CloudClient and Authenticating to vRealize Automation - Part 1"
date = "2015-01-28"
description = "Launching CloudClient and Authenticating to vRealize Automation - Part 1"
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

Before you can start using the CloudClient to perform command-line actions against your vRealize Automation (vRA) platform you have to authenticate to it. Whilst complete documentation is provided with the CloudClient download it does lack some examples of how to use the syntax, this post and others I'm yet to write will look to provide some of these examples based on my specific use cases.

The first step is to launch CloudClient, there are a couple of things to note here: 

a) you will need a Java Runtime Environment installed on the system where you re running the command-line too from.
b) the tool has two start-up scripts provide, one for Windows and one for Linux and these are now located in the /bin folder

1. Execute the correct start-up script, for my scenario I'm using a Windows server so we need to run C:\CloudClient\bin\cloudclient.bat. Assuming you have JVM installed correctly the CloudClient command-line tool will load and you will be presented with the following screen.

![](/archive/2015/cloudclient-startup.png)

2a. Next we need to run the following command-line syntax to authenticate to the default tenant of the vRealize Automation system, from there we can run many commands against the platform.

![](/archive/2015/cloudclient-logina.png)

2b. If you wanted to connect to a specific tenant and not the default tenant, then you can use the '--tenant' parameter as follows.

![](/archive/2015/cloudclient-loginb.png)

In the examples above we used the 'vra login userpass' command, but the tool also provides the ability to use a keyfile with the 'vra login keyfile' command. Now lets look at each of the parameters used in this example.

![](/archive/2015/cloudclient-01.png)
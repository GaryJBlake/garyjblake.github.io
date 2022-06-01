+++
author = "GaryJBlake"
title = "Pet Clinic Application - vCloud PoC"
date = "2011-12-13"
description = "Pet Clinic Application - vCloud PoC"
tags = [
    "vCloud Director"
]
categories = [
    
]
series = [

]
+++

I don’t know how much experience any of you have in delivering the Spring Source Pet Clinic application which can be used as a good sample application when delivering vCloud Director. Based on recent experience I thought I would share:

Pet Clinic Spring Source Sample Application – The Pet Clinic application is a simple two VM application running on CentOS, it consist of a one VM running Tomcat and IMDB and a second VM running Apache Web Server.

The application is deployed using OVF import into a vSphere infrastructure and has the default configuration:

<table>
    <tr>
        <th>VM Description</th>
        <td>Tomcat and IMDB Server</td>
        <td>Apache Server</td>
    </tr>
    <tr>
        <th>Hostname</th>
        <td>pc-vm-0-0</td>
        <td>pc-vm-1-0</td>
    </tr>
    <tr>
        <th>IP Address</th>
        <td>192.168.2.101</td>
        <td>192.168.2.100</td>
    </tr>
    <tr>
        <th>Root Password</th>
        <td>napa</td>
        <td>napa</td>
    </tr>
</table>

1. Deploy the application and alter the IP Address as in my case to test the vSphere Infrastructure the following files need to be edited:

| Tomcat & Apache Server                                                                                      |
| ---------------------------------------------------- | ---------------------------------------------------- |
| /etc/hosts                                           | (Alter the local host entry to match new IP Address) |
| /etc/sysconfig/network                               | (Alter the default gateway)                          |
| /etc/sysconfig/networking/network-scripts/ifcfg-eth0 | (Alter the servers IP Address)                       |

| Apache Server Only                                                                                          |
| ---------------------------------------------------- | ---------------------------------------------------- |
| /etc/httpd/conf.d/proxy.conf                         | (Alter the IP Address of the DB Server)              |

2. Deploying the Pet Clinic application and proving the web service. If you know much about vCD then you will be aware that there are many ways to hook up network connectivity, on a recent engagement I devised the following scenario’s to demonstrate to my customer, the key element I was looking to show was the ability to deploy multiple copies of the Pet Clinic application with the default system configuration detailed in my earlier post.

**Scenario One – Internal Organisation Network**

Multiple Pet Clinic vApps with a vApp Network of 192.168.2.x, each vApp Network is connected to the Internal Organisation Network through a vShield Edge with only NAT enabled, this allocates an IP address from the Org Network to each VM within the vApp.

Windows management VM deployed directly on the Org Network, application proving is then done through vCD Remote Console onto this VM. A web connection is then made using a NATed IP to test the Pet Clinic application.

**Scenario Two – External Organisation Network directly connected**

Add a Windows VM into the Pet Clinic vApp and then deploy multiple Pet Clinic vApps with two vApp Networks. Network one using 192.168.2.x, and network two using 192.168.3.x. All three VMs are attached to the 192.168.2.0 network to allow the application to function as normal and the Windows VM has a second NIC set as the primary to the 192.168.3.x network.

The vApp is then connected to the External Organisation Network through a vShield Edge with NAT enabled on the 192.168.3.x network only. This provide the Windows VM with an IP address on the customers corporate LAN giving a direct RDP connection to the Windows VM in order to test and alter the application. The reason for creating the second vApp network was to limit the number of IPs needed when the vApp is powered as the customer could only provide 10 IPs.

**Additional Management**

I additionally deployed a second management VM directly on the External Organisation Network and allocated two network cards one connected to it and the second attached to the Internal Organisation Network, this provided the added benefit of a jump box to allow access to the vApps deployed within the Internal Organisation. From the jump box the NATed IP of the Pet Clinic application can be used to access the application.

As I said before there are plenty of choices when configuring vCD and the above is just what I’ve set up recently to demonstrating the capabilities.
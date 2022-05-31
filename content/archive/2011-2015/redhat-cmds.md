+++
author = "GaryJBlake"
title = "Handy RedHat Commands"
date = "2011-04-24"
description = "Handy RedHat Commands"
tags = [
    "Linux"
]
categories = [
    
]
series = [

]
+++

As I continue to help customers build out their private clouds using vCloud Director I'm finding that I'm personally needing to build up my Linux skills (I come from a Windows background like a lot of VMware users) so I've created this post to bring all this information into one spot. As I find additional useful commands I will update. Enjoy !!

### Disable Firewall
By default the Firewall service within Red Hat is enabled, when setting up the vCloud Director cells this will stop you from being able to hit the url once installed. Use the following commands to check and configure the firewall:

#### Check the firewall status
```
/etc/init.d/iptables status
```

#### Disable the firewall service
```
/etc/init.d/iptables save
/etc/init.d/iptables stop
chkconfig iptables off
```
or
```
service iptables save
service iptables stop
chkconfig iptables off
```

#### Viewing Logs using tail
When deploying the vCloud Director Cells, you will need to monitor the services starting in case any issues occur (DNS is always a good one). The Linux tail command is useful in this situation, by default TAIL will print the last 10 lines but with some additional values we can display more lines and follow the output as it changes. This can be achieved using the following commands:

```
tail –f -n 50 /opt/vmware/vcloud-director/logs/cell.log
```

Checking Version of Red Hat
If you want to double check the version of Red Hat you running then the following command can be issued:

```
tail /etc/redhat-release
```
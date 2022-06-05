+++
author = "GaryJBlake"
title = "Installing SRM with HDS Storage"
date = "2012-05-01"
description = "Installing SRM with HDS Storage"
tags = [
    "SRM",
    "HDS Storage"
]
categories = [
    "Site Recovery Manager"
]
series = [

]
+++

These are notes on how to setup Site Recovery Manager (SRM) with HDS Storage using a command control device.

If using a VM for the SRM server ensure the following are configured before attempting to install the SRM components:

1. RDM presented to the SRM VM, attached, initialized, but not formatted or assigned a drive letter.
2. Install Hitachi RAID-Manger/Command Control Interface to setup the HORCM service (Protected site HORCM0 & Recovery Site HORCM1).
3. Configure the horcm0.conf and horcm1.conf files on the respective SRM Servers.
4. Start HORCM service (you will need to alter the name of the run config file located in the C:\HORCM\Tools, to match the service name 0 or 1.
5. Test connection locally using C:\HORCM\Tools\pairdisplay –g GRP1 –l (for local check) and pairdisplay –g GRP1 –fcx (remote side check), alter GRP1 to match the Group defined in your HORCM.conf file.

### Frequently Asked Questions

**Q:** Does the SRA work at an individual Hitachi LUN level or HUR (Hitachi Universal Replicator) journal  level ?

**A:** HUR keeps all LUN pairs in the JNL group in the same status so if the pairs are split for a failover, all pairs in the JNL groups are split. The SRA cannot override this behavior. To split a single LUN it must be in a JNL group without any other LUNs.

**Q:** Can SRA do split/sync for just one LUN ?

**A:** Yes, depending on the configuration of HORCM but this is possible. The HUR pairs need to be created as single LUN/JNL group.

**Q:** If we have multiple LUN's in same journal does it split  all LUN's at same time?

**A:** Yes

**Q:** Does the SRA start a reverse sync immediately (Reverse P-VOL and S-VOL) once the secondary site is brought up?

**A:** With SRM 4, HUR / TC do horctakeover so replication is reversed and if possible resync is run in the reverse direction. This behavior was changed for SRM 5 to support the additional functions. SRM 5 will only split and reverse the replication but will not resync until the reverseReplication function is called.

**Q:** Do we have to create a separate HUR journal for each LUN,  for individual LUN failover/failback?

**A:** A separate JNL Group.

#### **Useful links**

http://www.hds.com/assets/pdf/hitachi-storage-replication-adapter-software-vmware-vcenter-site-recovery-manager-deployment-guide.pdf
http://www.hds.com/solutions/applications/vmware/download.html
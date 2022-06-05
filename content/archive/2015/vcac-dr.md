+++
author = "GaryJBlake"
title = "vCloud Automation Center Disaster Recovery"
date = "2015-01-16"
description = "vCloud Automation Center Disaster Recovery"
tags = [
    "vCAC"
]
categories = [
    "vCloud Automation Center"
]
series = [

]
+++

Prior to the release of vCloud Automation Center (vCAC) v5.2 there was no awareness or understanding of virtual machines protected through vCenter Site Recovery Manager. With the introduction of v5.2, VMware provided enhanced integration so that vCAC would correctly discover the relationship between the primary and recovery virtual machines. 

These enhancements consisted of what could be considered minor modifications, albeit minor they were fundamental to ensuring that vCenter Site Recovery Manager (SRM) could successfully be implemented to the deliver disaster recovery of virtual machines managed by vCAC.
![](/archive/2015/srm-slide.png)

### So What’s Changed?

When a virtual machine is protected by SRM a ‘Managed Object Reference ID’ or ‘MoRefID’ is created against the virtual machine record in the vCenter Server database.

Prior to SRM v5.5 a single virtual machine property was created on the placeholder virtual machine object in the recovery site vCenter Server database called ‘ManagedBy:SRM,placeholderVM’, but vCAC did not inspect this value and so would attempt to add a second duplicate entry into its database, with the introduction of vCAC 5.2 when a data collection is run vCAC now ignores virtual machines with this value set to avoid this.

In addition to this SRM v5.5 introduced a second managed by property value which is placed on the virtual machine vCenter Server database record called ‘ManagedBy:SRM,testVM’ when a test recovery process is performed and data collection is run at the recovery site vCAC inspects this value and also ignores the virtual machines with this set to avoid creating a duplicate entry in the vCAC database.

With the changes highlighted above, SRM v5.5 and later and vCAC 5.2 and later can now be implemented in tandem with full awareness of the other. However one limitation still remains when moving a virtual machine into recovery or reprotect mode, vCAC does not properly recognize the move. To successfully perform these machine operations and continue being able to manage the machine life cycle, you must use the ‘Change Reservation’ operation, however this is still a manual task.

#### Introducing the CloudClient

In performing the investigation around the enhancements between SRM and vCAC above, and on uncovering the need for the manual change of reservation I spent some time with our Cloud Solution Engineering team discussing the need for finding a way to automate this step. They were already developing a tool called CloudClient, which is essentially a wrapper for our API’s allowing simple command line driven steps to be performed and suggested that this could be developed to support this use case.

#### Conclusion

In order to achieve a fully functional integration between vCloud Automation Center (5.2 or later) and vCenter Site Recovery Manager adhere to the following design decisions:

- Configure vCloud Automation Center with endpoints for both the protected and recovery sites.
- Perform a manual / automatic change reservation following a vCenter Site Recovery Manager planned or disaster migration.

![](/archive/2015/srm-platform.png)

### Frequently Asked Questions

**Q:** When I fail over my VMs from the protected site to the recovery site what happens when I request the built in vCAC machine operations?

**A:** Once you have performed a ‘Planned Migration’ or a ‘Disaster Recovery’ process, as long as you have changed the reservation within the vCAC Admin UI for the VM, machine operations will be performed in the normal way on the recovered VM.

**Q:** What happens if I do not perform the Change Reservation step to a VM once I’ve completed a ‘Planned Migration’ or ‘Disaster Recovery’ process and I then attempt to perform the built in vCAC machine operations on the VM?

**A:** Depending on which tasks you perform, some things are blocked by vCAC and you see an error message in the log “The method is disabled by ‘com.vmware.vcDR’” and some actions look like they are being processed but nothing happens. There are also a few actions, which are processed regardless of the VM failure scenario; these are Change Lease and Expiration Reminder.

**Q:** What happens if I perform a reprovision action on a VM that is currently in a ‘Planned Migration’ or ‘Disaster Recovery’ state?

**A:** VCAC will reprovision the VM in the normal manner, which is that the hostname and IP Address (if assigned through vCAC) will be maintained. However the SRM recovery plan will now fail if you attempt to reprotect the VM back to the protected site as the original object being managed is replaced. It’s recommended that for blueprints where SRM protection is a requirement that you disable the ‘Reprovision’ machine operation.
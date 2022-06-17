+++
author = "GaryJBlake"
title = "Cloud Builder Validation: SSL Certificate common name doesn’t match ESXi FQDN"
date = "2021-02-10"
description = "Cloud Builder Validation: SSL Certificate common name doesn’t match ESXi FQDN"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "VMware Cloud Builder"
]
series = [

]
+++

On February 9th VMware released VMware Cloud Foundation 4.2, and with it a number of new security enhancements, one of which means that each ESXi host used for either a Management Domain or Workload Domain now requires the self-signed certificate for the ESXi host to have its common name matching the real FQDN assigned to the host.

Failure to follow the procedure will result in the validation task failing with the error message: 'SSL Certificate common name doesn’t match ESXi FQDN'.

The VMware Cloud Foundation documentation includes details regarding this requirement as well as the procedure that must be followed to fix the issue.

* [VMware Cloud Foundation Deployment Guide](https://docs.vmware.com/en/VMware-Cloud-Foundation/4.2/com.vmware.vcf.ovdeploy.doc_42/GUID-20A4FD73-EB40-403A-99FF-DAD9E8F9E456.html)
* [VMware Cloud Foundation Operations and Administration Guide](https://docs.vmware.com/en/VMware-Cloud-Foundation/4.2/com.vmware.vcf.admin.doc_42/GUID-20A4FD73-EB40-403A-99FF-DAD9E8F9E456.html)


Assuming you have stumbled across this post after seeing the error mentioned, I've included a document extract and the procedure you need to follow.

**Documentation Extract**

***During the installation of ESXi, the installer generates a self-signed certificate for each ESXi host but the process is performed prior to the ESXi identity being configured. This means all ESXi hosts have a common name in their self-signed certificate of localhost.localdomain. All communication between VMware Cloud Builder and the ESXi hosts is performed securely over HTTPS and as a result it validates the identify when making a connection by comparing the common name of the certificate against the FQDN provided within the VMware Cloud Builder configuration file.***

***To ensure that the connection attempts and validation does not fail, you must manually regenerate the self-signed certificate after hostname has been configured.***

### Regenerate the Self-Signed Certificate on All Hosts

1. Log in to the ESXi host using an SSH client such as Putty.

2. Regenerate the self-signed certificate by executing the following command:
``` bash
/sbin/generate-certificates
```

3. Restart the hostd and vpxa services by executing the following command:
``` bash
/etc/init.d/hostd restart && /etc/init.d/vpxa restart
```

4. Repeat this procedure for all remaining hosts.

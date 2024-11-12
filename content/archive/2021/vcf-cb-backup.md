+++
author = "GaryJBlake"
title = "Configure VMware Cloud Builder as a Backup Target for SDDC Manager"
date = "2021-11-23"
description = "Configure VMware Cloud Builder as a Backup Target for SDDC Manager"
tags = [
    "API",
    "VCF",
    "PowerShell",
    "Backup"
]
categories = [
    "VMware Cloud Foundation",
    "VMware Cloud Builder",
    "PowerVCF"
]
series = [

]
+++

By default when VMware Cloud Foundation is deployed, SDDC Manager and NSX-T Data Center are configured to use an SFTP service running locally on the SDDC Manager Appliance. For production environments its critical that this is changed before going live to ensure that you have the ability to recover in the event of a disaster.

The requirements of using an SFTP in my experience seem to fall through the gaps during most initial deployments and as a result it takes organizations some time to get all the requirements put in place. Such delays simply place a risk on the implementation until addressed.

One way to reduce this risk, and of course for use in a lab environment is to use VMware Cloud Builder as an alternative short term solution as it too has an SFTP service running, this can be achieved through a simple three step process:

1. Create a Backup Service Account on the VMware Cloud Builder Appliance
2. Create a Backup Folder on the VMware Cloud Builder Appliance
3. Re-Configure the Backup in SDDC Manager

### Create a Backup Service Account on the VMware Cloud Builder Appliance

First step is to create a local account on the VMware Cloud Builder Appliance, this will be used as the service account and is supplied when re-configuring the backup configuration in SDDC Manager.

1. Connect to the SDDC Manager Appliance using an SSH client such as Putty, and authenticate as **admin**.

2. Switch to root by entering the following command:

``` Bash
su
```

3. Create the service account by entering the following command:

``` Bash
useradd -m -p $(openssl passwd -1 VMw@re1!) svc-vcf-bck
```

### Create a Backup Folder on the VMware Cloud Builder Appliance

The next step is to create a target backup folder on the VMware Cloud Builder Appliance and assign the appropriate access to allow the service account to store backup jobs.

1. Create a new folder by entering the following command:

``` Bash
mkdir /tmp/vcf-backups
```

2. Configure access to the folder for the service account by entering the following command:

``` Bash
chown svc-vcf-bck:users /tmp/vcf-backups
```

### Re-Configure the Backup in SDDC Manager

And finally you re-configure the backup configuration to use the new SFTP target for backups, performing this task will trigger SDDC Manager to automatically reconfigure SDDC Manager and NSX-T Data Center.

1. Login to the SDDC Manager UI with a user assigned with the **ADMIN** role.

2. Using the navigation paine, select **Administration** > **Backup**.

3. On the **Backup** paine, select **Site Settings** and click **Register External**.
![](/archive/2021/vcf-cb-backup-01.png)

4. Enter the values, and click **Save**.

Setting                     | Value
----------------------------|--------------------------
**Host FQDN or IP**         | sfo-cb01.sfo.rainpole.io
**Port**                    | 22
**Transfer Protocol**       | SFTP
**Username**                | svc-vcf-bck
**Password**                | VMw@re1!
**Backup Directory**        | /tmp/vcf-backups
**Confirm Fingerprint**     | Selected
**Encryption Passphares**   | VMw@re1!VMw@re1!

5. On the **Confirm your changes to backup settings** dialog, click **Confirm**. Your details will be saved and the ***Configure Backup of VCF Components (SDDC Manager and NSX Managers)*** task will start.

![](/archive/2021/vcf-cb-backup-02.png)

---
**NOTE**

The SDDC Manager UI procedure is valid for VMware Cloud Foundation 4.3.0 and later.

---

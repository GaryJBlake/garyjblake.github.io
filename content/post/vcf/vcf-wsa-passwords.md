+++
author = "GaryJBlake"
title = "Fixing Expired Passwords on Workspace ONE Access"
date = "2022-11-22"
description = "Fixing Expired Passwords on Workspace ONE Access"
tags = [
    "VCF",
    "WSA"
]
categories = [
    "VMware Cloud Foundation",
    "Workspace ONE Access"
]
series = [

]
+++

By default Workspace ONE Access passwords (root, sshuser) are set to expire after 60 days. Unless you rotate passwords on regular basis you may have overlooked this default configuration and suddenly find yourself locked out of being able to perform management tasks.

VMware Cloud Foundation provides the ability to perform scheduled or manual password rotations something to consider looking into from a day-to-day operational process but if your passwords have already expired this won't help as the VMware Cloud Foundation password rotation workflow can no longer authenticate.

It's also worth pointing out that VMware Cloud Foundation also does not support the password rotation of the sshuser account either so using SDDC Manager is only going to help solve part of problem.

All is not lost, here I provide the fastest way to get the environment working again, this involves resetting the root and sshuser accounts back to the original passwords.

## Resolving Expired Passwords for Workspace ONE Access Nodes

1. Log in to the management domain vCenter Server at `https://<management_vcenter_server_fqdn>/ui` as administrator@vsphere.local.

2. In the **Hosts and Clusters** inventory, navigate to the default management data center, expand the data center and cluster objects.

3. Locate and select the *Workspace ONE Access virtual appliance*, in the **Summary** page click **Launch Web Console**.

4. Login to the console as root, you will be forced to change the password due to it expiring. Set a temporary password.

5. Temporarily alter the password policy to allow the reuse of a previously used password by editing the `/etc/pam.d/system-password` file. You could use `vi` to edit the file but here I'm using `sed` to semi-automate the process.

    ``` bash
    sed -i ‘s/remember=5/remember=0/g’ /etc/pam.d/system-password
    ```

6. Reset the `root` password back to the previously expired password by entering the command and following the on-screen prompts.

    ``` bash
    passwd root
    ```

7. Reset the `sshuser` password back to the previously expired password by entering the command and following the on-screen prompts.

    ``` bash
    passwd sshuser
    ```

8. Revert the password policy by editing the `/etc/pam.d/system-password` file.

    ``` bash
    sed -i ‘s/remember=0/remember=5/g’ /etc/pam.d/system-password
    ```

9. Repeat the process for each node of the Workspace ONE Access cluster.

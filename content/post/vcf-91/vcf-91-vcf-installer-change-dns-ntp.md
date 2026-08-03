+++
author = "GaryJBlake"
title = "VCF Installer: Changing DNS/NTP Settings"
date = "2026-07-31"
description = "VCF Installer: Changing DNS/NTP Settings"
tags = [
    "VCF 9.1",
    "VCF Installer"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Installer"
]
series = [

]
+++

One of my customers reached out to me today to ask for help on how to change the DNS / NTP settings of their already deployed VCF Installer appliance. Specifically they were trying to alter the initial value used for NTP, after making the change via the linux console they were observing that when you walk-through the VCF Installer UI deployment wizard it was always displaying the original details and because of this the new value did not match throwing a validation in the UI and therefore they were blocked from moving forward.

After a bit of investigation I found the following, firstly the VCF Installer UI uses the public API `v1/system/appliance-info` to retrieve the appliance configuration which it uses to populate the values, secondly the appliance is configured using vApp Options. So rather than just making the adjustments through a linux console you also need to amend the vApp Options to match your changes.

### Part A - Update the VCF Installer vApp Options

1. Log in to the vCenter interface at *https://<vcenter_fqdn>/ui* as a user assigned the Administrator role.

2. Located your ***VCF Installer VM***.

3. Right-click the ***VCF Installer VM***, select ***Power > Shut Down Guest OS*** and click ***Yes***.

4. Select the ***VCF Installer VM***, navigate to the ***Configure*** tab.

5. Under ***Settings***, select ***vApp Options***.

6. Under ***Properties***, select the radio button for each of the following keys, click ***Set Value*** enter the new value click ***OK***.

```bash
vami.DNS.SDDC-Manager
vami.domain.SDDC-Manager
guestinfo.ntp
vami.searchpath.SDDC-Manager
```

7. Right-click the ***VCF Installer*** VM, select ***Power > Power On***.

8. Wait for the ***VCF Installer VM*** to finishing booting and then move to Part B.

### Part B - Update the VCF Installer within the Linux Console

1. Connect to VCF Installer over SSH and login using the vcf user.

2. Switch to root by running the following command:

```bash
su
```

3. Edit the `/etc/ntp.conf` file and save by running the following command:

```bash
vi /etc/ntp.conf
```

4. Restart the NTP service by running the following command:

```bash
systemctl restart ntpd
```

5. Verify the status of the NTP service by running the following command:

```bash
ntpq -p
```

6. Navigate to the `/etc/systemd/network/` directory by running the following command:

```bash
cd /etc/systemd/network/
```

7. Edit the `10-eth0.network` file and save by running the following command:

```bash
vi 10-eth0.network
```

8. Restart the `systemd-networkd` service by running the following command:

```bash
systemctl restart systemd-networkd
```

### Part C - Verify the New Configuration using the API

**VCF Installer APIs Used**

* POST /v1/tokens
* GET /v1/system/appliance-info

**Procedure**

1. Connect to a system that has access to your infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Installer instance and run the commands in the console.

```bash
export vcfInstallerFqdn='sfo-ins01.sfo.rainpole.io'
export vcfInstallerUser='admin@local'
export vcfInstallerPass='VMw@re1!VMw@re1!'
```

3. Authenticate to VCF Installer and obtain a token by running the following command:

```bash
vcfInstallerToken=$(curl -k -X POST "https://$vcfInstallerFqdn/v1/tokens" \
    --header 'Content-Type:application/json' \
    -d "{\"username\":\"$vcfInstallerUser\", \"password\":\"$vcfInstallerPass\"}" \
    | jq -r '.accessToken')
```

4. Verify you were able to successfully obtain an authentication token by running the following command:

```bash
echo $vcfInstallerToken
```

5. Verify the new configuration by running the following command:

```bash
curl -k -X GET "https://$vcfInstallerFqdn/v1/system/appliance-info" \
  --header "Authorization: ${vcfInstallerToken}" \
  --header "Content-Type:application/json" \
  | jq
```

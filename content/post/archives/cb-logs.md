+++
author = "GaryJBlake"
title = "VMware Cloud Builder - Logging and Log Collection"
date = "2019-04-24"
description = "VMware Cloud Builder - Logging and Log Collection"
tags = [
    "Cloud Builder"
]
categories = [
    "VMware Cloud Builder"
]
series = [

]
+++

VMware Cloud Builder - Logging and Log Collection

VMware Cloud Builder is used to automate the deployment of VMware Cloud Foundation and VMware Validated Designs, during the initial bringup phase both solutions use the same components of the VMware Cloud Builder appliance:

- JsonGenerator - used to take the Excel file and generate the JSON file used by the bringup service
- PlatformAudit - used to perform both validation on the JSON file and the physical environment
- Bringup - orchestration service that carries out the installation and configuration of the VMware components

Each of these components generate log files, should you encounter issues then these log files can be used to perform your troubleshooting and can also be provided to VMware Global Support Services (GSS).

The following illustrates the key path locations:

Component 	Log Name 	Location
JsonGenerator 	jsongenerator-[time-stamp] 	/var/log/vmware/vcf/sddc-support/
PlatformAudit 	platform-audit-[time-stamp] 	/var/log/vmware/vcf/sddc-support/
Bringup Service 	vcf-bringup.log 	/opt/vmware/bringup/logs/
vcf-bringup-debug.log 	/opt/vmware/bringup/logs/
rest-api-debug.log 	/opt/vmware/bringup/logs/
Web UI 	server.log 	/opt/vmware/vvd/vvd-ui/server/user_data/logs/
access.log 	/opt/vmware/vvd/vvd-ui/server/user_data/logs/

In addition to reviewing the log files locally you can also generate a log bundle that can be provided to GSS, this is done using the Supportability and Serviceability Utility (SoS) from the command line of the appliance as follows:

1. Connect to the VMware Cloud Builder Appliance using an SSH utility such as Putty.
2. Login using admin and enter your password.
3. Switch to root using su and enter your password.
4. Change into the SoS Utility folder:

  cd /opt/vmware/sddc-support

5. Execute SoS to collect the logs
 ./sos --cloud-builder-logs 
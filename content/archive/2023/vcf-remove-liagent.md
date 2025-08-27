+++
author = "GaryJBlake"
title = "Remove vRealize Log Insight Agent from SDDC Manager"
date = "2023-07-18"
description = "Remove vRealize Log Insight Agent from SDDC Manager"
tags = [
    "VCF",
    "vRLI"
]
categories = [
    "VMware Cloud Foundation",
    "VMware vRealize Log Insight",
    "VMware Aria Operations for Logs"
]
series = [

]
+++

If you have ever wanted to remove the vRealize Log Insight from VMware Cloud Foundation you may have skipped the step to uninstall the vRealize Log Insight Linux Agent from SDDC Manager, whilst the process is documented in the VMware documentation for vRealize Log Insight under [Uninstall the Log Insight Linux Agent RPM package](https://docs.vmware.com/en/vRealize-Log-Insight/8.10/com.vmware.log-insight.agent.admin.doc/GUID-01946617-34F8-4043-8637-2930FB751778.html) the procedure does not help you establish the version installed so here is a quick blog to tie all the information together.

## Removing the vRealize Log Insight Linux Agent from SDDC Manager

1. Log in to the SDDC Manager appliance using SSH as vcf.

2. Change to the root user by running the following command.

``` bash
su -
```

3. Verify that the VMware Log Insight Linux Agent is installed by running the following command.

``` bash
pgrep liagent
```

4. Verify the installed version by running the following command.

``` bash
rpm -qa | grep Log-Insight-Agent
```

5. Remove the VMware Log Insight Linux Agent by running the following command replacing VERSION and BUILD_NUMBER with the version and build number obtained in step 4.

``` bash
rpm -e VMware-Log-Insight-Agent-VERSION-BUILD_NUMBER
```

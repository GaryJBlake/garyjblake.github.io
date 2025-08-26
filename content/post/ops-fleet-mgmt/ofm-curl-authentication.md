+++
author = "GaryJBlake"
title = "Authentication Using Curl for VCF Operations Fleet Management"
date = "2025-01-28"
description = "Authentication Using Curl for VCF Operations Fleet Management"
tags = [
    "VCF",
    "Public APIs"
]
categories = [
    "VCF Operations Fleet Management"
]
series = [

]
+++

In this post we will look at the process of authenticating to VCF Operations Fleet Management.

**VCF Operations Fleet Management APIs Used**

* GET /lcmversion

### Authenticating to VCF Operations Fleet Management Using Curl

**Procedure**

1. Connect to a Linux based operating system over SSH.
2. Replace the values in the sample code with values for your VCF Operations Fleet Management and run the commands SSH session.

``` Bash
ariaSuiteLifecycleFqdn=$'flt-fm01.rainpole.io'
ariaSuiteLifecycleUser=$'admin@local'
ariaSuiteLifecyclePass=$'VMw@re1!VMw@re1!'
```

3. Connect to VCF Operations Fleet Management with the provided credentials and check the health by running the following command:

``` Bash
curl -k -X GET "https://$ariaSuiteLifecycleFqdn/lcm/health/api/v2/status" -u "$ariaSuiteLifecycleUser:$ariaSuiteLifecyclePass" -H "accept: application/json" -H "Content-Type: application/json"  | json_pp
```

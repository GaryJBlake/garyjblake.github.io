+++
author = "GaryJBlake"
title = "Configure Password Policies for VMware Cloud Foundation"
date = "2023-04-04"
description = "Configure Password Policies for VMware Cloud Foundation"
tags = [
    "API",
    "PowerShell",
	  "VVS"
]
categories = [
    "VMware Validated Solutions",
	  "PowerVCF"
]
series = [

]
+++

In a recent blog ([see here](/post/vvs/vvs-password-policy)) I provided an overview of Password Policy Configuration for VMware Cloud Foundation, in this blog we will take a deep dive on using `Start-PasswordPolicyConfig` which actually performs the configuration of all password policies across the VMware Cloud Foundation instance.

The `Start-PasswordPolicyConfig` cmdlet is part of the [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management) and provides the ability to automate the configuration of password policies using the provided configuration JSON for the following components:

* ESXi
* vCenter Single Sign-On
* vCenter Server
* NSX Manager
* NSX Edge
* SDDC Manager

The cmdlet has the following command line parameters:

CLI Parameters  | Required  | Description
----------------| --------- | ------------------------------------------------------------------------------
sddcManagerFqdn | required  | FQDN for SDDC Manager appliance
sddcManagerUser | required  | User account for SDDC Manager with ADMIN role
sddcManagerPass | required  | Password for the SDDC Manager user
sddcRootPass    | required  | Password of the root account
reportPath      | required  | Folder location where reports are created and configuration JSON file resides
policyFile      | optional  | Name of the configuration JSON file used set the configuration

Now lets take a look at an example of how to run the configuration.

### Configure Password Policies for All Workload Domains

1. Start Windows PowerShell.
2. Change to the report folder.
   ``` PowerShell
   cd F:\Reporting
   ```
3. Generate the configuration JSON with product defaults by running the command in the PowerShell console:
   ``` PowerShell
   Get-PasswordPolicyDefault -generateJson -jsonFile 'passwordPolicyConfig.json'
   ```
4. Open the generated configuration JSON file and updated with desired values and save.
5. Configure the password policies by running the following command in the PowerShell console:
``` PowerShell
Start-PasswordPolicyConfig -sddcManagerFqdn 'sfo-vcf01.sfo.rainpole.io' -sddcManagerUser 'admin@local' -sddcManagerPass 'VMw@re1!VMw@re1!' -sddcRootPass 'VMw@re1!' -reportPath 'F:\Reporting' -policyFile 'PasswordPolicyConfig.json'
```

### Conclusion

Using the `Start-PasswordPolicyConfig` cmdlet contained within the [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management) you can now easily configure the password policies for password expiration, password complexity and account lockout for all components within VMware Cloud Foundation instance.

If you have feedback, suggestions or want to report an issues with using the [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management) visit GitHub and open an [issue](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management/issues/new/choose)

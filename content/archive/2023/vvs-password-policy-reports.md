+++
author = "GaryJBlake"
title = "Generating Password Policy Reports for VMware Cloud Foundation"
date = "2023-02-23"
description = "Generating Password Policy Reports for VMware Cloud Foundation"
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

**Last Updated:** 25-Apr-2023

In a recent blog ([see here](/archive/2023/vvs-password-policy)) I provided an overview of Password Policy Configuration for VMware Cloud Foundation, in this blog we will take a deep dive on using `Invoke-PasswordPolicyManager` to generate the password policy reports.

The `Invoke-PasswordPolicyManager` cmdlet is part of the [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management) and provides the ability to generate two types of HTML reports:

* An HTML report showing the current configuration for password expiration, password complexity and account lockout for each component.
* An HTML report showing the configuration differences for password expiration, password complexity and account lockout for each component.

As well as the two types of report the cmdlet has a number of command line parameters:

CLI Parameters  | Required  | Description
----------------| --------- | ------------------------------------------------------------------------------
sddcManagerFqdn | required  | FQDN for SDDC Manager appliance
sddcManagerUser | required  | User account for SDDC Manager with ADMIN role
sddcManagerPass | required  | Password for the SDDC Manager user
sddcRootPass    | required  | Password of the root account
reportPath      | required  | Folder location where reports are created and configuration JSON file resides
allDomains      | required  | Generate a report for the complete SDDC Manager instance
workloadDomain  | required  | Generate a report for a specific Workload Domain
drift           | optional  | Generate a report and compare against the configuration JSON file
policyFile      | optional  | Name of the configuration JSON file used to compare the configuration
darkMode        | optional  | Generate the HTML report in dark mode
wsaFqdn         | optional  | FQDN for Workspace ONE Access to be included in the report
wsaRootPass     | optional  | User account for Workspace ONE Access with administrator role
wsaAdminPass    | optional  | Password for the Workspace ONE Access  user

Each report is self-contained in that the CSS styling is included as part of the HTML file, this means once generated you can share the report with others without loosing any formatting or content.

Now lets take a look at a few examples.

### Example Report 1 - Password Policy Report for All Workload Domains

For example report 1, we are going to generate the Password Policy Report for all Workload Domains. For this report we use the following command line parameters:

* sddcManagerFqdn
* sddcManagerUser
* sddcManagerPass
* sddcRootPass
* reportPath
* allDomains
* darkMode

**Generate Password Policy Manager Report**

1. Start Windows PowerShell.

``` powershell
Invoke-PasswordPolicyManager -sddcManagerFqdn 'sfo-vcf01.sfo.rainpole.io' -sddcManagerUser 'admin@local' -sddcManagerPass 'VMw@re1!VMw@re1!' -sddcRootPass 'VMw@re1!' -reportPath 'F:\Reporting' -darkMode -allDomains
```

**Console Output - Example Report 1**

This screenshot displays the output of the `Invoke-PasswordPolicyManager` cmdlet on the console.
![](/archive/2023/ppm-report-command.png)

**HTML Report - Example Report 1**

Once the report is ready, if executed on a Windows system the report is automatically opened in the default browser but if run on Linux you have to manually open the HTML file from the reporting folder to view.
![](/archive/2023/ppm-report-html.png)

### Example Report 2 - Password Policy Report with Configuration Drift for All Workload Domains

For example report 2, we are going to generate the Password Policy Report for all Workload Domains with configuration drift. For this report we use the following command line parameters:

* sddcManagerFqdn
* sddcManagerUser
* sddcManagerPass
* sddcRootPass
* reportPath
* allDomains
* darkMode
* drift
* policyFile

Because we are comparing the current configuration of each component against a desired state configuration we must first create a configuration JSON file and then update the values to align to the desired state settings. For this the PowerShell Module for VMware Validated Solutions provides another handy cmdlet called `Get-PasswordPolicyDefault`, this can be used to create the initial JSON file using the VMware product defaults which you then update accordingly.

**Create Configuration JSON File and Generate Password Policy Manager Report with Configuration Drift**

1. Start Windows PowerShell.
2. Change to the report folder.
   ``` PowerShell
   cd F:\Reporting
   ```
3. Run the commands in the PowerShell console
   ``` PowerShell
   Get-PasswordPolicyDefault -generateJson -jsonFile 'passwordPolicyConfig.json'
   ```
4. Open the generated configuration JSON file and updated with desired values and save.
5. Run the commands in the PowerShell console
``` PowerShell
 Invoke-PasswordPolicyManager -sddcManagerFqdn 'sfo-vcf01.sfo.rainpole.io' -sddcManagerUser 'admin@local' -sddcManagerPass 'VMw@re1!VMw@re1!' -sddcRootPass 'VMw@re1!' -reportPath 'F:\Reporting' -darkMode -allDomains -drift -policyFile 'PasswordPolicyConfig.json'
```

**Console Output - Example Report 2**

This screenshot displays the output of the `Invoke-PasswordPolicyManager` cmdlet on the console, you will see its the same as the first report the difference this time is the output generated in the HTML report.
![](/archive/2023/ppm-drift-command.png)

**HTML Report - Example Report 2**

This time when the report is generated we are presented with the same format and layout as that of the standard report, the difference now is that for each parameter displayed its compared against the configuration JSON file and if a difference is found an additional value is shown within [] brackets. The value contained within the [] is the desired state configuration value, if you see these values it means that the system is not compliant with the desired state configuration  and that some reconfiguration work is required.
![](/archive/2023/ppm-drift-html.png)

### Conclusion

Using the `Invoke-PasswordPolicyManager` cmdlet contained within the [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management) you can now easily generate a report to capture the current state configuration of all components across a VMware Cloud Foundation instance, and you can also compare the configuration against the desired state configuration to identify remediation work.

If you have feedback, suggestions or want to report an issues with using the [PowerShell Module for VMware Cloud Foundation Password Management](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management) visit GitHub and open an [issue](https://github.com/vmware/powershell-module-for-vmware-cloud-foundation-password-management/issues/new/choose)

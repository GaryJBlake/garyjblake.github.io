+++
author = "GaryJBlake"
title = "End-to-End Automation of Identity and Access Management Validated Solution"
date = "2022-01-13"
description = "End-to-End Automation of Identity and Access Management Validated Solution"
tags = [
    "API",
    "PowerShell",
	"VVS",
	"IAM"
]
categories = [
    "VMware Validated Solutions",
	"PowerVCF"
]
series = [

]
+++

If your not already familiar with the [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation) Validated Solution it’s primary purpose is to provide customers a consistent way of integrating the foundational components of VMware Cloud Foundation (vCenter Server, NSX-T Data Center and SDDC Manager) with an organizations identify provider delivering operational consistency and flexibility.

The Identity and Access Management solution achieves this by connecting components using Active Directory over LDAP/LDAPS and utilizing  Active Directory Global Groups to assign individual component level role access and then nested Global Groups to assign a collection of roles based on personas.

The roles and personas documented ([here](https://docs.vmware.com/en/VMware-Cloud-Foundation/services/vcf-identity-and-access-management-v1/GUID-52BDCCC7-6B90-4C8B-AE81-9663945FB925.html)) should be considered as a minimum requirement when implementing the Identity and Access Management solution but there is nothing stopping customers adding more granular roles where possible or even personas that better align with their own organizations roles and responsibilities.

Now you have a better understanding of what the Identity and Access Management for VMware Cloud Foundation Validated Solution provides let’s look at how we can automate the implementation. Each Validated Solution provides both UI and Infrastructure-as-code based procedures. The Infrastructure-as-code method is delivered through the use of a PowerShell module specifically created to support Validated Solutions called [PowerValidatedSolutions](https://www.powershellgallery.com/packages/PowerValidatedSolutions), each UI based procedure has a PowerShell cmdlet equivalent that not only performs the operation but ensures pre and post validation checks are performed to provide robustness.

Included with the PowerValidatedSolution PowerShell module which can be installed directly from the Microsoft PS Gallery there is a **SampleScripts** folder and contained within that a folder named **iam** which contains sample **.ps1** script files. These sample scripts demonstrate linking multiple procedures into a single executable script using the Planning and Preparation Workbook as the input for all data.  

For the Identity and Access Management solution this is broken down into three phases and therefore three scripts as follows:

- vSphere and SDDC Manager
- Workspace ONE Access
- NSX-T Data Center

As already mentioned the scripts use the Planning and Preparation Workbook to obtain all the required inputs, this is the first step in the execution. The script checks that the path provided to the workbook is valid and then opens the workbook, reading the required information using named cells. 

Once that step is complete it begins the process of executing each procedure based on the order of steps defined within the implementation guide.

In addition to providing the main cmdlets supporting the validated solution implementation procedures a number of cmdlets are included that provide supporting capabilities which are utilised by the scripts. 

- ***Start-SetupLogFile*** - this cmdlet is used to configure a log file where the output of each step is logged. 
- ***Write-LogMessage*** - this cmdlet is used to format the output of messages both to the console and log file.
- ***Debug-CatchWriter*** - this cmdlet is used to provide a consistent way of displaying exception errors should they occur. 

For each procedure executed by the script, the output is captured into variables and then redirected to the Write-LogMessage cmdlet for display to the console and log in a consistent way. There are three types of output messages :

- **INFO** - Used for informational messages and successful execution of a procedure. 
- **WARNING** - Used when a procedure is skipped due to the process already being executed. 
- **ERROR** - Used to display a failure along with the failure reason. 

Let’s now take a deeper look at the scripts. 

### vSphere and SDDC Manager (iamConfigureVsphere.ps1)

The **iamConfigureVsphere.ps1** script automates all the procedures associated with ESXi, vCenter Server and SDDC Manager. This includes:

- Add Identity Provider to vCenter Server. This adds Active Directory over LDAP or LDAPS to vCenter Server making Active Directory users and groups available to both vCenter Server and SDDC Manager for assigning access control. 
- Assign Global Permissions. This assigns the vCenter Server Administrator and Read Only  roles to corresponding groups in Active Directory. 
- Assign Single Sign-On Permissions. This assigns the Single Sign-On Administrator role to a corresponding group in Active Directory. 
- Configure vCenter Server Appliance password expiration policy. 
- Configure Single Sign-On password and lockout polices. 
- Assign SDDC Manager Roles. This assigns the Admin, Operator and Viewer roles to corresponding groups in Active Directory. 
- Configure ESXi password and lockout polices.

Execution of the **iamConfigureVsphere.ps1** script is performed by using the following command:
```
.\SampleScripts\iam\iamConfigureVsphere.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

### Workspace ONE Access (iamConfigureWorkspaceOne.ps1)

The **iamConfigureWorkspaceOne.ps1** script automates the deployment and configuration of Workspace ONE Access. This includes:

- Creating a Virtual Machine folder in vCenter Server. 
- Deploying the Workspace ONE Access .ova. 
- Performing the configuration of Workspace ONE Access:
	- Initial configuration. This assigns the root, admin and sshuser credentials. 
	- Configure NTP settings. 
	- Configure SMTP server settings. 
	- Install a signed-certificate. 
	- Configure password policy. 
- Add Identity Provider to Workspace ONE Access. This adds Active Directory over LDAP or LDAPS to Workspace ONE Access making Active Directory users and groups available. 
- Assign Workspace ONE Access Permissions. This assigns the Super Admin, Directory Admin and Read Only Admin to corresponding groups in Active Directory.
- Create VM Group. This creates a VM Group in vCenter Server and assigns the Workspace ONE Access virtual machine to it. 

Execution of the **iamConfigureWorkspaceOne.ps1** script is performed by using the following command:

``` powershell
.\SampleScripts\iam\iamConfigureWorkspaceOne.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

### NSX-T Data Center (iamConfigureNsx.ps1)

The **iamConfigureNsx.ps1** script automates the integration between the NSX Managers and Workspace ONE Access. Whilst it is possible to configure NSX-T Data Center with a direct connection to Active Directory over LDAP, the Identity and Access Management solution uses Workspace ONE Access which provides additional methods for connecting to authentication sources. This includes:

- Enable Integration between NSX Manager and Workspace ONE Access. 
- Assign NSX-T Data Center Permissions. This assigns Enterprise Admin, Network Engineer and Auditor roles to corresponding groups in Active Directory for both the Management and Workload Domains. 
- Configure Authentication Policies. This configure the authentication policies on the NSX Manager and NSX Edge Nodes for both the Management and Workload Domains. 
- Create a custom role in vCenter Server. 
- Assign Single Sign-On Permissions. This assigns the License Administration role to the NSX Manager service account used by SDDC Manager. 
- Reduce vCenter Server Permissions. This reduces the permissions a specific vCenter Server service account has for other vCenter Servers within the Single Sign-On domain.

Execution of the **iamConfigureNsx.ps1** script is performed by using the following command:

``` powershell
.\SampleScripts\iam\iamConfigureNsx.ps1 -sddcManagerFqdn sfo-vcf01.sfo.rainpole.io -sddcManagerUser administrator@vsphere.local -sddcManagerPass VMw@re1! -workbook F:\vvs\PnP.xlsx -filePath F:\vvs
```

After execution of these scripts in the order described above, and assuming that each step completed successfully your environment is fully configured based on the design and implementation procedures documented within the [Identity and Access Management for VMware Cloud Foundation](https://core.vmware.com/identity-and-access-management-vmware-cloud-foundation) Validated Solution.

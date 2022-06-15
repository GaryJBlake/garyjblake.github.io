+++
author = "GaryJBlake"
title = "Fixing Expired Passwords on NSX Manager and Edge Nodes"
date = "2022-06-16"
description = "Fixing Expired Passwords on NSX Manager and Edge Nodes"
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

By default NSX-T Data Center passwords (root, admin and audit) on the NSX Manager and NSX Edge nodes are set to expire after 90 days. Unless you rotate passwords on regular basis you may have overlooked this default configuration and suddenly find yourself locked out of being able to perform management tasks.

Firstly in more recent releases, VMware Cloud Foundation provides the ability to perform scheduled or manual password rotations something to consider looking into from a day-to-day operational process but if your passwords have already expired all bets are off as the VMware Cloud Foundation password rotation workflow can no longer authenticate. Thinking the password rotation feature may be a way out very quickly presents you with the following error message:

<table>
    <tr>
        <th style="text-align:left;">Description</th>
        <td>Password update for resource : sfo-m01-nsx01.sfo.rainpole.io, user : admin and credential type : API</td>
    </tr>
    <tr>
        <th style="text-align:left;">Message</th>
        <td>Failed to get NSXT user details</td>
    </tr>
    <tr>
        <th style="text-align:left;">Remediation Message</th>
        <td>Please verify that the account is active and is not locked. If the password of the account has expired, manually reset the password in the product and then perform a REMEDIATE operation in the SDDC Manager, to update its stored copy of the password.</td>
    </tr>
    <tr>
        <th style="text-align:left;">Reference Token</th>
        <td>HDDF8C</td>
    </tr>
   <tr>
        <th style="text-align:left;">Cause</th>
        <td>The credentials were incorrect or the account specified has been locked.</td>
    </tr>
</table>

In a fairly small deployment the process of resetting the passwords is not a speedy process, for example in a Standard Architecture deployment of VMware Cloud Foundation with a single NSX Edge Cluster deployed in each Workload Domain the NSX Appliance count is already a total of ten (10). Not withstanding this, personally I found very little information on the internet that explained a single end-to-end process or in fact the best approach in order to rectify the situation. For example the message from VMware Cloud Foundation itself suggests a number of steps, including the remediate option which frankly just adds further time to the process.

Because of this I decided to spend a little bit of time investigating the options with a view to documenting what I found to be the fastest approach to get things unblocked. In essence this really boils down to adjusting the expiration policy to never expire initially, it removes the need to manually update all of the passwords and then perform remediation within VMware Cloud Foundation and once your unblocked you can either continue using the original passwords and the never expire policy setting or look to use a combination of VMware Cloud Foundation scheduled password rotations and a complementary expiration timeline.

Let's take a look at the process I followed in my lab, which involves a combination of nsxcli commands executed on the console and some cmdlets that have been recently added to PowerValidatedSolutions which use the NSX REST APIs.

## Resolving Expired Passwords for an NSX Management Cluster

The first step in the process is unlocking the NSX Management Cluster, this has to be done through a console on one of the NSX Manager appliances, the good news though is that as this is a cluster you only need to make the change on one of the NSX Manager nodes.

1. Login to the Management Domain vCenter Server.
2. Open a remote or web console to the first NSX Manager node of the cluster.
3. Login using the root account and the original password.
4. You will be prompted to change the password immediately, follow the on-screen prompts to change the root password.
5. Now your authenticated we can disable password expiry for each account using the following sudo commands (pay careful attention to the syntax):
``` bash
su admin '-c clear user admin password-expiration'
```

``` bash
su admin '-c clear user audit password-expiration'
```

``` bash
su admin '-c clear user root password-expiration'
```

6. Now the accounts are set to no longer expire, we reset the root account back to the original password also using a sudo command:
``` bash
   su admin '-c set user root password VMw@re1!VMw@re1! old-password VMware123!VMware123!'
```

7. All accounts should be available for connection using the original passwords.

## Resolving Expired Passwords for NSX Edge Nodes

The second step in the process is to unlock the NSX Edge Nodes, for this process now we have the admin account of the NSX Manager working again we can use the NSX REST APIs to simplify the process. In this procedure we use a number of PowerShell cmdlets that have been included in PowerValidatedSolutions, you could simply use the APIs directly on the command line but having the APIs wrapped in PowerShell cmdlets simplifies the process for many.

Ensure you have followed the prerequisites for installing the PowerValidatedSolutions PowerShell module and have it installed.

1. Start Windows PowerShell.

2. Replace the values in the sample code with values for the instance of VMware Cloud Foundation and run the commands in the PowerShell console.

``` powershell
$nsxtManagerFqdn = "sfo-m01-nsx01.sfo.rainpole.io"
$nsxtManagerUser = "admin"
$nsxtManagerPass = "VMw@re1!VMw@re1!"
```
	 
3. Perform the configuration by running the command in the PowerShell console.

``` powershell
Request-NsxToken -fqdn $nsxtManagerFqdn -username $nsxtManagerUser -password $nsxtManagerPass
$transportNodeIds = (Get-NsxtEdgeCluster).members.transport_node_id
$userIds = @("0","10000","10002")
foreach ($id in $transportNodeIds ) {
    foreach ($userId in $userIds) {
        Set-NsxtApplianceUserExpirationPolicy -userId $userId -days 0 -transportNodeId $id
    }
}
``` 

4. All your NSX Edge Node accounts should also now be unblocked and set to never expire.
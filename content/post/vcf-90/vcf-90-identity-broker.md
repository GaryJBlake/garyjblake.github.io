+++
author = "GaryJBlake"
title = "VMware Cloud Foundation 9.0: Setting Up VCF Single Sign-On with OpenLDAP"
date = "2025-09-11"
description = "VMware Cloud Foundation 9.0: Setting Up VCF Single Sign-On with OpenLDAP"
tags = [
    "VCF",
    "SSO",
    "LDAP"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF Identity Broker",
    "VCF Single Sign-On"
]
series = [

]
+++

VMware Cloud Foundation 9.0 introduced the new VCF Identity Broker component to provide the totally revamped VCF Single Sign-On capability which provides single sign-on across VCF Operations, vCenter, NSX Manager, VCF Operations for logs, VCF Operations for networks, VCF Operations HCX and VCF Automation. VMware Cloud Foundation 9.0 added support for Ping Identity and Generic SAML 2.0 providers in addition to Okta, Microsoft Entra ID, Microsoft Active Directory, Microsoft ADFS and OpenLDAP.

When it comes to Role Based Access Control (RBAC) we've typically used Microsoft Active Directory within our lab setups to provide group, service account and user access across the VMware Cloud Foundation platform. The biggest downside of this being the need to deploy at least one Windows Server virtual machine, this isn't a significant issue generally but it does require a Windows Server license. For this reason we recently took a look at OpenLDAP as an alternative.

In this post we discuss the high-level steps for getting VCF Identity Broker up and running as well as provide some more details steps as they pertain to using OpenLDAP as the Identity Provider of choice.

### High-level Steps for Configuring VCF Identity Broker and VCF Single Sign-On

The following high-level steps should be followed to successfully deploy and configure VCF Identity Broker, for the most part the official Broadcom Technical Documentation is pretty good so I'm not going to document all of these procedures instead use the links provided to take you directly to the relevant part of the VMware Cloud Foundation 9.0 documentation.

1. [Deploy VCF Identity Broker appliance](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/deployment/deploying-a-new-vmware-cloud-foundation-or-vmware-vsphere-foundation-private-cloud-/manual-deployment-of-components-to-complete-your-vcf-platform/installing-vcf-identity-broker.html#GUID-0eafc123-11e5-4983-84bf-95d5d24c60ad-en_id-915ca638-7020-4655-d9aa-6cdc9909d6c3)
2. [Select a VCF Instance for which you want to configure VCF Single Sign-On](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/select-a-vcf-instance.html)
3. [Choose the deployment mode you wish to use](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/choose-the-deployment-mode.html)
4. [Select and configure the identity provider](#configuring-openldap-as-an-identity-provider) (*Documented as part of this post*)
5. [Configure VCF Single Sign-On for NSX and vCenter](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/connect-components.html)
6. [Modify the Identity Provider Sync Settings](#modify-the-identity-provider-sync-settings) (*Documented as part of this post*)
7. [Configure VCF Single Sign-On for VCF Operations and VCF Automation](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/configure-vmware-cloud-foundation-sso-for-the-operations-and-automation-appliance(1).html)
8. [(Optional) Configure VCF Single Sign-On for other VCF Components](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/configure-vmware-cloud-foundation-sso--as-a-client-for-other-components.html)
9. [Assign required roles and permissions for users or groups](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/assigning-roles-and-permissions.html)

The following two sections provide more detailed step-by-step guidance around the OpenLDAP configuration specifically based on my own lab.

### Configuring OpenLDAP as an Identity Provider

Whilst the official Broadcom Technical Documentation for [Configure OpenLDAP as an Identity Provider](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/cofigure-vmware-cloud-foundation-identity-provider/configure-vmware-cloud-foundation-identity-provider-for-open-ldap.html) could be followed, I wanted to highlight some specifics of the procedure so I've duplicated the steps here.

---
**NOTE**

First key point to call out here is to make sure you apply the following prerequisite to your OpenLDAP configuration otherwise you will have issues.

*Ensure that the `memberOf` overlay is activated in the OpenLDAP server. For information about activating `memberOf` overlay, see [OpenLDAP Overlays](https://www.openldap.org/doc/admin24/overlays.html).*

---

1. Log in to the VCF Operations interface at *https://<vcf_operations_fqdn>* as a user assigned Administrator role.

2. In the main navigation select **Fleet Management > Identity & Access**.

3. From the **Identity & Access** navigation, select **SSO Overview**.

4. From the **Enable Single Sign-On** page, click the **Start** button against the **Configure Identity Provider** option.

5. From the **Choose Identity Provider** section, select **OpenLDAP** from the list and click **Next**.

6. From the **Configure the Identity Provider** section, click **Configure**.

7. On the **Directory Details** screen, enter the following details and click **Next**.

| Setting                                       | Value                                     |
| --------------------------------------------- | ----------------------------------------- |
| Directory name                                | mycloudyworld                             |
| Primary domain controller                     | ldap://10.167.173.100                     |
| Directory search attribute                    | Custom Attribute                          |
| Custom directory search attribute for Users   | uid                                       |
| Custom directory search attribute for Groups  | cn                                        |
| Base DN                                       | dc=mycloudyworld,dc=io                    |
| Bind user name                                | cn=svc-vcf-ldap,dc=mycloudyworld,dc=io    |
| Bind user password                            | VMw@re1!VMw@re1!                          |

5. On the **LDAP Configuration** screen, accept the default values and click **Next**.

6. On the **Review** screen, review the details you have added for the configuration and click **Finish**.

7. On the **Configure User and Group Provisioning** screen, click **Configure**.

8. On the **Directory Review Information** screen, click **Next**.

9. On the **Attributes Mappings** screen, enter the following details and click **Next**.

| Setting           | Value             |
| ----------------- | ----------------- |
| userName          | uid               |
| firstName         | givenName         |
| lastName          | sn                |
| distinguishedName | dn                |
| employeeID        | (leave blank)     |
| email             | mail              |
| userPrincipalName | userPrincipalName |

10. On the **Group Provisioning** screen, enter a base group DN `dc=mycloudyworld,dc=io` and click **Select Base Group DN**.

11. Select all the groups that you want to be visible in the VCF Identity Broker and click **Next**.

12. On the **User Provisioning** screen, do not select any users and click **Next**.

13. On the **Review** screen, review the configuration and click **Finish**.

14. Click **Done**.

15. Now perform [Configure VCF Single Sign-On for NSX and vCenter](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/fleet-management/what-is/setting-up-sso/connect-components.html).

### Modify the Identity Provider Sync Settings

1. Log in to the VCF Operations interface at *https://<vcf_operations_fqdn>* as a user assigned Administrator role.

2. In the main navigation select **Fleet Management > Identity & Access**.

3. From the **Identity & Access** navigation, select **VCF Instances > Instance with Identity Source**.

4. Under **Directory Information**, select the radio button for *mycloudyworld* and click **Edit**.

5. In the **mycloudyworld** navigation, select **Sync Settings**.

6. On the *Sync Settings* screen, click **Edit**.

7. Change the **Sync Frequency** to **Every 15 Minutes** and click **Save**.

### Conclusion

Use this post as a reference to help configure VCF Identity Broker with OpenLDAP as the Identity Provider.

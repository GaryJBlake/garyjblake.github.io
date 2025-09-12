+++
author = "GaryJBlake"
title = "VMware Cloud Foundation 9.0: Setting Up Custom LDAP Service for an Organization in VCF Automation"
date = "2025-09-18"
description = "VMware Cloud Foundation 9.0: Setting Up Custom LDAP Service for an Organization in VCF Automation"
tags = [
    "VCF",
    "SSO",
    "LDAP"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF Automation"
]
series = [

]
+++

If you have looked at VCF Automation in any detail you may be aware that you can configure one or more external identity providers (IdPs), and import users and groups to your organizations. This configuration can use an LDAP server connection which can be configured at either the system or the organization level, a SAML integration at the organization level, or an OpenID Connect (OIDC) integration at the organization level.

In one of my recent posts [VMware Cloud Foundation 9.0: Setting Up VCF Single Sign-On with OpenLDAP](/post/vcf-90/vcf-90-identity-broker) I talked about setting up VCF Single Sign-On using the VCF Identity Broker component and OpenLDAP as the Identity Provider. As a follow on from that I decided to look at setting up OpenLDAP as an authentication source at the organizational level with a view to being able to demonstrate having completely separate authentication sources across organizations.

Official Broadcom Technical Documentation exists but in my view its not very detailed and lacks some critical detail, for reference you can view the following documents:

* [Configure an Organization LDAP Connection in Your VCF Automation](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/provider-management/managing-identity-providers-in-vcd/managing-ldap-connections/configure-an-organization-ldap-connection.html)
* [Edit, Test, and Synchronize an LDAP Connection Using Your VCF Automation Provider Management Portal](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/provider-management/managing-identity-providers-in-vcd/managing-ldap-connections/edit-test-and-synchronize-an-ldap-connection-in-your-vcd.html)

Let's take a look at the high-level process which consists of the following steps:

1. Configuring an LDAP Identity Provider for an Organization
2. Assign Organization Access Control

### Configuring an LDAP Identity Provider for an Organization

In this procedure we walk through the process of configuring a custom LDAP Service and perform a simple test to validate the connection details.

**Procedure**

1. Log in to the VCF Automation Provider interface at *https://<vcf_automation_fqdn>/provider* as a user assigned System Administrator role.

2. In the main navigation select **Infrastructure > Organizations**.

3. Click the three dots next to the organization and click **Launch Organizational Portal**.

4. Select the **Administer** tab.

5. In the main navigation select **Connections > Identity Providers**.

6. In the **Identity Providers** page, click the **LDAP** tab.

7. Click **Configure**.

8. In the **Edit LDAP Options** dialog, select the **Custom LDAP Service** radio button and click **Save**.

9. Under **LDAP**, click the **Custom LDAP** tab.

10. Click **Edit**.

11. On the **Edit Custom LDAP** screen, select the **Connection** tab and enter the following details.

| Setting               | Value                                         |
| ------------------------- | ----------------------------------------- |
| Server                    | mycloudyworld                             |
| Port                      | 389                                       |
| Base Distinguished Name   | dc=mycloudyworld,dc=io                    |
| Connector Type            | OpenLDAP                                  |
| Authentication Method     | Simple                                    |
| User Name                 | cn=svc-vcf-ldap,dc=mycloudyworld,dc=io    |
| Password                  | VMw@re1!VMw@re1!                          |

12. On the **Edit Custom LDAP** screen, select the **User Attributes** tab and enter the following details.

| Setting                       | Value             |
| ----------------------------- | ----------------- |
| Object Class                  | inetOrgPerson     |
| Unique identifier             | entryUUID         |
| User name                     | uid               |
| Display name                  | cn                |
| Given name                    | givenName         |
| Surname                       | sn                |
| Email                         | mail              |
| Telephone                     | telephoneNumber   |
| Group membership identifier   | dn                |
| Group back link               | (blank)           |

13. On the **Edit Custom LDAP** screen, select the **Group Attributes** tab and enter the following details.

| Setting                       | Value             |
| ----------------------------- | ----------------- |
| Object Class                  | groupOfNames      |
| Unique identifier             | entryUUID         |
| Name                          | cn                |
| Member                        | member            |
| Group membership identifier   | dn                |
| Group back link identifier    | (blank)           |

14. Click **Save**.

15. Click **Test**.

16. On the **Test LDAP** dialog, enter the password and click **Test**.

17. On the **Test LDAP** dialog, verify each object has a green tick and click **Cancel**.

18. Click **Sync**.

19. On the **Synchronize LDAP** dialog, click **Sync**.

### Assign Organization Access Control

Now we have the Custom LDAP Service configured we can assign access to groups from the Identity Provider based on one of the following roles:

* Organization Administrator
* Organization Auditor
* Organization User

**Procedure**

1. Log in to the VCF Automation Provider interface at *https://<vcf_automation_fqdn>/provider* as a user assigned System Administrator role.

2. In the main navigation select **Infrastructure > Organizations**.

3. Click the three dots next to the organization and click **Launch Organizational Portal**.

4. Select the **Administer** tab.

5. In the main navigation select **Access Control**.

6. In the **Access Control** page, click the **Groups** tab.

7. Click **Import Groups**.

8. On the **Import Groups** dialog, enter the group name in the search text box.

9. Select the group you want to assign with a role.

10. Using the dropdown list under **Assign Role**, select **Organization User** and click **Save**.

### Conclusion

Use this post as a reference to help configure a Customer LDAP Service for a VCF Automation Organization.

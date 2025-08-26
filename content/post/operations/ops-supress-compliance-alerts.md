+++
author = "GaryJBlake"
title = "VCF Operations 9.0: Managing Alert Definitions"
date = "2025-07-21"
description = "VCF Operations 9.0: Managing Alert Definitions"
tags = [
    "VCF",
    "VCF Operations"
]
categories = [
    "VCF Operations"
]
series = [

]
+++

### Excluding Triggered Alerts from a Policy

1. Log in to the VCF Operations interface at *https://<vcf_operations_fqdn>* with a user assigned the `Administrator` role.

2. In the navigation pane, click **Infrastructure Operations > Configurations**.

3. On the **Configurations** page, under **Alerts**, click **Alert Definitions**.

4. Use the filters to locate the alert definition you want exclude from the default policy.

5. Click the ellipses next to the alert definition and click **Edit**.

6. On the **Edit Alert Definition** page, click **4 - Policies**.

7. Uncheck the **Default Policy** checkbox and click **Update**.

### Alternative Method For Excluding Triggered Alerts from a Policy

1. Log in to the VCF Operations interface at *https://<vcf_operations_fqdn>* with a user assigned the `Administrator` role.

2. In the navigation pane, click **Security > Compliance**.

3. On the **Compliance** page, select the compliance tile that has **Non-Compliant** items.

4. In the **Compliance Alerts List**, expand an alert.

5. Select the checkbox for an alert within the alert grouping.

6. From the **Action** menu, select **Go to Alert Definition**.

7. Click the ellipses next to the alert definition and click **Edit**.

8. On the **Edit Alert Definition** page, click **4 - Policies**.

9. Uncheck the **Default Policy** checkbox and click **Update**.

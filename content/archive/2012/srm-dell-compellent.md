+++
author = "GaryJBlake"
title = "SRM 5 & Dell Compellent Best Practice Procedures"
date = "2012-06-07"
description = "SRM 5 & Dell Compellent Best Practice Procedures"
tags = [
    "SRM",
    "Dell Compellent"
]
categories = [
    "Site Recovery Manager"
]
series = [

]
+++

I was recently involved in an engagement to implement Site Recovery Manager (SRM) 5 with a Dell Compellent storage solution. During the engagement we had various issues around how to implement the Dell components. Dell have produced a best practice document but some elements of the document are a little light on the ground. This blog is a collection of tested procedures that we followed to prove the solution.

### **Setting up the Environment**

During our testing we setup the environment using the following steps:

1. Set up the LUNs and replication using Compellent Enterprise Manager client.
2. Save the restore points using Enterprise Manager client. This is a manual process that Dell talks about within their Best Practice guide and must be done after all major SRM events.
3. Set up datastores in vSphere and present them to the appropriate hosts.
4. Create a Protection Group(s) in SRM for the newly created datastores.
5. Create a Recovery Plan(s) in SRM for the newly created datastores.
6. Configure SRM debug logging in both Data Collectors to collect SRM information. (We did this step in order to capture detailed logging to provide Dell if required.)
7. Confirmed that the SiteA SRA was talking to the remote data collector (hosted in SiteA) and the SiteB SRA was talking to primary data collector (hosted in SiteB, as per Compellent Best Practice.

---
**NOTE**

This configuration is not 100% clear in the best practice document and we were provided conflicting information from Dell Support when we asked for verification, the document did not define Primary vs Remote Data Collectors and simply referred to Enterprise Manager in both sites.

---

### Defining the Failover Procedure

We defined the following procedure to be run during a failover type of ***Disaster Recovery***:

1. Run the Recovery Plan, selecting **Disaster Recovery** as the recovery type.
2. Save the restore points using Enterprise Manager client, ignoring the inactive ones flagged.

---
**NOTE**

The Compellent Best Practice document says that these can be removed, but our testing showed that this created errors at the re-protect stage so we skipped this process.

---

3. Re-protect (to reverse replication)
4. Save the restore points using Enterprise Manager client.

### Defining the Failback Procedure

We defined the following procedure to be run during a failback type of ***Disaster Planned Migration***:

1. Run the same Recovery Plan as used for the Failover procedure, selecting **Planned Migration** as the recovery type.
2. Save the restore points using Enterprise Manager client, ignoring the inactive ones flagged.

---
**NOTE**

The Compellent Best Practice document says that these can be removed, but our testing showed that this created errors at the re-protect stage so we skipped this process.

---

3. Re-protect (to reverse replication).
4. Save the restore points using Enterprise Manager client.

### **Test Scenarios**

After defining the procedures we then carried out the following tests to verify the process.

### Test 1 - Both Compellent Enterprise Manager Data Collectors Running

Ensuring both data collectors were up and running, the failover procedure was run for the following scenarios:
* DR from SiteB to SiteA, virtual machine TESTVM001, hosted on datastore SRMTest_1
* DR from SiteA to SiteB, virtual machine TESTVM001, hosted on datastore SRMTest_2

Both failovers completed without error, so we then followed the failback procedure to bring everything back to where it started.
Both failback procedures completed without error.

### Test 2 - Primary Data Collector Shut Down

Shutting down the primary data collector hosted at SiteB, we simulated a failure of SiteB and then ran the following scenario:
* DR from SiteB to SiteA, virtual machine TESTVM001, hosted on datastore SRMTest_1

The failover completed successfully, but with a number of errors at the following stages of the recovery plan:

* Pre-Synchronise Storage
* Prepare Protected Site FMs for Migration
* Synchronise Storage

None of these errors were fatal but they did mean that a re-protect of the protection group could not be completed until they had been resolved. This meant running a second Recovery once the Primary data collector was back online, this then completed successfully and then allowed a re-protect to run.

With both data collectors online, the failback procedure was then run to bring everything back to where it started. This completed without error.

### Test 3 -  Remote Data Collector Shut Down

Shutting down the remote data collector hosted in SiteA, we simulated a failure of SiteA and then ran the following scenario:
* DR from SiteA to SiteB, virtual machine TESTVM002, hosted on datastore SRMTest_2

This failover completed successfully, but with the same non-critical errors as seen in test 2 along the way. Resolution was the same as test 2, bringing the remote data collector back online and then running a second Recovery. This completed successfully and allowed a re-protect to run.

With both data collectors online, the failback procedure was then run to bring everything back to where it started. This completed without error.
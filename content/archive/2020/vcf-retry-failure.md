+++
author = "GaryJBlake"
title = "VMware Cloud Foundation - Retrying a Failed Workflow"
date = "2020-12-04"
description = "VMware Cloud Foundation - Retrying a Failed Workflow"
tags = [
    "VCF"
]
categories = [
    "VMware Cloud Foundation"
]
series = [

]
+++

This week I was doing some testing in my home lab, and purely by accident I entered some details incorrect into the VI Configuration Wizard which walks you through the inputs to deploy a Workload Domain in VMware Cloud Foundation. I had wrongly entered the FQDN of the Management Domain vCenter Server instead of the new Workload Domain vCenter server, I didn't notice this until I found the deployment task in a failed state.

For those not familiar with VMware Cloud Foundation when a task fails SDDC Manager does give you the ability to retry the task from the Task list but unfortunately it does not give you the opportunity to modify any of the input data.
![](/archive/2020/vcf-failed-task.png)

At first I thought I was in no man's land and would not be able to complete the new Workload Domain deployment but after talking to a colleague who referred me to this [KB70602 article](https://kb.vmware.com/s/article/70602) as a reference I proceeded to attempt translating the procedure and test in my setup. Low and behold it worked and I was able to recover from my issue and complete the deployment, so I thought I would document the steps here in case it helps get someone else out of jail.

**Procedure**

1. In the SDDC Manager UI, navigate to the Task list and click the failed task to see the sub-tasks.<
![](/archive/2020/vcf-failed-task-detail.png)

2. In the browser URL make a note of the workflow ID of the task.
![](/archive/2020/vcf-failed-taskid.png)

3. Connect to the SDDC Manager appliance using and SSH client such as Putty using the vcf user.

4. Enter <strong>su</strong> to switch to the root user and enter the password.

5. Obtain the Workflow Spec information by running the following command, using the Workflow ID from Step 2.
``` bash
curl -s http://localhost/domainmanager/internal/vault/1faab6e8-4dfb-46bb-8860-8133df44b196 | json_pp > /tmp/workflow.json
```

6. Edit the Workload Spec json, and replace the input details that are incorrect.
``` bash
vi /tmp/workflow.json
```

7. Update the Workflow Spec by passing the edited json file with the new details by running the following command.
``` bash 
curl -H 'Content-Type:text/plain' -X PUT http://localhost/domainmanager/internal/vault/1faab6e8-4dfb-46bb-8860-8133df44b196 -d @/tmp/workflow.json
```

8. In the SDDC Manager UI, navigate to the Task list and click Retry Task for the failed workflow.

Your workflow should now complete.

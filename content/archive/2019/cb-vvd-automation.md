+++
author = "GaryJBlake"
title = "Introducing VMware Cloud Builder, Automated Deployment of VMware Validated Designs"
date = "2019-01-23"
description = "Introducing VMware Cloud Builder, Automated Deployment of VMware Validated Designs"
tags = [
    "Cloud Builder",
    "VVD"
]
categories = [
    "VMware Validated Design",
    "VMware Cloud Builder"
]
series = [

]
+++

On January 23rd 2019 I posted the below blog article on [blogs.vmware.com](https://blogs.vmware.com/cloud-foundation/2019/01/23/introducing-vmware-cloud-builder-automated-deployment-of-vmware-validated-designs/).

### Blog Post from blogs.vmware.com

On January 22nd the Integrated Systems Business Unit (ISBU) released version 1.0 of VMware Cloud Builder a free virtual appliance that allows our customers to  automate the deployment of VMware Validated Designs. In this post I will  provide some background history and provide a bit of detail as to  exactly what VMware Cloud Builder is and how it can be used.

### History

Nearly four years ago, the ISBU embarked on a journey to develop a  blueprint architecture for implementing a Software-Defined Data Center  (SDDC) and thus VMware Validated Designs were born. As you can imagine  the work involved to validate the blueprint required the team to  repeatedly tear down and build up environments to validate operationally  and develop the documentation we have come to know and love, an idea of  using automation was hatched and a small team of developers set about  building a tool that became known internally as VVD Deployment Toolkit  (DTK). A short time after its inception whilst working for another team  outside of the ISBU I convinced my now manager to release the DTK to  VMware Professional Services and for around two and half years they used  the DTK to implement many VMware Validated Design deployments  delivering faster time-to-value for our customers. About twelve months  ago we took the decision to migrate all of the automation from DTK over  into the same orchestration engine that is used by VMware Cloud  Foundation and with the release of VMware Validated Design v4.3 we  replaced DTK with VMware Cloud Builder however this continued to be only  made available for internal ISBU use and VMware Professional Services  only until now….

### What is VMware Cloud Builder?

VMware Cloud Builder is an appliance distributed as an Open Virtualization Appliance (OVA) package that manages the orchestration of deployment and configuration of an SDDC platform that adheres to the  blueprint set out by VMware Validated Designs. What this means is that it’s not a general-purpose automation tool for just laying down some VMware products but rather it configures them based on the VMware Validated Design chosen. Once the appliance has been deployed you upload the VMware Validated  Design Software Bundle which is a single ISO file containing all the VMware product binaries defined for that release of the VMware Validated Design, upload signed-certificates generated using CertGen (see [KB 2146215](https://kb.vmware.com/s/article/2146215)) run the reconfigure.sh script to mount the ISO and perform some configuration steps and your all set. Only requirement is that you own the licenses for each component that is deployed and that you need to gather the deployment configuration using the relevant Deployment Parameters XLS file for the architecture, these can be download from [my.vmware.com](https://my.vmware.com/group/vmware/info?slug=datacenter_cloud_infrastructure/vmware_validated_design_for_software_defined_data_center/5_0) or directly from the VMware Cloud Builder appliance once deployed.

The VMware Validated Design Software Bundle contains the following VMware software binaries:

- VMware ESXi
- VMware vCenter Server
- VMware NSX for vSphere
- VMware vRealize Suite Lifecycle Manager
- VMware vRealize Operations Manager
- Management Packs for vRealize Operations Manager
- VMware vRealize Log Insight
- Content Packs for vRealize Log Insight
- VMware vRealize Automation
- VMware vRealize Business for Cloud
- VMware Site Recovery Manager
- VMware vSphere Replication

### What architectures can I deploy with VMware Cloud Builder?

The VMware Validated Designs support a number of different  architectures that have been developed to support different customer  profiles. VMware Cloud Builder has been developed to be flexible enough  to handle these different architectures and today supports the  following:

- VMware Validated Design for Software-Defined Data Center – Region A
- VMware Validated Design for Software-Defined Data Center – Region B
- VMware Validated Design for Management and Workload Consolidation

![](/archive/2019/cb-web-ui.png) <figcaption>Home Page - VMware Cloud Builder User Interface</figcaption> 

### What is the Deployment Parameters XLS File?

When deploying the VMware Validated Designs using VMware Cloud Builder we provide levels of flexibility in that we can configure using customer defined naming conventions for objects such as hostnames, datacenters, clusters, datastores as well as allocation of IP addresses  and networks. This customer specific information is captured in the  excel workbook known as the Deployment Parameters XLS file.

The process of gathering this custom configuration involves siting  down and populating the relevant Deployment Parameters XLS file. The  configuration gathering process has been developed using an excel  workbook as it provides the most flexible method for data gathering due  to its portability and ease of updates.

The Deployment Parameters XLS file consists of a number of worksheets  or tabs, each defined to collect specific types of data typically  aligned with the discussions you have during the data gathering process  with the target audiences such as roles and responsibilities within the  organization.

The Deployment Parameters XLS file contains the following worksheets:

- Prerequisites Checklist – contains details concerning the preparation phase of the deployment and used to track the status of the preparation work.
- Management Workloads – from a data gathering stand-point used to capture the license keys used by each VMware solution. Also contains a footprint breakdown of all the management component virtual machines deployed as part of the architecture for reference.
- Users and Groups – captures service accounts and groups in Active Directory that are required by the deployment as well as all the passwords that are used.
- Hosts and Networks – captures all VLAN configuration details pertaining to the environment and the configuration details for each ESXi host.
- Deployment Parameters – captures product specific configuration options exposed for customization including hostnames, IP address, Active Directory, DNS and NTP configuration, vCenter objects and more.
- vRA Configuration – captures configuration details that should be applied to a tenant that is created within vRealize Automation.
- Run Parameters – provides the ability to manipulate how VMware Cloud Builder implements the SDDC platform such as instructing it to not use VSAN or not deploying a specific product.
- CertConfig – auto populated worksheet that pulls the required details for using the CertConfig utility to automate the creation of the configuration files used by CertGen to generate the signed certificates across all VMware solutions.
![](/archive/2019/cb-xls.png) <figcaption>Microsoft Excel - Deployment Parameter Workbook</figcaption>

### How does this all come together?

Now we have a better understanding of VMware Cloud Builder and the  supporting files that are available for download from my.vmware.com  let’s describe the end-to-end workflow. The general flow is as follows:

* Prepare the environment by performing all the prerequisites as documented in the Deployment Guides:
    1. Prepare ESXi hosts
    2. Prepare UMDS virtual machine
    3. Prepare vRealize Automation IaaS Master VM
    4. Prepare SQL Server for vRealize Automation
    5. Prepare Site Recovery Manager
    6. Generate signed certificates
* Populate the Deployment Parameters XLS file.
* Download and deploy the VMware Cloud Builder appliance
    1. Upload the software bundle
    2. Upload the signed certificates
* Deploy the Software-Defined Data Center
    1. Generate the JSON file
    2. Audit the deployment parameters and target environment
    3. Deploy the Software-Defined Data Center
* Perform manual post-deployment procedures

As you can see VMware Cloud Builder drastically reduces the  procedures for deploying an SDDC platform allowing you to focus more of  your time on delivering business benefits.

### Conclusion

With the release of VMware Cloud Builder, customers have a new tool  to automate the deployment of a VMware Validated Design. Using VMware  Cloud Builder not only accelerates the time to value for our customers,  but it also ensures consistency with the VMware Validated Design from a  deployment, configuration and operational readiness perspective.
+++
author = "GaryJBlake"
title = "Automate VMware Cloud Foundation 9.0 with OpenAPI"
date = "2025-09-04"
description = "Automate VMware Cloud Foundation 9.0 with OpenAPI"
tags = [
    "VCF",
    "Public APIs"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF Installer",
    "SDDC Manager"
]
series = [

]
+++

If like me you're always looking for opportunities to replace manual repetitive steps with automation then this post is for you! Here I've documented the location of various OpenAPI specification files for components of VMware Cloud Foundation 9.0 which can be downloaded directly from their appliances and imported into your favorite REST API tool such as Postman. Alternatively, you can also obtain the JSON files conforming to the OpenAPI 3.0.1 standard for VMware Cloud Foundation directly from the following GitHub [github.com/vmware/vcf-api-specs](https://github.com/vmware/vcf-api-specs) repository.

### OpenAPI JSON File Appliance Locations

| Component                       | Path                                                                      | File                                                   |
| ------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------ |
| VCF Installer                   | /opt/vmware/vcf/sddc-manager-ui-app/vcf-installer-ui/assets               | vcf-installer-openapi.json                             |
| SDDC Manager                    | /opt/vmware/vcf/sddc-manager-ui-app/vcf-installer-ui/assets               | swagger.json                                           |
| VCF Operations                  | /usr/lib/vmware-vcops/tomcat-enterprise/webapps/suite-api/docs/openapi/v3 | public-api.json                                        |
| VCF Operations logs             | /usr/lib/loginsight/application/3rd_party/apache-tomcat/webapps/ROOT/loginsight/api/swagger | swagger_v2_supported_deprecated.json |

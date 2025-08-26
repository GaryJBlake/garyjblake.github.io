+++
author = "GaryJBlake"
title = "Using VMware.Sdk.Vcf.SddcManager: Commands for SDDC Manager in PowerCLI"
date = "2025-07-17"
description = "Using VMware.Sdk.Vcf.SddcManager: Commands for SDDC Manager in PowerCLI"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI",
    "SDDC Manager"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI",
    "SDDC Manager"
]
series = [

]
+++

VCF PowerCLI 9.0 now includes a module called `VMware.Sdk.Vcf.SddcManager`, this modules contains auto-generated cmdlets to support SDDC Manager Public APIs. Use can use this post as a quick reference guide.

### Connecting to a SDDC Manager Instance with Local Credentials

1. Start a PowerShell session.

2. Connect to a SDDC Manager instance using local credentials by running the following command:

``` powershell
Connect-VcfSddcManagerServer -Server sfo-vcf01.sfo.rainpole.io -User administrator@vsphere.local -Password VMw@re1!VMw@re1!
```

3. Once connected the following information is stored in `$defaultSddcManagerConnections`.

``` bash
ServiceUri     : https://sfo-vcf01.sfo.rainpole.io/
SessionSecret  : <sessionSecret>
User           : administrator@vsphere.local
IsConnected    : True
Id             : /VcfSddcManagerServer=administrator@vsphere.local@sfo-vcf01.sfo.rainpole.io:443/
Name           : sfo-vcf01.sfo.rainpole.io
Uid            : /VcfSddcManagerServer=administrator@vsphere.local@sfo-vcf01.sfo.rainpole.io:443/
ProductVersion : 9.0.0.0.24703748
ServerUri      : https://sfo-vcf01.sfo.rainpole.io/
UUID           : /VcfSddcManagerServer=administrator@vsphere.local@sfo-vcf01.sfo.rainpole.io:443/
Port           : 443
```

4. Disconnect from a SDDC Manager instance by running the following command:

``` powershell
Disconnect-VcfSddcManagerServer -Server sfo-vcf01.sfo.rainpole.io
```

### Display All SDDC Manager GET Command Details

1. Start a PowerShell session.

2. Display all GET cmdlets supported in `VMware.Sdk.Vcf.SddcManager` by running the following command:

``` powershell
Get-VcfSddcManagerOperation -Method Get | Select-Object CommandInfo, Path, Method
```

3. Output for all GET cmdlets in `VMware.Sdk.Vcf.SddcManager`.

| Command Info                                          | Path                                                                             | Method
| ------------------------------------------------------| ---------------------------------------------------------------------------------| ------
| Invoke-VcfGetALBCluster                               | /v1/nsx-alb-clusters/{id}                                                        | GET
| Invoke-VcfGetALBClusters                              | /v1/nsx-alb-clusters                                                             | GET
| Invoke-VcfGetALBClustersFormFactors                   | /v1/nsx-alb-clusters/form-factors                                                | GET
| Invoke-VcfGetALBClustersFormFactors1                  | /v1/alb-clusters/form-factors                                                    | GET
| Invoke-VcfGetAviLBCluster                             | /v1/alb-clusters/{id}                                                            | GET
| Invoke-VcfGetAviLBClusters                            | /v1/alb-clusters                                                                 | GET
| Invoke-VcfGetClusterCapacityForALBDeployment          | /v1/alb-clusters/cluster-capacity                                                | GET
| Invoke-VcfGetBackupConfiguration                      | /v1/system/backup-configuration                                                  | GET
| Invoke-VcfGetBackupLocation                           | /v1/system/backup-configuration/backup-locations                                 | GET
| Invoke-VcfGetRestoreTask                              | /v1/restores/tasks/{id}                                                          | GET
| Invoke-VcfGetBrownfieldSyncTaskById                   | /v1/domains/{domainId}/synchronizations/{taskId}                                 | GET
| Invoke-VcfGetBundle                                   | /v1/bundles/{id}                                                                 | GET
| Invoke-VcfGetBundleDownloadStatus                     | /v1/bundles/download-status                                                      | GET
| Invoke-VcfGetBundles                                  | /v1/bundles                                                                      | GET
| Invoke-VcfGetBundlesForSkipUpgrade                    | /v1/bundles/domains/{id}                                                         | GET
| Invoke-VcfGetCeipStatus                               | /v1/system/ceip                                                                  | GET
| Invoke-VcfDownloadCSR                                 | /v1/domains/{id}/csrs/downloads                                                  | GET
| Invoke-VcfGetCSRs                                     | /v1/domains/{id}/csrs                                                            | GET
| Invoke-VcfGetCertificateAuthorities                   | /v1/certificate-authorities                                                      | GET
| Invoke-VcfGetCertificateAuthorityById                 | /v1/certificate-authorities/{id}                                                 | GET
| Invoke-VcfGetCertificatesByDomain                     | /v1/domains/{id}/resource-certificates                                           | GET
| Invoke-VcfGetDomainCertificates                       | /v1/domains/{id}/certificates                                                    | GET
| Invoke-VcfGetResourceCertificatesValidationByID       | /v1/domains/{id}/resource-certificates/validations/{validationId}                | GET
| Invoke-VcfGetLastAssessmentRunInfo                    | /v1/system/check-sets                                                            | GET
| Invoke-VcfGetResult                                   | /v1/system/check-sets/{runId}                                                    | GET
| Invoke-VcfGetCluster                                  | /v1/clusters/{id}                                                                | GET
| Invoke-VcfGetClusterCreateValidation                  | /v1/clusters/validations/{id}                                                    | GET
| Invoke-VcfGetClusterDatastores                        | /v1/clusters/{id}/datastores                                                     | GET
| Invoke-VcfGetClusterImageCompliance                   | /v1/clusters/{id}/image-compliance                                               | GET
| Invoke-VcfGetClusterNetworkConfigurationCriteria      | /v1/clusters/{id}/network/criteria                                               | GET
| Invoke-VcfGetClusterNetworkConfigurationQueryResponse | /v1/clusters/{id}/network/queries/{queryId}                                      | GET
| Invoke-VcfGetClusterTagManagerUrl                     | /v1/clusters/{id}/tags/tag-manager                                               | GET
| Invoke-VcfGetClusterUpdateValidation                  | /v1/clusters/{id}/validations/{validationId}                                     | GET
| Invoke-VcfGetClusters                                 | /v1/clusters                                                                     | GET
| Invoke-VcfGetDatastoreCriterion1                      | /v1/clusters/{id}/datastores/criteria/{name}                                     | GET
| Invoke-VcfGetDatastoreQueryResponse1                  | /v1/clusters/{clusterId}/datastores/queries/{queryId}                            | GET
| Invoke-VcfGetDatastoresCriteria1                      | /v1/clusters/{id}/datastores/criteria                                            | GET
| Invoke-VcfGetHostCriteria                             | /v1/clusters/{id}/hosts/criteria                                                 | GET
| Invoke-VcfGetHostCriterion                            | /v1/clusters/{id}/hosts/criteria/{name}                                          | GET
| Invoke-VcfGetHostQueryResponse1                       | /v1/clusters/{clusterId}/hosts/queries/{queryId}                                 | GET
| Invoke-VcfGetTagAssignableForCluster                  | /v1/clusters/{id}/tags/assignable-tags                                           | GET
| Invoke-VcfGetTagsAssignedToCluster                    | /v1/clusters/{id}/tags                                                           | GET
| Invoke-VcfGetTagsAssignedToClusters                   | /v1/clusters/tags                                                                | GET
| Invoke-VcfGetVdses                                    | /v1/clusters/{clusterId}/vdses                                                   | GET
| Invoke-VcfGetCompatibilityMatrices                    | /v1/compatibility-matrices                                                       | GET
| Invoke-VcfGetCompatibilityMatrix                      | /v1/compatibility-matrices/{compatibilityMatrixSource}                           | GET
| Invoke-VcfGetCompatibilityMatrixContent               | /v1/compatibility-matrices/{compatibilityMatrixSource}/content                   | GET
| Invoke-VcfGetCompatibilityMatrixMetadata              | /v1/compatibility-matrices/{compatibilityMatrixSource}/metadata                  | GET
| Invoke-VcfGetComplianceAudit                          | /v1/compliance-audits/{complianceAuditId}                                        | GET
| Invoke-VcfGetComplianceAuditForADomain                | /v1/domains/{id}/compliance-audits/{complianceAuditId}                           | GET
| Invoke-VcfGetComplianceAuditHistory                   | /v1/compliance-audits                                                            | GET
| Invoke-VcfGetComplianceAuditHistoryForADomain         | /v1/domains/{id}/compliance-audits                                               | GET
| Invoke-VcfGetComplianceAuditItems                     | /v1/compliance-audits/{complianceAuditId}/compliance-audit-items                 | GET
| Invoke-VcfGetComplianceAuditItemsForADomain           | /v1/domains/{id}/compliance-audits/{complianceAuditId}/compliance-audit-items    | GET
| Invoke-VcfGetComplianceAuditTask                      | /v1/domains/{id}/compliance-audits/tasks/{taskId}                                | GET
| Invoke-VcfGetComplianceConfigurations                 | /v1/compliance-configurations                                                    | GET
| Invoke-VcfGetComplianceStandards                      | /v1/compliance-standards                                                         | GET
| Invoke-VcfGetConfigs                                  | /v1/config-drifts                                                                | GET
| Invoke-VcfGetReconciliationTask                       | /v1/config-drift-reconciliations/{taskId}                                        | GET
| Invoke-VcfGetCredential                               | /v1/credentials/{id}                                                             | GET
| Invoke-VcfGetCredentialTaskByResourceID               | /v1/credentials/tasks/{id}/resource-credentials                                  | GET
| Invoke-VcfGetCredentials                              | /v1/credentials                                                                  | GET
| Invoke-VcfGetCredentialsSubTask                       | /v1/credentials/tasks/{id}/subtasks/{subtaskId}                                  | GET
| Invoke-VcfGetCredentialsTask                          | /v1/credentials/tasks/{id}                                                       | GET
| Invoke-VcfGetCredentialsTasks                         | /v1/credentials/tasks                                                            | GET
| Invoke-VcfGetPasswordExpirationByTaskID               | /v1/credentials/expirations/{id}                                                 | GET
| Invoke-VcfGetDepotSettings                            | /v1/system/settings/depot                                                        | GET
| Invoke-VcfGetDepotSyncInfo                            | /v1/system/settings/depot/depot-sync-info                                        | GET
| Invoke-VcfDomainCreateValidation                      | /v1/domains/validations/{id}                                                     | GET
| Invoke-VcfGetAssignableTagsForDomain                  | /v1/domains/{id}/tags/assignable-tags                                            | GET
| Invoke-VcfGetClusterCriteria                          | /v1/domains/{domainId}/clusters/criteria                                         | GET
| Invoke-VcfGetClusterCriterion                         | /v1/domains/{domainId}/clusters/criteria/{name}                                  | GET
| Invoke-VcfGetClusterQueryResponse                     | /v1/domains/{domainId}/clusters/{clusterName}/queries/{queryId}                  | GET
| Invoke-VcfGetClustersQueryResponse                    | /v1/domains/{domainId}/clusters/queries/{queryId}                                | GET
| Invoke-VcfGetDatastoreCriterion                       | /v1/domains/{domainId}/datastores/criteria/{name}                                | GET
| Invoke-VcfGetDatastoreQueryResponse                   | /v1/domains/{domainId}/datastores/queries/{queryId}                              | GET
| Invoke-VcfGetDatastoresCriteria                       | /v1/domains/{domainId}/datastores/criteria                                       | GET
| Invoke-VcfGetDomain                                   | /v1/domains/{id}                                                                 | GET
| Invoke-VcfGetDomainCapabilities                       | /v1/domains/capabilities                                                         | GET
| Invoke-VcfGetDomainCapabilitiesByDomainId             | /v1/domains/{id}/capabilities                                                    | GET
| Invoke-VcfGetDomainDatacenters                        | /v1/domains/{id}/datacenters                                                     | GET
| Invoke-VcfGetDomainEndpoints                          | /v1/domains/{id}/endpoints                                                       | GET
| Invoke-VcfGetDomainIsolationPrecheckStatus            | /v1/domains/{domainId}/isolation-prechecks/{precheckId}                          | GET
| Invoke-VcfGetDomainTagManagerUrl                      | /v1/domains/{id}/tags/tag-manager                                                | GET
| Invoke-VcfGetDomainUpdateValidation                   | /v1/domains/{id}/validations/{validationId}                                      | GET
| Invoke-VcfGetDomains                                  | /v1/domains                                                                      | GET
| Invoke-VcfGetTagsAssignedToDomain                     | /v1/domains/{id}/tags                                                            | GET
| Invoke-VcfGetTagsAssignedToDomains                    | /v1/domains/tags                                                                 | GET
| Invoke-VcfGetFIPSConfiguration                        | /v1/system/security/fips                                                         | GET
| Invoke-VcfGetCustomPatches                            | /v1/releases/domains/{domainId}/custom-patches                                   | GET
| Invoke-VcfGetCustomPatchesBySku                       | /v1/releases/custom-patches                                                      | GET
| Invoke-VcfGetReleaseComponentsBySku                   | /v1/releases/{sku}/release-components                                            | GET
| Invoke-VcfGetAssignableTagForHost                     | /v1/hosts/{id}/tags/assignable-tags                                              | GET
| Invoke-VcfGetCriteria                                 | /v1/hosts/criteria                                                               | GET
| Invoke-VcfGetCriterion                                | /v1/hosts/criteria/{name}                                                        | GET
| Invoke-VcfGetHost                                     | /v1/hosts/{id}                                                                   | GET
| Invoke-VcfGetHostCommissionValidationByID             | /v1/hosts/validations/{id}                                                       | GET
| Invoke-VcfGetHostQueryResponse                        | /v1/hosts/queries/{id}                                                           | GET
| Invoke-VcfGetHostTagManagerUrl                        | /v1/hosts/{id}/tags/tag-manager                                                  | GET
| Invoke-VcfGetHosts                                    | /v1/hosts                                                                        | GET
| Invoke-VcfGetHostsPrechecksResponse                   | /v1/hosts/prechecks/{id}                                                         | GET
| Invoke-VcfGetTagsAssignedToHost                       | /v1/hosts/{id}/tags                                                              | GET
| Invoke-VcfGetTagsAssignedToHosts                      | /v1/hosts/tags                                                                   | GET
| Invoke-VcfGetIdentityPrecheckResult                   | /v1/identity-broker/prechecks                                                    | GET
| Invoke-VcfGetIdentityProviderById                     | /v1/identity-providers/{id}                                                      | GET
| Invoke-VcfGetIdentityProviders                        | /v1/identity-providers                                                           | GET
| Invoke-VcfGetSddcWs1bOidcInfo                         | /v1/identity-broker/sddc-manager-oidc                                            | GET
| Invoke-VcfGetDomainLicensingInfo                      | /v1/licensing-info/domains/{id}                                                  | GET
| Invoke-VcfGetLicenseCheckResultByID                   | /v1/resources/license-checks/{id}                                                | GET
| Invoke-VcfGetLicenseInformation                       | /v1/licensing-info                                                               | GET
| Invoke-VcfGetLicenseKey                               | /v1/license-keys/{key}                                                           | GET
| Invoke-VcfGetLicenseKeys                              | /v1/license-keys                                                                 | GET
| Invoke-VcfGetLicenseProductTypes                      | /v1/license-keys/product-types                                                   | GET
| Invoke-VcfGetSystemLicensingInfo                      | /v1/licensing-info/system                                                        | GET
| Invoke-VcfGetManifest                                 | /v1/manifests                                                                    | GET
| Invoke-VcfGetNsxCluster                               | /v1/nsxt-clusters/{id}                                                           | GET
| Invoke-VcfGetNsxClusterQueryResponse                  | /v1/nsxt-clusters/queries/{id}                                                   | GET
| Invoke-VcfGetNsxClusters                              | /v1/nsxt-clusters                                                                | GET
| Invoke-VcfGetNsxCriteria                              | /v1/nsxt-clusters/criteria                                                       | GET
| Invoke-VcfGetNsxCriterion                             | /v1/nsxt-clusters/criteria/{name}                                                | GET
| Invoke-VcfGetNsxIpAddressPool                         | /v1/nsxt-clusters/{nsxt-cluster-id}/ip-address-pools/{name}                      | GET
| Invoke-VcfGetNsxIpAddressPools                        | /v1/nsxt-clusters/{nsxt-cluster-id}/ip-address-pools                             | GET
| Invoke-VcfGetNsxTransportZones                        | /v1/nsxt-clusters/{nsxt-cluster-id}/transport-zones                              | GET
| Invoke-VcfGetProjects                                 | /v1/nsxt-clusters/{nsxtClusterId}/projects                                       | GET
| Invoke-VcfGetValidationResult                         | /v1/nsxt-clusters/ip-address-pools/validations/{id}                              | GET
| Invoke-VcfGetVpcConfiguration                         | /v1/nsxt-clusters/{nsxt-cluster-id}/vpc-configuration                            | GET
| Invoke-VcfGetVpcConnectivityProfiles                  | /v1/nsxt-clusters/{nsxtClusterId}/projects/{projectId}/vpc-connectivity-profiles | GET
| Invoke-VcfGetNetworkOfNetworkPool                     | /v1/network-pools/{id}/networks/{networkId}                                      | GET
| Invoke-VcfGetNetworkPool                              | /v1/network-pools                                                                | GET
| Invoke-VcfGetNetworkPoolByID                          | /v1/network-pools/{id}                                                           | GET
| Invoke-VcfGetNetworksOfNetworkPool                    | /v1/network-pools/{id}/networks                                                  | GET
| Invoke-VcfGetNotifications                            | /v1/notifications                                                                | GET
| Invoke-VcfGetEdgeCluster                              | /v1/edge-clusters/{id}                                                           | GET
| Invoke-VcfGetEdgeClusterQueryCriteria                 | /v1/edge-clusters/{edgeClusterId}/criteria                                       | GET
| Invoke-VcfGetEdgeClusterValidationByID                | /v1/edge-clusters/validations/{id}                                               | GET
| Invoke-VcfGetEdgeClusters                             | /v1/edge-clusters                                                                | GET
| Invoke-VcfGetPsc                                      | /v1/pscs/{id}                                                                    | GET
| Invoke-VcfGetPscs                                     | /v1/pscs                                                                         | GET
| Invoke-VcfGetPersonalities                            | /v1/personalities                                                                | GET
| Invoke-VcfGetPersonality                              | /v1/personalities/{personalityId}                                                | GET
| Invoke-VcfGetProductVersionCatalog                    | /v1/product-version-catalog                                                      | GET
| Invoke-VcfGetProductVersionCatalogContent             | /v1/product-version-catalogs                                                     | GET
| Invoke-VcfGetProductVersionCatalogUploadTask          | /v1/product-version-catalogs/upload-tasks/{taskId}                               | GET
| Invoke-VcfGetProxyConfiguration                       | /v1/system/proxy-configuration                                                   | GET
| Invoke-VcfGetFutureReleases                           | /v1/releases/domains/{domainId}/future-releases                                  | GET
| Invoke-VcfGetReleases                                 | /v1/releases                                                                     | GET
| Invoke-VcfGetSystemRelease                            | /v1/releases/system                                                              | GET
| Invoke-VcfGetRepositoryImagesQueryResponse            | /v1/vcenters/repository-images/queries/{queryId}                                 | GET
| Invoke-VcfGetResourceFunctionalities                  | /v1/resource-functionalities                                                     | GET
| Invoke-VcfGetResourcesFunctionalitiesAllowedGlobal    | /v1/resource-functionalities/global                                              | GET
| Invoke-VcfGetResourceWarning                          | /v1/resource-warnings/{id}                                                       | GET
| Invoke-VcfGetResourceWarnings                         | /v1/resource-warnings                                                            | GET
| Invoke-VcfExportHealthCheckByID                       | /v1/system/health-summary/{id}/data                                              | GET
| Invoke-VcfExportSupportBundleByID                     | /v1/system/support-bundles/{id}/data                                             | GET
| Invoke-VcfGetHealthCheckStatus                        | /v1/system/health-summary/{id}                                                   | GET
| Invoke-VcfGetHealthCheckTask                          | /v1/system/health-summary                                                        | GET
| Invoke-VcfGetSupportBundleStatus                      | /v1/system/support-bundles/{id}                                                  | GET
| Invoke-VcfGetSupportBundleTask                        | /v1/system/support-bundles                                                       | GET
| Invoke-VcfGetSddcManagerUpgradables                   | /v1/sddc-manager/upgradables                                                     | GET
| Invoke-VcfGetLocalOsUserAccounts                      | /v1/sddc-manager/local-os-user-accounts                                          | GET
| Invoke-VcfGetSddcManager                              | /v1/sddc-managers/{id}                                                           | GET
| Invoke-VcfGetSddcManagerHistory                       | /v1/sddc-managers/{id}/history                                                   | GET
| Invoke-VcfGetSddcManagers                             | /v1/sddc-managers                                                                | GET
| Invoke-VcfGetApplianceInfo                            | /v1/system/appliance-info                                                        | GET
| Invoke-VcfGetSystemConfiguration                      | /v1/system                                                                       | GET
| Invoke-VcfGetSystemVcfManagementComponents            | /v1/system/vcf-management-components                                             | GET
| Invoke-VcfGetDnsConfiguration                         | /v1/system/dns-configuration                                                     | GET
| Invoke-VcfGetNtpConfiguration                         | /v1/system/ntp-configuration                                                     | GET
| Invoke-VcfGetValidationOfDnsConfiguration             | /v1/system/dns-configuration/validations/{id}                                    | GET
| Invoke-VcfGetValidationOfNtpConfiguration             | /v1/system/ntp-configuration/validations/{id}                                    | GET
| Invoke-VcfGetValidationsOfDNSConfiguration            | /v1/system/dns-configuration/validations                                         | GET
| Invoke-VcfGetValidationsOfNtpConfiguration            | /v1/system/ntp-configuration/validations                                         | GET
| Invoke-VcfGetDomainReleaseViewValidation              | /v1/releases/domains/validations/{validationId}                                  | GET
| Invoke-VcfGetReleaseByDomain                          | /v1/releases/domains/{domainId}                                                  | GET
| Invoke-VcfGetReleaseByDomains                         | /v1/releases/domains                                                             | GET
| Invoke-VcfGetTask                                     | /v1/tasks/{id}                                                                   | GET
| Invoke-VcfGetTasks                                    | /v1/tasks                                                                        | GET
| Invoke-VcfGetTrustedCertificates                      | /v1/sddc-manager/trusted-certificates                                            | GET
| Invoke-VcfGetNsxUpgradeResources                      | /v1/upgradables/domains/{domainId}/nsxt                                          | GET
| Invoke-VcfGetUpgradables                              | /v1/system/upgradables                                                           | GET
| Invoke-VcfGetUpgradablesByDomain                      | /v1/upgradables/domains/{domainId}                                               | GET
| Invoke-VcfGetUpgradablesClusters                      | /v1/upgradables/domains/{domainId}/clusters                                      | GET
| Invoke-VcfGetUpgradeById                              | /v1/upgrades/{upgradeId}                                                         | GET
| Invoke-VcfGetUpgradePrecheckByID                      | /v1/upgrades/{upgradeId}/prechecks/{precheckId}                                  | GET
| Invoke-VcfGetUpgradePreview                           | /v1/upgrades/preview                                                             | GET
| Invoke-VcfGetUpgrades                                 | /v1/upgrades                                                                     | GET
| Invoke-VcfGetLocalAccount                             | /v1/users/local/admin                                                            | GET
| Invoke-VcfGetRoles                                    | /v1/roles                                                                        | GET
| Invoke-VcfGetSSODomainEntities                        | /v1/sso-domains/{sso-domain}/entities                                            | GET
| Invoke-VcfGetSSODomains                               | /v1/sso-domains                                                                  | GET
| Invoke-VcfGetUiUsers                                  | /v1/users/ui                                                                     | GET
| Invoke-VcfGetUsers                                    | /v1/users                                                                        | GET
| Invoke-VcfGetVcfManagementComponents                  | /v1/vcf-management-components                                                    | GET
| Invoke-VcfGetVcfManagementComponentsLatestTask        | /v1/vcf-management-components/tasks/latest                                       | GET
| Invoke-VcfGetVcfManagementComponentsTaskByID          | /v1/vcf-management-components/tasks/{taskId}                                     | GET
| Invoke-VcfGetVcfManagementComponentsTaskSpec          | /v1/vcf-management-components/tasks/{taskId}/spec                                | GET
| Invoke-VcfGetVcfManagementComponentsTasks             | /v1/vcf-management-components/tasks                                              | GET
| Invoke-VcfGetVcfManagementComponentsValidationsById   | /v1/vcf-management-components/validations/{validationId}                         | GET
| Invoke-VcfGetVcenter                                  | /v1/vcenters/{id}                                                                | GET
| Invoke-VcfGetVcenters                                 | /v1/vcenters                                                                     | GET
| Invoke-VcfGetVsanHealthCheckByDomain                  | /v1/domains/{domainId}/health-checks                                             | GET
| Invoke-VcfGetVsanHealthCheckByQueryID                 | /v1/domains/{domainId}/health-checks/queries/{queryId}                           | GET
| Invoke-VcfGetVsanHealthCheckByTaskID                  | /v1/domains/{domainId}/health-checks/tasks/{taskId}                              | GET
| Invoke-VcfGetVsanHclAttributes                        | /v1/vsan-hcl/attributes                                                          | GET
| Invoke-VcfGetVsanHclConfiguration                     | /v1/vsan-hcl/configuration                                                       | GET
| Invoke-VcfGetVasaProvider                             | /v1/vasa-providers/{id}                                                          | GET
| Invoke-VcfGetVasaProviderStorageContainers            | /v1/vasa-providers/{id}/storage-containers                                       | GET
| Invoke-VcfGetVasaProviderUser                         | /v1/vasa-providers/{id}/users                                                    | GET
| Invoke-VcfGetVasaProviderValidation                   | /v1/vasa-providers/validations/{id}                                              | GET
| Invoke-VcfGetVasaProviders                            | /v1/vasa-providers                                                               | GET
| Invoke-VcfGetVcfService                               | /v1/vcf-services/{id}                                                            | GET
| Invoke-VcfGetVcfServices                              | /v1/vcf-services                                                                 | GET
| Invoke-VcfGetVersionAliasConfiguration                | /v1/system/settings/version-aliases                                              | GET

### Display All SDDC Manager POST Command Details

1. Start a PowerShell session.

2. Display all POST cmdlets supported in `VMware.Sdk.Vcf.SddcManager` by running the following command:

``` powershell
Get-VcfSddcManagerOperation -Method Post | Select-Object CommandInfo, Path, Method
```

3. Output for all POST cmdlets in `VMware.Sdk.Vcf.SddcManager`.

| Command Info                                       | Path                                                  | Method
| ---------------------------------------------------| ------------------------------------------------------| ------
| Invoke-VcfCreateALBCluster                         | /v1/nsx-alb-clusters                                  | POST
| Invoke-VcfDeployALBCluster                         | /v1/alb-clusters                                      | POST
| Invoke-VcfValidateALBClusterCreationSpec           | /v1/nsx-alb-clusters/validations                      | POST
| Invoke-VcfValidateALBCompatibility                 | /v1/alb-clusters/compatibility/validations            | POST
| Invoke-VcfValidateALBControllerClusterCreationSpec | /v1/alb-clusters/validations                          | POST
| Invoke-VcfValidateNsxALBCompatibility              | /v1/nsx-alb-clusters/validations/version              | POST
| Invoke-VcfStartBackup                              | /v1/backups/tasks                                     | POST
| Invoke-VcfStartRestore                             | /v1/restores/tasks                                    | POST
| Invoke-VcfValidateBackupConfigurationsOperations   | /v1/system/backup-configuration/validations           | POST
| Invoke-VcfSynchronization                          | /v1/domains/{domainId}/synchronizations               | POST
| Invoke-VcfUploadBundle                             | /v1/bundles                                           | POST
| Invoke-VcfQueryCheckSets                           | /v1/system/check-sets/queries                         | POST
| Invoke-VcfTriggerCheckRun                          | /v1/system/check-sets                                 | POST
| Invoke-VcfAddDatastoreToCluster                    | /v1/clusters/{id}/datastores                          | POST
| Invoke-VcfCreateCluster                            | /v1/clusters                                          | POST
| Invoke-VcfGetClusterNetworkConfiguration           | /v1/clusters/{id}/network/queries                     | POST
| Invoke-VcfImportVdsToInventory                     | /v1/clusters/{clusterId}/vdses                        | POST
| Invoke-VcfPostDatastoreQuery1                      | /v1/clusters/{id}/datastores/queries                  | POST
| Invoke-VcfPostHostQuery                            | /v1/clusters/{id}/hosts/queries                       | POST
| Invoke-VcfValidateClusterCreationSpec              | /v1/clusters/validations                              | POST
| Invoke-VcfValidateClusterUpdateSpec                | /v1/clusters/{id}/validations                         | POST
| Invoke-VcfValidateVsanRemoteDatastoreMountSpec     | /v1/clusters/{clusterId}/datastores/validations       | POST
| Invoke-VcfValidateVsanRemoteDatastoreSpec          | /v1/clusters/{clusterId}/datastores/validation        | POST
| Invoke-VcfComplianceAudit                          | /v1/domains/{id}/compliance-audits                    | POST
| Invoke-VcfReconcileConfigs                         | /v1/config-drift-reconciliations                      | POST
| Invoke-VcfGetPasswordExpiration                    | /v1/credentials/expirations                           | POST
| Invoke-VcfCreateDomain                             | /v1/domains                                           | POST
| Invoke-VcfPerformDomainIsolationPrecheck           | /v1/domains/{domainId}/isolation-prechecks            | POST
| Invoke-VcfPostClusterQuery                         | /v1/domains/{domainId}/clusters/{clusterName}/queries | POST
| Invoke-VcfPostClustersQuery                        | /v1/domains/{domainId}/clusters/queries               | POST
| Invoke-VcfPostDatastoreQuery                       | /v1/domains/{domainId}/datastores/queries             | POST
| Invoke-VcfValidateDomainCreationSpec               | /v1/domains/validations                               | POST
| Invoke-VcfValidateDomainUpdateSpec                 | /v1/domains/{id}/validations                          | POST
| Invoke-VcfCommissionHosts                          | /v1/hosts                                             | POST
| Invoke-VcfPostHostsPrechecks1                      | /v1/hosts/prechecks                                   | POST
| Invoke-VcfPostQuery                                | /v1/hosts/queries                                     | POST
| Invoke-VcfValidateCommissionHosts                  | /v1/hosts/validations/commissions                     | POST
| Invoke-VcfValidateHostCommissionSpec               | /v1/hosts/validations                                 | POST
| Invoke-VcfAddEmbeddedIdentitySource                | /v1/identity-providers/{id}/identity-sources          | POST
| Invoke-VcfAddExternalIdentityProvider              | /v1/identity-providers                                | POST
| Invoke-VcfGenerateSyncClientToken                  | /v1/identity-providers/{id}/sync-client               | POST
| Invoke-VcfAddLicenseKey                            | /v1/license-keys                                      | POST
| Invoke-VcfStartLicenseCheckByResource              | /v1/resources/license-checks                          | POST
| Invoke-VcfSaveManifest                             | /v1/manifests                                         | POST
| Invoke-VcfConnectOpenId                            | /v1/nsxt-clusters/oidcs                               | POST
| Invoke-VcfScaleOutNsx                              | /v1/nsxt-clusters/{nsxt-cluster-id}/scale-out         | POST
| Invoke-VcfStartNsxCriteriaQuery                    | /v1/nsxt-clusters/queries                             | POST
| Invoke-VcfValidateIpPool                           | /v1/nsxt-clusters/ip-address-pools/validations        | POST
| Invoke-VcfAddIpPoolToNetworkOfNetworkPool          | /v1/network-pools/{id}/networks/{networkId}/ip-pools  | POST
| Invoke-VcfCreateNetworkPool                        | /v1/network-pools                                     | POST
| Invoke-VcfCreateEdgeCluster                        | /v1/edge-clusters                                     | POST
| Invoke-VcfValidateEdgeClusterCreationSpec          | /v1/edge-clusters/validations                         | POST
| Invoke-VcfValidateEdgeClusterUpdateSpec            | /v1/edge-clusters/{id}/validations                    | POST
| Invoke-VcfUploadPersonality                        | /v1/personalities                                     | POST
| Invoke-VcfUploadProductBinary                      | /v1/product-binaries                                  | POST
| Invoke-VcfUploadProductVersionCatalog              | /v1/product-version-catalog                           | POST
| Invoke-VcfUploadProductVersionCatalogWithSignature | /v1/product-version-catalogs                          | POST
| Invoke-VcfInitiateRepositoryImagesQuery            | /v1/vcenters/repository-images/queries                | POST
| Invoke-VcfCreateResourceWarning                    | /v1/resource-warnings                                 | POST
| Invoke-VcfStartHealthCheck                         | /v1/system/health-summary                             | POST
| Invoke-VcfStartSupportBundle                       | /v1/system/support-bundles                            | POST
| Invoke-VcfValidateDnsConfiguration                 | /v1/system/dns-configuration/validations              | POST
| Invoke-VcfValidateNtpConfiguration                 | /v1/system/ntp-configuration/validations              | POST
| Invoke-VcfValidateReleaseByDomainID                | /v1/releases/domains/{domainId}/validations           | POST
| Invoke-VcfCreateToken                              | /v1/tokens                                            | POST
| Invoke-VcfAddTrustedCertificate                    | /v1/sddc-manager/trusted-certificates                 | POST
| Invoke-VcfPerformUpgrade                           | /v1/upgrades                                          | POST
| Invoke-VcfStartUpgradePrecheck                     | /v1/upgrades/{upgradeId}/prechecks                    | POST
| Invoke-VcfAddUsers                                 | /v1/users                                             | POST
| Invoke-VcfDeployVcfManagementComponents            | /v1/vcf-management-components                         | POST
| Invoke-VcfValidateVcfManagementComponents          | /v1/vcf-management-components/validations             | POST
| Invoke-VcfAddVasaProvider                          | /v1/vasa-providers                                    | POST
| Invoke-VcfAddVasaProviderStorageContainer          | /v1/vasa-providers/{id}/storage-containers            | POST
| Invoke-VcfAddVasaProviderUser                      | /v1/vasa-providers/{id}/users                         | POST
| Invoke-VcfValidateVasaProviderSpec                 | /v1/vasa-providers/validations                        | POST

### Display All SDDC Manager PUT Command Details

1. Start a PowerShell session.

2. Display all PUT cmdlets supported in `VMware.Sdk.Vcf.SddcManager` by running the following command:

``` powershell
Get-VcfSddcManagerOperation -Method Put | Select-Object CommandInfo, Path, Method
```

3. Output for all PUT cmdlets in `VMware.Sdk.Vcf.SddcManager`.

| Command Info                               | Path                                                                | Method
| -------------------------------------------| --------------------------------------------------------------------| ------
| Invoke-VcfSetBackupConfiguration           | /v1/system/backup-configuration                                     | PUT
| Invoke-VcfCreateCertificateAuthority       | /v1/certificate-authorities                                         | PUT
| Invoke-VcfGenerateCertificates             | /v1/domains/{id}/certificates                                       | PUT
| Invoke-VcfGeneratesCSRs                    | /v1/domains/{id}/csrs                                               | PUT
| Invoke-VcfReplaceResourceCertificates      | /v1/domains/{id}/resource-certificates                              | PUT
| Invoke-VcfValidateResourceCertificates     | /v1/domains/{id}/resource-certificates/validations                  | PUT
| Invoke-VcfAssignTagsToCluster              | /v1/clusters/{id}/tags                                              | PUT
| Invoke-VcfUpdateCompatibilityMatrix        | /v1/compatibility-matrices                                          | PUT
| Invoke-VcfUpdateDepotSettings              | /v1/system/settings/depot                                           | PUT
| Invoke-VcfAssignTagsToDomain               | /v1/domains/{id}/tags                                               | PUT
| Invoke-VcfAssignTagsToHost                 | /v1/hosts/{id}/tags                                                 | PUT
| Invoke-VcfSetLicenseKeyForResource         | /v1/resources/licensing-infos                                       | PUT
| Invoke-VcfUploadPersonalityFiles           | /v1/personalities/files                                             | PUT
| Invoke-VcfConfigureDns                     | /v1/system/dns-configuration                                        | PUT
| Invoke-VcfConfigureNtp                     | /v1/system/ntp-configuration                                        | PUT
| Invoke-VcfUpdateVersionAliasConfiguration  | /v1/system/settings/version-aliases/{bundleComponentType}/{version} | PUT
| Invoke-VcfUpdateVersionAliasConfigurations | /v1/system/settings/version-aliases                                 | PUT

### Display All SDDC Manager PATCH Command Details

1. Start a PowerShell session.

2. Display all PATCH cmdlets supported in `VMware.Sdk.Vcf.SddcManager` by running the following command:

``` powershell
Get-VcfSddcManagerOperation -Method Patch | Select-Object CommandInfo, Path, Method
```

3. Output for all PATCH cmdlets in `VMware.Sdk.Vcf.SddcManager`.

| Command Info                                 | Path                                                            | Method
| ---------------------------------------------| ----------------------------------------------------------------| ------
| Invoke-VcfUpdateBackupConfiguration          | /v1/system/backup-configuration                                 | PATCH
| Invoke-VcfStartBundleDownloadByID            | /v1/bundles/{id}                                                | PATCH
| Invoke-VcfSetCeipStatus                      | /v1/system/ceip                                                 | PATCH
| Invoke-VcfConfigureCertificateAuthority      | /v1/certificate-authorities                                     | PATCH
| Invoke-VcfReplaceCertificates                | /v1/domains/{id}/certificates                                   | PATCH
| Invoke-VcfSetAutoRenewConfiguration          | /v1/domains/resource-certificates                               | PATCH
| Invoke-VcfSetAutoRenewConfigurationForDomain | /v1/domains/{id}/resource-certificates                          | PATCH
| Invoke-VcfTriggerPartialRetryOfCheckRun      | /v1/system/check-sets/{runId}                                   | PATCH
| Invoke-VcfUpdateCluster                      | /v1/clusters/{id}                                               | PATCH
| Invoke-VcfRetryComplianceAuditTask           | /v1/domains/{id}/compliance-audits/tasks/{taskId}               | PATCH
| Invoke-VcfRetryCredentialsTask               | /v1/credentials/tasks/{id}                                      | PATCH
| Invoke-VcfUpdateOrRotatePasswords            | /v1/credentials                                                 | PATCH
| Invoke-VcfSyncDepotMetadata                  | /v1/system/settings/depot/depot-sync-info                       | PATCH
| Invoke-VcfEnableOverlayOverManagementNetwork | /v1/domains/{id}/overlay                                        | PATCH
| Invoke-VcfUpdateDomain                       | /v1/domains/{id}                                                | PATCH
| Invoke-VcfUpdateEmbeddedIdentitySource       | /v1/identity-providers/{id}/identity-sources/{domainName}       | PATCH
| Invoke-VcfUpdateExternalIdentityProvider     | /v1/identity-providers/{id}                                     | PATCH
| Invoke-VcfUpdateLicenseKey                   | /v1/license-keys/{licenseKeyOrId}                               | PATCH
| Invoke-VcfUpdateNetworkPool                  | /v1/network-pools/{id}                                          | PATCH
| Invoke-VcfUpdateEdgeCluster                  | /v1/edge-clusters/{id}                                          | PATCH
| Invoke-VcfUpdateProductVersionCatalogPatches | /v1/product-version-catalogs                                    | PATCH
| Invoke-VcfUpdateProxyConfiguration           | /v1/system/proxy-configuration                                  | PATCH
| Invoke-VcfUpdateResourcesFunctionalities     | /v1/resource-functionalities                                    | PATCH
| Invoke-VcfUpdateResourcesFunctionalities1    | /v1/resource-functionalities/global                             | PATCH
| Invoke-VcfUpdateSystemConfiguration          | /v1/system                                                      | PATCH
| Invoke-VcfUpdateReleaseByDomainID            | /v1/releases/domains/{domainId}                                 | PATCH
| Invoke-VcfRetryTask                          | /v1/tasks/{id}                                                  | PATCH
| Invoke-VcfRefreshAccessToken                 | /v1/tokens/access-token/refresh                                 | PATCH
| Invoke-VcfSyncUMDS                           | /v1/system/host-bundle-depot                                    | PATCH
| Invoke-VcfUpdateUpgradeSchedule              | /v1/upgrades/{upgradeId}                                        | PATCH
| Invoke-VcfUpdateLocalUserPassword            | /v1/users/local/admin                                           | PATCH
| Invoke-VcfUpdateVsanHealthCheckByDomain      | /v1/domains/{domainId}/health-checks                            | PATCH
| Invoke-VcfDownloadVsanHcl                    | /v1/vsan-hcl                                                    | PATCH
| Invoke-VcfUpdateVsanHclConfiguration         | /v1/vsan-hcl/configuration                                      | PATCH
| Invoke-VcfUpdateVasaProvider                 | /v1/vasa-providers/{id}                                         | PATCH
| Invoke-VcfUpdateVasaProviderStorageContainer | /v1/vasa-providers/{id}/storage-containers/{storageContainerId} | PATCH
| Invoke-VcfUpdateVasaProviderUser             | /v1/vasa-providers/{id}/users/{userId}                          | PATCH

### Display All SDDC Manager DELETE Command Details

1. Start a PowerShell session.

2. Display all DELETE cmdlets supported in `VMware.Sdk.Vcf.SddcManager` by running the following command:

``` powershell
Get-VcfSddcManagerOperation -Method Delete | Select-Object CommandInfo, Path, Method
```

3. Output for all DELETE cmdlets in `VMware.Sdk.Vcf.SddcManager`.

| Command Info                                              | Path                                                                | Method
| ----------------------------------------------------------| --------------------------------------------------------------------| ------
| Invoke-VcfDeleteALBCluster                                | /v1/nsx-alb-clusters/{id}                                           | DELETE
| Invoke-VcfUndeployALBCluster                              | /v1/alb-clusters/{id}                                               | DELETE
| Invoke-VcfDeleteBundle                                    | /v1/bundles/{id}                                                    | DELETE
| Invoke-VcfRemoveCertificateAuthority                      | /v1/certificate-authorities/{id}                                    | DELETE
| Invoke-VcfDeleteCluster                                   | /v1/clusters/{id}                                                   | DELETE
| Invoke-VcfRemoveDatastoreFromCluster                      | /v1/clusters/{id}/datastores/{datastoreId}                          | DELETE
| Invoke-VcfRemoveTagsFromCluster                           | /v1/clusters/{id}/tags                                              | DELETE
| Invoke-VcfCancelCredentialsTask                           | /v1/credentials/tasks/{id}                                          | DELETE
| Invoke-VcfDeleteDepotSettings                             | /v1/system/settings/depot                                           | DELETE
| Invoke-VcfDeleteDomain                                    | /v1/domains/{id}                                                    | DELETE
| Invoke-VcfRemoveTagsFromDomain                            | /v1/domains/{id}/tags                                               | DELETE
| Invoke-VcfDecommissionHosts                               | /v1/hosts                                                           | DELETE
| Invoke-VcfRemoveTagsFromHost                              | /v1/hosts/{id}/tags                                                 | DELETE
| Invoke-VcfDeleteExternalIdentityProvider                  | /v1/identity-providers/{id}                                         | DELETE
| Invoke-VcfDeleteIdentitySource                            | /v1/identity-providers/{id}/identity-sources/{domainName}           | DELETE
| Invoke-VcfRemoveLicenseKey                                | /v1/license-keys/{key}                                              | DELETE
| Invoke-VcfDeleteIpPoolFromNetworkOfNetworkPool            | /v1/network-pools/{id}/networks/{networkId}/ip-pools                | DELETE
| Invoke-VcfDeleteNetworkPool                               | /v1/network-pools/{id}                                              | DELETE
| Invoke-VcfDeletePersonality                               | /v1/personalities                                                   | DELETE
| Invoke-VcfDeleteReleaseByDomainID                         | /v1/releases/domains/{domainId}                                     | DELETE
| Invoke-VcfCancelTask                                      | /v1/tasks/{id}                                                      | DELETE
| Invoke-VcfInvalidateRefreshToken                          | /v1/tokens/refresh-token                                            | DELETE
| Invoke-VcfDeleteTrustedCertificate                        | /v1/sddc-manager/trusted-certificates/{alias}                       | DELETE
| Invoke-VcfDisableLocalAccount                             | /v1/users/local/admin                                               | DELETE
| Invoke-VcfRemoveUser                                      | /v1/users/{id}                                                      | DELETE
| Invoke-VcfRemoveVasaProvider                              | /v1/vasa-providers/{id}                                             | DELETE
| Invoke-VcfRemoveVasaProviderStorageContainer              | /v1/vasa-providers/{id}/storage-containers/{storageContainerId}     | DELETE
| Invoke-VcfDeleteAliasVersionsBySoftwareTypeAndBaseVersion | /v1/system/settings/version-aliases/{bundleComponentType}/{version} | DELETE
| Invoke-VcfDeleteVersionAliasBySoftwareType                | /v1/system/settings/version-aliases/{bundleComponentType}           | DELETE

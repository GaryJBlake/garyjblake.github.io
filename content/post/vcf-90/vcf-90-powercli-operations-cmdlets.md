+++
author = "GaryJBlake"
title = "Using VMware.Sdk.Vcf.Ops: Commands for VCF Operations"
date = "2025-07-10"
description = "Using VMware.Sdk.Vcf.Ops: Commands for VCF Operations"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI",
    "VCF Operations 9.0"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI",
    "VCF Operations 9.0"
]
series = [

]
+++

VCF PowerCLI 9.0 now includes a module called `VMware.Sdk.Vcf.Ops`, this modules contains auto-generated cmdlets to support VCF Operations Public APIs. Use can use this post as a quick reference guide.

### Connecting to a VCF Operations Instance with Local Credentials

1. Start a PowerShell session.

2. Connect to a VCF Operations instance using local credentials by running the following command:

``` powershell
Connect-VcfOpsServer -Server flt-ops01a.rainpole.io -User admin -Password VMw@re1!VMw@re1!
```

3. Once connected the following information is stored in `$defaultOpsConnections`.

``` bash
ServiceUri     : https://flt-ops01a.rainpole.io/
SessionSecret  : 54aa4efb-3acd-4a14-ad75-10e66742a96d::c38a1c14-0ea4-4f3f-abe8-40afc55bae6d
User           : admin
IsConnected    : True
Id             : /VcfOpsServer=admin@flt-ops01a.rainpole.io:443/
Name           : flt-ops01a.rainpole.io
Uid            : /VcfOpsServer=admin@flt-ops01a.rainpole.io:443/
ProductVersion : VCF Operations 9.0.0.0
ServerUri      : https://flt-ops01a.rainpole.io/
UUID           : /VcfOpsServer=admin@flt-ops01a.rainpole.io:443/
Port           : 443
```

4. Disconnect from a VCF Operations instance by running the following command:

``` powershell
Disconnect-VcfOpsServer -Server flt-ops01a.rainpole.io
```

### Display All VCF Operations GET Command Details

1. Start a PowerShell session.

2. Display all GET cmdlets supported in `VMware.Sdk.Vcf.Ops` by running the following command:

``` powershell
Get-VcfOpsOperation -Method Get | Select-Object CommandInfo, Path, Method
```

3. Output for all GET cmdlets in `VMware.Sdk.Vcf.Ops`.

| Command Info                                           | Path                                                                          | Method
| -------------------------------------------------------| ------------------------------------------------------------------------------| ------
| Invoke-VcfOpsGetActionStatus                           | /api/actions/{taskId}/status                                                  | GET
| Invoke-VcfOpsGetAllActions                             | /api/actiondefinitions                                                        | GET
| Invoke-VcfOpsGetAdapterType                            | /api/adapterkinds/{id}                                                        | GET
| Invoke-VcfOpsGetAdapterTypes                           | /api/adapterkinds                                                             | GET
| Invoke-VcfOpsGetResourceTypeAttributesForAdapterType   | /api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}/statkeys   | GET
| Invoke-VcfOpsGetResourceTypeForAdapterType             | /api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}            | GET
| Invoke-VcfOpsGetResourceTypePropertiesForAdapterType   | /api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}/properties | GET
| Invoke-VcfOpsGetResourceTypesForAdapterType            | /api/adapterkinds/{key}/resourcekinds                                         | GET
| Invoke-VcfOpsGetResourcesWithAdapterAndResourceKind    | /api/adapterkinds/{adapterKindKey}/resourcekinds/{resourceKindKey}/resources  | GET
| Invoke-VcfOpsGetResourcesWithAdapterKind               | /api/adapterkinds/{adapterKindKey}/resources                                  | GET
| Invoke-VcfOpsEnumerateAdapterInstances                 | /api/adapters                                                                 | GET
| Invoke-VcfOpsGetAdapterInstance                        | /api/adapters/{adapterId}                                                     | GET
| Invoke-VcfOpsGetResourcesOfAdapterInstance             | /api/adapters/{adapterId}/resources                                           | GET
| Invoke-VcfOpsGetAlertPluginInstance                    | /api/alertplugins/{pluginId}                                                  | GET
| Invoke-VcfOpsGetAlertPluginTypeWithId                  | /api/alertplugins/types/{pluginTypeId}                                        | GET
| Invoke-VcfOpsGetAlertPluginTypes                       | /api/alertplugins/types                                                       | GET
| Invoke-VcfOpsGetAlertPluginsOfType                     | /api/alertplugins                                                             | GET
| Invoke-VcfOpsGetRulesOfPlugin                          | /api/alertplugins/{pluginId}/rules                                            | GET
| Invoke-VcfOpsGetAlert                                  | /api/alerts/{id}                                                              | GET
| Invoke-VcfOpsGetAlertContributingSymptoms              | /api/alerts/contributingsymptoms                                              | GET
| Invoke-VcfOpsGetAlertDefinitionById                    | /api/alertdefinitions/{id}                                                    | GET
| Invoke-VcfOpsGetAlertDefinitions                       | /api/alertdefinitions                                                         | GET
| Invoke-VcfOpsGetAlertNote                              | /api/alerts/{id}/notes/{noteId}                                               | GET
| Invoke-VcfOpsGetAlertNotes                             | /api/alerts/{id}/notes                                                        | GET
| Invoke-VcfOpsGetAlertTypes                             | /api/alerts/types                                                             | GET
| Invoke-VcfOpsGetAlerts                                 | /api/alerts                                                                   | GET
| Invoke-VcfOpsDownloadClientCertificate                 | /api/applications/clientCertificate/{collectorIpOrGroupName}                  | GET
| Invoke-VcfOpsGetAgentOperationStatus                   | /api/applications/agents/{taskId}/status                                      | GET
| Invoke-VcfOpsGetApplicationResources                   | /api/applications/resources                                                   | GET
| Invoke-VcfOpsGetConfigurationDetails                   | /api/applications                                                             | GET
| Invoke-VcfOpsGetServiceConfigurationTemplate           | /api/applications/services/{name}                                             | GET
| Invoke-VcfOpsGetServiceConfigurations                  | /api/applications/agents/{id}/services/{name}                                 | GET
| Invoke-VcfOpsGetServiceOperationStatus                 | /api/applications/agents/services/{taskId}/status                             | GET
| Invoke-VcfOpsGetServicesConfigurations                 | /api/applications/agents/{id}/services                                        | GET
| Invoke-VcfOpsGetSystemAudit                            | /api/audit/system                                                             | GET
| Invoke-VcfOpsGetAllObjectScopes                        | /api/auth/scopes                                                              | GET
| Invoke-VcfOpsGetAssignedRolePermissionsForCurrentUser  | /api/auth/currentuser/permissions                                             | GET
| Invoke-VcfOpsGetAssignedRolePermissionsForUser         | /api/auth/users/{userId}/permissions                                          | GET
| Invoke-VcfOpsGetAssignedRolePermissionsForUserGroup    | /api/auth/usergroups/{groupId}/permissions                                    | GET
| Invoke-VcfOpsGetAuthSource                             | /api/auth/sources/{sourceId}                                                  | GET
| Invoke-VcfOpsGetAuthSourceType                         | /api/auth/sourcetypes/{sourceId}                                              | GET
| Invoke-VcfOpsGetAuthSourceTypes                        | /api/auth/sourcetypes                                                         | GET
| Invoke-VcfOpsGetAuthSources                            | /api/auth/sources                                                             | GET
| Invoke-VcfOpsGetAvailablePrivilegeGroups               | /api/auth/privilegegroups                                                     | GET
| Invoke-VcfOpsGetAvailablePrivileges                    | /api/auth/privileges                                                          | GET
| Invoke-VcfOpsGetCurrentUser                            | /api/auth/currentuser                                                         | GET
| Invoke-VcfOpsGetCurrentUserRolePrivileges              | /api/auth/currentuser/roles/{roleName}/privileges                             | GET
| Invoke-VcfOpsGetRoleByName                             | /api/auth/roles/{roleName}                                                    | GET
| Invoke-VcfOpsGetRolePrivileges                         | /api/auth/roles/{roleName}/privileges                                         | GET
| Invoke-VcfOpsGetRoles                                  | /api/auth/roles                                                               | GET
| Invoke-VcfOpsGetScope                                  | /api/auth/scopes/{scopeId}                                                    | GET
| Invoke-VcfOpsGetTraversalSpecs                         | /api/auth/traversalspecs                                                      | GET
| Invoke-VcfOpsGetUser                                   | /api/auth/users/{id}                                                          | GET
| Invoke-VcfOpsGetUserGroup                              | /api/auth/usergroups/{id}                                                     | GET
| Invoke-VcfOpsGetUserGroups                             | /api/auth/usergroups                                                          | GET
| Invoke-VcfOpsGetUsers                                  | /api/auth/users                                                               | GET
| Invoke-VcfOpsGetAllCertificates                        | /api/certificate                                                              | GET
| Invoke-VcfOpsGetBill                                   | /api/chargeback/bills/{id}                                                    | GET
| Invoke-VcfOpsDownloadChargeBackReport                  | /api/chargeback/reports/{id}/download                                         | GET
| Invoke-VcfOpsGetChargeBackReport                       | /api/chargeback/reports/{id}                                                  | GET
| Invoke-VcfOpsGetChargeBackReports                      | /api/chargeback/reports                                                       | GET
| Invoke-VcfOpsGetReportScheduleById                     | /api/chargeback/reportdefinitions/{id}/schedules/{scheduleId}                 | GET
| Invoke-VcfOpsGetReportSchedulesById                    | /api/chargeback/reportdefinitions/{id}/schedules                              | GET
| Invoke-VcfOpsGetCollectorGroup                         | /api/collectorgroups/{id}                                                     | GET
| Invoke-VcfOpsGetCollectorGroups                        | /api/collectorgroups                                                          | GET
| Invoke-VcfOpsGetAdaptersOnCollector                    | /api/collectors/{id}/adapters                                                 | GET
| Invoke-VcfOpsGetCollectors                             | /api/collectors                                                               | GET
| Invoke-VcfOpsGet                                       | /api/configurations/files                                                     | GET
| Invoke-VcfOpsDownload                                  | /api/content/operations/export/zip                                            | GET
| Invoke-VcfOpsDownloadBackupContentData                 | /api/content/backup/result                                                    | GET
| Invoke-VcfOpsGetContentProgress                        | /api/content/progress                                                         | GET
| Invoke-VcfOpsGetLastExportOperation                    | /api/content/operations/export                                                | GET
| Invoke-VcfOpsGetLastImportOperation                    | /api/content/operations/import                                                | GET
| Invoke-VcfOpsGetRestoreContentData                     | /api/content/restore/result                                                   | GET
| Invoke-VcfOpsGetCurrency                               | /api/costconfig/currency                                                      | GET
| Invoke-VcfOpsGetAdapterInstancesUsingCredential        | /api/credentials/{id}/adapters                                                | GET
| Invoke-VcfOpsGetCredential                             | /api/credentials/{id}                                                         | GET
| Invoke-VcfOpsGetCredentialKinds                        | /api/credentialkinds                                                          | GET
| Invoke-VcfOpsGetCredentials                            | /api/credentials                                                              | GET
| Invoke-VcfOpsGetResourcesUsingCredential               | /api/credentials/{id}/resources                                               | GET
| Invoke-VcfOpsGetGlobalSettingMetadata                  | /api/deployment/config/globalsettings/metadata                                | GET
| Invoke-VcfOpsGetGlobalSettingValue                     | /api/deployment/config/globalsettings/{key}                                   | GET
| Invoke-VcfOpsGetGlobalSettings                         | /api/deployment/config/globalsettings                                         | GET
| Invoke-VcfOpsGetNodeStatus                             | /api/deployment/node/status                                                   | GET
| Invoke-VcfOpsGetServiceInfo                            | /api/deployment/node/services/{name}/info                                     | GET
| Invoke-VcfOpsGetServicesInfo                           | /api/deployment/node/services/info                                            | GET
| Invoke-VcfOpsGetDomainDetailsById                      | /api/integrations/vcf/{integrationId}/domains/{domainId}                      | GET
| Invoke-VcfOpsGetDomainSummary                          | /api/integrations/vcf/{integrationId}/domains                                 | GET
| Invoke-VcfOpsGetVCFIntegrationById                     | /api/integrations/vcf/{integrationId}                                         | GET
| Invoke-VcfOpsGetVcenterIntegrationById                 | /api/integrations/vcenters/{integrationId}                                    | GET
| Invoke-VcfOpsGetLogConfigurationsByType                | /api/logs/configuration/{logtype}                                             | GET
| Invoke-VcfOpsGetLogForwardingConfiguration             | /api/logs/forwarding                                                          | GET
| Invoke-VcfOpsGetMaintenanceSchedules                   | /api/maintenanceschedules                                                     | GET
| Invoke-VcfOpsGetAllNotificationRules                   | /api/notifications/rules                                                      | GET
| Invoke-VcfOpsGetNotificationRule                       | /api/notifications/rules/{id}                                                 | GET
| Invoke-VcfOpsGetNotificationTemplate                   | /api/notifications/templates/{id}                                             | GET
| Invoke-VcfOpsGetNotificationTemplates                  | /api/notifications/templates                                                  | GET
| Invoke-VcfOpsGetAutomationStatus                       | /api/optimization/workloadplacement/{dataCenterId}/automation/status          | GET
| Invoke-VcfOpsGetCrossDCMoveStatus                      | /api/optimization/workloadplacement/{dataCenterId}/crossdcmove/status         | GET
| Invoke-VcfOpsGetPlacementSettings                      | /api/optimization/workloadplacement/{dataCenterId}/settings                   | GET
| Invoke-VcfOpsExportPolicies                            | /api/policies/export                                                          | GET
| Invoke-VcfOpsGetPolicies                               | /api/policies                                                                 | GET
| Invoke-VcfOpsGetPolicySettings                         | /api/policies/{id}/settings                                                   | GET
| Invoke-VcfOpsGetLicenseInfo                            | /api/product/licensing/info                                                   | GET
| Invoke-VcfOpsGetNPCStatus                              | /api/product/licensing/npc/status                                             | GET
| Invoke-VcfOpsGetProductEdition                         | /api/product/licensing/edition                                                | GET
| Invoke-VcfOpsGetRecommendationById                     | /api/recommendations/{id}                                                     | GET
| Invoke-VcfOpsGetRecommendations                        | /api/recommendations                                                          | GET
| Invoke-VcfOpsDownloadReport                            | /api/reports/{id}/download                                                    | GET
| Invoke-VcfOpsGetReport                                 | /api/reports/{id}                                                             | GET
| Invoke-VcfOpsGetReportDefinition                       | /api/reportdefinitions/{id}                                                   | GET
| Invoke-VcfOpsGetReportDefinitions                      | /api/reportdefinitions                                                        | GET
| Invoke-VcfOpsGetReportSchedule                         | /api/reportdefinitions/{id}/schedules/{scheduleId}                            | GET
| Invoke-VcfOpsGetReportSchedules                        | /api/reportdefinitions/{id}/schedules                                         | GET
| Invoke-VcfOpsGetReports                                | /api/reports                                                                  | GET
| Invoke-VcfOpsGetDTStatsOfResource                      | /api/resources/{id}/stats/dt                                                  | GET
| Invoke-VcfOpsGetLatestStats                            | /api/resources/{id}/stats/latest                                              | GET
| Invoke-VcfOpsGetRelationship                           | /api/resources/{id}/relationships/{relationshipType}                          | GET
| Invoke-VcfOpsGetRelationships                          | /api/resources/{id}/relationships                                             | GET
| Invoke-VcfOpsGetResource                               | /api/resources/{id}                                                           | GET
| Invoke-VcfOpsGetResourceProperties                     | /api/resources/{id}/properties                                                | GET
| Invoke-VcfOpsGetStatKeys                               | /api/resources/{id}/statkeys                                                  | GET
| Invoke-VcfOpsGetStatsOfResource                        | /api/resources/{id}/stats                                                     | GET
| Invoke-VcfOpsGetTopNStatsOfResource                    | /api/resources/{id}/stats/topn                                                | GET
| Invoke-VcfOpsGetCustomDatacenter                       | /api/resources/customdatacenters/{id}                                         | GET
| Invoke-VcfOpsGetCustomDatacenters                      | /api/resources/customdatacenters                                              | GET
| Invoke-VcfOpsGetCustomGroup                            | /api/resources/groups/{groupId}                                               | GET
| Invoke-VcfOpsGetCustomGroupMembers                     | /api/resources/groups/{groupId}/members                                       | GET
| Invoke-VcfOpsGetCustomGroups                           | /api/resources/groups                                                         | GET
| Invoke-VcfOpsGetCustomProfile                          | /api/resources/profiles/{profileId}                                           | GET
| Invoke-VcfOpsGetCustomProfiles                         | /api/resources/profiles                                                       | GET
| Invoke-VcfOpsGetGroupTypes                             | /api/resources/groups/types                                                   | GET
| Invoke-VcfOpsGetLatestStatsOfResources                 | /api/resources/stats/latest                                                   | GET
| Invoke-VcfOpsGetResourcePropertiesList                 | /api/resources/properties                                                     | GET
| Invoke-VcfOpsGetResources                              | /api/resources                                                                | GET
| Invoke-VcfOpsGetStatKeysOfResources                    | /api/resources/statkeys                                                       | GET
| Invoke-VcfOpsGetStatsOfResources                       | /api/resources/stats                                                          | GET
| Invoke-VcfOpsGetTopNStatsOfResources                   | /api/resources/stats/topn                                                     | GET
| Invoke-VcfOpsGetAdapterKindsForSolution                | /api/solutions/{solutionId}/adapterkinds                                      | GET
| Invoke-VcfOpsGetSolution                               | /api/solutions/{solutionId}                                                   | GET
| Invoke-VcfOpsGetSolutions                              | /api/solutions                                                                | GET
| Invoke-VcfOpsGetSuperMetric                            | /api/supermetrics/{id}                                                        | GET
| Invoke-VcfOpsGetSuperMetrics                           | /api/supermetrics                                                             | GET
| Invoke-VcfOpsGetSymptomDefinitionByKey                 | /api/symptomdefinitions/{id}                                                  | GET
| Invoke-VcfOpsGetSymptomDefinitions                     | /api/symptomdefinitions                                                       | GET
| Invoke-VcfOpsGetSymptoms                               | /api/symptoms                                                                 | GET
| Invoke-VcfOpsGetTaskStatus                             | /api/tasks/{id}                                                               | GET
| Invoke-VcfOpsGetTasksStatus                            | /api/tasks                                                                    | GET
| Invoke-VcfOpsGetCurrentVersionOfServer                 | /api/versions/current                                                         | GET
| Invoke-VcfOpsGetSupportedApplicationVersions           | /api/versions                                                                 | GET

### Display All VCF Operations POST Command Details

1. Start a PowerShell session.

2. Display all POST cmdlets supported in `VMware.Sdk.Vcf.Ops` by running the following command:

``` powershell
Get-VcfOpsOperation -Method Post | Select-Object CommandInfo, Path, Method
```

3. Output for all POST cmdlets in `VMware.Sdk.Vcf.Ops`.

| Command Info                                           | Path                                                                     | Method
| -------------------------------------------------------| -------------------------------------------------------------------------| ------
| Invoke-VcfOpsPerformAction                             | /api/actions/{id}                                                        | POST
| Invoke-VcfOpsPopulateAction                            | /api/actions/{id}/query                                                  | POST
| Invoke-VcfOpsCreateAdapterInstance                     | /api/adapters                                                            | POST
| Invoke-VcfOpsTestConnection                            | /api/adapters/testConnection                                             | POST
| Invoke-VcfOpsCreateAlertPlugin                         | /api/alertplugins                                                        | POST
| Invoke-VcfOpsTestAlertPlugin                           | /api/alertplugins/{pluginId}/test                                        | POST
| Invoke-VcfOpsAddAlertNote                              | /api/alerts/{id}/notes                                                   | POST
| Invoke-VcfOpsCreateAlertDefinition                     | /api/alertdefinitions                                                    | POST
| Invoke-VcfOpsModifyAlerts                              | /api/alerts                                                              | POST
| Invoke-VcfOpsQueryAlert                                | /api/alerts/query                                                        | POST
| Invoke-VcfOpsQueryAlertDefinitions                     | /api/alertdefinitions/query                                              | POST
| Invoke-VcfOpsQueryAlertGroups                          | /api/alerts/group/{groupingCondition}/query                              | POST
| Invoke-VcfOpsQueryAlertNotes                           | /api/alerts/notes/query                                                  | POST
| Invoke-VcfOpsActivateServices                          | /api/applications/agents/services                                        | POST
| Invoke-VcfOpsCreateVCenterMapping                      | /api/applications/vccpmappings                                           | POST
| Invoke-VcfOpsInstallAgent                              | /api/applications/agents                                                 | POST
| Invoke-VcfOpsQueryVCenterMappingsInfo                  | /api/applications/vccpmappings/query                                     | POST
| Invoke-VcfOpsSaveServicesConfigurations                | /api/applications/agents/{id}/services                                   | POST
| Invoke-VcfOpsSignClientCertificate                     | /api/applications/clientCertificate/{collectorId}                        | POST
| Invoke-VcfOpsAcquireToken                              | /api/auth/token/acquire                                                  | POST
| Invoke-VcfOpsAddAuthSource                             | /api/auth/sources                                                        | POST
| Invoke-VcfOpsAddRolePrivileges                         | /api/auth/roles/{roleName}/privileges                                    | POST
| Invoke-VcfOpsCreateScope                               | /api/auth/scopes                                                         | POST
| Invoke-VcfOpsCreateUser                                | /api/auth/users                                                          | POST
| Invoke-VcfOpsCreateUserGroup                           | /api/auth/usergroups                                                     | POST
| Invoke-VcfOpsCreateUserRole                            | /api/auth/roles                                                          | POST
| Invoke-VcfOpsImportUsers                               | /api/auth/sources/{id}/users                                             | POST
| Invoke-VcfOpsReleaseToken                              | /api/auth/token/release                                                  | POST
| Invoke-VcfOpsSearchUserGroupsForAuthSource             | /api/auth/sources/{id}/usergroups/search                                 | POST
| Invoke-VcfOpsSearchUsersForAuthSource                  | /api/auth/sources/{id}/users/search                                      | POST
| Invoke-VcfOpsTestAuthSource                            | /api/auth/sources/test                                                   | POST
| Invoke-VcfOpsImportCertificate                         | /api/certificate                                                         | POST
| Invoke-VcfOpsGenerateBills                             | /api/chargeback/bills                                                    | POST
| Invoke-VcfOpsGetBillSummary                            | /api/chargeback/bills/query                                              | POST
| Invoke-VcfOpsCreateChargeBackReport                    | /api/chargeback/reports                                                  | POST
| Invoke-VcfOpsCreateReportScheduleById                  | /api/chargeback/reportdefinitions/{id}/schedules                         | POST
| Invoke-VcfOpsCreateCollectorGroup                      | /api/collectorgroups                                                     | POST
| Invoke-VcfOpsBackupContent                             | /api/content/backup                                                      | POST
| Invoke-VcfOpsExportContent                             | /api/content/operations/export                                           | POST
| Invoke-VcfOpsImportContent                             | /api/content/operations/import                                           | POST
| Invoke-VcfOpsRestoreContent                            | /api/content/restore                                                     | POST
| Invoke-VcfOpsSetCurrency                               | /api/costconfig/currency                                                 | POST
| Invoke-VcfOpsCreateCredential                          | /api/credentials                                                         | POST
| Invoke-VcfOpsPushEvent                                 | /api/events                                                              | POST
| Invoke-VcfOpsPushEventByAdapterKindKey                 | /api/events/adapterkinds/{adapterKind}                                   | POST
| Invoke-VcfOpsPushEvents                                | /api/events/bulk                                                         | POST
| Invoke-VcfOpsPushEventsByAdapterKindKey                | /api/events/bulk/adapterkinds/{adapterKind}                              | POST
| Invoke-VcfOpsCreateVCFIntegration                      | /api/integrations/vcf                                                    | POST
| Invoke-VcfOpsCreateVcenterIntegration                  | /api/integrations/vcenters                                               | POST
| Invoke-VcfOpsTestDomain                                | /api/integrations/vcf/{integrationId}/domains/{domainId}/testConnection  | POST
| Invoke-VcfOpsTestVCFIntegration                        | /api/integrations/vcf/testConnection                                     | POST
| Invoke-VcfOpsTestVcenterIntegration                    | /api/integrations/vcenters/testConnection                                | POST
| Invoke-VcfOpsCreateMaintenanceSchedules                | /api/maintenanceschedules                                                | POST
| Invoke-VcfOpsCreateNotificationPluginRule              | /api/notifications/rules                                                 | POST
| Invoke-VcfOpsCreateNotificationTemplate                | /api/notifications/templates                                             | POST
| Invoke-VcfOpsGetWlpHistory                             | /api/optimization/workloadplacement/history/query                        | POST
| Invoke-VcfOpsApplyPolicy                               | /api/policies/apply                                                      | POST
| Invoke-VcfOpsCreatePolicy                              | /api/policies                                                            | POST
| Invoke-VcfOpsImportPolicies                            | /api/policies/import                                                     | POST
| Invoke-VcfOpsCreateRecommendation                      | /api/recommendations                                                     | POST
| Invoke-VcfOpsCreateReport                              | /api/reports                                                             | POST
| Invoke-VcfOpsCreateReportSchedule                      | /api/reportdefinitions/{id}/schedules                                    | POST
| Invoke-VcfOpsAddProperties                             | /api/resources/{id}/properties                                           | POST
| Invoke-VcfOpsAddPropertiesUsingPushAdapterKind         | /api/resources/{id}/properties/adapterkinds/{adapterKind}                | POST
| Invoke-VcfOpsAddRelationship                           | /api/resources/{id}/relationships/{relationshipType}                     | POST
| Invoke-VcfOpsAddStats                                  | /api/resources/{id}/stats                                                | POST
| Invoke-VcfOpsAddStatsUsingPushAdapterKind              | /api/resources/{id}/stats/adapterkinds/{adapterKind}                     | POST
| Invoke-VcfOpsGetStatsForResource                       | /api/resources/{id}/stats/query                                          | POST
| Invoke-VcfOpsAddGroupType                              | /api/resources/groups/types                                              | POST
| Invoke-VcfOpsAddResourcesProperties                    | /api/resources/properties                                                | POST
| Invoke-VcfOpsAddResourcesPropertiesUsingAdapterKind    | /api/resources/properties/adapterkinds/{adapterKind}                     | POST
| Invoke-VcfOpsAddStatsForResources                      | /api/resources/stats                                                     | POST
| Invoke-VcfOpsAddStatsForResourcesUsingPushAdapterKind  | /api/resources/stats/adapterkinds/{adapterKind}                          | POST
| Invoke-VcfOpsCreateCustomDatacenter                    | /api/resources/customdatacenters                                         | POST
| Invoke-VcfOpsCreateCustomGroup                         | /api/resources/groups                                                    | POST
| Invoke-VcfOpsCreateCustomProfile                       | /api/resources/profiles                                                  | POST
| Invoke-VcfOpsCreateResourceUsingAdapterInstance        | /api/resources/adapters/{adapterInstanceId}                              | POST
| Invoke-VcfOpsCreateResourceUsingAdapterKind            | /api/resources/adapterkinds/{adapterKindKey}                             | POST
| Invoke-VcfOpsGetMatchingResources                      | /api/resources/query                                                     | POST
| Invoke-VcfOpsGetResourcesRelationships                 | /api/resources/bulk/relationships                                        | POST
| Invoke-VcfOpsGetStatsAndDTForResources                 | /api/resources/stats/dt/query                                            | POST
| Invoke-VcfOpsGetStatsForResources                      | /api/resources/stats/query                                               | POST
| Invoke-VcfOpsQueryLatestPropertiesOfResources          | /api/resources/properties/latest/query                                   | POST
| Invoke-VcfOpsQueryLatestStatsOfResources               | /api/resources/stats/latest/query                                        | POST
| Invoke-VcfOpsCreateSuperMetric                         | /api/supermetrics                                                        | POST
| Invoke-VcfOpsCreateSymptomDefinition                   | /api/symptomdefinitions                                                  | POST
| Invoke-VcfOpsQuerySymptoms                             | /api/symptoms/query                                                      | POST

### Display All VCF Operations PUT Command Details

1. Start a PowerShell session.

2. Display all PUT cmdlets supported in `VMware.Sdk.Vcf.Ops` by running the following command:

``` powershell
Get-VcfOpsOperation -Method Put | Select-Object CommandInfo, Path, Method
```

3. Output for all PUT cmdlets in `VMware.Sdk.Vcf.Ops`.

| Command Info                                           | Path                                                                     | Method
| -------------------------------------------------------| -------------------------------------------------------------------------| ------
| Invoke-VcfOpsMarkAdapterInstanceAsBeingMaintained      | /api/adapters/{adapterId}/maintained                                     | PUT
| Invoke-VcfOpsStartMonitoringResourcesOfAdapterInstance | /api/adapters/{adapterId}/monitoringstate/start                          | PUT
| Invoke-VcfOpsStopMonitoringResourcesOfAdapterInstance  | /api/adapters/{adapterId}/monitoringstate/stop                           | PUT
| Invoke-VcfOpsUpdateAdapterInstance                     | /api/adapters                                                            | PUT
| Invoke-VcfOpsModifyAlertPluginState                    | /api/alertplugins/{pluginId}/enable/{enabled}                            | PUT
| Invoke-VcfOpsUpdateAlertPlugin                         | /api/alertplugins                                                        | PUT
| Invoke-VcfOpsDisableAlertDefinitionInPolicies          | /api/alertdefinitions/{id}/disable                                       | PUT
| Invoke-VcfOpsEnableAlertDefinitionInPolicies           | /api/alertdefinitions/{id}/enable                                        | PUT
| Invoke-VcfOpsUpdateAlertDefinition                     | /api/alertdefinitions                                                    | PUT
| Invoke-VcfOpsAddVcenterToConfiguration                 | /api/applications/vcenter/add                                            | PUT
| Invoke-VcfOpsRemoveVcenterFromConfiguration            | /api/applications/vcenter/remove                                         | PUT
| Invoke-VcfOpsStartAgent                                | /api/applications/agents/start                                           | PUT
| Invoke-VcfOpsStopAgent                                 | /api/applications/agents/stop                                            | PUT
| Invoke-VcfOpsSubscribe                                 | /api/applications/subscribe                                              | PUT
| Invoke-VcfOpsUnsubscribe                               | /api/applications/unsubscribe                                            | PUT
| Invoke-VcfOpsUpdateServicesConfigurations              | /api/applications/agents/{id}/services                                   | PUT
| Invoke-VcfOpsUpgradeAgent                              | /api/applications/agents/upgrade                                         | PUT
| Invoke-VcfOpsAssignRolePermissionToUser                | /api/auth/users/{userId}/permissions                                     | PUT
| Invoke-VcfOpsAssignRolePermissionToUserGroup           | /api/auth/usergroups/{groupId}/permissions                               | PUT
| Invoke-VcfOpsAssignTraversalSpecToUser                 | /api/auth/users/{userId}/traversalspecs                                  | PUT
| Invoke-VcfOpsAssignTraversalSpecToUserGroup            | /api/auth/usergroups/{groupId}/traversalspecs                            | PUT
| Invoke-VcfOpsChangePassword                            | /api/auth/users/passwordchange                                           | PUT
| Invoke-VcfOpsModifyScope                               | /api/auth/scopes                                                         | PUT
| Invoke-VcfOpsModifyUser                                | /api/auth/users                                                          | PUT
| Invoke-VcfOpsModifyUserGroup                           | /api/auth/usergroups                                                     | PUT
| Invoke-VcfOpsSetRolePrivileges                         | /api/auth/roles/{roleName}/privileges                                    | PUT
| Invoke-VcfOpsSynchronizeUserGroups                     | /api/auth/sources/{id}/usergroups/synchronize                            | PUT
| Invoke-VcfOpsUpdateAuthSource                          | /api/auth/sources                                                        | PUT
| Invoke-VcfOpsUpdateUserRole                            | /api/auth/roles                                                          | PUT
| Invoke-VcfOpsUpdateReportScheduleById                  | /api/chargeback/reportdefinitions/{id}/schedules                         | PUT
| Invoke-VcfOpsAddCollectorToCollectorGroup              | /api/collectorgroups/{id}/collector/{collectorId}                        | PUT
| Invoke-VcfOpsUpdateCollectorGroup                      | /api/collectorgroups                                                     | PUT
| Invoke-VcfOpsDisableDataPersistence                    | /api/collectors/{id}/datapersistence/disable                             | PUT
| Invoke-VcfOpsEnableDataPersistence                     | /api/collectors/{id}/datapersistence/enable                              | PUT
| Invoke-VcfOpsUpdateCredential                          | /api/credentials                                                         | PUT
| Invoke-VcfOpsManageDT                                  | /api/deployment/cluster/dt                                               | PUT
| Invoke-VcfOpsUpdateGlobalSettingValue                  | /api/deployment/config/globalsettings/{key}/{value}                      | PUT
| Invoke-VcfOpsRegisterVC                                | /api/integrations/vcenters/{integrationId}/register                      | PUT
| Invoke-VcfOpsRegisterVCF                               | /api/integrations/vcf/{integrationId}/register                           | PUT
| Invoke-VcfOpsUnregisterVC                              | /api/integrations/vcenters/{integrationId}/unregister                    | PUT
| Invoke-VcfOpsUnregisterVCF                             | /api/integrations/vcf/{integrationId}/unregister                         | PUT
| Invoke-VcfOpsUpdateDomainDetails                       | /api/integrations/vcf/{integrationId}/domains/{domainId}                 | PUT
| Invoke-VcfOpsUpdateVCFIntegration                      | /api/integrations/vcf                                                    | PUT
| Invoke-VcfOpsUpdateVcenterIntegration                  | /api/integrations/vcenters                                               | PUT
| Invoke-VcfOpsCreateOrUpdateLogConfigurations           | /api/logs/configuration/{logtype}                                        | PUT
| Invoke-VcfOpsDisableLogForwarding                      | /api/logs/forwarding/disable                                             | PUT
| Invoke-VcfOpsEnableLogForwarding                       | /api/logs/forwarding/enable                                              | PUT
| Invoke-VcfOpsUpdateLogForwardingConfiguration          | /api/logs/forwarding                                                     | PUT
| Invoke-VcfOpsUpdateMaintenanceSchedules                | /api/maintenanceschedules                                                | PUT
| Invoke-VcfOpsUpdateNotificationPluginRule              | /api/notifications/rules                                                 | PUT
| Invoke-VcfOpsUpdateNotificationTemplate                | /api/notifications/templates                                             | PUT
| Invoke-VcfOpsDisableAutomation                         | /api/optimization/workloadplacement/{dataCenterId}/automation/disable    | PUT
| Invoke-VcfOpsDisableCrossDCMove                        | /api/optimization/workloadplacement/{dataCenterId}/crossdcmove/disable   | PUT
| Invoke-VcfOpsEnableAutomation                          | /api/optimization/workloadplacement/{dataCenterId}/automation/enable     | PUT
| Invoke-VcfOpsEnableCrossDCMove                         | /api/optimization/workloadplacement/{dataCenterId}/crossdcmove/enable    | PUT
| Invoke-VcfOpsSetPlacementSettings                      | /api/optimization/workloadplacement/{dataCenterId}/settings              | PUT
| Invoke-VcfOpsAssignPolicy                              | /api/policies/{id}/assign                                                | PUT
| Invoke-VcfOpsSetDefaultPolicy                          | /api/policies/default                                                    | PUT
| Invoke-VcfOpsUnassignPolicy                            | /api/policies/{id}/unassign                                              | PUT
| Invoke-VcfOpsUpdatePriorities                          | /api/policies/priorities                                                 | PUT
| Invoke-VcfOpsUpdateRecommendation                      | /api/recommendations                                                     | PUT
| Invoke-VcfOpsUpdateReportSchedule                      | /api/reportdefinitions/{id}/schedules                                    | PUT
| Invoke-VcfOpsMarkResourceAsBeingMaintained             | /api/resources/{id}/maintained                                           | PUT
| Invoke-VcfOpsSetRelationship                           | /api/resources/{id}/relationships/{relationshipType}                     | PUT
| Invoke-VcfOpsStartMonitoringResource                   | /api/resources/{id}/monitoringstate/start                                | PUT
| Invoke-VcfOpsStopMonitoringResource                    | /api/resources/{id}/monitoringstate/stop                                 | PUT
| Invoke-VcfOpsUpdateGeoLocationOfResource               | /api/resources/{id}/geolocation                                          | PUT
| Invoke-VcfOpsMarkResourcesAsBeingMaintained            | /api/resources/maintained                                                | PUT
| Invoke-VcfOpsModifyCustomGroup                         | /api/resources/groups                                                    | PUT
| Invoke-VcfOpsModifyCustomProfile                       | /api/resources/profiles                                                  | PUT
| Invoke-VcfOpsStartMonitoringResources                  | /api/resources/monitoringstate/start                                     | PUT
| Invoke-VcfOpsStopMonitoringResources                   | /api/resources/monitoringstate/stop                                      | PUT
| Invoke-VcfOpsUpdateCustomDatacenter                    | /api/resources/customdatacenters                                         | PUT
| Invoke-VcfOpsUpdateResource                            | /api/resources                                                           | PUT
| Invoke-VcfOpsUpdateSuperMetric                         | /api/supermetrics                                                        | PUT
| Invoke-VcfOpsUpdateSymptomDefinition                   | /api/symptomdefinitions                                                  | PUT

### Display All VCF Operations PATCH Command Details

1. Start a PowerShell session.

2. Display all PATCH cmdlets supported in `VMware.Sdk.Vcf.Ops` by running the following command:

``` powershell
Get-VcfOpsOperation -Method Patch | Select-Object CommandInfo, Path, Method
```

3. Output for all PATCH cmdlets in `VMware.Sdk.Vcf.Ops`.

| Command Info                                       | Path                         | Method
| ---------------------------------------------------| -----------------------------| ------
| Invoke-VcfOpsPatchAdapterInstance                  | /api/adapters                | PATCH
| Invoke-VcfOpsPatchTestConnection                   | /api/adapters/testConnection | PATCH
| Invoke-VcfOpsPatchAlertPlugin                      | /api/alertplugins            | PATCH
| Invoke-VcfOpsPatchAuthSourceWithCertificateDetails | /api/auth/sources            | PATCH
| Invoke-VcfOpsPatchTestAuthSource                   | /api/auth/sources/test       | PATCH
| Invoke-VcfOpsPartialUpdateCredential               | /api/credentials             | PATCH
| Invoke-VcfOpsPatchPolicySettings                   | /api/policies/{id}/settings  | PATCH


### Display All VCF Operations DELETE Command Details

1. Start a PowerShell session.

2. Display all DELETE cmdlets supported in `VMware.Sdk.Vcf.Ops` by running the following command:

``` powershell
Get-VcfOpsOperation -Method Delete | Select-Object CommandInfo, Path, Method
```

3. Output for all DELETE cmdlets in `VMware.Sdk.Vcf.Ops`.

| Command Info                                        | Path                                                             | Method
| ----------------------------------------------------| -----------------------------------------------------------------| ------
| Invoke-VcfOpsDeleteAdapterInstance                  | /api/adapters/{adapterId}                                        | DELETE
| Invoke-VcfOpsUnmarkAdapterInstanceAsBeingMaintained | /api/adapters/{adapterId}/maintained                             | DELETE
| Invoke-VcfOpsDeleteAlertPlugin                      | /api/alertplugins/{pluginId}                                     | DELETE
| Invoke-VcfOpsDeleteAlertDefinition                  | /api/alertdefinitions/{id}                                       | DELETE
| Invoke-VcfOpsDeleteAlertNote                        | /api/alerts/{id}/notes/{noteId}                                  | DELETE
| Invoke-VcfOpsDeleteCanceledAlerts                   | /api/alerts/bulk                                                 | DELETE
| Invoke-VcfOpsDeleteVCenterMapping                   | /api/applications/vccpmappings                                   | DELETE
| Invoke-VcfOpsRemoveServicesConfigurations           | /api/applications/agents/{id}/services                           | DELETE
| Invoke-VcfOpsUninstallAgent                         | /api/applications/agents                                         | DELETE
| Invoke-VcfOpsDeleteAuthSource                       | /api/auth/sources/{sourceId}                                     | DELETE
| Invoke-VcfOpsDeleteScopes                           | /api/auth/scopes                                                 | DELETE
| Invoke-VcfOpsDeleteUser                             | /api/auth/users/{id}                                             | DELETE
| Invoke-VcfOpsDeleteUserGroup                        | /api/auth/usergroups/{id}                                        | DELETE
| Invoke-VcfOpsDeleteUserGroups                       | /api/auth/usergroups                                             | DELETE
| Invoke-VcfOpsDeleteUserRole                         | /api/auth/roles/{roleName}                                       | DELETE
| Invoke-VcfOpsDeleteUsers                            | /api/auth/users                                                  | DELETE
| Invoke-VcfOpsRemoveRolePrivileges                   | /api/auth/roles/{roleName}/privileges                            | DELETE
| Invoke-VcfOpsUnassignedRolePermissionFromUser       | /api/auth/users/{userId}/permissions/{roleName}                  | DELETE
| Invoke-VcfOpsUnassignedRolePermissionFromUserGroup  | /api/auth/usergroups/{groupId}/permissions/{roleName}            | DELETE
| Invoke-VcfOpsDeleteCertificate                      | /api/certificate                                                 | DELETE
| Invoke-VcfOpsDeleteBill                             | /api/chargeback/bills/{id}                                       | DELETE
| Invoke-VcfOpsDeleteChargeBackReport                 | /api/chargeback/reports/{id}                                     | DELETE
| Invoke-VcfOpsDeleteScheduleById                     | /api/chargeback/reportdefinitions/{id}/schedules/{scheduleId}    | DELETE
| Invoke-VcfOpsDeleteCollectorGroup                   | /api/collectorgroups/{id}                                        | DELETE
| Invoke-VcfOpsRemoveCollectorFromCollectorGroup      | /api/collectorgroups/{id}/collector/{collectorId}                | DELETE
| Invoke-VcfOpsDeleteCredential                       | /api/credentials/{id}                                            | DELETE
| Invoke-VcfOpsDeleteVcenterIntegration               | /api/integrations/vcenters/{integrationId}                       | DELETE
| Invoke-VcfOpsDeleteVcfDomain                        | /api/integrations/vcf/{integrationId}/domains/{domainId}         | DELETE
| Invoke-VcfOpsDeleteVcfIntegration                   | /api/integrations/vcf/{integrationId}                            | DELETE
| Invoke-VcfOpsDeleteLogConfigurationSettings         | /api/logs/configuration/{logtype}/settings                       | DELETE
| Invoke-VcfOpsDeleteMaintenanceSchedules             | /api/maintenanceschedules                                        | DELETE
| Invoke-VcfOpsDeleteNotificationPluginRules          | /api/notifications/rules/{id}                                    | DELETE
| Invoke-VcfOpsDeleteNotificationTemplate             | /api/notifications/templates/{id}                                | DELETE
| Invoke-VcfOpsDeletePlacementConfiguration           | /api/optimization/workloadplacement/{dataCenterId}/settings      | DELETE
| Invoke-VcfOpsDeletePolicy                           | /api/policies/{id}                                               | DELETE
| Invoke-VcfOpsDeletePolicySettings                   | /api/policies/{id}/settings                                      | DELETE
| Invoke-VcfOpsDeleteRecommendation                   | /api/recommendations/{id}                                        | DELETE
| Invoke-VcfOpsDeleteReport                           | /api/reports/{id}                                                | DELETE
| Invoke-VcfOpsDeleteSchedule                         | /api/reportdefinitions/{id}/schedules/{scheduleId}               | DELETE
| Invoke-VcfOpsDeleteRelationship                     | /api/resources/{id}/relationships/{relationshipType}/{relatedId} | DELETE
| Invoke-VcfOpsDeleteResource                         | /api/resources/{id}                                              | DELETE
| Invoke-VcfOpsUnmarkResourceAsBeingMaintained        | /api/resources/{id}/maintained                                   | DELETE
| Invoke-VcfOpsDeleteCustomDatacenters                | /api/resources/customdatacenters                                 | DELETE
| Invoke-VcfOpsDeleteCustomGroup                      | /api/resources/groups/{groupId}                                  | DELETE
| Invoke-VcfOpsDeleteCustomProfile                    | /api/resources/profiles/{profileId}                              | DELETE
| Invoke-VcfOpsDeleteGroupType                        | /api/resources/groups/types/{key}                                | DELETE
| Invoke-VcfOpsDeleteResources                        | /api/resources/bulk                                              | DELETE
| Invoke-VcfOpsUnmarkResourcesAsBeingMaintained       | /api/resources/maintained                                        | DELETE
| Invoke-VcfOpsDeleteSuperMetric                      | /api/supermetrics/{id}                                           | DELETE
| Invoke-VcfOpsDeleteSymptomDefinition                | /api/symptomdefinitions/{id}                                     | DELETE

+++
author = "GaryJBlake"
title = "Using VMware.Sdk.Srm: Commands for VMware Live Site Recovery in PowerCLI"
date = "2025-07-29"
description = "Using VMware.Sdk.Vcf.Installer: Commands for VMware Live Site Recovery in PowerCLI"
tags = [
    "VCF",
    "VCF 9.0",
    "VCF PowerCLI",
    "VMware Live Site Recovery"
]
categories = [
    "VMware Cloud Foundation 9.0",
    "VCF PowerCLI",
    "VMware Live Site Recovery"
]
series = [

]
+++

VCF PowerCLI 9.0 now includes a module called `VMware.Sdk.Srm`, this modules contains auto-generated cmdlets to support VMware Live Site Recovery Public APIs. Use can use this post as a quick reference guide.

### Display All VMware Live Recovery GET Command Details

1. Start a PowerShell session.

2. Display all GET cmdlets supported in `VMware.Sdk.Srm` by running the following command:

``` powershell
Get-SrmOperation -Method Get | Select-Object CommandInfo, Path, Method
```

3. Output for all GET cmdlets in `VMware.Sdk.Srm`.

| Command Info                                              | Path                                                                                                                              | Method
| ----------------------------------------------------------| ----------------------------------------------------------------------------------------------------------------------------------| ------
| Invoke-SrmGetFolderMapping                                | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/folders/{mapping_id}                                                      | GET
| Invoke-SrmGetFolderMappings                               | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/folders                                                                   | GET
| Invoke-SrmGetNetworkIpSubnetMapping                       | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/networks/{mapping_id}/ip-subnet-mapping                                   | GET
| Invoke-SrmGetNetworkMapping                               | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/networks/{mapping_id}                                                     | GET
| Invoke-SrmGetNetworkMappings                              | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/networks                                                                  | GET
| Invoke-SrmGetPlaceholderDatastore                         | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/placeholder-datastores/{datastore_id}                                     | GET
| Invoke-SrmGetPlaceholderDatastores                        | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/placeholder-datastores                                                    | GET
| Invoke-SrmGetResourceMapping                              | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/resources/{mapping_id}                                                    | GET
| Invoke-SrmGetResourceMappings                             | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/resources                                                                 | GET
| Invoke-SrmGetStoragePolicyMapping                         | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/storage-policies/{mapping_id}                                             | GET
| Invoke-SrmGetStoragePolicyMappings                        | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/storage-policies                                                          | GET
| Invoke-SrmGetTestNetworkMapping                           | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/test-networks/{mapping_id}                                                | GET
| Invoke-SrmGetTestNetworkMappings                          | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/test-networks                                                             | GET
| Invoke-SrmGetLicensing                                    | /pairings/{pairing_id}/srms/{srm_id}/licensing                                                                                    | GET
| Invoke-SrmGetPairing                                      | /pairings/{pairing_id}                                                                                                            | GET
| Invoke-SrmGetPairingIssues                                | /pairings/{pairing_id}/issues                                                                                                     | GET
| Invoke-SrmGetPairings                                     | /pairings                                                                                                                         | GET
| Invoke-SrmGetSrm                                          | /pairings/{pairing_id}/srms/{srm_id}                                                                                              | GET
| Invoke-SrmGetSrmIssues                                    | /pairings/{pairing_id}/srms/{srm_id}/issues                                                                                       | GET
| Invoke-SrmGetSrmPermissions                               | /pairings/{pairing_id}/srms/{srm_id}/permissions                                                                                  | GET
| Invoke-SrmGetSrms                                         | /pairings/{pairing_id}/srms                                                                                                       | GET
| Invoke-SrmGetAllGroups                                    | /pairings/{pairing_id}/protection-management/groups                                                                               | GET
| Invoke-SrmGetDatastoreGroup                               | /pairings/{pairing_id}/protection-management/groups/{group_id}/datastore-groups/{datastore_group_id}                              | GET
| Invoke-SrmGetDatastoreGroups                              | /pairings/{pairing_id}/protection-management/groups/{group_id}/datastore-groups                                                   | GET
| Invoke-SrmGetGroup                                        | /pairings/{pairing_id}/protection-management/groups/{group_id}                                                                    | GET
| Invoke-SrmGetGroupIssues                                  | /pairings/{pairing_id}/protection-management/groups/{group_id}/issues                                                             | GET
| Invoke-SrmGetGroupRelatedRecoveryPlans                    | /pairings/{pairing_id}/protection-management/groups/{group_id}/recovery-plans                                                     | GET
| Invoke-SrmGetGroupVm                                      | /pairings/{pairing_id}/protection-management/groups/{group_id}/vms/{vm_id}                                                        | GET
| Invoke-SrmGetGroupVms                                     | /pairings/{pairing_id}/protection-management/groups/{group_id}/vms                                                                | GET
| Invoke-SrmGetProtectionGroupFolder                        | /pairings/{pairing_id}/protection-management/inventory/{folder_id}                                                                | GET
| Invoke-SrmGetProtectionGroupFolderChildren                | /pairings/{pairing_id}/protection-management/inventory/{folder_id}/children                                                       | GET
| Invoke-SrmGetProtectionGroupFolders                       | /pairings/{pairing_id}/protection-management/inventory                                                                            | GET
| Invoke-SrmGetVmProtectionSettings                         | /pairings/{pairing_id}/protection-management/groups/{group_id}/vms/{vm_id}/protection-settings                                    | GET
| Invoke-SrmGetVvolReplicationGroup                         | /pairings/{pairing_id}/protection-management/groups/{group_id}/replication-groups/{replication_group_id}                          | GET
| Invoke-SrmGetVvolReplicationGroups                        | /pairings/{pairing_id}/protection-management/groups/{group_id}/replication-groups                                                 | GET
| Invoke-SrmGetAllPlanHistoryRecords                        | /pairings/{pairing_id}/recovery-management/history-reports                                                                        | GET
| Invoke-SrmGetAllRecoveryPlans                             | /pairings/{pairing_id}/recovery-management/plans                                                                                  | GET
| Invoke-SrmGetPlanHistoryRecord                            | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/history-reports/{report_id}                                            | GET
| Invoke-SrmGetPlanHistoryRecords                           | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/history-reports                                                        | GET
| Invoke-SrmGetPlanRelatedProtectionGroups                  | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/protection-groups                                                      | GET
| Invoke-SrmGetPlanRelatedTestNetworks                      | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/test-networks                                                          | GET
| Invoke-SrmGetPlanVirtualMachine                           | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}                                                            | GET
| Invoke-SrmGetPlanVirtualMachineDependentVms               | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/dependent-vms                            | GET
| Invoke-SrmGetPlanVirtualMachineIpCustomization            | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/ip-customization                         | GET
| Invoke-SrmGetPlanVirtualMachineRecoveryPriority           | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/priority                                 | GET
| Invoke-SrmGetPlanVirtualMachineRecoverySettings           | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings                                          | GET
| Invoke-SrmGetPlanVirtualMachineSummarizedRecoverySettings | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/summary                                  | GET
| Invoke-SrmGetPlanVirtualMachines                          | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms                                                                    | GET
| Invoke-SrmGetRecoveryPlan                                 | /pairings/{pairing_id}/recovery-management/plans/{plan_id}                                                                        | GET
| Invoke-SrmGetRecoveryPlanFolder                           | /pairings/{pairing_id}/recovery-management/inventory/{folder_id}                                                                  | GET
| Invoke-SrmGetRecoveryPlanFolderChildren                   | /pairings/{pairing_id}/recovery-management/inventory/{folder_id}/children                                                         | GET
| Invoke-SrmGetRecoveryPlanFolders                          | /pairings/{pairing_id}/recovery-management/inventory                                                                              | GET
| Invoke-SrmGetRecoveryPlanIssues                           | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/issues                                                                 | GET
| Invoke-SrmGetRecoveryStep                                 | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/{view_mode}/{recovery_step_id}                          | GET
| Invoke-SrmGetRecoverySteps                                | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/{view_mode}                                             | GET
| Invoke-SrmGetRecoveryStepsCalloutDetails                  | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/{view_mode}/{recovery_step_id}/callout-data             | GET
| Invoke-SrmGetRecoveryStepsUserPrompt                      | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/user-prompts/{prompt_id}                                | GET
| Invoke-SrmGetRecoveryStepsUserPrompts                     | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/user-prompts                                            | GET
| Invoke-SrmGetAllVvolFaultDomainReplicationGroups          | /pairings/{pairing_id}/srms/{srm_id}/replication-management/vvol/fault-domains/{domain_id}/replication-groups                     | GET
| Invoke-SrmGetAllVvolFaultDomains                          | /pairings/{pairing_id}/srms/{srm_id}/replication-management/vvol/fault-domains                                                    | GET
| Invoke-SrmGetArrayManager                                 | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-managers/{array_manager_id}                                 | GET
| Invoke-SrmGetArrayManagers                                | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-managers                                                    | GET
| Invoke-SrmGetReplicatedArrayPair                          | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-pairs/{array_pair_id}                                       | GET
| Invoke-SrmGetReplicatedArrayPairs                         | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-pairs                                                       | GET
| Invoke-SrmGetStorageAdapter                               | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/storage-adapters/{storage_adapter_id}                             | GET
| Invoke-SrmGetStorageAdapterConnectionParams               | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/storage-adapters/{storage_adapter_id}/connection-params           | GET
| Invoke-SrmGetStorageAdapters                              | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/storage-adapters                                                  | GET
| Invoke-SrmGetStorageDevices                               | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-pairs/{array_pair_id}/storage-devices                       | GET
| Invoke-SrmGetVsanProtectionGroup                          | /pairings/{pairing_id}/srms/{srm_id}/replication-management/vsan/protection-groups/{protection_group_id}                          | GET
| Invoke-SrmGetVsanProtectionGroups                         | /pairings/{pairing_id}/srms/{srm_id}/replication-management/vsan/protection-groups                                                | GET
| Invoke-SrmGetVvolFaultDomain                              | /pairings/{pairing_id}/srms/{srm_id}/replication-management/vvol/fault-domains/{domain_id}                                        | GET
| Invoke-SrmGetVvolFaultDomainReplicationGroup              | /pairings/{pairing_id}/srms/{srm_id}/replication-management/vvol/fault-domains/{domain_id}/replication-groups/{replication_group} | GET
| Invoke-SrmGetExportFilesInfo                              | /server/configuration/backup/files                                                                                                | GET
| Invoke-SrmGetExportSettings                               | /server/configuration/backup/settings                                                                                             | GET
| Invoke-SrmGetInfo                                         | /server/info                                                                                                                      | GET
| Invoke-SrmRetrieveExportFile                              | /server/configuration/backup/files/{file_id}                                                                                      | GET
| Invoke-SrmGetRecentTasksInfo                              | /tasks                                                                                                                            | GET
| Invoke-SrmGetTaskInfo                                     | /tasks/{taskId}                                                                                                                   | GET
| Invoke-SrmBrowseVcenterComputeItem                        | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/compute/{compute_id}/browser                                               | GET
| Invoke-SrmGetReplicatedVms                                | /pairings/{pairing_id}/vcenters/{vcenter_id}/replicated-vms                                                                       | GET
| Invoke-SrmGetVcStoragePolicies                            | /pairings/{pairing_id}/vcenters/{vcenter_id}/storage-policies                                                                     | GET
| Invoke-SrmGetVcStoragePolicy                              | /pairings/{pairing_id}/vcenters/{vcenter_id}/storage-policies/{storage_policy_id}                                                 | GET
| Invoke-SrmGetVcenter                                      | /pairings/{pairing_id}/vcenters/{vcenter_id}                                                                                      | GET
| Invoke-SrmGetVcenterComputeInventory                      | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/compute                                                                    | GET
| Invoke-SrmGetVcenterComputeItem                           | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/compute/{compute_id}                                                       | GET
| Invoke-SrmGetVcenterDatastoreItem                         | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/datastores/{datastore_id}                                                  | GET
| Invoke-SrmGetVcenterDatastores                            | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/datastores                                                                 | GET
| Invoke-SrmGetVcenterNetworkInventory                      | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/network                                                                    | GET
| Invoke-SrmGetVcenterNetworkItem                           | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/network/{network_id}                                                       | GET
| Invoke-SrmGetVcenterVmFolder                              | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/vm-folder/{vm_folder_id}                                                   | GET
| Invoke-SrmGetVcenterVmFolderInventory                     | /pairings/{pairing_id}/vcenters/{vcenter_id}/inventory/vm-folder                                                                  | GET
| Invoke-SrmGetVcenters                                     | /pairings/{pairing_id}/vcenters                                                                                                   | GET

### Display All VMware Live Recovery POST Command Details

1. Start a PowerShell session.

2. Display all POST cmdlets supported in `VMware.Sdk.Srm` by running the following command:

``` powershell
Get-SrmOperation -Method Post | Select-Object CommandInfo, Path, Method
```

3. Output for all POST cmdlets in `VMware.Sdk.Srm`.

| Command Info                                       | Path                                                                                                                                     | Method
| ---------------------------------------------------| -----------------------------------------------------------------------------------------------------------------------------------------| ------
| Invoke-SrmCreateFolderMapping                      | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/folders                                                                          | POST
| Invoke-SrmCreateNetworkMapping                     | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/networks                                                                         | POST
| Invoke-SrmCreatePlaceholderDatastores              | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/placeholder-datastores                                                           | POST
| Invoke-SrmCreateResourceMapping                    | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/resources                                                                        | POST
| Invoke-SrmCreateStoragePolicyMapping               | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/storage-policies                                                                 | POST
| Invoke-SrmCreateTestNetworkMappings                | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/test-networks                                                                    | POST
| Invoke-SrmQuerySuitableDatastores                  | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/placeholder-datastores/actions/query-suitable-datastores                         | POST
| Invoke-SrmApplyOfflineLicenseKey                   | /pairings/{pairing_id}/srms/{srm_id}/licensing/offline-key                                                                               | POST
| Invoke-SrmGenerateOfflineKeyActivationRequest      | /pairings/{pairing_id}/srms/{srm_id}/licensing/actions/generate-offline-key-activation-request                                           | POST
| Invoke-SrmCreatePairing                            | /pairings                                                                                                                                | POST
| Invoke-SrmDeleteSrmPermissions                     | /pairings/{pairing_id}/srms/{srm_id}/permissions/actions/remove                                                                          | POST
| Invoke-SrmReconnectPairing                         | /pairings/{pairing_id}/actions/reconnect                                                                                                 | POST
| Invoke-SrmAddDatastoreGroup                        | /pairings/{pairing_id}/protection-management/groups/{group_id}/datastore-groups                                                          | POST
| Invoke-SrmConfigureAll                             | /pairings/{pairing_id}/protection-management/groups/{group_id}/actions/configure-all-vms                                                 | POST
| Invoke-SrmCreateGroup                              | /pairings/{pairing_id}/protection-management/groups                                                                                      | POST
| Invoke-SrmCreateProtectionGroupFolder              | /pairings/{pairing_id}/protection-management/inventory                                                                                   | POST
| Invoke-SrmMoveProtectionGroupFolder                | /pairings/{pairing_id}/protection-management/inventory/{folder_id}/actions/move                                                          | POST
| Invoke-SrmReconfigureGroup                         | /pairings/{pairing_id}/protection-management/groups/{group_id}/actions/reconfigure                                                       | POST
| Invoke-SrmRemoveVmFromProtectionGroup              | /pairings/{pairing_id}/protection-management/groups/{group_id}/vms/{vm_id}/actions/remove-from-group                                     | POST
| Invoke-SrmRemoveVmProtection                       | /pairings/{pairing_id}/protection-management/groups/{group_id}/vms/{vm_id}/actions/remove-protection                                     | POST
| Invoke-SrmRenameProtectionGroupFolder              | /pairings/{pairing_id}/protection-management/inventory/{folder_id}/actions/rename                                                        | POST
| Invoke-SrmRestoreAllPlaceholders                   | /pairings/{pairing_id}/protection-management/groups/{group_id}/actions/restore-all-placeholders                                          | POST
| Invoke-SrmCancelRecoveryPlan                       | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/actions/cancel                                                                | POST
| Invoke-SrmCreatePlan                               | /pairings/{pairing_id}/recovery-management/plans                                                                                         | POST
| Invoke-SrmCreateRecoveryPlanFolder                 | /pairings/{pairing_id}/recovery-management/inventory                                                                                     | POST
| Invoke-SrmCreateRecoveryStepsCallout               | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/{view_mode}                                                    | POST
| Invoke-SrmDismissRecoveryStepsRecoveryPlanPrompt   | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/user-prompts/{prompt_id}/actions/dismiss-prompt                | POST
| Invoke-SrmEditRecoveryStepsCallout                 | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/{view_mode}/{recovery_step_id}/callout-data/actions/edit       | POST
| Invoke-SrmMoveRecoveryPlanFolder                   | /pairings/{pairing_id}/recovery-management/inventory/{folder_id}/actions/move                                                            | POST
| Invoke-SrmPlanVirtualMachineCheckDependentVms      | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/dependent-vms/actions/validate                  | POST
| Invoke-SrmReconfigureRecoveryPlan                  | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/actions/reconfigure                                                           | POST
| Invoke-SrmRenameRecoveryPlanFolder                 | /pairings/{pairing_id}/recovery-management/inventory/{folder_id}/actions/rename                                                          | POST
| Invoke-SrmRunCleanupTestRecovery                   | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/actions/cleanup                                                               | POST
| Invoke-SrmRunRecovery                              | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/actions/recovery                                                              | POST
| Invoke-SrmRunReprotect                             | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/actions/reprotect                                                             | POST
| Invoke-SrmRunTestRecovery                          | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/actions/test                                                                  | POST
| Invoke-SrmUpdatePlanVirtualMachineDependentVms     | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/dependent-vms/actions/update                    | POST
| Invoke-SrmUpdatePlanVirtualMachineIpCustomization  | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/ip-customization/actions/update                 | POST
| Invoke-SrmUpdatePlanVirtualMachineRecoverySettings | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/actions/update                                  | POST
| Invoke-SrmCreateArrayManager                       | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-managers                                                           | POST
| Invoke-SrmCreateArrayManager                       | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-managers                                                           | POST
| Invoke-SrmCreateReplicatedArrayPair                | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-pairs                                                              | POST
| Invoke-SrmDiscoverReplicatedArrayPairs             | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-managers/{array_manager_id}/actions/discover-array-pairs           | POST
| Invoke-SrmDiscoverStorageDevices                   | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-pairs/{array_pair_id}/actions/discover-storage-devices             | POST
| Invoke-SrmRetrieveUnassignedDatastoreGroups        | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-pairs/{array_pair_id}/actions/retrieve-unassigned-datastore-groups | POST
| Invoke-SrmExportConfiguration                      | /server/configuration/actions/backup                                                                                                     | POST
| Invoke-SrmUploadExportFiles                        | /server/configuration/backup/actions/upload-all-to-datastore                                                                             | POST

### Display All VMware Live Recovery PUT Command Details

1. Start a PowerShell session.

2. Display all PUT cmdlets supported in `VMware.Sdk.Srm` by running the following command:

``` powershell
Get-SrmOperation -Method Put | Select-Object CommandInfo, Path, Method
```

3. Output for all PUT cmdlets in `VMware.Sdk.Srm`.

| Command Info                                       | Path                      | Method
| ---------------------------------------------------| --------------------------------------------------------------------------------------------------| ------
| Invoke-SrmUpdateNetworkIpSubnetMapping             | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/networks/{mapping_id}/ip-subnet-mapping   | PUT
| Invoke-SrmManageSrmPermissions                     | /pairings/{pairing_id}/srms/{srm_id}/permissions                                                  | PUT
| Invoke-SrmUpdateVmProtectionSettings               | /pairings/{pairing_id}/protection-management/groups/{group_id}/vms/{vm_id}/protection-settings    | PUT
| Invoke-SrmUpdatePlanVirtualMachineRecoveryPriority | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/vms/{vm_id}/recovery-settings/priority | PUT

### Display All VMware Live Recovery PATCH Command Details

1. Start a PowerShell session.

2. Display all PATCH cmdlets supported in `VMware.Sdk.Srm` by running the following command:

``` powershell
Get-SrmOperation -Method Patch | Select-Object CommandInfo, Path, Method
```

3. Output for all PATCH cmdlets in `VMware.Sdk.Srm`.

| Command Info                | Path                                  | Method
| ----------------------------| --------------------------------------| ------
| Invoke-SrmSetExportSettings | /server/configuration/backup/settings | PATCH

### Display All VMware Live Recovery DELETE Command Details

1. Start a PowerShell session.

2. Display all DELETE cmdlets supported in `VMware.Sdk.Srm` by running the following command:

``` powershell
Get-SrmOperation -Method Delete | Select-Object CommandInfo, Path, Method
```

3. Output for all DELETE cmdlets in `VMware.Sdk.Srm`.

| Command Info                           | Path                                                                                                     | Method
| ---------------------------------------| ---------------------------------------------------------------------------------------------------------| ------
| Invoke-SrmDeleteFolderMapping          | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/folders/{mapping_id}                             | DELETE
| Invoke-SrmDeleteNetworkMapping         | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/networks/{mapping_id}                            | DELETE
| Invoke-SrmDeletePlaceholderDatastore   | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/placeholder-datastores/{datastore_id}            | DELETE
| Invoke-SrmDeleteResourceMapping        | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/resources/{mapping_id}                           | DELETE
| Invoke-SrmDeleteStoragePolicyMapping   | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/storage-policies/{mapping_id}                    | DELETE
| Invoke-SrmDeleteTestNetworkMapping     | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/test-networks/{mapping_id}                       | DELETE
| Invoke-SrmRemoveNetworkIpSubnetMapping | /pairings/{pairing_id}/srms/{srm_id}/inventory-mappings/networks/{mapping_id}/ip-subnet-mapping          | DELETE
| Invoke-SrmRemoveOfflineLicenseKey      | /pairings/{pairing_id}/srms/{srm_id}/licensing/offline-key                                               | DELETE
| Invoke-SrmDeletePairing                | /pairings/{pairing_id}                                                                                   | DELETE
| Invoke-SrmRemoveSrmPermissions         | /pairings/{pairing_id}/srms/{srm_id}/permissions                                                         | DELETE
| Invoke-SrmDeleteGroup                  | /pairings/{pairing_id}/protection-management/groups/{group_id}                                           | DELETE
| Invoke-SrmDeleteProtectionGroupFolder  | /pairings/{pairing_id}/protection-management/inventory/{folder_id}                                       | DELETE
| Invoke-SrmRemoveDatastoreGroup         | /pairings/{pairing_id}/protection-management/groups/{group_id}/datastore-groups/{datastore_group_id}     | DELETE
| Invoke-SrmDeleteRecoveryPlan           | /pairings/{pairing_id}/recovery-management/plans/{plan_id}                                               | DELETE
| Invoke-SrmDeleteRecoveryPlanFolder     | /pairings/{pairing_id}/recovery-management/inventory/{folder_id}                                         | DELETE
| Invoke-SrmDeleteRecoveryStep           | /pairings/{pairing_id}/recovery-management/plans/{plan_id}/recovery-steps/{view_mode}/{recovery_step_id} | DELETE
| Invoke-SrmDeleteArrayManager           | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-managers/{array_manager_id}        | DELETE
| Invoke-SrmDeleteReplicatedArrayPair    | /pairings/{pairing_id}/srms/{srm_id}/replication-management/abr/array-pairs/{array_pair_id}              | DELETE
| Invoke-SrmDeleteExportFiles            | /server/configuration/backup/files                                                                       | DELETE

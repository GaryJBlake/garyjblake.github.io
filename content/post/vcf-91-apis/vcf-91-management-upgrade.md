+++
author = "GaryJBlake"
title = "VMware Cloud Foundation APIs: Upgrading VCF Management"
date = "2026-08-11"
description = "VMware Cloud Foundation APIs: Upgrading VCF Management"
tags = [
    "VCF 9.1",
    "API"
]
categories = [
    "VMware Cloud Foundation",
    "VCF Operations"
]
series = [
    "VMware Cloud Foundation 9.1 APIs"
]
+++

Performing an upgrade of your VMware Cloud Foundation platform involves multiple steps which include running a precheck of the component before commencing the upgrade itself. I've broken these steps down into sections as you have some optionality.

- [Authenticating to the VCF Fleet Lifcycle Service](#authenticating-to-the-vcf-fleet-lifcycle-service)
- [Configure the Upgrade Plan](#configure-the-upgrade-plan)
- [Perform Prechecks Before Upgrading](#perform-prechecks-before-upgrading)
  - [Perform Prechecks For All Components](#perform-prechecks-for-all-components)
  - [Perform Prechecks for a Single Component](#perform-prechecks-for-a-single-component)
- [Perform Component Upgrades](#perform-component-upgrades)
  - [Perform an Upgrade of All Components](#perform-an-upgrade-of-all-components)
  - [Perform Upgrade of a Single Component](#perform-upgrade-of-a-single-component)

### Authenticating to the VCF Fleet Lifcycle Service

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* POST /api/v1/identity/token

1. Connect to a system that has access to the infrastructure and is capable of running CURL.

2. Replace the values in the sample code with values for your VCF Fleet Lifecycle Service and paste the commands in the console. If your not sure which endpoint this FQDN should be log into VCF Operations, go to ***Build > Lifecycle > VCF Management*** and select the ***Components*** tab and locate the component named ***Fleet lifecycle*** the FQDN is shown in the FQDN column.

```bash
export vcfFleetLifecycleFqdn='flt-fc01.rainpole.io'
export vcfFleetLifecycleUser='admin@vsp.local'
export vcfFleetLifecyclePass='VMw@re1!VMw@re1!'
```

3. Authenticate to the VCF Fleet Lifecycle service and obtain a token by running the following command:

```bash
vcfFleetLifecycleToken=$(curl -k -X POST "https://$vcfFleetLifecycleFqdn/api/v1/identity/token" \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data "grant_type=password" \
    --data "username=$vcfFleetLifecycleUser" \
    --data "password=$vcfFleetLifecyclePass" \
    | jq -r '.access_token')
```

4. Verify you successfully obtained an authentication token by running the following command:

```bash
echo $vcfFleetLifecycleToken
```

Example Output:

```bash
eyJhbGciOiJFZERTQSIsImtpZCI6Ilg4Mk5veGNJRlVCVEFiY0xPM1NUdU12UTF6Qlo4d01xeUxDTGNuOGZYdFUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2ZsdC1mYzAxLnJhaW5wb2xlLmlvIiwic3ViIjoiYWRtaW5AdnNwLmxvY2FsIiwiYXVkIjpbInZzcCJdLCJleHAiOjE3ODUyNTE2NDIsImlhdCI6MTc4NTIzNzI0MiwianRpIjoiNTg1NTliYmItNTZlOS00ZWE2LWI2ZDgtNTY0ZjNkYWQwMGRlIiwiYXpwIjoicGFzc3dvcmRfZ3JhbnRfY2xpZW50IiwiYWNjdCI6ImFkbWluQHZzcC5sb2NhbCIsImF1dGhvcml6YXRpb25fZGV0YWlscyI6bnVsbH0.hGXyWeet4RPMvnhbjHs6JtPYTCYcbGFFfsN9toOSMiJca0xXOU2r4rU7OY9hTsmh9h1RzPpAxh-GUZTUMADMCg
```

### Configure the Upgrade Plan

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* GET /fleet-lcm/v1/upgrade-plans
* GET /fleet-lcm/v1/release-versions/target-versions
* PATCH /fleet-lcm/v1/upgrade-plans/<upgradePlanId>

1. Retrieve the current upgrade plan ID by running the following command:

```bash
upgradePlanId=$(curl -ks -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/upgrade-plans" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '.elements[] .id')
```

2. Verify you successfully obtained the upgrade plan ID by running the following command:

```bash
echo $upgradePlanId
```

Example Output:

```bash
019f1e4d-a527-79e4-a7ff-bf3797ee6eff
```

3. Obtain the known target versions by the system and extract to the *target-versions.json* file by running the following command:

```bash
curl -ks -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/release-versions/target-versions" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '.elements[]' > target-versions.json
```

4. Verify the contents of the *target-versions.json* file  by running the following command:

```bash
cat target-versions.json
```

Example Output:

```json
{
  "version": "9.1.0.0",
  "components": [
    {
      "type": "OPS",
      "publicName": "VCF Operations",
      "versions": [
        "9.1.0.0400.25541561",
        "9.1.0.0300.25531073",
        "9.1.0.0200.25500350",
        "9.1.0.0100.25435105",
        "9.1.0.0.25346025"
      ]
    },
    {
      "type": "OPS_DATA_PLATFORM",
      "publicName": "Real-time metrics",
      "versions": [
        "9.1.0.0400.25544944",
        "9.1.0.0100.25435036",
        "9.1.0.0.25346020"
      ]
    },
    {
      "type": "OPS_LOGS",
      "publicName": "Log management",
      "versions": [
        "9.1.0.0400.25544947",
        "9.1.0.0100.25435121",
        "9.1.0.0.25346055"
      ]
    },
    {
      "type": "OPS_NETWORKS",
      "publicName": "VCF Operations for networks",
      "versions": [
        "9.1.0.0200.25517220",
        "9.1.0.0100.25427421",
        "9.1.0.0.25318550"
      ]
    },
    {
      "type": "SALT",
      "publicName": "Salt master",
      "versions": [
        "9.1.0.0400.25544946",
        "9.1.0.0100.25434834",
        "9.1.0.0.25346036"
      ]
    },
    {
      "type": "SALT_RAAS",
      "publicName": "Salt RaaS",
      "versions": [
        "9.1.0.0400.25544946",
        "9.1.0.0100.25434834",
        "9.1.0.0.25346036"
      ]
    },
    {
      "type": "TELEMETRY_ACCEPTOR",
      "publicName": "Telemetry",
      "versions": [
        "9.1.0.0.25181946"
      ]
    },
    {
      "type": "VCD_MIGRATOR",
      "publicName": "Migration service engine",
      "versions": [
        "9.1.0.0200.25556825",
        "9.1.0.0.25370929"
      ]
    },
    {
      "type": "VCFA",
      "publicName": "VCF Automation",
      "versions": [
        "9.1.0.0200.25556825",
        "9.1.0.0100.25429499",
        "9.1.0.0.25370929"
      ]
    },
    {
      "type": "VCFMS_METRICS_STORE",
      "publicName": "Real-time metrics store",
      "versions": [
        "9.1.0.0200.25555874",
        "9.1.0.0.25370367"
      ]
    },
    {
      "type": "VCF_FLEET_DEPOT",
      "publicName": "Software depot",
      "versions": [
        "9.1.0.0400.25570105",
        "9.1.0.0.25371105"
      ]
    },
    {
      "type": "VCF_OPS_CLOUD_PROXY",
      "publicName": "Cloud proxy",
      "versions": [
        "9.1.0.0400.25541562",
        "9.1.0.0300.25531074",
        "9.1.0.0200.25500351",
        "9.1.0.0100.25434833",
        "9.1.0.0.25346033"
      ]
    },
    {
      "type": "VCF_SDDC_LCM",
      "publicName": "SDDC lifecycle",
      "versions": [
        "9.1.0.0400.25570103",
        "9.1.0.0300.25536194",
        "9.1.0.0200.25495903",
        "9.1.0.0100.25423352",
        "9.1.0.0.25371107"
      ]
    },
    {
      "type": "VIDB",
      "publicName": "Identity broker",
      "versions": [
        "9.1.0.0100.25522734",
        "9.1.0.0.25368698"
      ]
    },
    {
      "type": "VSP",
      "publicName": "VCF services runtime",
      "versions": [
        "9.1.0.0200.25555874",
        "9.1.0.0.25370367"
      ]
    }
  ]
}
```

5. Extract the most current version from the *target-versions.json* file and create the *desired-state.json* payload to configure the upgrade plan by running the following command:

```bash
jq '{
  spec: {
    desiredSoftware: {
      version: "9.1.0.0",
      components: [.components[] | {type: .type, version: .versions[0]}]
    }
  }
}' target-versions.json > desired-state.json
```

6. Verify the contents of the *desired-state.json* file by running the following command:

```bash
cat desired-state.json
```

Example Output:

```json
{
  "spec": {
    "desiredSoftware": {
      "version": "9.1.0.0",
      "components": [
        {
          "type": "OPS",
          "version": "9.1.0.0300.25531073"
        },
        {
          "type": "OPS_DATA_PLATFORM",
          "version": "9.1.0.0400.25544944"
        },
        {
          "type": "OPS_LOGS",
          "version": "9.1.0.0400.25544947"
        },
        {
          "type": "OPS_NETWORKS",
          "version": "9.1.0.0200.25517220"
        },
        {
          "type": "SALT",
          "version": "9.1.0.0400.25544946"
        },
        {
          "type": "SALT_RAAS",
          "version": "9.1.0.0400.25544946"
        },
        {
          "type": "TELEMETRY_ACCEPTOR",
          "version": "9.1.0.0.25181946"
        },
        {
          "type": "VCD_MIGRATOR",
          "version": "9.1.0.0200.25556825"
        },
        {
          "type": "VCFA",
          "version": "9.1.0.0200.25556825"
        },
        {
          "type": "VCFMS_METRICS_STORE",
          "version": "9.1.0.0200.25555874"
        },
        {
          "type": "VCF_FLEET_DEPOT",
          "version": "9.1.0.0400.25570105"
        },
        {
          "type": "VCF_OPS_CLOUD_PROXY",
          "version": "9.1.0.0400.25541562"
        },
        {
          "type": "VCF_SDDC_LCM",
          "version": "9.1.0.0400.25570103"
        },
        {
          "type": "VIDB",
          "version": "9.1.0.0100.25522734"
        },
        {
          "type": "VSP",
          "version": "9.1.0.0200.25555874"
        }
      ]
    }
  }
}
```

7. Update the upgrade plan with the new target releases by running the following command:

```bash
curl -ks -X PATCH "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/upgrade-plans/${upgradePlanId}" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d @desired-state.json \
  | jq
```

### Perform Prechecks Before Upgrading

#### Perform Prechecks For All Components

**VCF Fleet Lifecycle Service APIs Used**

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* POST /fleet-lcm/v1/upgrade-plans/<upgradePlanId>?action=precheck
* GET /fleet-lcm/v1/tasks/<taskId>

1. You can perform the prechecks for all components at once by running the following command:

```bash
taskId=$(curl -ks -X POST "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/upgrade-plans/${upgradePlanId}?action=precheck" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r ".id")
```

2. Check the status of the precheck task by running the following command:

```bash
curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$taskId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

3. The command in previous step will need to be run multiple times, you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/${taskId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 60 seconds."
    sleep 60
done
```

#### Perform Prechecks for a Single Component

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* GET /fleet-lcm/v1/components
* POST /fleet-lcm/v1/upgrade-plans/<upgradePlanId>?action=precheck
* GET /fleet-lcm/v1/tasks/<taskId>

Alternatively you can perform prechecks on an individual components by passing in the component ID.

1.  Obtain a list of components and their component IDs by running the following command:

```bash
curl -ks -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/components" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '["ID", "COMPONENT TYPE", "DESCRIPTION"], (.components[] | [.id, .componentType, .componentTypeDescription]) | @tsv' \
  | column -t -s $'\t'
```

2. Replace the values in the sample code with your value and paste the commands in the console.

```bash
export componentId='868ec4ec-a583-4462-9469-9960bfa5c95d'
```

3. Perform a prechecks on an individual component by running the following command:

```bash
taskId=$(curl -ks -X POST "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/upgrade-plans/${upgradePlanId}?action=precheck" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d "{\"componentsFilter\": [{\"id\": \"${componentId}\"}]}" \
  | jq -r ".id")
```

4. Check the status of the precheck task by running the following command:

```bash
curl -g -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/${taskId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

5. The command in previous step will need to be run multiple times, you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/${taskId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 60 seconds."
    sleep 60
done
```

### Perform Component Upgrades

#### Perform an Upgrade of All Components

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* POST /fleet-lcm/v1/upgrade-plans/<upgradePlanId>?action=apply
* GET /fleet-lcm/v1/tasks/<taskId>

1. You can perform the upgrade for all components at once by running the following command:

```bash
taskId=$(curl -ks -X POST "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/upgrade-plans/${upgradePlanId}?action=apply" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r ".id")
```

2. Check the status of the upgrade task by running the following command:

```bash
curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$taskId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

3. The command in previous step will need to be run multiple times, you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/${taskId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 60 seconds."
    sleep 60
done
```

#### Perform Upgrade of a Single Component

[VCF Fleet LCM Service APIs](https://developer.broadcom.com/xapis/vcf-fleet-lcm-service-apis/latest/)

* GET /fleet-lcm/v1/components
* POST /fleet-lcm/v1/upgrade-plans/<upgradePlanId>?action=apply
* GET /fleet-lcm/v1/tasks/<taskId>

1.  Obtain a list of components and their component IDs by running the following command:

```bash
curl -ks -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/components" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  | jq -r '["ID", "COMPONENT TYPE", "DESCRIPTION"], (.components[] | [.id, .componentType, .componentTypeDescription]) | @tsv' \
  | column -t -s $'\t'
```

2. Replace the values in the sample code with your value and paste the commands in the console.

```bash
export componentId='ace00e3c-8c03-46a0-a043-2945426776ee'
```

3. Perform the upgrade of a single component by running the following command:

```bash
taskId=$(curl -ks -X POST "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/upgrade-plans/${upgradePlanId}?action=apply" \
  --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
  --header "Accept: application/json" \
  --header "Content-Type: application/json" \
  -d "{\"componentsFilter\": [{\"id\": \"${componentId}\"}]}" \
  | jq -r ".id")
```

4. Check the status of the upgrade task by running the following command:

```bash
curl -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/$taskId" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq
```

5. The command in previous step will need to be run multiple times, you can run the command over and over by running the following command:

```bash
while curl -s -k -X GET "https://$vcfFleetLifecycleFqdn/fleet-lcm/v1/tasks/${taskId}" \
    --header "Authorization: Bearer ${vcfFleetLifecycleToken}" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    | jq '{status: .status}' \
    | grep -q "RUNNING"; do
    echo "Still in 'RUNNING' state... waiting 60 seconds."
    sleep 60
done
```

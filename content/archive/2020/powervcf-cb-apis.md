+++
author = "GaryJBlake"
title = "PowerVCF v2.0 - Using VMware Cloud Builder with Public APIs"
date = "2020-04-29"
description = "PowerVCF v2.0 - Using VMware Cloud Builder with Public APIs"
tags = [
    "API",
    "PowerShell",
    "VCF"
]
categories = [
    "VMware Cloud Foundation",
    "VMware Cloud Builder",
    "PowerVCF"
]
series = [
    
]
+++

<img align="left" width="200" height="200" src="/images/powervcf-color-transparent.webp" style="float:left; padding-right:20px" >

<!-- wp:paragraph -->
<p>For those that follow my blog posts you will be aware that I’m involved with the development of PowerVCF a collection of PowerShell cmdlets created to expose the Public APIs of VMware Cloud Foundation. Whilst working on PowerVCF v2.0 I started to take a look at the Public APIs for VMware Cloud Builder, I’ve been heavily involved with the development team for a number of years now and knew there were both Public and Private APIs but just never had the time to dig deeper. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>First thing to note is that the Public APIs for VMware Cloud Builder are actually documented within the Public APIs for VMware Cloud Foundation <a rel="noreferrer noopener" href="https://code.vmware.com/apis/921/vmware-cloud-foundation?h=VMware%20Cloud%20Foundation" target="_blank">here</a>. From within the documentation refer to the section named <a href="https://vdc-download.vmware.com/vmwb-repository/dcr-public/1020677c-5d51-40dc-8967-256fc6429ba0/78a109b8-feea-4021-a095-71be503543c6/index.html#_sddcs_management_domain">2.3. SDDCs (Management Domain)</a>, there is support for the following API calls:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>GET /v1/sddcs - Retrieve all SDDCs</li><li>POST /v1/sddcs - Create SDDC</li><li>GET /v1/sddcs/{id} - Retrieve a SDDC</li><li>PATCH /v1/sddcs/{id} - Retry failed SDDC creation</li><li>GET /v1/sddcs/validations - Get all SDDC specification validations</li><li>POST /v1/sddcs/validations - Validate SDDC specification before creation</li><li>GET /v1/sddcs/validations/{id} - Get SDDC specification validation status by ID</li><li>DELETE /v1/sddcs/validations/{id} - Cancel SDDC specification validation</li><li>PATCH /v1/sddcs/validations/{id} - Retry SDDC validation</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Based on these APIs, I built a number of new PowerVCF cmdlets as follows:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>Get-CloudBuilderSDDC</li><li>Start-CloudBuilderSDDC</li><li>Restart-CloudBuilderSDDC</li><li>Get-CloudBuilderSDDCValidation</li><li>Start-CloudBuilderSDDCValidation</li><li>Stop-CloudBuilderSDDCValidation</li><li>Restart-CloudBuilderSDDCValidation</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>Next I needed to work on building a valid JSON spec to be used both during the validation and deployment phases, sounds like a simple task based on the fact that VMware Cloud Builder already takes the Deployment Parameters Workbook and converts it into a JSON file through the utility called JsonGenerator however not quite so. The biggest challenge here is that in VMware Cloud Foundation 4.0 the User Interface still uses the Private APIs which means there are a number of differences between the JSON elements used for the Private API versus the Public API so just taking and reusing the JSON file was not possible. A couple of examples include:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>"VLANId" versus "vlanId"</li><li>"dvsId" versus "dvsName"</li><li>"niocSpec" versus "niocSpecs"</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>After walking through and doing a comparison section by section I finally had what I hoped to be a working JSON and was ready to perform end to end testing using the new PowerVCF cmdlets and the JSON spec. For the working JSON sample, see the bottom of this post.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>I will now cover the process of using the new PowerVCF cmdlets to drive the deployment of a VMware Cloud Foundation 4.0 Management Domain.</p>
<!-- /wp:paragraph -->

<!-- wp:quote -->
<blockquote class="wp-block-quote"><p>Assumption: You have already installed or imported PowerVCF on your system.</p></blockquote>
<!-- /wp:quote -->

<!-- wp:heading {"level":3} -->
<h3>Performing Validations using PowerVCF v2.0</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>The following procedure demonstrates the process of using PowerVCF to perform the validation of the JSON spec and target environment using VMware Cloud Builder.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Procedure</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>1. Before performing any operations on VMware Cloud Builder using PowerVCF you must enter the credentials, the PowerVCF cmdlet <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/Connect-CloudBuilder/" target="_blank" rel="noreferrer noopener">Connect-CloudBuilder</a></strong> takes these credentials and stores them as a base64 string which is then used for each subsequent cmdlet. Enter the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Connect-CloudBuilder -fqdn sfo-cb01.sfo.rainpole.io -username admin -password VMw@re1!</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>2. Taking a copy of the sample JSON file from the bottom of this post, copy and paste into an editor (I use Notepad++), make changes as they correspond to your environment and save the file. I'm using sfo-managementDomain.json for the purpose of this blog post and saving it to the root of my E: Drive.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>3. Next we want trigger the validation process, this is achieved using the <strong>Start-CloudBuilderSDDCValidation</strong> cmdlet and passing it the json file we created in the previous step. Enter the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Start-CloudBuilderSDDCValidation -json E:\sfo-managementDomain.json</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here we can see the output of the <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/SDDC%20(Cloud%20Builder)/Start-CloudBuilderSDDCValidation/" target="_blank" rel="noreferrer noopener">Start-CloudBuilderSDDCValidation</a></strong> cmdlet, the task has a unique ID which can be used with the <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/SDDC%20(Cloud%20Builder)/Get-CloudBuilderSDDCValidation/" target="_blank" rel="noreferrer noopener">Get-CloudBuilderSDDCValidation</a></strong> cmdlet to get updates on the validation process.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":447,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-12.png?w=1024" alt="" class="wp-image-447"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>We can also log into the VMware Cloud Builder user interface where we also see the validation workflow in progress.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":448,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-13.png?w=1024" alt="" class="wp-image-448"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>4. Now using the <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/SDDC%20(Cloud%20Builder)/Get-CloudBuilderSDDCValidation/" target="_blank" rel="noreferrer noopener">Get-CloudBuilderSDDCValidation</a></strong> cmdlet and the unique ID shown during the triggering of the validation workflow we can check the status using the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-CloudBuilderSDDCValidation -id 9f13aac9-3d9c-43f1-b41a-d152d418b4b6</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":449,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-14.png?w=1024" alt="" class="wp-image-449"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>We can see based on the <em><strong>executionStatus</strong></em> the validation has <strong><em>COMPLETED</em></strong>, we can verify this further through the VMware Cloud Builder user interface.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":450,"sizeSlug":"large","className":"is-style-default"} -->
<figure class="wp-block-image size-large is-style-default"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-15.png?w=1024" alt="" class="wp-image-450"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>When looking at status of the validation using the VMware Cloud Builder user interface you will see that there are a number of validations performed, each with their own status. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>5. We can view the same level of detail using the PowerVCF cmdlet by simply adding ConvertTo-Json to the command as follows:</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-CloudBuilderSDDCValidation -id 9f13aac9-3d9c-43f1-b41a-d152d418b4b6 | ConvertTo-Json</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":453,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-16.png?w=1024" alt="" class="wp-image-453"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once your audit has finished and has the <strong>COMPLETED</strong> status we can move on to trigger the actual deployment.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Performing Deployment using PowerVCF 2.0</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Now we have the json spec and the infrastructure validated we are ready trigger the actual deployment.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Procedure</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>1. Using the PowerVCF cmdlet <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/Connect-CloudBuilder/" target="_blank" rel="noreferrer noopener">Connect-CloudBuilder</a></strong> connect to the VMware Cloud Builder appliance using the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Connect-CloudBuilder -fqdn sfo-cb01.sfo.rainpole.io -username admin -password VMw@re1!</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>2. Using the <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/SDDC%20(Cloud%20Builder)/Start-CloudBuilderSDDC/" target="_blank" rel="noreferrer noopener">Start-CloudBuilderSDDC</a></strong> cmdlet and passing it the json file we start the deployment workflow using the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Start-CloudBuilderSDDC -json E:\sfo-managementDomain.json</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Here we can see the output of the <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/SDDC%20(Cloud%20Builder)/Start-CloudBuilderSDDC/" target="_blank" rel="noreferrer noopener">Start-CloudBuilderSDDC</a></strong> cmdlet, the task has a unique ID which can be used with the <strong><a href="https://powervcf.readthedocs.io/en/latest/functions/SDDC%20(Cloud%20Builder)/Get-CloudBuilderSDDC/" target="_blank" rel="noreferrer noopener">Get-CloudBuilderSDDC</a></strong> cmdlet to get updates on the validation process.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":455,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-17.png?w=1024" alt="" class="wp-image-455"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>And again we can see the status of the deployment by logging into the VMware Cloud Builder user interface.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":457,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-18.png?w=1024" alt="" class="wp-image-457"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>3. Now using the <strong><a rel="noreferrer noopener" href="https://powervcf.readthedocs.io/en/latest/functions/SDDC%20(Cloud%20Builder)/Get-CloudBuilderSDDC/" target="_blank">Get-CloudBuilderSDDC</a></strong> cmdlet and the unique ID shown during the trigger of the workflow we can check the status using the following syntax.</p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>Get-CloudBuilderSDDC -id d5b175e1-a966-4845-85c3-43e98e616267</code></pre>
<!-- /wp:code -->

<!-- wp:image {"id":459,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-19.png?w=1024" alt="" class="wp-image-459"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>After some time, we can see based on the <em><strong>status</strong></em> the deployment has <em><strong>COMPLETED_WITH_SUCCESS</strong></em>, we can verify this further through the VMware Cloud Builder user interface.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":461,"sizeSlug":"large"} -->
<figure class="wp-block-image size-large"><img src="https://mycloudyworldcom.files.wordpress.com/2020/04/image-20.png?w=1024" alt="" class="wp-image-461"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>And there you have it, using the new VMware Cloud Builder cmdlets released with PowerVCF 2.0 it's now possible to script the automation of the validation and deployment of a VMware Cloud Foundation 4.0 Management Domain.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Hope you have found this post useful, if you have comments then please feel free to get in touch.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Sample JSON File</h3>
<!-- /wp:heading -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">{
        "excludedComponents": [ "NSX-V" ],
	"dvSwitchVersion": "7.0.0",
	"skipEsxThumbprintValidation": true,
	"managementPoolName": "sfo-m01-np01",
	"sddcManagerSpec": {
		"secondUserCredentials": {
			"username": "vcf",
			"password": "VMw@re1!"
		},
		"ipAddress": "172.20.11.59",
		"netmask": "255.255.255.0",
		"hostname": "sfo-vcf01",
		"rootUserCredentials": {
			"username": "root",
			"password": "VMw@re1!"
		},
		"restApiCredentials": {
			"username": "admin",
			"password": "VMw@re1!"
		}
	},
	"sddcId": "sfo-m01",
	"ceipEnabled": true,
	"esxLicense": "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX",
	"taskName": "workflowconfig/workflowspec-ems.json",
	"ntpServers": [ "ntp.sfo.rainpole.io" ],
	"dnsSpec": {
		"subdomain": "sfo.rainpole.io",
		"domain": "sfo.rainpole.io",
		"nameserver": "172.20.11.4",
		"secondaryNameserver": "172.20.11.5"
	},
	"networkSpecs": [{
			"subnet": "172.20.11.0/24",
			"vlanId": "3061",
			"mtu": "1500",
			"networkType": "MANAGEMENT",
            "gateway": "172.20.11.1",
            "portGroupKey": "sfo-m01-cl01-vds01-pg-mgmt",
			"association": "sfo-m01-dc01"
		},
		{
			"subnet": "172.20.13.0/24",
			"includeIpAddressRanges": [ {"startIpAddress": "172.20.13.101", "endIpAddress": "172.20.13.104" } ],
			"vlanId": "3063",
			"mtu": "9000",
			"networkType": "VSAN",
            "gateway": "172.20.13.253",
            "portGroupKey": "sfo-m01-cl01-vds01-pg-vsan",
			"association": "sfo-m01-dc01"
		},
		{
			"subnet": "172.20.12.0/24",
			"includeIpAddressRanges": [ {"startIpAddress": "172.20.12.101", "endIpAddress": "172.20.12.104" } ],
			"vlanId": "3062",
			"mtu": "9000",
			"networkType": "VMOTION",
            "gateway": "172.20.12.253",
            "portGroupKey": "sfo-m01-cl01-vds01-pg-vmotion",
			"association": "sfo-m01-dc01"
		},
		{
			"networkType": "UPLINK01",
			"subnet": "172.27.24.0/24",
			"gateway": "172.27.24.253",
			"vlanId": "3284",
			"mtu": "9000",
			"portGroupKey": "sfo-m01-cl01-vds01-pg-uplink01",
			"association": "sfo-m01-dc01"
		},
		{
			"networkType": "UPLINK02",
			"subnet": "172.27.25.0/24",
			"gateway": "172.27.25.253",
			"vlanId": "3285",
			"mtu": "9000",
			"portGroupKey": "sfo-m01-cl01-vds01-pg-uplink02",
			"association": "sfo-m01-dc01"
		},
		{
			"networkType": "REGION_SPECIFIC",
			"subnet": "192.168.31.0/24",
			"gateway": "192.168.31.1",
			"mtu": "9000",
			"vlanId": "0",
			"association": "sfo-m01-dc01"
		},
		{
			"networkType": "X_REGION",
			"subnet": "192.168.11.0/24",
			"gateway": "192.168.11.1",
			"mtu": "9000",
			"vlanId": "0",
			"association": "sfo-m01-dc01"
		},
		{
			"networkType": "NSXT_EDGE_TEP",
			"subnet": "172.20.15.0/24",
			"mtu": "9000",
			"gateway": "172.20.15.253",
			"vlanId": "3065",
			"association": "sfo-m01-dc01"
		}
	],
	"nsxtSpec": {
		"nsxtManagerSize": "medium",
        "nsxtManagers": [
            {
                "hostname": "sfo-m01-nsx01a",
                "ip": "172.20.11.66"
            },
            {
                "hostname": "sfo-m01-nsx01b",
                "ip": "172.20.11.67"
            },
            {
                "hostname": "sfo-m01-nsx01c",
                "ip": "172.20.11.68"
            }
          ],
        "rootNsxtManagerPassword": "VMw@re1!VMw@re1!",
        "nsxtAdminPassword": "VMw@re1!VMw@re1!",
        "nsxtAuditPassword": "VMw@re1!VMw@re1!",
        "rootLoginEnabledForNsxtManager": "true",
        "sshEnabledForNsxtManager": "true",
		"overLayTransportZone": {
			"zoneName": "sfo-m01-tz-overlay01",
            "networkName": "sfo-m01-cl01-nvds01-pg-edge"
		},
		"vlanTransportZone": {
			"zoneName": "sfo-m01-tz-vlan01",
            "networkName": "netName-vlan"
		},
		"vip": "172.20.11.65",
		"vipFqdn": "sfo-m01-nsx01",
		"nsxtLicense": "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX",
		"transportVlanId": 3064,
		"nsxtEdgeSpec": {
			"edgeClusterName": "sfo-m01-ec01",
            "edgeRootPassword": "VMw@re1!VMw@re1!",
            "edgeAdminPassword": "VMw@re1!VMw@re1!",
            "edgeAuditPassword": "VMw@re1!VMw@re1!",
			"edgeFormFactor": "MEDIUM",
			"tier0ServicesHighAvailability": "ACTIVE_ACTIVE",
			"asn": 65003,
			"edgeServicesSpecs": {
				"tier0GatewayName": "sfo-m01-ec01-t0-gw01",
				"tier1GatewayName": "sfo-m01-ec01-t1-gw01"
			},
			"edgeNodeSpecs": [{
					"edgeNodeName": "sfo-m01-en01",
					"edgeNodeHostname": "sfo-m01-en01.sfo.rainpole.io",
					"managementCidr": "172.20.11.69/24",
					"edgeVtep1Cidr": "172.20.15.2/24",
					"edgeVtep2Cidr": "172.20.15.3/24",
					"interfaces": [{
							"name": "uplink-edge1-tor1",
							"interfaceCidr": "172.27.24.2/24"
						},
						{
							"name": "uplink-edge1-tor2",
							"interfaceCidr": "172.27.25.3/24"
						}
					]
				},
				{
					"edgeNodeName": "sfo-m01-en02",
					"edgeNodeHostname": "sfo-m01-en02.sfo.rainpole.io",
					"managementCidr": "172.20.11.70/24",
					"edgeVtep1Cidr": "172.20.15.4/24",
					"edgeVtep2Cidr": "172.20.15.5/24",
					"interfaces": [{
							"name": "uplink-edge2-tor1",
							"interfaceCidr": "172.27.24.3/24"
						},
						{
							"name": "uplink-edge2-tor2",
							"interfaceCidr": "172.27.25.2/24"
						}
					]
				}
			],
			"bgpNeighbours": [{
					"neighbourIp": "172.27.24.1",
					"autonomousSystem": 65001,
					"password": "VMw@re1!"
				},
				{
					"neighbourIp": "172.27.25.1",
					"autonomousSystem": 65001,
					"password": "VMw@re1!"
				}
			]
		},
		"logicalSegments": [{
				"name": "sfo-m01-seg01",
				"networkType": "REGION_SPECIFIC"
			},
			{
				"name": "xreg-m01-seg01",
				"networkType": "X_REGION"
			}
		]
	},
	"vsanSpec": {
		"vsanName": "vsan-1",
        "licenseFile": "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX",
        "vsanDedup": "false",
		"datastoreName": "sfo-m01-cl01-ds-vsan01"
	},
	"dvsSpecs": [{
		"mtu": 9000,
		"niocSpecs": [{
				"trafficType": "VSAN",
				"value": "HIGH"
			},
			{
				"trafficType": "VMOTION",
				"value": "LOW"
			},
			{
				"trafficType": "VDP",
				"value": "LOW"
			},
			{
				"trafficType": "VIRTUALMACHINE",
				"value": "HIGH"
			},
			{
				"trafficType": "MANAGEMENT",
				"value": "NORMAL"
			},
			{
				"trafficType": "NFS",
				"value": "LOW"
			},
			{
				"trafficType": "HBR",
				"value": "LOW"
			},
			{
				"trafficType": "FAULTTOLERANCE",
				"value": "LOW"
			},
			{
				"trafficType": "ISCSI",
				"value": "LOW"
			}
		],
		"dvsName": "sfo-m01-cl01-vds01",
		"vmnics": [
			"vmnic0",
			"vmnic1"
		],
		"networks": [
			"MANAGEMENT",
			"VSAN",
			"VMOTION",
			"UPLINK01",
            "UPLINK02",
            "NSXT_EDGE_TEP"
		]
	}],
	"clusterSpec": {
        "vmFolders": {
            "MANAGEMENT": "sfo-m01-fd-mgmt",
            "NETWORKING": "sfo-m01-fd-nsx",
            "EDGENODES": "sfo-m01-fd-edge"
        },
		"clusterName": "sfo-m01-cl01",
		"clusterEvcMode": "",
		"resourcePoolSpecs": [{
				"cpuSharesLevel": "high",
				"cpuSharesValue": 0,
				"name": "sfo-m01-cl01-rp-sddc-mgmt",
				"memorySharesValue": 0,
				"cpuReservationPercentage": 0,
				"memoryLimit": -1,
				"memoryReservationPercentage": 0,
				"cpuReservationExpandable": true,
				"memoryReservationExpandable": true,
				"memorySharesLevel": "normal",
				"cpuLimit": -1,
				"type": "management"
			},
			{
				"cpuSharesLevel": "high",
				"cpuSharesValue": 0,
				"name": "sfo-m01-cl01-rp-sddc-edge",
				"memorySharesValue": 0,
				"cpuReservationPercentage": 0,
				"memoryLimit": -1,
				"memoryReservationPercentage": 0,
				"cpuReservationExpandable": true,
				"memoryReservationExpandable": true,
				"memorySharesLevel": "normal",
				"cpuLimit": -1,
				"type": "network"
			},
			{
				"cpuSharesLevel": "normal",
				"cpuSharesValue": 0,
				"name": "sfo-m01-cl01-rp-user-edge",
				"memorySharesValue": 0,
				"cpuReservationPercentage": 0,
				"memoryLimit": -1,
				"memoryReservationPercentage": 0,
				"cpuReservationExpandable": true,
				"memoryReservationExpandable": true,
				"memorySharesLevel": "normal",
				"cpuLimit": -1,
				"type": "compute"
			},
			{
				"name": "sfo-m01-cl01-rp-user-vm",
				"type": "compute",
				"cpuReservationPercentage": 0,
				"cpuLimit": -1,
				"cpuReservationExpandable": true,
				"cpuSharesLevel": "normal",
				"cpuSharesValue": 0,
				"memoryReservationPercentage": 0,
				"memoryLimit": -1,
				"memoryReservationExpandable": true,
				"memorySharesLevel": "normal",
				"memorySharesValue": 0
			}
		]
	},
	"pscSpecs": [{
		"pscId": "psc-1",
		"vcenterId": "vcenter-1",
		"pscSsoSpec": {
			"ssoSiteName": "sfo-m01",
			"ssoDomainPassword": "VMw@re1!",
			"ssoDomain": "vsphere.local",
			"isJoinSsoDomain": false
		},
		"adminUserSsoPassword": "VMw@re1!"
	}],
	"vcenterSpec": {
		"vcenterIp": "172.20.11.62",
		"vcenterHostname": "sfo-m01-vc01",
		"vcenterId": "vcenter-1",
		"licenseFile": "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX",
		"rootVcenterPassword": "VMw@re1!",
		"vmSize": "small"
	},
	"hostSpecs": [{
			"credentials": {
				"username": "root",
				"password": "VMw@re1!"
			},
			"ipAddressPrivate": {
				"subnet": "255.255.255.0",
				"cidr": "172.20.11.0/24",
				"ipAddress": "172.20.11.101",
				"gateway": "172.20.11.1"
			},
			"hostname": "sfo01-m01-esx01",
			"vSwitch": "vSwitch0",
			"serverId": "host-0",
			"association": "sfo-m01-dc01"
		},
		{
			"credentials": {
				"username": "root",
				"password": "VMw@re1!"
			},
			"ipAddressPrivate": {
				"subnet": "255.255.255.0",
				"cidr": "172.20.11.0/24",
				"ipAddress": "172.20.11.102",
				"gateway": "172.20.11.1"
			},
			"hostname": "sfo01-m01-esx02",
			"vSwitch": "vSwitch0",
			"serverId": "host-1",
			"association": "sfo-m01-dc01"
		},
		{
			"credentials": {
				"username": "root",
				"password": "VMw@re1!"
			},
			"ipAddressPrivate": {
				"subnet": "255.255.255.0",
				"cidr": "172.20.11.0/24",
				"ipAddress": "172.20.11.103",
				"gateway": "172.20.11.1"
			},
			"hostname": "sfo01-m01-esx03",
			"vSwitch": "vSwitch0",
			"serverId": "host-2",
			"association": "sfo-m01-dc01"
		},
		{
			"credentials": {
				"username": "root",
				"password": "VMw@re1!"
			},
			"ipAddressPrivate": {
				"subnet": "255.255.255.0",
				"cidr": "172.20.11.0/24",
				"ipAddress": "172.20.11.104",
				"gateway": "172.20.11.1"
			},
			"hostname": "sfo01-m01-esx04",
			"vSwitch": "vSwitch0",
			"serverId": "host-3",
			"association": "sfo-m01-dc01"
		}
	]
}</pre>
<!-- /wp:preformatted -->

- - -
### Useful Links

If you would like to learn more about VMware Cloud Foundation or PowerVCF, check out these links:

<!-- wp:list -->
<ul><li><a rel="noreferrer noopener" href="https://docs.vmware.com/en/VMware-Cloud-Foundation/" target="_blank">VMware Cloud Foundation Documentation</a></li><li><a rel="noreferrer noopener" href="https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/datasheet/products/vmware-cloud-foundation-faq.pdf" target="_blank">VMware Cloud Foundation General FAQ</a></li><li><a rel="noreferrer noopener" href="https://docs.vmware.com/en/VMware-Cloud-Foundation/4.0/rn/VMware-Cloud-Foundation-40-Release-Notes.html" target="_blank">VMware Cloud Foundation 4.0 Release Notes</a></li><li><a rel="noreferrer noopener" href="https://powervcf.readthedocs.io/en/latest/" target="_blank">PowerVCF Documentation</a></li><li><a rel="noreferrer noopener" href="https://www.powershellgallery.com/packages/PowerVCF/2.0.0" target="_blank">PowerVCF v2.0 PowerShell Library Download</a></li></ul>
<!-- /wp:list -->

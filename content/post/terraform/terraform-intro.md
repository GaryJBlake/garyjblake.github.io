+++
author = "GaryJBlake"
title = "Terraform - Learning Some Basics"
date = "2022-08-18"
description = "Terraform - Learning Some Basics"
tags = [
    "Terraform"
]
categories = [

]
series = [

]
+++

During the last couple of months I've been working on a new project which has given me the opportunity to delve back into Terraform. I first took a look at Terraform in late 2020 while doing some research around automating VMware Validated Solutions, at the time there were far too many gaps in the providers which made it difficult to justify its use to deliver end to end automation with very short time scales. Jumping forward to today, there has been a lot of traction over the last 24 months with new providers being released as well as enhancements to existing providers and with less time pressures its felt like a good time to roll up my sleeves and dig deeper into what Terraform can do for me now.

I'm not a Terraform expert by any stretch of the imagination and I certainly don't pretend to be one, and in truth its taken me a while to get my head around the Terraform concepts but the idea of this post is to try and share what I've learnt by explaining in a way that has made sense to me. Hopefully it will help others at least get their heads around the basics and allow them to flourish in their development of Terraform plans.

## Terraform Install

First things first, you will need to intsall Terraform on your operating system of choice. For this I would recommend using the [Terraform documentation](https://learn.hashicorp.com/tutorials/terraform/install-cli) where you will find a number of methods that can be followed.

## Terraform Concepts

Let's now take a look at some basic concepts, this is not an exhaustive list but should be enough to get you going.

- **Files and Directories**
  
  Terraform code is stored as plain text within files that have a `.tf` file extension. All files are kept together within a single directory which is referred to as a module and Terraform evaluates all of these configuration files treating the entire module as a single document.
  
  ---
    **Tip**

    Use Terraform's ability to read multiple `.tf` files as part of the module, this allows you to split out elements of the code into smaller and easier to manage files.

    ---

- **Resources**
  
  A resource describes the infrastructure object being created or modified and as such are considered the most important element.

- **Data Sources**
  
  Data sources relate to objects defined outside of Terraform.

- **Providers** 
  
  Providers are referred to as `plugins` which are used to interact with the infrastructure, each provider adds a set of `resource types` and/or `data sources` that Terraform can manage.
  
  Without providers, Terraform can't manage any kind of infrastructure, they are distributed separately from Terraform itself.

- **Variables and Outputs**
  
  Input variables allow you to customize the code without making changes to the source code. Output values are used to return values from the code which can be used by other modules. Terraform also has the concept of temporary variables which are referred to as local variables.

- **Built in Functions**
  
  The Terraform language includes a number of built-in functions which can be called to transform and combine values.

  ## Terraform CLI

The command line interface (CLI) to Terraform is via the `terraform` command, which accepts a variety of subcommands such as `terraform init` or `terraform plan`.  For a full breakdown of Terraform CLI commands refer to the the [Terraform CLI Documentation](https://www.terraform.io/cli) but here are a few common ones you should get familiar with:

- Validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs
  ```terraform
  terraform validate
  ```

- Formats the configuration files to a canonical format and style
  ```terraform
  terraform fmt
  ```

- Initialize a working directory containing Terraform configuration files
  ```terraform
  terraform init
  ```

- Creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure
  ```terraform
  terraform plan -out=tfplan
  ```

- Executes the actions proposed in a Terraform plan
  ```terraform
  terraform apply tfplan
  ```

- Destroys all remote objects managed by a particular Terraform configuration
  ```terraform
  terraform destroy
  ```

## Conclusion

In this post we have only scratched the surface of Terraform, but if you can get your head around these basics as you start playing with Terraform yourself you will quickly become familar with additional functionality and will be writing more complex Terraform code in no time.
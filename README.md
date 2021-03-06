# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
This project deploys a highly availabe web application infrastructure to a Microsoft Azure tenant.  It uses Packer for bundling a configured virtual machine image, and Terraform for detailing the necessary resources to implement a load balancer along with the network and storage capabilities required to get up and running.


### Getting Started
1. Clone this repository

2. Follow the instructions stated below

3. Verify the resources as specified in the Output section have been generated and installed.

4. Season to taste!

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions

#### Running Packer
Please note:  This readme assumes the user has access to a bash shell prompt.
              This is readily available on MacOS and Linux laptop/desktops.
              If using a Windows system, please use [this](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
              to assist with setting up a bash environment on Windows.

The Packer Build template uses the following custom environment variables:

- `ARM_SUBSCRIPTION_ID`
- `ARM_UDACITY_RG`


Please make certain to add and provide values for the aforementioned
variables to your shell environment before proceeding.

```bash
$ export ARM_SUBSCRIPTION_ID=<azure_subscription_id> && export ARM_UDACITY_RG=<target_resource_group>
```

Build the virtual machine image containing the server on your Azure account.

```bash
$ packer build server.json
```


#### Running Terraform


Generate infrastructure deployment plan

```bash
$ terraform plan -out udacity-project-azure-ubuntu.plan
```

Execute infrastructure deployment plan

```bash
$ terraform apply udacity-project-azure-ubuntu.plan
```

#### Customizing the Terraform Template

There are a few dynamic values used with this template that you can change to
suit your needs.  These values are located in the file _vars.tf_.  You can change
the defaults in either of:

- Change the `default` value of the variable entry you wish to update, or
- Provide a `-var` argument when executing `terraform plan`. This will override
  the value set in the _vars.tf_ file

### Output

You should see something resembling the following:

```
Apply complete! Resources: 24 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```

Upon completion of the earlier steps, when accessing your Azure portal, you 
should see the following resources:


- Public IP Address
- Virtual Machine x2
- OS Disk x2
- Network Security Group
- Network Interface x2
- Managed Disk x2
- Virtual Network
- Load Balancer
- Availability Set



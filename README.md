## Installation of Terraform

1. Open you `Windows Powershell` and run as `admin`
2. Download `Chocolatey` by entering the following code:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
3. Download terraform using `choco`

```
 choco install terraform
```
4. Terraform is now downloaded enter `terraform` in gitbash to see the following guide:

```
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  metadata      Metadata related commands
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.


```

5. Configure the AWS access keys in your environmental variables as user in your Windows.
  1. Type `env` after you touch the windows 
  2. Click ` Edit the system environmental variables`
  3. Click `Environmental Variables`


  ![env variable](https://github.com/fsh-nur/iac_terraform_orchestration/assets/129324316/e52c0783-0546-446d-8ae6-726c06dac920)



  4. Click `New` and add you access key and secret access key naming them both `AWS_ACCESS_KEY_ID` and `AWS_SECRET_KEY_ID`


  
## Creating an AWS Instance in Terraform

1. Create a `main.tf` file
```
nano main.tf
```
2. Enter `terraform init` to initialise terraform to allow us to use commands
2. Enter the following in the `main.tf` file

```
# Write a ascript to launch resources on the cloud 
# codify terraform - syntax - {key = value}
provider "aws" {
    region = "eu-west-1"
}

# let's create a service on AWS
# add resource
# specify which service
resource "aws_instance" "app_instance"{
    # choose ami
    ami = "ami-0c5a2f4a8680af2d2"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    tags = {
        Name = "tech221-fatima-terraform-app"
    }
}

```
3. Enter the command `terraform plan`, this will check if the syntax is correct
4. Enter `terraform apply` this will launch the instance according to how you have configured the instance using the ami id which we entered.

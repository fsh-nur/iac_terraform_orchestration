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
    ami = var.ami_id
    instance_type = "t2.micro"
    associate_public_ip_address = true
    tags = {
        Name = "tech221-fatima-terraform-app"
    }
}

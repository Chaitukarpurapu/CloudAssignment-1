* This is the detailed document to create VPC, ec2 instance with security group
author: Chaitanya Kishore

Installed Packages
- AWS CLI
- VS code
- terraform Extension

  *Prerequisites

 - Go through the [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html]
 - Know [how to launch an EC2 instance from an AMI](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html)

 Instance type guidance:

 * AWS IAM credentials that give permissions to run EC2 instances.


 Quick Start:

1.Launch an Instance using this AMI from the AWS Marketplace using either of the following options:
  
   - Click Launch
   - Launches your instance with the default instance, networking, storage and security group settings.
   - Creates a security group that allows ssh ingress from any IP address.

2.Log into the machine:

  - More details on how to connect are provided in the [EC2 documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html)
  - ssh -i <Private Key> centos@<Public IP/External DNS Hostname>

3.Store your project data:

  - To store your project data select the folder in your pc and make NewFolder TerraForm.
  - Make a new file of Ec2 Instance.

4.Create Subnets And Region:
  
  - Create Region (For Example:"ap-south-1")
  - Create Private & Public Subnets



provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "*****" {
  cidr_block = "0.0.0.0/00"
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.id
  cidr_block              = "00.0.0.0/00"
  availability_zone       = "ap-south-1"

  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.****.id
  cidr_block = "00.0.000.0/00"
  availability_zone = "ap-south-1" 
  
}


5. Create a Terminal in the following Steps:

 * Terraform -v

 * AWS configure

 * AWS Access Key ID [****************JBMA]: *************

 * AWS Secret Access Key [****************ifK6]: *************

 * Default region name [eu-north-1]: *********

 * Default output format [None]: ***********


After Creation vof Terraform we have to run the Terraform 

6. Follow the Below Steps:

 * Terraform init

 * Terraform apply

 * Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 

It will Create the Terraform  Ec2 Instance ........

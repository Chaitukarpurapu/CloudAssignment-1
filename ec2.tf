provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "assignment_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.assignment_vpc.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "ap-south-1a"

  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.assignment_vpc.id
  cidr_block = "10.0.128.0/20"
  availability_zone = "ap-south-1a" 
}

resource "aws_security_group" "assignment_sg" {
  name        = "assignment-sg"
  description = "Security group for EC2 instance"

  vpc_id = aws_vpc.assignment_vpc.id

  // Inbound rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "chaitu" {
  ami           = "ami-0da59f1af71ea4ad2" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name    = "EC2 Instance"
    purpose = "Assignment"
  }

  security_groups = [aws_security_group.assignment_sg.id]
}

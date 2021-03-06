provider "aws" {
  shared_credentials_file = "Users/trust/.aws/credentials"
  region    = "us-east-1"
}

resource "aws_key_pair" "demo_key" {
  key_name   = "MyKeyPair"
  public_key = var.public_key
}

resource "aws_instance" "jenkins" {
  count = var.instance_count

  ami           = "ami-08fe38a2865705db8"
  instance_type = "t2.small"
  key_name      = aws_key_pair.demo_key.key_name

  vpc_security_group_ids = [
    aws_security_group.employee.id
  ]

  tags = {
    Name = "jenkins-${count.index + 1}"
  }
}

resource "aws_instance" "jump" {
  count = var.instance_count

  ami           = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.demo_key.key_name

  vpc_security_group_ids = [
    aws_security_group.employee.id
  ]

  tags = {
    Name = "jump-${count.index + 1}"
  }
}

resource "aws_instance" "dev" {
  count = var.instance_count

  ami           = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.demo_key.key_name

  vpc_security_group_ids = [
    aws_security_group.employee.id,
    aws_security_group.customer.id
  ]

  tags = {
    Name = "dev-${count.index + 1}"
  }
}

resource "aws_instance" "prod" {
  count = var.instance_count

  ami           = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.demo_key.key_name

  vpc_security_group_ids = [
    aws_security_group.employee.id,
    aws_security_group.customer.id
  ]

  tags = {
    Name = "prod-${count.index + 1}"
  }
}

resource "aws_security_group" "employee" {
  name        = "employee-security-group"
  description = "Security group for employee laptop"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "customer" {
  name        = "customer-security-group"
  description = "Security group for customer laptop"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


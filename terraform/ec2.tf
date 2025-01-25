# configure aws provider
provider "aws" {
    region = "eu-central-1"
    profile = "terraform-user"
}

# create a security group to only allow http traffic
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP traffic"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from anywhere
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_traffic"
  }
}

# launch an ec2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-085131ff43045c877"  # Amazon Linux 2 AMI ID in eu-central-1
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_http.name]
  associate_public_ip_address = true

  tags = {
    Name = "FastAPI-App-Server"
  }
}

# print the public IP
output "public_ip" {
  value = aws_instance.web_server.public_ip
  description = "The public IP of the EC2 instance"
}

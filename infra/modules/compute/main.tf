resource "aws_instance" "saleor" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y docker.io docker-compose unzip
              systemctl start docker
              cd /home/ubuntu
              curl -O https://your-s3-bucket.s3.amazonaws.com/saleor-platform.zip
              unzip saleor-platform.zip
              cd saleor-platform
              docker-compose up -d
              EOF

  tags = {
    Name = "SaleorInstance"
  }
}

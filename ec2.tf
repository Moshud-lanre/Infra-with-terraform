# Create Ubuntu server and install/enable apache2
resource "aws_instance" "web-server-instance" {
  ami = "ami-0729e439b6769d6ab"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "vprofile"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.web-server-nic.id
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo My first techchak project > /var/www/html/index.html'
                EOF

  tags = {
    "Name" = "web-server"
    }
}

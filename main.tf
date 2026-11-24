resource "aws_instance" "server" {
  ami           = "ami-006f82a1d5a27da54"
  instance_type = "t3.xlarge"
  key_name      = "key-pem"

  tags = {
    Name = "server"
  }
}

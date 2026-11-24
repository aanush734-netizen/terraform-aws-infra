resource "aws_security_group" "my_sg" {
  name        = "my-sg"
  vpc_id      = aws_vpc.my_vpc.id

#inbound rule to allow HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

#inbound rule to allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

#outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }
   tags = {
    Name = "my-sg"
   }
}

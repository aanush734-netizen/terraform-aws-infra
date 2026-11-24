#crating a default VPC with CIDR block
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-VPC"
  }
}

#creating a default internet gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-internet-gateway"
  }
}

#creating a private subnet in the default VPC
resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.my_vpc.id
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private subnet"
  }
}

#creating a public subnet in the default VPC
resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.my_vpc.id
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public subnet"
  }
}

#creating a route table for the default VPC
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id
  }
}
 
 resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_route_table.id
 }

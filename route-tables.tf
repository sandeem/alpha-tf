resource "aws_internet_gateway" "alpha-igw-tf" {
  vpc_id     = aws_vpc.alpha-vpc-tf.id

  tags = {
    Name = "alpha-igw-tf"
  }
}

resource "aws_route_table" "alpha-public-rt-tf" {
  vpc_id     = aws_vpc.alpha-vpc-tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alpha-igw-tf.id
  }

  tags = {
    Name = "alpha-public-rt-tf"
  }
}

resource "aws_route_table" "alpha-private-rt-tf" {
  vpc_id     = aws_vpc.alpha-vpc-tf.id

  tags = {
    Name = "alpha-private-rt-tf"
  }
}

resource "aws_route_table_association" "zonea-public-subnet-association" {
  subnet_id         = aws_subnet.zonea-public-subnet.id
  route_table_id    = aws_route_table.alpha-public-rt-tf.id
}

resource "aws_route_table_association" "zonea-private-subnet-association" {
  subnet_id         = aws_subnet.zonea-private-subnet.id
  route_table_id    = aws_route_table.alpha-private-rt-tf.id
}

resource "aws_route_table_association" "zoneb-public-subnet-association" {
  subnet_id         = aws_subnet.zoneb-public-subnet.id
  route_table_id    = aws_route_table.alpha-public-rt-tf.id
}

resource "aws_route_table_association" "zoneb-private-subnet-association" {
  subnet_id         = aws_subnet.zoneb-private-subnet.id
  route_table_id    = aws_route_table.alpha-private-rt-tf.id
}
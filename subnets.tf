resource "aws_subnet" "zonea-public-subnet" {
  vpc_id     = aws_vpc.alpha-vpc-tf.id
  cidr_block = "192.168.1.0/24"
  availability_zone ="us-east-2a"

  tags = {
    Name = "zonea-public-subnet"
  }
}

resource "aws_subnet" "zonea-private-subnet" {
  vpc_id     = aws_vpc.alpha-vpc-tf.id
  cidr_block = "192.168.2.0/24"
  availability_zone ="us-east-2a"
  
  tags = {
    Name = "zonea-private-subnet"
  }
}

resource "aws_subnet" "zoneb-public-subnet" {
  vpc_id     = aws_vpc.alpha-vpc-tf.id
  cidr_block = "192.168.3.0/24"
  availability_zone ="us-east-2b"

  tags = {
    Name = "zoneb-public-subnet"
  }
}

resource "aws_subnet" "zoneb-private-subnet" {
  vpc_id     = aws_vpc.alpha-vpc-tf.id
  cidr_block = "192.168.4.0/24"
  availability_zone ="us-east-2b"
  
  tags = {
    Name = "zoneb-private-subnet"
  }
}
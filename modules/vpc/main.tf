resource "aws_vpc" "niranjan_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = merge(var.tags, {
    Name = "${var.name}-vpc"
  })
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.niranjan_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
  tags = merge(var.tags, {
    Name = "${var.name}-public-subnet"
  })
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.niranjan_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags = merge(var.tags, {
    Name = "${var.name}-private-subnet"
  })
}

resource "aws_internet_gateway" "Niranjan_igw" {
  vpc_id = aws_vpc.niranjan_vpc.id
  tags = merge(var.tags, {
    Name = "${var.name}-igw"
  })
}

resource "aws_eip" "nat" {
  domain = "vpc"
  tags = merge(var.tags, {
    Name = "${var.name}-nat-eip"
  })
}

resource "aws_nat_gateway" "niranjan_nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = merge(var.tags, {
    Name = "${var.name}-nat-gateway"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.niranjan_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Niranjan_igw.id
  }

  tags = merge(var.tags, {
    Name = "${var.name}-public-rt"
  })
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.niranjan_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.niranjan_nat_gateway.id
  }

  tags = merge(var.tags, {
    Name = "${var.name}-private-rt"
  })
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}


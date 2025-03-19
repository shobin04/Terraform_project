## vpc##
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

## subnets ##
resource "aws_subnet" "public_subnet" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidrs, count.index)

  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[0]
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

##webtier subnets##
resource "aws_subnet" "web_tier" {
  count       = length(var.availability_zones)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.web_tier_subnet_cidrs, count.index)

  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "webtier-subnet-${count.index + 1}"
  }
}

##mobiletier subnets##
resource "aws_subnet" "mobile_tier" {
  count      = length(var.availability_zones)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.mobile_tier_subnet_cidrs, count.index)

  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "mobiletier-subnet-${count.index + 1}"
  }
}

##db subnets##
resource "aws_subnet" "db_tier" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db_tier_subnet_cidr

  map_public_ip_on_launch = false
  availability_zone       = var.availability_zones[1]
  tags = {
    Name = "db-tier-subnet"
  }
}

#eks subnets##
resource "aws_subnet" "eks" {
  count      = length(var.availability_zones)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.eks_subnet_cidrs, count.index)

  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "eks-subnet-${count.index + 1}"
  }
}

## igw ##
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "my_igw"
  }
}

# Creating an Elastic IP for the NAT Gateway!
resource "aws_eip" "nat" {
  tags = {
    Name = "Nat_gateway_eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags = {
    Name = "Nat_gateway"
  }
}

## route tables ##
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id  # Pointing to NAT
  }
  tags = {
    Name = "Private-route-table"
  }
}

resource "aws_route_table_association" "webtier" {
  count          = length(aws_subnet.web_tier)
  subnet_id      = aws_subnet.web_tier[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "mobiletier" {
  count          = length(aws_subnet.mobile_tier)
  subnet_id      = aws_subnet.mobile_tier[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "db_tier" {
  subnet_id      = aws_subnet.db_tier.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "eks" {
  count          = length(aws_subnet.eks)
  subnet_id      = aws_subnet.eks[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
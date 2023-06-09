resource "aws_eip" "natgw" {
  vpc = true

  tags = {
    Name = "natgw"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "natgw"
  }

  depends_on = [aws_internet_gateway.igw]
}

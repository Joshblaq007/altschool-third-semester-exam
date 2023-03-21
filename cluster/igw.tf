resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mytag.id

  tags = {
    Name = "igw"
  }
}

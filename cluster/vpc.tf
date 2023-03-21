resource "aws_vpc" "mytag" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "mytag"
  }
}

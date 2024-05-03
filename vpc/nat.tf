
# Elastic IP to keep the IP constant
resource "aws_eip" "this" {

  tags = {
    Name = "${var.env}-eip"
  }
}

# NAT Gateway for outbound connections (single: to save cost)
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.env}-nat"
  }

  depends_on = [aws_internet_gateway.this]
}
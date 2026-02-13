
resource "aws_nat_gateway" "main" {
  allocation_id = var.allocation_id  
  subnet_id     = var.subnet_id  


  depends_on = [var.internet_gateway_id]

  tags = {
    Name = "${var.project_name}-nat"
  }
}
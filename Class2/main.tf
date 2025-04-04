resource "aws_key_pair" "deployer" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub") 
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-samaraz"
}

resource "aws_s3_object" "object" {
  #bucket = aws_s3_bucket.example.bucket 
  depends_on = [aws_s3_bucket.example] 
  bucket = "kaizen-samaraz"
  key    = "provider.tf"
  source = "provider.tf"
}

# cp WHAT (local) Where (remote)
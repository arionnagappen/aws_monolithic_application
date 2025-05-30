resource "aws_kms_key" "my_kms_key" {
  description = "KMS key for RDS Encryption"
  deletion_window_in_days = 7

  tags = {
    Name = "MyKMSKey"
  }
}
output "app_server_instance_profile_name" {
  value = aws_iam_instance_profile.app_instance_profile.name
}

output "kms_key_id" {
  value = aws_kms_key.my_kms_key.id
}

output "kms_key_arn" {
 value = aws_kms_key.my_kms_key.arn 
}
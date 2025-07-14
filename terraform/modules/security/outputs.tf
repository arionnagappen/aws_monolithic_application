// ---  KMS ---
output "my_kms_key_id" {
  value = module.my_kms.kms_key_id
}

output "kms_key_arn" {
 value = module.my_kms.kms_key_arn
}

// --- IAM ROLE ---
output "instance_profile_name" {
  value = module.iam.app_server_instance_profile_name
}

// --- RDS SECRET ---
output "rds_creds" {
  value = module.db_secrets.rds_creds
}

resource "aws_iam_account_password_policy" "strong_password" {
  minimum_password_length = 14
  require_symbols = true
  require_numbers = true
  require_uppercase_characters = true
  require_lowercase_characters = true
  allow_users_to_change_password = true

  # Force users to reset password after 90 days
  max_password_age = 90

  # Prevent password reuse
  password_reuse_prevention = 5
}
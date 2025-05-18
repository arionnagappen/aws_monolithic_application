output "app_server_ids" {
  value = [for inst in aws_instance.app_server_instance : inst.id]
}
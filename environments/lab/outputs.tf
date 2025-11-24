output "instance_ip" {
  description = "Public IP address of the nginx instance"
  value       = module.nginx_instance.instance_ip
}

output "instance_id" {
  description = "ID of the nginx instance"
  value       = module.nginx_instance.instance_id
}

output "instance_name" {
  description = "Name of the nginx instance"
  value       = module.nginx_instance.instance_name
}

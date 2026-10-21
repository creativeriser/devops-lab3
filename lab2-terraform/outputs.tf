
output "container_ids" {
  description = "IDs of the created containers"
  value       = docker_container.nginx[*].id
}

output "application_urls" {
  description = "Local URLs for the NGINX containers"
  value = [
    for container in docker_container.nginx :
    "http://localhost:${container.ports[0].external}"
  ]
}

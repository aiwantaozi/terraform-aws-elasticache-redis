output "context" {
  description = "The input context, a map, which is used for orchestration."
  value       = var.context
}

output "selector" {
  description = "The selector, a map, which is used for dependencies or collaborations."
  value       = local.tags
}

output "endpoint_internal" {
  description = "The internal endpoints, a string list, which are used for internal access."
  value       = [format("%s.%s", aws_service_discovery_service.primary.name, var.infrastructure.domain_suffix)]
}

output "endpoint_internal_readonly" {
  description = "The internal readonly endpoints, a string list, which are used for internal readonly access."
  value       = var.architecture == "replication" ? [format("%s.%s", aws_service_discovery_service.reader[0].name, var.infrastructure.domain_suffix)] : []
}

output "password" {
  value       = local.password
  description = "The password of redis service."
}
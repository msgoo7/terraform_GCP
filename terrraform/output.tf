output "Endpoint_URL" {
  value       = "${google_cloud_run_service.default.status[0].url}"
  description = "endpoint of the cloud run code"
}
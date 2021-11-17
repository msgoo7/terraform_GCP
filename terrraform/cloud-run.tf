# =========== INFRA CODE ===========#
resource "google_cloud_run_service" "default" {
  name     = var.name
  location = var.region_var
  project  = var.project


  template {
    spec {
      containers {
        resources {
          limits   = { cpu = 4, memory = "8Gi" }
          requests = { cpu = 4, memory = "8Gi" }

        }
        image = var.image_name
        ports {
          container_port = 3000
        }
        env {
          name  = "GCS_BUCKET_NAME"
          value = var.GCS_BUCKET_NAME
        }
      }

    }
    metadata {
      name = "${var.name}-test3"
      annotations = {
        "autoscaling.knative.dev/minScale" = "1"
      }
    }
  }
}

## Authentication code ##
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

resource "google_cloud_run_service" "my_service" {
  name = "steam-v0"
  location = "europe-west3"
  template {
    spec {
      containers {
        image = "gcr.io/steam-378309/steam-v0:$COMMIT_SHA"
      }
    }
  }
  metadata {
    annotations = {
      "run.googleapis.com/client-name" = "terraform"
    }
  }
}

resource "google_cloud_run_service_iam_policy" "my_service_iam_policy" {
  service_name = google_cloud_run_service.my_service.name
  policy_data = data.google_iam_policy.iam_policy_data.policy_data
}

data "google_iam_policy" "iam_policy_data" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}

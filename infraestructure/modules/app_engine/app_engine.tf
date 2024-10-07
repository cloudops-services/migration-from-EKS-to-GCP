
resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.region
}

resource "google_app_engine_standard_app_version" "app_version" {
  project      = var.project_id
  service      = "default"
  version_id   = "v1"
  runtime      = "python39"
  entrypoint {
    shell = "gunicorn -b :$PORT main:app"
  }
  
  deployment {
    zip {
      source_url = var.source_code_url
    }
  }
}

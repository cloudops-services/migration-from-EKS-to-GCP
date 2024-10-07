
module "gcp_network" {
  source       = "../modules/gcp_network"
  network_name = "demo-vpc-network"
}


module "app_engine" {
  source          = "../modules/app_engine"
  project_id      = "cloudops-services"
  region          = var.region
  source_code_url = var.source_code_url
}

resource "null_resource" "deploy_app" {
  provisioner "local-exec" {
    command = "./scripts/deploy_app.sh ${var.project_id}"
    working_dir = "${path.module}/scripts"
  }

  depends_on = [
    module.app_engine,
  ]
}

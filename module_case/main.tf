module "backEnd_instance" {
  source        = "./modules/instance"
  instance_name = "backend"
  instance_type = "e2-micro"
  network_name  = "backendnetwork"
}
module "frontEnd_instance" {
  source        = "./modules/instance"
  instance_name = "frontend"
  instance_type = "e2-micro"
  network_name  = "frontendnetwork"
}

terraform {
  backend "atlas" {
    name = "<organisation-name>/<workspace-name>"
  }
}



resource "null_resource" "string" {
 provisioner "local-exec" {
   command = "echo Random string is ${module.random_string.string-module-output}"
 }
}


module "random_string" {
 source = "./modules/"
}
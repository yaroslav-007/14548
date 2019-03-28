resource "random_string" "string" {
  length           = 5
  special          = false
}


output "string-module-output" {
  value = "${random_string.string.result}"
}
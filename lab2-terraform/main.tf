
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "nginx" {
  count = var.instance_count

  name  = "terraform-nginx-${count.index + 1}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8083 + count.index
  }
}

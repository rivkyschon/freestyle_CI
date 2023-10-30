terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nodejs-app" {
  name         = "rivkyschon/nodejs-app:latest"
  keep_locally = false
}

resource "docker_container" "nodejs-app" {
  image = docker_image.nodejs-app.image_id
  name  = "test"
  ports {
    internal = 4000
    external = 4000
  }
}
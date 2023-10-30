provider "kubernetes" {
  config_path = "~/.kube/config" # Path to your Kubernetes config file
}

resource "kubernetes_deployment" "nodejs-app" {
  metadata {
    name = "nodejs-app-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nodejs-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "nodejs-app"
        }
      }

      spec {
        container {
          name  = "nodejs-app"
          image = "rivkyschon/nodejs-app:0.0.3" # Replace with your Node.js Docker image
          port {
            container_port = 4000
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "mongodb" {
  metadata {
    name = "mongodb-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mongodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }

      spec {
        container {
          name  = "mongodb"
          image = "mongo:latest"
          port {
            container_port = 27017
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mongodb-service" {
  metadata {
    name = "mongodb-service"
  }

  spec {
    selector = {
      app = "mongodb"
    }

    port {
      port        = 27017
      target_port = 27017
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "nodejs-app-service" {
  metadata {
    name = "nodejs-app-service"
  }

  spec {
    selector = {
      app = "nodejs-app"
    }

    port {
      name       = "http"
      protocol   = "TCP"
      port       = 80
      target_port = 4000
    }

    type = "LoadBalancer"
  }
}

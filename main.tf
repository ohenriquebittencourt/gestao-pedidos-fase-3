provider "aws" {
  region = "us-east-2"
}

resource "kubernetes_deployment" "my_api_deployment" {
  metadata {
    name = "minha-api"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "minha-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "minha-api"
        }
      }

      spec {
        container {
          image = "<sua-conta>.dkr.ecr.us-east-1.amazonaws.com/minha-api:latest"
          name  = "minha-api"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
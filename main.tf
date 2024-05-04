provider "aws" {
  region = "us-east-2"
}

provider "kubernetes" {
  host  = "https://1FC52356DA6E21E0390E97776718260C.gr7.us-east-2.eks.amazonaws.com"
  cluster_ca_certificate   = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJYWZqdEM4cXhOUVF3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TkRBMU1EUXhOelE1TXpCYUZ3MHpOREExTURJeE56VTBNekJhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURnOVhsVTUvYVZONmkwNGhUUExGc1YzNWFhZGRGdFhlQVQvNWxhT3RGSVFjNVBHWHMrSmhsQmtyK1gKRDU2eWtvUFVqZ3p2WW5abU5FamFJNDVOUTRqQ2dscVhFNmJZQWFuNytRM0x3a3FBVVBPYlFsYk8xNGVsdGtBMwp1bjBYd0RNc2M0NzNXMUFhaTRMejRxWEJwTkFhL3Z1aTR1b1A5WDlHbDhBOXJvclNVaUw1YlNTZmk0Q1gvZjd1ClJqMWV1WUp1QVVlMk5JQ0I3S1UxOHJPYVV6VktwcmFQTkErZjllbXNmOUVlQVJYaDZPMHMxTDVsNUVWMW9tTjAKZUlIaWdyQitqeGs5eW1hSHNYOHBKWC9IREVyNk14UExZRDdRQzRnMHU0clI0Z1NDR3A0bHBDV3BGTVJXd3VuYQp2UVowL3gzZEZiNUlVa0pqRUo5MnlXRitRWG16QWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJROHl2WEF2VUJSeVpyb2RueXFhNTkyRlRXbmhUQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQTdHcnl2TGZMTwo5Y2xjb20wMHZnblZPZWd3dW1uV0NVSUFDZW5iNjFraWxHSGw1emc0c1d4SlIzRy9qMEU0S2ZQNWtQUTAzUVdaCnFnRmFoNjhsd0lCdzZQRWQyNUU1aTlXNVB3MTFjWWx1SnFoQnR0QXNTRWRFU3pYOUV1N1hHOVMvOXVMdjFrM04KNlBnTTlUaElMdStzeTQzVkhDT2p4cWlmdzdIUEtiWkhEbjBDRGVjUlpqZlVySmFlUHFiR1Y2M25ZRzRLUXF6NApFVEx4ZW11d2xET205bkYrblVhaVczeXhNa0JwZ3VsdXpBZk5NTmR3VDNsdGQwak5XRkFPZ0xOTkVMZkxFUys0CmhRN2VaMHVBaTBwWVNIRnB1NnN6NVpEQ3Y0eUpBVTMxd3hBdS9CcVFnVlJHbkVWT1Zxdjd4Uy9MRW9IdExwOHoKQ1pYNTEwTXZkMTJ5Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
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
          image = "547185396737.dkr.ecr.us-east-2.amazonaws.com/minha-api:latest"
          name  = "minha-api"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

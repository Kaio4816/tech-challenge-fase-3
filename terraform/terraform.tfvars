aws_region         = "us-east-1"
project_name       = "pos-togmaster"
environment        = "dev"
eks_cluster_name   = "togmaster-eks"
db_password        = "TroqueEssaSenha123!"
cluster_name       = "techchallenge-eks"
kubernetes_version = "1.30"

argocd_namespace     = "argocd"
argocd_chart_version = "7.8.2"
argocd_service_type  = "LoadBalancer"
argocd_hostname      = ""

vpc_cidr = "10.0.0.0/16"
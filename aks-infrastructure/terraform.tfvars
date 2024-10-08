resource_group_name   = "k8s-rg"
location              = "australiaeast"
public_ssh_key        = ""
vnet_address_prefix   = ["172.20.0.0/16"]
subnet_address_prefix = ["172.20.1.0/24"]
agents_count          = 2
agents_size           = "Standard_B2s"
bootstrap_repo_url    = "https://github.com/afriteknz/k8s-infrastructure/"
# bootstrap_repo_url    = "https://github.com/ams0/argocd-apps"
bootstrap_repo_path   = "aks-infrastructure/apps"
bootstrap_repo_branch = "main"
dns_prefix            = " argocd"

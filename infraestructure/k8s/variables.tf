variable "kube_config_path" {
    description = "Configuração de Cluster k3d Kubernets"
    type = string
    default = "~/.kube/config"  
}

variable "ssh_repo" {
    description = "Chave Privada do repositório"
    type        = string  
}

variable "repo_url" {
    description = "URL de acesso ao repositório"
    type        = string  
}

variable "repo_branch" {
    description = "Branch principal do repositório"
    type        = string  
}

variable "argocd_admin_secret" {
    description = "Senha de acesso ao ArgoCD"
    type        = string
}

variable "argocd_admin_secret_time" {
    description = "Horário de criação da senha de acesso"
    type        =  string  
}
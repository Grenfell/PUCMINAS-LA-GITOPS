resource "kubectl_manifest" "argocd_namespace" {
    yaml_body = fime("../manifests/argocd-namespace.yaml")
} 
#Add ArgoCD using Helm
resource "helm_release" "argocd"{
    depends_on = [kubectl_manifest.argocd_namespace]
    name       = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-cd"
    namespace  = kubectl_manifest.argocd_namespace.name
    wait       = false
    set {
        name   =  "configs.secret.argocdServerAdminPassword"
        value  = var.argocd.admin.secret
    }
    set {
        name   =  "configs.secret.argocdServerAdminPasswordMtime"
        value  = var.argocd.admin.secret_time
    }
}

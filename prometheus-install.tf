resource "kubernetes_namespace" "monitoring" {
  metadata {
    name   = "monitoring"
    labels = {}
  }
}

resource "helm_release" "prometheus" {
  name             = "prometheus"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "kube-prometheus"
  namespace        = kubernetes_namespace.monitoring.metadata[0].name
  create_namespace = false
  recreate_pods    = false
  reuse_values     = false
  reset_values     = true
  force_update     = false
  wait             = true

  #   set {
  #     name  = ""
  #     value = ""
  #   }

  #   depends_on = [

  #   ]
}

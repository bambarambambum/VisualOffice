provider "helm" {
  version = "~> 1.00"
}

resource "helm_release" "nginx-ingress" {
  name       = "nginx-ingress"
  chart      = "stable/nginx-ingress"
  namespace = "default"

  depends_on = [
   google_container_node_pool.primary_nodes
  ]
}

resource "helm_release" "visualoffice" {
  name       = "visualoffice"
  chart      = "../kubernetes/charts/visualoffice"
  namespace = "default"

  depends_on = [
   google_container_node_pool.primary_nodes
  ]
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "../kubernetes/charts/prometheus"
  namespace = "monitoring"
  create_namespace = true

  depends_on = [
   google_container_node_pool.primary_nodes
  ]
  values = [
    "${file("../kubernetes/charts/prometheus/custom_values.yaml")}"
  ]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "../kubernetes/charts/grafana"
  namespace = "monitoring"
  create_namespace = true
  depends_on = [
   google_container_node_pool.primary_nodes
  ]
  values = [
    "${file("../kubernetes/charts/grafana/custom_values.yaml")}"
  ]
}

resource "helm_release" "prometheus-mysql-exporter" {
  name       = "mysql-exporter"
  chart      = "../kubernetes/charts/prometheus-mysql-exporter"
  namespace = "default"
  create_namespace = true
  depends_on = [
   google_container_node_pool.primary_nodes
  ]
  values = [
    "${file("../kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml")}"
  ]
}

resource "helm_release" "prometheus-mysql-exporter-staging" {
  name       = "mysql-exporter"
  chart      = "../kubernetes/charts/prometheus-mysql-exporter"
  namespace = "staging"
  create_namespace = true
  depends_on = [
   google_container_node_pool.primary_nodes
  ]
  values = [
    "${file("../kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml")}"
  ]
}

resource "helm_release" "prometheus-mysql-exporter-production" {
  name       = "production"
  chart      = "../kubernetes/charts/prometheus-mysql-exporter"
  namespace = "production"
  create_namespace = true
  depends_on = [
   google_container_node_pool.primary_nodes
  ]
  values = [
    "${file("../kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml")}"
  ]
}
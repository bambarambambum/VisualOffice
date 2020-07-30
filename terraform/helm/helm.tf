provider "helm" {
  version = "~> 1.00"
}

resource "helm_release" "nginx-ingress" {
  name       = "nginx-ingress"
  chart      = "stable/nginx-ingress"
  namespace = "default"
}

resource "helm_release" "visualoffice" {
  name       = "visualoffice"
  chart      = "../../kubernetes/charts/visualoffice"
  namespace = "application"
  create_namespace = true
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "../../kubernetes/charts/prometheus"
  namespace = "monitoring"
  create_namespace = true

  values = [
    "${file("../../kubernetes/charts/prometheus/custom_values.yaml")}"
  ]

  timeout = 720
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "../../kubernetes/charts/grafana"
  namespace = "monitoring"
  create_namespace = true

  values = [
    "${file("../../kubernetes/charts/grafana/custom_values.yaml")}"
  ]
}

resource "helm_release" "prometheus-mysql-exporter" {
  name       = "mysql-exporter"
  chart      = "../../kubernetes/charts/prometheus-mysql-exporter"
  namespace = "application"
  create_namespace = true

  values = [
    "${file("../../kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml")}"
  ]
}

resource "helm_release" "prometheus-mysql-exporter-staging" {
  name       = "mysql-exporter"
  chart      = "../../kubernetes/charts/prometheus-mysql-exporter"
  namespace = "staging"
  create_namespace = true

  values = [
    "${file("../../kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml")}"
  ]
}

resource "helm_release" "prometheus-mysql-exporter-production" {
  name       = "mysql-exporter"
  chart      = "../../kubernetes/charts/prometheus-mysql-exporter"
  namespace = "production"
  create_namespace = true

  values = [
    "${file("../../kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml")}"
  ]
}

resource "helm_release" "gitlab" {
  name       = "gitlab"
  chart      = "../../kubernetes/charts/gitlab"
  namespace = "application"

  values = [
    "${file("../../kubernetes/charts/gitlab/custom_values.yaml")}"
  ]

  timeout = 720
}

resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  chart      = "jetstack/cert-manager"
  namespace = "cert-manager"
  create_namespace = true
}
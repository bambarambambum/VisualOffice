{{- define "mysql.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}
{{- define "mysql.datastore" -}}
{{- printf "%s-%s-ssd" .Chart.Name .Release.Namespace -}}
{{- end -}}
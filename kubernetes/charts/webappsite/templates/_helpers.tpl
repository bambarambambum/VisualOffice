{{- define "webappsite.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}
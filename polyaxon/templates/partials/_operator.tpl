{{- /*
Operator service account
*/}}
{{- define "config.operator.sa" -}}
{{- if .Values.rbac.enabled }}
serviceAccountName: {{ template "polyaxon.fullname" . }}-operator-sa
{{- end }}
{{- end -}}

{{- /*
Config operator scheduling
*/}}
{{- define "config.operator.scheduling" -}}
{{- if .Values.operator.nodeSelector }}
nodeSelector:
{{ toYaml .Values.operator.nodeSelector | indent 2}}
{{- else }}
{{- if .Values.nodeSelector }}
nodeSelector:
{{ toYaml .Values.nodeSelector | indent 2}}
{{- end }}
{{- end }}
{{- if .Values.operator.affinity }}
affinity:
{{ toYaml .Values.operator.affinity | indent 2 }}
{{- else }}
{{- if .Values.affinity }}
affinity:
{{ toYaml .Values.affinity | indent 2 }}
{{- end }}
{{- end }}
{{- if .Values.operator.tolerations }}
tolerations:
{{ toYaml .Values.operator.tolerations | indent 2 }}
{{- else }}
{{- if .Values.tolerations }}
tolerations:
{{ toYaml .Values.tolerations | indent 2 }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.operator.imagePullSecrets" -}}
{{- if .Values.operator.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.operator.imagePullSecrets }}
  - name: {{ . }}
{{- end }}
{{- else }}
{{- if .Values.imagePullSecrets }}
imagePullSecrets:
{{- range .Values.imagePullSecrets }}
  - name: {{ . }}
{{- end }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.operator.priorityClassName" -}}
{{- if .Values.operator.priorityClassName }}
priorityClassName: {{ .Values.operator.priorityClassName }}
{{- else }}
{{- if .Values.priorityClassName }}
priorityClassName: {{ .Values.priorityClassName }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.operator.annotations" -}}
{{- if .Values.operator.annotations }}
{{ toYaml .Values.operator.annotations }}
{{- else }}
{{- if .Values.annotations }}
{{ toYaml .Values.annotations }}
{{- end }}
{{- end }}
{{- end -}}

{{- define "config.operator.labels" -}}
{{- if .Values.operator.labels }}
{{ toYaml .Values.operator.labels }}
{{- else }}
{{- if .Values.labels }}
{{ toYaml .Values.labels }}
{{- end }}
{{- end }}
{{- end -}}

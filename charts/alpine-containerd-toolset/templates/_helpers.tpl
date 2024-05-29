{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "alpine.containerd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "alpine.containerd.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "alpine.containerd.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Expand the Application Image name.
*/}}
{{- define "alpine.containerd.image" -}}
{{- printf "%s:%s" .Values.image.repository (tpl .Values.image.tag .) }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "alpine.containerd.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "alpine.containerd.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

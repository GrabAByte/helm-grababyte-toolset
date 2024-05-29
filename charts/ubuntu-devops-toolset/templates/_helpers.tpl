{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "ubuntu.devops.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "ubuntu.devops.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "ubuntu.devops.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Expand the Application Image name.
*/}}
{{- define "ubuntu.devops.image" -}}
{{- printf "%s:%s" .Values.image.repository (tpl .Values.image.tag .) }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "ubuntu.devops.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "ubuntu.devops.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

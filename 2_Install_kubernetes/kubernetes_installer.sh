#!/bin/bash

# INSTALAIÓN DE MINIKUBE

# Descarga del paquete debian.
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.9.2-0_amd64.deb

# Instalación del paquete debian.
sudo dpkg -i minikube_1.9.2-0_amd64.deb

#Comprobación de la correcta instalación.
minikube version

# -------------------------------------------------------------------------------------------- #

# INSTALACIÓN DE KUBECTL

# Descargar el binario con la herramienta curl.
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

# Conceder permisos de ejecución.
chmod +x ./kubectl

# Mover el binario al PATH.
sudo mv ./kubectl /usr/local/bin/kubectl

# Comprobación de la correcta instalación.
kubectl version --client

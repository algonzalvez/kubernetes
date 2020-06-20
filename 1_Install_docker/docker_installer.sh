#!/bin/bash

# Actualizar repositorios del OS.
sudo apt-get update

# Permitir el uso de apt sobre el protocolo https e instalar herramientas complementarias necesarias.
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# Añadir la clave GpG oficial de Docker.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Añadir el repositorio de Docker.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Actualizar de nuevo repositorios del OS.
sudo apt-get update

# Instalar la última versión de docker.
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Crear el grupo docker.
sudo groupadd docker

# Añadir el usuario actual al grupo de docker anteriormente creado.
sudo usermod -aG docker $USER

# Comprobar la correcta instalación de Docker.
sudo docker --version

echo "Cerrar sesión con el usuario actual o reiniciar la máquina en caso de máquinas virtuales para que se hagan efectivos los cambios"


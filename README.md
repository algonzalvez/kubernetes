# Proyecto Django-cms en Kubernetes (minikube)
Este proyecto tiene como fin el despliegue del gestor de contenidos django-cms en un escenario kubernetes. Para ello kubernetes creará principalmente un volumen, un pod con postgresql y un pod de django-cms.
No usar en producción sin modificar/personalizar.
Los scripts de instalación están adaptados solo para ser ejecutados en Ubuntu 18.04

## Clonar el repositorio

```
$ git clone https://github.com/algonzalvez/kubernetes.git
```

## Acceder al directorio raíz

```
$ cd kubernetes
```


## Instalar Docker
> Saltar este paso si ya se tiene instalado.

```
$ ./1_Install_docker/docker_installer.sh 
```

## Instalar Minikube y kubectl
> Saltar este paso si ya se tiene instalado.

```
$ ./2_Install_kubernetes/kubernetes_installer.sh
```

## Crear clúster en kubernetes

```
$ minikube start
```

## Desplegar postgresql y crear el volumen persistente

```
$ kubectl apply -f 3_deploy/postgres/
```

## Mostrar los pods

```
$ kubectl get all
```
> Esperar hasta que el pod de postgres tenga el status "Running"

## Desplegar djangocms

```
$ kubectl apply -f 3_deploy/django/
```
> Esperar hasta que el pod de django tenga el status "Running"

## Crear super usuario para administrar django-cms

```
$ kubectl exec -it pod/nombre_del_pod_de_django -- /bin/bash
# python manage.py createsuperuser
```

## Acceder a django-cms

```
$ minikube service django-service
```

> Si carga la página web del sitio y no el panel de acceso, añadir /admin en la url.


***

***


# Ejemplo de auto escalado HPA

## Desplegar el servicio

```
$ kubectl apply -f 4_HPA/service-node-port.yaml
```

## Desplegar el deployment

```
$ kubectl apply -f 4_HPA/deployment.yaml
```


## Comprobar si el servicio de métricas está habilitado

> El servicio se llama metrics-server

```
$ minikube addons list
```

## Habilitar el servicio de métricas

```
$ minikube addons enable metrics-server
```

## Aplicar manifiesto del HPA

```
$ kubectl apply -f 4_HPA/hpa.yaml
```

## Mostrar el la url del servicio

```
$ minikube service php-apache
```

## Mostrar la cantidad de pods desplegados antes de aumentar la carga de trabajo

```
$ kubectl get all
```

## Aumentar la carga de trabajo

```
$ while true; do wget -q -O- http://$(minikube ip):30000; done
```
> Esperar unos minutos que se midan las métricas

## Comprobar que ha aumentado el número de pods desplegados

```
$ kubectl get all
```

[Página principal](https://algonzalvez.github.io/)

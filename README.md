### Proyecto Django-cms en Kubernetes (minikube)
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



[Página principal](https://algonzalvez.github.io/)

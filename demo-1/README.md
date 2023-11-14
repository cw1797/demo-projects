## service.yaml
- Using Cluster IP as ingress can handle forwarding traffic directly to the service - of course if there is a particular case for needing NodePort to be use this can still be done.
- Sets target port of the pod and port to expose on the service to 80

## configmap.yaml
- Basic html document to be used for testing each service is available via ingress

## deployment.yaml
- Deploys pods for services 1,2,3
- Mounts above mentioned configmap as a volume mount into the container that will be served by nginx

## tls-secret.yaml
- Our really secure self signed certificate (Defineley should not be in github!)

## ingress.yaml
- Path based rules defined for each service to forward traffic to their respective service.
- ingressClassName specifies to use nginx ingress controller backend
- Defines host and the tls cert for it - HTTPS traffic arriving from aws nlb will be terminated at this ingress and from there be taken to service in HTTP

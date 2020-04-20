cd C:\Users\xyz\source\repos\nginx-sidecar-tls-jwt\nginx-plus-sidecar
docker build --no-cache -t nginxplus .

CD C:\Users\xyz\source\repos\nginx-sidecar-tls-jwt\nginx-plus-sidecar
docker build --no-cache -t nginxplus-sidecar .

#for local testing
docker stop $(docker ps -aq --filter name=nginxplus-sidecar)
docker rm $(docker ps -aq --filter name=nginxplus-sidecar)
docker run --name nginxplus-sidecar -it -p 8443:443 nginxplus-sidecar:latest

#for local testing
docker stop $(docker ps -aq --filter name=nginxplus-sidecar)
docker rm $(docker ps -aq --filter name=nginxplus-sidecar)
docker run --name nginxplus-sidecar  -it -p 8000:80 nginxplus-sidecar:latest

docker ps
docker stop $(docker ps -aqf  name=nginxplus-sidecar)

az acr login --name myacr
az acr repository list --name myacr --output table

docker tag nginxplus-sidecar:latest myacr.azurecr.io/nginxplus-sidecar:v8.0
docker push myacr.azurecr.io/nginxplus-sidecar:v8.0

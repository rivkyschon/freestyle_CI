echo "Hello World !!!!"
#docker-compose up
docker ps
docker run -d -p 27017:27017 --name mongodb -v mongodb-data:/data/db mongo:latest
docker run -d -p 4000:4000 --name nodejs-app -v mongodb-data:/data/db rivkyschon/nodejs-app:v0.0.1

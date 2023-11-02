echo "Hello World !!!!"
ls
#docker-compose up --build
#docker ps
#docker run -d -p 27017:27017 --name mongodb -v mongodb-data:/data/db mongo:latest
#docker run -d -p 4000:4000 --name nodejs-app -v mongodb-data:/data/db rivkyschon/nodejs-app:v0.0.1
docker network create my-network

docker run -d -p 27017:27017 --name mongodb -v mongodb-data:/data/db --network my-network mongo:latest

docker build -t rivkyschon/nodejs-app:ci .

docker run -d -p 4000:4000 --name nodejs-app -v mongodb-data:/data/db --network my-network rivkyschon/nodejs-app:ci

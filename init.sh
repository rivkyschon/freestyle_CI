echo "Hello World !!!!"
#docker-compose up
docker ps
docker run -d -p 27017:27017 --name mongodb -v mongodb-data:/data/db mongo:latest
docker run -d -p 27017:27017 --name mongodb -v mongodb-data:/data/db mongo:latest

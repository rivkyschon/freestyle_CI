# Stage 1: Build the application (development stage)
FROM node:20-alpine as development


WORKDIR /usr/src/app


# Copy package.json and package-lock.json to the container
COPY package*.json ./


# Install all dependencies (including dev dependencies) for development
RUN npm install


# Copy the rest of the application code to the container
COPY . .


# Expose the port for development (if needed)
EXPOSE 4000


# Use a command specific to your development environment (e.g., npm run dev)
CMD ["npm", "run", "dev"]


# Stage 2: Build the application (production stage)
FROM node:20-alpine as production


WORKDIR /usr/src/app


# Copy package.json and package-lock.json to the container
COPY package*.json ./


# Install only production dependencies
RUN npm install --production


# Copy the rest of the application code to the container
COPY . .


# Expose the port for production
EXPOSE 4000


# Define the command to start your application in production
CMD ["node", "index.js"]
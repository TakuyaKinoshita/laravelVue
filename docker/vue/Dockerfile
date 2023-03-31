# docker/vue/Dockerfile

# Specify base image
FROM node:lts

# Working Directory Settings
WORKDIR /app

# install vue-cli
RUN npm install -g @vue/cli

# Copy package.json and package-lock.json
COPY ./package*.json ./

# Install Dependencies
RUN npm install

# Copy the application source code
COPY . .

EXPOSE 3000
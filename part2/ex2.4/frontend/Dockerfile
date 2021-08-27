# Use ubuntu 18.04 image from dockerhub as base
FROM ubuntu:18.04

# Set workdir
WORKDIR /usr/src/app

# Copy the app soure into image, must be in that folder currently
COPY . .

# Install curl, then node v14
RUN apt update && apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt install -y nodejs
RUN npm install

# Install serve npm package
RUN npm install -g serve

# Set the environment variable that points to the backend API
#ENV REACT_APP_BACKEND_URL=localhost:8080

# Always build the app upon running to apply env variables & use serve when launching the container
CMD npm run build ; serve -s -l 5000 build

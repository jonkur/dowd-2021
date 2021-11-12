# Use ubuntu 18.04 image from dockerhub as base for the build image
FROM ubuntu:18.04 as build-img

# Set workdir
WORKDIR /usr/src/app

# Copy the app soure into image, must be in that folder currently
COPY . .

# Install curl, then node v14
RUN apt update && apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt install -y nodejs
RUN npm install

# Build the app
RUN npm run build

#ENV REACT_APP_BACKEND_URL=localhost:8080

# Copy build to a new nginx image container
FROM nginx:1.21.4-alpine
COPY --from=build-img /usr/src/app/build /usr/share/nginx/html
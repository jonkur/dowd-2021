# Use ubuntu 18.04 image from dockerhub as base
FROM ubuntu:18.04

# Set workdir
WORKDIR /usr/src/app

# Copy the app source into image, must be in that folder currently
COPY . .

# Install curl, then node v14
RUN apt update && apt install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt install -y nodejs && \
    npm install && \
    npm install -g serve && \
    apt-get purge -y --auto-remove curl && \ 
    rm -rf /var/lib/apt/lists/* && \
    useradd -m nonrootuser && \
    chown nonrootuser /usr/src/app

USER nonrootuser

#ENV REACT_APP_BACKEND_URL=localhost:8080

# Always build the app upon running to apply env variables & use serve when launching the container
CMD REACT_APP_BACKEND_URL=http://localhost:8080 npm run build ; serve -s -l 5000 build

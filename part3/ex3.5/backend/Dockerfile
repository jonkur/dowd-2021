# Start with the golang:1.16 base image
FROM ubuntu:18.04

# Working dir
WORKDIR /go/src/app/

# Copy everything from this dir to image
COPY . .

# ENVs
ENV PORT=8080
ENV REQUEST_ORIGIN=http://localhost:5000

# Build
RUN apt-get update && apt-get -y upgrade && \ 
    apt install -y wget && \
    wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz && \
    tar -xvf go1.16.4.linux-amd64.tar.gz && \
    mv go /usr/local && \
    export GOROOT=/usr/local/go && \
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH && \
    go build && \
    apt-get purge -y --auto-remove wget && \ 
    rm -rf /usr/local/go && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m nonrootuser

USER nonrootuser

# CMD for launching
CMD ["./server"]

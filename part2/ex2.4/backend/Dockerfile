# Start with the golang:1.16 base image
FROM golang:1.16

# Working dir
WORKDIR /go/src/app/

# Copy everything from this dir to image
COPY . .

# Build
RUN go build

# CMD for launching
CMD ["./server"]

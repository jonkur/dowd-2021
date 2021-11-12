# Use the golang:1.16 base image for building
FROM golang:1.16 as build-img

# Working dir
WORKDIR /go/src/app/

# Copy everything from this dir to image
COPY . .

# Build with CGO disabled to make sure the binary is fully static and not dynamically linked (= does not have outside dependencies)
RUN CGO_ENABLED=0 go build

# Use this empty image to run the built server
FROM scratch
COPY --from=build-img /go/src/app/server /server

# CMD for launching
ENTRYPOINT ["/server"]

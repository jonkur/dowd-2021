FROM alpine:3.13

WORKDIR /usr/src/app
COPY publishProject.sh .

RUN apk add git
RUN apk add docker

CMD ./publishProject.sh

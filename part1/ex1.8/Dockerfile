FROM ubuntu:18.04
WORKDIR /usr/src/app
RUN apt update && yes | apt install curl
COPY scriptfile .
RUN chmod +x scriptfile
CMD ./scriptfile

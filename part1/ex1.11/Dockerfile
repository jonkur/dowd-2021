# Start with the base Openjdk:8 image
FROM openjdk:8

# Expose the port mentioned in README.md
EXPOSE 8080

# Set workdir
WORKDIR /usr/src/app

# git clone the repository containing the app we are putting in this image, git should be installed in the base
RUN git clone https://github.com/docker-hy/material-applications

# retain only the wanted app from repo, remove everything else to save space
RUN mv material-applications/spring-example-project/* .
RUN mv material-applications/spring-example-project/.[!.]* .
RUN rm -rf material-applications

# build the project
RUN ./mvnw package

# CMD for running it
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]

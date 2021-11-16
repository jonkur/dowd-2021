# First clone the project to a designated build container and build it there, also initialize a new sqlite database for it.
# Lastly extract the dependencies for the built jar, which we'll use when building a smaller JRE runtime to run the app in.
FROM maven:3.8.2-jdk-11 as build-img
WORKDIR /usr/src/
RUN git clone https://github.com/jonkur/Kysymyspankki.git && \
    cd Kysymyspankki && \
    mvn install && \
    apt update && \
    apt install sqlite3 && \
    sed '1,31!d' dbschema > dbschema_redacted && \
    sqlite3 db.sqlite < dbschema_redacted && \
    cd target && \
    jdeps -q --ignore-missing-deps --print-module-deps --multi-release 18 -cp 'dependency/*' Kysymyspankki-1.0-SNAPSHOT-jar-with-dependencies.jar > deps

# Build a smaller JRE runtime in an intermediate container, had to do it this way as building it in a non-alpine based image resulted
# in the executable not being able to run (because Alpine uses musl instead of glibc, apparently)
FROM openjdk:17-alpine AS jre-build-img
WORKDIR /usr/src/temp
COPY --from=build-img /usr/src/Kysymyspankki/target/deps deps
RUN jlink --no-header-files --no-man-pages --compress 2 --output runtime --add-modules $(cat deps)

# Copy the JRE runtime and the built JAR to a lightweight container and start the app.
# Add a new non-root user with reduced privileges for added security.
# Tip: Manually map a host port to container port 4567 when running the app (the -p flag)
FROM alpine:3.13

RUN adduser -D nonrootuser

WORKDIR /usr/src

COPY --from=jre-build-img --chown=nonrootuser /usr/src/temp/runtime app
COPY --from=build-img --chown=nonrootuser /usr/src/Kysymyspankki/target/Kysymyspankki-1.0-SNAPSHOT-jar-with-dependencies.jar app/Kysymyspankki.jar
COPY --from=build-img --chown=nonrootuser /usr/src/Kysymyspankki/db.sqlite app/db.sqlite

USER nonrootuser

ENTRYPOINT app/bin/java -jar app/Kysymyspankki.jar app/db.sqlite
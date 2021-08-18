## Image for the Kysymyspankki app

Link to dockerhub: https://hub.docker.com/r/jkur00/kysymyspankki

This very simple app runs on Java and is built with Maven. Data ist persisted to an Sqlite database.
The docker container is ready to run as-is, with all dependencies installed and an empty database created within.

### Pulling & running the image

Make sure the port 4567 is free (or change the first port after -p argument to another free port)

```
docker pull jkur00/kysymyspankki:1.0
docker run -p 4567:4567 jkur00/kysymyspankki:1.0
```

Navigate to localhost:4567 with your browser (or another port, if you changed it) to use the app.

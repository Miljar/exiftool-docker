# Exiftool Docker image

## Using this image

### Clone this repository

```shell
$ git clone git@github.com:Miljar/exiftool-docker.git && cd exiftool-docker
```

### Build container

```shell
$ docker built -t exiftool .
```

### Run container

```shell
$ docker run -v "$PWD":/tmp exiftool <image>
```

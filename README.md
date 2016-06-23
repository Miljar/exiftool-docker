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

You might want to alias the above command to the `exiftool` command, so you can simply do:

```shell
$ exiftool <image>
```

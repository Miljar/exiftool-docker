FROM alpine:latest
MAINTAINER Tom Van Herreweghe
MAINTAINER Jeroen Kransen

ENV EXIFTOOL_VERSION=12.55

RUN apk add --no-cache perl make ca-certificates
RUN cd /tmp \
	&& wget https://exiftool.org/Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& tar -zxvf Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& cd Image-ExifTool-${EXIFTOOL_VERSION} \
	&& perl Makefile.PL \
	&& make test \
	&& make install \
	&& cd .. \
	&& rm -rf Image-ExifTool-${EXIFTOOL_VERSION}


VOLUME /tmp

WORKDIR /tmp

ENTRYPOINT ["exiftool"]

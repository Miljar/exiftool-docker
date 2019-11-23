FROM alpine:latest
MAINTAINER Tom Van Herreweghe

ENV EXIFTOOL_VERSION=11.76

RUN apk add --no-cache perl make ca-certificates
RUN cd /tmp \
	&& wget https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
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

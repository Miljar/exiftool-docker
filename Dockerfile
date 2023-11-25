FROM alpine:latest
LABEL org.opencontainers.image.authors="Tom Van Herreweghe, Charles \"Cyndi\" Cavanaugh"

ENV EXIFTOOL_VERSION=12.70

RUN apk add --no-cache perl make
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

FROM alpine:3.3
MAINTAINER Tom Van Herreweghe

RUN apk add --no-cache perl make curl
RUN cd /tmp \
	&& export EXIFTOOL_VERSION=$(curl -s https://exiftool.org/ | grep -Eo "Image-ExifTool-[0-9\.]+.tar.gz" | sed -e "s/Image-ExifTool-//g" -e "s/.tar.gz//") \
	&& wget http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
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

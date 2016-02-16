FROM        ubuntu:14.04.3
MAINTAINER  Dmitry Mozzherin
ENV LAST_FULL_REBUILD 2016-02-15

# Update the package repository and install applications
RUN apt-get update -qq && \
  apt-get upgrade -yqq && \
  apt-get -yqq install varnish && \
  apt-get -yqq clean

ENV VARNISH_PORT 80
ENV VARNISH_MEM  100M

EXPOSE 80
VOLUME /etc/varnish

RUN ln -sf /dev/stdout /var/log/varnish/access.log
RUN ln -sf /dev/stderr /var/log/varnish/error.log

COPY varnish /

CMD ["/varnish"]

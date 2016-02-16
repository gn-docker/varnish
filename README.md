varnish
=======

Varnish container


sudo docker run -v /eol/varnish/default.vcl:/etc/varnish/default.vcl \
  -p 80:80 gnames/varnish

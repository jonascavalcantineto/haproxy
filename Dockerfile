FROM haproxy:2.1.4

RUN export LC_ALL="en_US.UTF-8"
RUN export LC_CTYPE="en_US.UTF-8"

RUN apt-get update
RUN apt-get install -y iputils-ping git

#Enable LetsEncrypt
RUN apt-get install -y \
                certbot \
                letsencrypt

ADD scripts/* /
RUN chmod 755 /*.sh

COPY confs/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
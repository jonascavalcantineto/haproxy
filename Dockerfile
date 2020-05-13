FROM haproxy:2.1.4

RUN apt-get update
RUN apt-get install -y iputils-ping
COPY confs/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
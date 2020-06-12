FROM centos:8.1.1911


RUN set -ex  \
        && yum clean all

RUN yum update -y
RUN yum install -y \
                epel-release \
                haproxy \
                git \
                vim \
                telnet

RUN yum install -y supervisor

RUN set -ex \
        && cd /opt \
        && git clone https://github.com/certbot/certbot.git \
        && cd certbot && echo "y" | ./certbot-auto

ADD scripts/* /
RUN chmod 755 /*.sh

ADD confs/supervisord.conf /etc/supervisord.conf
COPY confs/haproxy.cfg /etc/haproxy/haproxy.cfg


CMD ["/start.sh"]
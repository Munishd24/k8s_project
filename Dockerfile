FROM rockylinux:9

RUN dnf install -y httpd zip unzip && dnf clean all

WORKDIR /var/www/html

COPY photogenic-master.zip /tmp/photogenic-master.zip

RUN unzip /tmp/photogenic-master.zip -d /tmp && \
    cp -rvf /tmp/photogenic-master/* /var/www/html/ && \
    rm -rf /tmp/photogenic-master /tmp/photogenic-master.zip

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]


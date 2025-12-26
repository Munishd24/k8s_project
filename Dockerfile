FROM rockylinux:9

RUN dnf install -y httpd zip unzip && dnf clean all

WORKDIR /var/www/html

COPY photogenic.zip /tmp/photogenic.zip

RUN unzip /tmp/photogenic.zip -d /tmp && \
    cp -rvf /tmp/photogenic/* /var/www/html/ && \
    rm -rf /tmp/photogenic /tmp/photogenic.zip

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]


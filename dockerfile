FROM ubuntu
LABEL version="1"
LABEL description="an apache and php images"
WORKDIR /var/www
COPY ./ /html
ENV TZ=America/Bogota
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \ 
      apt-get install apache2 -y
RUN apt-get install sudo
EXPOSE 8080
RUN echo "$(whoami)" > /var/www/html/user1.html
RUN useradd andres
USER andres
RUN echo "$(whoami)" > /tmp/user2.html
VOLUME /var/www/html
USER root 
RUN cp /tmp/user2.html /var/www/html/user2.html
CMD apachectl -DFOREGROUND 
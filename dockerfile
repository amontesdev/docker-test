FROM ubuntu
WORKDIR /var/www
COPY ./ /html
ENV TZ=America/Bogota
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \ 
      apt-get install apache2 -y
RUN apt-get install sudo
EXPOSE 8080
CMD apachectl -DFOREGROUND 
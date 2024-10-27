# Utiliza la imagen oficial de Ubuntu 20.04
FROM ubuntu:20.04

# Establece el ambiente no interactivo para evitar preguntas en la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualiza el sistema y luego instala Apache2, Perl, mod_perl y el módulo CGI
RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-perl2 perl libcgi-pm-perl && \
    apt-get clean

# Habilita mod_perl y CGI para que Apache2 ejecute scripts Perl
RUN a2enmod perl && a2enmod cgi

# Configura el ServerName para evitar advertencias
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copia el archivo Perl al directorio CGI-bin
COPY cgi-bin/calculadora.pl /usr/lib/cgi-bin/

# Copia el resto de los archivos (HTML, CSS, imágenes) al directorio web de Apache
COPY /html /var/www/html/
COPY css/ /var/www/html/css/
COPY css/images/ /var/www/html/images/

# Da permisos ejecutables al script Perl
RUN chmod +x /usr/lib/cgi-bin/calculadora.pl

# Cambia el propietario de todos los archivos al usuario de Apache
RUN chown -R www-data:www-data /var/www/html /usr/lib/cgi-bin/

# Expone el puerto 80 para que se pueda acceder al servidor web
EXPOSE 80

# Inicia el servicio de Apache en primer plano
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

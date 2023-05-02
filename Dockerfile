# Imagen base
FROM debian

# Actualizar la lista de paquetes y aplicar los cambios
RUN apt-get update

# Instalacion de Apache
RUN apt-get -y install apache2

EXPOSE 80

# Se inicia el servicio de Apache
RUN service apache2 start

# Se agrega el comando al bashrc para que el servicio se inicie automaticamente al ingresar a la terminal
RUN echo "service apache2 start" >> /etc/bash.bashrc

# Activacion del modulo deflate para compresion de archivos
RUN a2enmod deflate
RUN cd /etc/apache2/

# Se reemplaza el archivo de configuracion de la imagen
COPY ./apache2.conf /etc/apache2.conf 


RUN service apache2 restart
#expose 80
CMD /usr/sbin/apache2ctl -D FOREGROUND

# Imagen base
FROM debian

# Actualizar la lista de paquetes
RUN apt-get -y update

# Instalacion de Apache
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2

# Se inicia el servicio de Apache
RUN service apache2 start

# Se agrega el comando al bashrc para que el servicio se inicie automaticamente al ingresar a la terminal
RUN echo "service apache2 start" >> /etc/bash.bashrc

# Activacion de los modulos necesarios
RUN a2enmod deflate
RUN a2enmod headers

# Se reemplaza el archivo de configuracion de la imagen
COPY apache2.conf /etc/apache2/ 

# Se reinicia el servicio para que se apliquen los cambios
RUN service apache2 restart

# Se prepara la imagen para cuando se construya el contenedor a partir de esta
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND

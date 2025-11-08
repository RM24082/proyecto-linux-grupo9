FROM ubuntu:20.04
# Evitar preguntas interactivas

ENV DEBIAN_FRONTEND=noninteractive


# Instalar dependencias del sistema

RUN apt-get update && apt-get install -y \

    apache2 \

    php \

    curl \

    cron \

    && apt-get clean \

    && rm -rf /var/lib/apt/lists/*


# Copiar scripts y contenido web

COPY scripts/ /var/www/scripts/

COPY web/ /var/www/html/


# Dar permisos de ejecución

RUN chmod +x /var/www/scripts/*.sh


# Configurar Apache para PHP

RUN echo "<?php phpinfo(); ?>" > /var/www/html/info.php


# Exponer puerto

EXPOSE 80


# Iniciar Apache en primer plano

CMD ["apache2ctl", "-D", "FOREGROUND"]


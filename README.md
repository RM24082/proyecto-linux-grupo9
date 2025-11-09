# 🐧 Proyecto Linux - Grupo 9

## 📖 Descripción
Sistema completo de monitoreo y administración de servidores Linux implementado en Docker con interfaz web, automatización y control de versiones.

## 🎯 Objetivos Cumplidos

### ✅ 1. Preparación del Entorno Servidor
- **Hostname:** `servidor-grupo9`
- **Usuarios del sistema:**
  - `adminsys` (privilegios sudo)
  - `tecnico` (grupo soporte)
  - `visitante` (grupo web)
- **Grupos:** `soporte`, `web`
- **Estructura de directorios en `/proyecto/`:**
  - `datos/` - Archivos de configuración (grupo soporte)
  - `web/` - Archivos del sitio web (grupo web)
  - `scripts/` - Scripts de automatización
  - `capturas/` - Evidencias del proyecto

### ✅ 2. Automatización y Monitoreo
- **Script de monitoreo:** `reporte_sistema.sh`
- **Métricas monitoreadas:**
  - Fecha y hora actual
  - Nombre del host del sistema
  - Número de usuarios conectados
  - Espacio libre en disco principal
  - Memoria RAM disponible
  - Número de contenedores Docker activos
- **Automatización con Cron:** Ejecución cada 30 minutos
- **Logs:** `/var/log/proyecto-linux-grupo9/reporte_sistema.log`

### ✅ 3. Control de Versiones
- **Repositorio Git:** Inicializado en `/proyecto/`
- **GitHub:** https://github.com/RM24082/proyecto-linux-grupo9.git
- **Commits:** Historial completo de desarrollo

### ✅ 4. Docker
- **Docker:** Instalado y configurado
- **Usuarios con permisos Docker:**
  - `adminsys` (grupo docker)
  - `tecnico` (grupo docker)
- **Verificación:** Contenedor hello-world ejecutado exitosamente

### ✅ 5. Servidor Web Containerizado
- **Contenedor:** Apache/PHP en Docker
- **Puerto:** 8080 (host) → 80 (contenedor)
- **Volúmenes montados:**
  - `/proyecto/web/` → `/var/www/html/`
  - `/proyecto/scripts/` → `/var/www/scripts/`
- **URL:** http://localhost:8080

## 🚀 Instalación y Configuración

### Prerrequisitos
- Linux Mint/Ubuntu
- Docker y Docker Compose
- Git

### Pasos de instalación

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/RM24082/proyecto-linux-grupo9.git
   cd proyecto-linux-grupo9




Configurar el entorno:

# Crear estructura de directorios
sudo mkdir -p /proyecto/{datos,web,scripts,capturas}

# Configurar permisos
sudo chgrp soporte /proyecto/datos
sudo chgrp web /proyecto/web
sudo chmod g+s /proyecto/datos /proyecto/web

Ejecutar con Docker Compose:


docker compose up -d

    Acceder a la aplicación:

        Interfaz web: http://localhost:8080

        Monitor en tiempo real: http://localhost:8080/monitor.php

reporte_sistema.sh
#!/bin/bash
echo "---Reporte de monitoreo del sistema---"
echo "Fecha y hora: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Nombre del Host: $(hostname)"
echo "Usuarios conectados: $(who | wc -l)"
echo "Espacio disponible: $(df -h / | awk 'NR==2 {print $4}')"
echo "Espacio disponible en Memoria RAM: $(free -m | awk 'NR==2 {print $7}')"
echo "Número de contenedores docker activos: $(docker ps -q | wc -l)"
echo "---Reporte finalizado---"



docker-compose.yml

services:
  web-monitor:
    build: .
    container_name: proyecto-linux-grupo9
    ports:
      - "8080:80"
    volumes:
      - ./scripts:/var/www/scripts
      - ./web:/var/www/html
      - ./datos:/var/www/datos
      - ./capturas:/var/www/capturas
    restart: unless-stopped

Dockerfile
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    apache2 php libapache2-mod-php curl cron \
    && apt-get clean
COPY scripts/ /var/www/scripts/
COPY web/ /var/www/html/
RUN chmod +x /var/www/scripts/*.sh
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]

Estructura del Proyecto
proyecto-linux-grupo9/
├── scripts/
│   ├── reporte_sistema.sh
│   └── reporte_sys.sh
├── web/
│   ├── index.html
│   └── monitor.php
├── datos/
├── capturas/
├── docker-compose.yml
├── Dockerfile
└── README.md
Gestión del contenedor
# Iniciar servicios
docker compose up -d

# Ver logs
docker compose logs -f

# Detener servicios
docker compose down

# Reconstruir
docker compose up -d --build
Monitoreo
# Ejecutar reporte manual
/proyecto/scripts/reporte_sistema.sh

# Ver logs automáticos
tail -f /var/log/proyecto-linux-grupo9/reporte_sistema.log
Administración
# Ver usuarios y grupos
getent passwd adminsys tecnico visitante
getent group soporte web docker

# Ver contenedores
docker ps

📝 Funcionalidades Implementadas

    ✅ Interfaz web responsive para monitoreo

    ✅ Scripts de automatización con cron

    ✅ Containerización con Docker

    ✅ Control de acceso por usuarios y grupos

    ✅ Monitoreo en tiempo real del sistema

    ✅ Logs centralizados de actividades

    ✅ Control de versiones con Git/GitHub
    Integrantes del Grupo 9



Josue Alexander Najarro Cardoza                  nc23009
Daniel Alexis Ramirez Martinez                      rm24082   
Carlos Sanchez Villalobos                               SV24006
Alexander Alonso Zeceña Martinez               zm24004




     Licencia

    # 🐧 Proyecto Linux - Grupo 9

## 📖 Descripción
Sistema completo de monitoreo y administración de servidores Linux implementado en Docker con interfaz web, automatización y control de versiones.

## 🎯 Objetivos Cumplidos

### ✅ 1. Preparación del Entorno Servidor
- **Hostname:** `servidor-grupo9`
- **Usuarios del sistema:**
  - `adminsys` (privilegios sudo)
  - `tecnico` (grupo soporte)
  - `visitante` (grupo web)
- **Grupos:** `soporte`, `web`
- **Estructura de directorios en `/proyecto/`:**
  - `datos/` - Archivos de configuración (grupo soporte)
  - `web/` - Archivos del sitio web (grupo web)
  - `scripts/` - Scripts de automatización
  - `capturas/` - Evidencias del proyecto

### ✅ 2. Automatización y Monitoreo
- **Script de monitoreo:** `reporte_sistema.sh`
- **Métricas monitoreadas:**
  - Fecha y hora actual
  - Nombre del host del sistema
  - Número de usuarios conectados
  - Espacio libre en disco principal
  - Memoria RAM disponible
  - Número de contenedores Docker activos
- **Automatización con Cron:** Ejecución cada 30 minutos
- **Logs:** `/var/log/proyecto-linux-grupo9/reporte_sistema.log`

### ✅ 3. Control de Versiones
- **Repositorio Git:** Inicializado en `/proyecto/`
- **GitHub:** https://github.com/RM24082/proyecto-linux-grupo9.git
- **Commits:** Historial completo de desarrollo

### ✅ 4. Docker
- **Docker:** Instalado y configurado
- **Usuarios con permisos Docker:**
  - `adminsys` (grupo docker)
  - `tecnico` (grupo docker)
- **Verificación:** Contenedor hello-world ejecutado exitosamente

### ✅ 5. Servidor Web Containerizado
- **Contenedor:** Apache/PHP en Docker
- **Puerto:** 8080 (host) → 80 (contenedor)
- **Volúmenes montados:**
  - `/proyecto/web/` → `/var/www/html/`
  - `/proyecto/scripts/` → `/var/www/scripts/`
- **URL:** http://localhost:8080

## 🚀 Instalación y Configuración

### Prerrequisitos
- Linux Mint/Ubuntu
- Docker y Docker Compose
- Git

### Pasos de instalación

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/RM24082/proyecto-linux-grupo9.git
   cd proyecto-linux-grupo9




Configurar el entorno:

# Crear estructura de directorios
sudo mkdir -p /proyecto/{datos,web,scripts,capturas}

# Configurar permisos
sudo chgrp soporte /proyecto/datos
sudo chgrp web /proyecto/web
sudo chmod g+s /proyecto/datos /proyecto/web

Ejecutar con Docker Compose:


docker compose up -d

    Acceder a la aplicación:

        Interfaz web: http://localhost:8080

        Monitor en tiempo real: http://localhost:8080/monitor.php

        Opcion alternativa al monitor: http://localhost:8080/index.html


reporte_sistema.sh
#!/bin/bash
echo "---Reporte de monitoreo del sistema---"
echo "Fecha y hora: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Nombre del Host: $(hostname)"
echo "Usuarios conectados: $(who | wc -l)"
echo "Espacio disponible: $(df -h / | awk 'NR==2 {print $4}')"
echo "Espacio disponible en Memoria RAM: $(free -m | awk 'NR==2 {print $7}')"
echo "Número de contenedores docker activos: $(docker ps -q | wc -l)"
echo "---Reporte finalizado---"



docker-compose.yml

services:
  web-monitor:
    build: .
    container_name: proyecto-linux-grupo9
    ports:
      - "8080:80"
    volumes:
      - ./scripts:/var/www/scripts
      - ./web:/var/www/html
      - ./datos:/var/www/datos
      - ./capturas:/var/www/capturas
    restart: unless-stopped

Dockerfile
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    apache2 php libapache2-mod-php curl cron \
    && apt-get clean
COPY scripts/ /var/www/scripts/
COPY web/ /var/www/html/
RUN chmod +x /var/www/scripts/*.sh
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]

Estructura del Proyecto
proyecto-linux-grupo9/
├── scripts/
│   ├── reporte_sistema.sh
│   └── reporte_sys.sh
├── web/
│   ├── index.html
│   └── monitor.php
├── datos/
├── capturas/
├── docker-compose.yml
├── Dockerfile
└── README.md
Gestión del contenedor
# Iniciar servicios
docker compose up -d

# Ver logs
docker compose logs -f

# Detener servicios
docker compose down

# Reconstruir
docker compose up -d --build
Monitoreo
# Ejecutar reporte manual
/proyecto/scripts/reporte_sistema.sh

# Ver logs automáticos
tail -f /var/log/proyecto-linux-grupo9/reporte_sistema.log
Administración
# Ver usuarios y grupos
getent passwd adminsys tecnico visitante
getent group soporte web docker

# Ver contenedores
docker ps

📝 Funcionalidades Implementadas

    ✅ Interfaz web responsive para monitoreo

    ✅ Scripts de automatización con cron

    ✅ Containerización con Docker

    ✅ Control de acceso por usuarios y grupos

    ✅ Monitoreo en tiempo real del sistema

    ✅ Logs centralizados de actividades

    ✅ Control de versiones con Git/GitHub
    Integrantes del Grupo 9



Josue Alexander Najarro Cardoza ------------------- nc23009
Daniel Alexis Ramirez Martinez  ------------------- rm24082   
Carlos Sanchez Villalobos       ------------------- SV24006
Alexander Alonso Zeceña Martinez ------------------ zm24004




     Licencia

    Este proyecto es de uso educativo creado e implementado para la materia  "Introduccion al sofware Libre" 
    de la carrera Ingenieria en dessarrollo de sofware

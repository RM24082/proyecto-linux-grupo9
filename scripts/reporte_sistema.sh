#!/bin/bash

echo "--------------------------Reporte de monitoreo del sistema--------------------------"

#1. Primer requisito: Fecha y hora 
echo "Fecha y hora: $(date "+%Y-%m-%d %H:%M:%S")"

# 2. Requisito del sistema: Hostname
echo "Nombre del Host $(hostname)"

#3 Numero de usuario conectados: 
echo  "Usuarios conectados: $(who | wc -l)"

#4. Espacio libre en el disco:  
echo "Espacio disponible: $( df -h / | awk 'NR==2 {print $4}')"

#5  Espacio libre en memoria RAM
echo "Espacio disponible en Memoria RAM: $(free -h | awk '/^Mem:/ {print $7}')"

#6 Numero de contenedore de Docker que estan activos: 
echo "Numero de contenedores docker activos: $(docker ps -q 2>/dev/null | wc -l)"

echo "-------------------------Reporte finalizado------------------------------------------"

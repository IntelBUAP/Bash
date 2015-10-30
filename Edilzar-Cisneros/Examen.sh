#!/bin/bash

clear
#Atrapar tecleo de salida ctrl+c y ctrl+z
trap '' 2
trap "" SIGTSTP
		echo ":::::::COMANDOS:::::::"
		echo "::	Buscar	    ::"
		echo "::	Comprimir   ::"
		echo "::	Descomprimir::"
		echo "::	Listar	    ::"
		echo "::	Moverse	    ::"
		echo "::	Abrir	    ::"
		echo "::	Tutorial    ::"
		echo "::	Salir	    ::"
		echo "::::::::::::::::::::::"
		
		
while true; do
#Leer comando ingresado y asignarlo en un arreglo
echo -n "Comandos-> "  
read var1
IFS=' ' read -a array <<< "$var1"
#Validacion de opciones, si se encuentra a un error manda a default y devuelve el prompt.
#Uso de Case anidado para verificar linea alinea, dependiendo de los parametros que recibe
#la variable array desde terminal.
case "${array[0]}" in
   "Buscar")case "${array[1]}" in
   		"Tamaño") find -size "${array[2]}"
   			;;
   		"Nombre") find -name "${array[2]}"
  			 ;;
   		"Usuario") find -user "${array[2]}"
  			 ;;
		"Permiso")find -type f -perm "${array[2]}"
  			 ;;
		"Fecha") find -mtime "${array[2]}"
  			 ;;
		*) echo "Argumentos no Validos (Use el comando Tutorial)" 
     		 ;; 
		esac	
   ;;
   "Comprimir") case "${array[1]}" in
   		".tar.gz") tar -czvf "${array[2]}.tar.gz" "${array[3]}"
   			;;
   		".tar.bz2") tar -c "${array[3]}" | bzip2 > "${array[2]}.tar.bz2"
  			 ;;
   		"zip") zip "${array[2]}.zip" "${array[3]}"
  			 ;;
		"rar")rar a "${array[2]}.rar" "${array[3]}"
		
  			 ;;
		*) echo "Argumentos no Validos (Use el comando Tutorial)" 
		esac	
   ;;
   "Descomprimir") case "${array[1]}" in
   		".tar.gz") tar -xzvf "${array[2]}.tar.gz"
   			;;
   		".tar.bz2") tar -jvxf "${array[2]}.tar.bz2"
  			 ;;
   		"zip") unzip "${array[2]}.zip"
  			 ;;
		"rar") rar x "${array[2]}.rar"
  			 ;;
		*) echo "Argumentos no Validos (Use el comando Tutorial)" 
		esac	
   ;;
   "Listar") ls --color 
   ;;
   "Moverse") case "${array[1]}" in
   		"Ir") cd "${array[2]}"; ls
   			;;
   		"Regresar") cd ..; ls
  			 ;;
		"Directorio") cd "${array[2]}"; ls
  			 ;;
		*) echo "Argumentos no Validos (Use el comando Tutorial)" 
		esac	
   ;;
   "Abrir") gedit "${array[1]}"
		
   ;;
#Tutorial para el uso optimo
   "Tutorial") echo -e "\e[1;37m(::::::::::::::::::::Tutorial::::::::::::::::::::)\e[0m" 
		echo -e "\e[1;37m(Busqueda Personalizada.)\e[0m"
		echo "- Sintaxis: Busqueda <tipo de busqueda> <Argumentos>" 
		echo "- Tipo de busqueda: Tamaño, Nombre, Usuario, Fecha." 
		echo "- Argumentos: Tamaño en k, Nombre del fichero, Nombre de usuario, Tipos de permisos 000, Dias de ficheros."
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		echo -e "\e[1;37m(Comprimir Archivos.)\e[0m"
		echo "- Sintaxis: Comprimir <tipo de Compresion> <Nombre de salida sin extension> <Nombre Archivo/Carperta>" 
		echo "- Tipo de Compresion: .tar.bz2, tar.gz, zip, rar." 
		echo "- Nombre se salida sin extension: Unicamente Nombre para el archivo de salida."
		echo "- Nombre Archivo/Carpeta: Nombre del archivo(con extension) o carpeta a comprimir." 
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		echo -e "\e[1;37m(Descomprimir Archivos.)\e[0m"
		echo "- Sintaxis: Descomprimir <tipo de Descompresion> <Nombre de Archivo Comprimido sin extension> " 
		echo "- Tipo de Descompresion: .tar.bz2, tar.gz, zip, rar." 
		echo "- Nombre de Archivo Comprimido sin extension: Unicamente Nombre para el archivo a descomprimir."
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		echo -e "\e[1;37m(Listar Archivos.)\e[0m"
		echo "- Sintaxis: Listar" 
		echo "- Listar: Lista en colores los archivos." 
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		echo -e "\e[1;37m(Moverse en Carpetas.)\e[0m"
		echo "- Sintaxis: Moverse <Tipo de navegacion> <Argumentos> " 
		echo "- Tipo de navegacion: Ir, Regresar, Directorio " 
		echo "- Argumentos: Nombre de carpeta,Regresar no necesita argumentos, Ruta"
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		echo -e "\e[1;37m(Abrir archivo.)\e[0m"
		echo "- Sintaxis: Abrir <Nombre del archivo> " 
		echo "- Nombre del archivo: Nombre del archivo con extension. " 
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		echo -e "\e[1;37m(Ver Tutorial.)\e[0m"
		echo "- Sintaxis: Tutorial" 
		echo "- Descripcion: Muestra el Tutorial." 
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		echo -e "\e[1;37m(Salir del interprete.)\e[0m"
		echo "- Sintaxis: Salir" 
		echo "- Termina con el programa." 
		echo ":::::::::::::::::::::::::::::::::::::::::::::::::" 
		
		
   ;;
   "Salir") exit
   ;;

   *) echo "Argumentos no Validos (Use el comando Tutorial)" 

esac

done
trap 2
trap - SIGTSTP

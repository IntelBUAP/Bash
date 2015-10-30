#!/bin/bash

echo "::Bienvenido a interprete basico::"

read x

linea=( $x )
numpal="${#linea[@]}"


if [ -z "$x" ] ; then
        echo ""
	sh interprete.sh
#------------ Para comandos sin parametros
elif [ $numpal -eq 1 ] ; then
	if [ $x = "sos" ] ; then
		clear
		echo "---------------------------------Inprete de ordenes básico----------------------------------"
		echo "Use los comandos:"
		echo "---Para realizar una búsqueda             :: encuentra 'Archivo_a_buscar' 'Donde_comenzar'"
        	echo "---Para comprimir                         :: enpaqueta 'Archivo'"
	       	echo "---Para desplegar contenido de carpetas   :: ver [archivo|carpeta]  "
        	echo "---Para moverte a un directorio           :: moversea /ruta"
	       	echo "---Para mostrar contenido de archivo      :: muestra 'archivo'"
        	echo "---Para salir del interprete              :: salir"
		echo "---------------------------------- LEOR Version 1.0-----------------------------------------"
		sh interprete.sh
	elif [ $x = "salir" ] ; then
		#dialog --yesno "Desea salir?" 6 30
		echo "Adios"
	elif [ $x = "ver" ] ; then
		lista=`echo *`
		echo $lista
		sh interprete.sh
	else
		echo -e '\E[31;47m'"\033[6mNo se encontró la órden \"$x\"." '\E[30;47m'"Obtenga ayuda con el comando" '\E[35;47m'"\033[5msos\033[0m"
        	sh interprete.sh
	fi
#----------- Si es un parámetro más un argumento
elif [ $numpal -eq 2 ] ; then
	#Se evalua el comando
	if [ ${linea[0]} = "moversea" ] ; then
		if [ -d ${linea[1]} ] ; then    		#Nos movemos a ${linea[1]} si existe"
			cd ${linea[1]}
			pwd
			sh interprete.sh
		else						#Notificamos si no existe el directorio
			echo "No existe el directorio ${linea[1]}"
			sh interprete.sh
		fi
	elif [ ${linea[0]} = "ver"  ] ; then
		if [ -d ${linea[1]} ] ; then			#Nos aseguramos de que que es un directorio
			ls ${linea[1]}
			sh interprete.sh
		else						#Notificamos si no existe el directorio
			echo -e '\E[31;40m'"\033[5mNo existe el directorio" '\E[33;40m'"${linea[1]}\033[0m"
			sh interprete.sh
		fi
	elif [ ${linea[0]} = "muestra" ] ; then
		if [ -f ${linea[1]} ] ; then
			#cat ${liena[1]}
			echo "Función en desarrollo"
			sh interprete.sh
		else
			echo -e '\E[31;40m'"\033[5mNo existe el archivo ${linea[1]}\033[0m"
			sh interprete.sh
		fi
	elif [ ${linea[0]} = "enpaqueta" ] ; then
		echo "Función sin terminar, en desarrollo"
		sh interprete.sh
	elif [ ${linea[0]} = "encuentra" ] ; then
		echo "Función sin desarrollo, en progreso"
		sh interprete.sh
	else
		#Si no coincide con algún comando y o su parámetro
                echo -e '\E[31;47m'"\033[6mNo se encontró la órden \"$x\"." '\E[30;47m'"Obtenga ayuda con el comando" '\E[35;47m'"\033[5msos\033[0m"
                sh interprete.sh
	fi
else
	#Si no coincide con algún comando
	echo -e '\E[31;47m'"\033[6mNo se encontró la órden \"$x\"." '\E[30;47m'"Obtenga ayuda con el comando" '\E[35;47m'"\033[5msos\033[0m"
	sh interprete.sh
fi

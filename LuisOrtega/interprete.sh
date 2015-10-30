#!/bin/bash
OLD_PATH=$PATH
PATH=$PATH:`pwd`

echo -e '\E[34;47m'"\033[4m::Bienvenido a interprete basico::\033[0m"

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
		echo "---Para realizar una búsqueda             :: encuentra [Archivo_a_buscar] [Donde_comenzar]"
        	echo "---Para comprimir                         :: enpaqueta <tar.gz|rar|zip> <Archivo>"
		echo "---Para descomprimir                      :: desenpaca <tar.gz|rar|zip> <Archivo> "
	       	echo "---Para desplegar contenido de carpetas   :: muestrame [detallado|todo] [/carpeta]  "
        	echo "---Para moverte a un directorio           :: moversea [/ruta]"
	       	echo "---Para mostrar contenido de archivo      :: despliega [archivo]"
        	echo "---Para salir del interprete              :: salir"
		echo "---------------------------------- LEOR Version 1.0-----------------------------------------"
		sh interprete.sh
	elif [ $x = "salir" ] ; then
		#dialog --yesno "Desea salir?" 6 30
		echo "Adios"
	elif [ $x = "muestrame" ] ; then
		ls --color=tty
		sh interprete.sh
	elif [ $x = "moversea" ] ; then
		cd
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
			sh interprete.sh
		else						#Notificamos si no existe el directorio
			echo -e '\E[31;40m'"\033[5mNo existe el directorio" '\E[33;40m'"${linea[1]}\033[0m"
			sh interprete.sh
		fi
	elif [ ${linea[0]} = "muestrame"  ] ; then
		case ${linea[1]} in
		"detallado")
			ls --color=tty -l
			sh interprete.sh
		;;
		"todo")
			ls --color=tty -a
			sh interprete.sh
		;;
		*)
		if [ -d ${linea[1]} ] ; then			#Nos aseguramos de que es un directorio
			ls --color=tty ${linea[1]}
			sh interprete.sh
		else						#Notificamos si no existe el directorio
			echo -e '\E[31;40m'"\033[5mNo existe el directorio" '\E[33;40m'"${linea[1]}. "'\E[32;40m'"\033[5msos para ayuda\033[0m"
			sh interprete.sh
		fi
		;;
		esac
	elif [ ${linea[0]} = "despliega" ] ; then
		if [ -f ${linea[1]} ] ; then
			more ${linea[1]}
			sh interprete.sh
		else
			echo -e '\E[31;40m'"\033[5mNo existe el archivo ${linea[1]}\033[0m"
			sh interprete.sh
		fi
	elif [ ${linea[0]} = "encuentra" ] ; then
		echo "Función sin desarrollo, en progreso"
		sh interprete.sh
	else
		#Si no coincide con algún comando y o su parámetro
                echo -e '\E[31;47m'"\033[6mNo se encontró la órden \"$x\"." '\E[30;47m'"Obtenga ayuda con el comando" '\E[35;47m'"\033[5msos\033[0m"
                sh interprete.sh
	fi
elif [ $numpal -eq 3 ] ; then
	if [ ${linea[0] = "enpaqueta"} ] ; then
		if [ ${linea[1]} = "tar.gz" ] ; then
			if [ -f ${linea[2]} ] || [ -d ${linea[2]} ] ; then
				tar -czvf ${linea[2]}.tar.bz ${linea[2]}
				sh interprete.sh
			else
				echo -e '\E[31;40m'"\033[5mNo existe el archivo ${linea[2]}\033[0m"
				sh interprete.sh
			fi
		elif [ ${linea[1]} = "zip" ] ; then
			if [ -f ${linea[2]} ] || [ -d ${linea[2]} ] ; then
				zip ${linea[2]}
				sh interprete.sh
			else
				echo -e '\E[31;40m'"\033[5mNo existe el archivo ${linea[2]}\033[0m"
                                sh interprete.sh
			fi
		elif [ ${linea[1]} = "rar" ] ; then
                        if [ -f ${linea[2]} ] || [ -d ${linea[2]} ] ; then
                                rar ${linea[2]}
                                sh interprete.sh
                        else
                                echo -e '\E[31;40m'"\033[5mNo existe el archivo ${linea[2]}\033[0m"
                                sh interprete.sh
                        fi
		else
			echo -e '\E[31;47m'"\033[6mNo se encontró la órden \"$x\"." '\E[30;47m'"Obtenga ayuda con el comando" '\E[35;47m'"\033[5msos\033[0m"
			sh interprete.sh
		fi
	fi
else
	#Si no coincide con algún comando
	echo -e '\E[31;47m'"\033[6mNo se encontró la órden \"$x\"." '\E[30;47m'"Obtenga ayuda con el comando" '\E[35;47m'"\033[5msos\033[0m"
	sh interprete.sh
fi

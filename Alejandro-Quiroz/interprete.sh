#!/bin/bash

function controls(){
	echo -e "Para terminar la ejecución, utilice el comando \e[1msalir\e[21m"
	echo -e -n '\e[33m[Quiro-sh~]>\e[39m '
}

trap controls SIGINT
trap controls SIGQUIT
trap controls SIGSTOP

echo -e '\e[2;3m-- Intérprete de comandos \e[1mQuiro-sh\e[21m--\e[22;23m'
echo -e '\e[2;3m-- Para obtener ayuda de los comandos disponibles, utilice el comando  \e[1mayuda\e[21m --\e[22;23m'
while true
do
	echo -e -n '\e[33m[Quiro-sh~]>\e[39m '
	read line
	comm=$(echo $line | cut -f1 -d' ')
	param1=$(echo $line | cut -f2 -d' ')
	param2=$(echo $line | cut -f3 -d' ')
	param3=$(echo $line | cut -f4 -d' ')
	param4=$(echo $line | cut -f5 -d' ')

	case $comm in
		"ayuda")
			more manual.txt
			;;
		"busca")
			case $param1 in
				"-tamano")
					find -size $param2 
					;;
				"-nombre")
					find -name $param2 
					;;
				"-usuario")
					find -user $param2 
					;;
				"-permisos")
					find -type f -perm $param2 
					;;
				"-fecha")
					find -atime $param2 
					;;
				*)
					echo -e "Error de parametros. Verifique el uso del comando \e[1m$comm\e[21m con la opción \e[1mayuda\e[21m."
					;;
			esac
			;;
	    "comprime")
			case $param1 in
				"-tarbz")
					tar -cjvf $param2.tar.bz $param3 
					;;
				"-targz")
					tar -zcvf $param2.tar.gz $param3
					;;
				"-zip")
					zip -r $param2.zip $param3
					;;
				"-rar")
					rar a $param2.rar $param3
					;;
				*)
					echo -e "Error de parametros. Verifique el uso del comando \e[1m$comm\e[21m con la opción \e[1mayuda\e[21m."
					;;
			esac
			;;	
		"descomprime")
			case $param1 in
				"-tarbz")
					tar -xjvf $param2
					;;
				"-targz")
					tar -xzvf $param2
					;;
				"-zip")
					unzip $param2
					;;
				"-rar")
					unrar x $param2
					;;
				*)
					echo -e "Error de parametros. Verifique el uso del comando \e[1m$comm\e[21m con la opción \e[1mayuda\e[21m."
					;;
			esac
			;;	
		"carpeta")
			echo -n "Directorio actual: "
			pwd
			ls --color
			;;
		"moverse")
			cd $param1
			echo -n "Directorio actual: "
			pwd
			;;
		"contenido")
			cat $param1
			;;
		"salir")
			echo -n "¿Está seguro de que desea salir? [s/n]: "
			read op2
			if [ "$op2" = "s" ]
			then
				echo "¡Hasta luego!"
				exit $?
			elif [ "$op2" != "n" ]
			then
				echo "Tomaré eso como un no."
			fi
			;;
		*)
			echo -e "!No conozco esa función! Verifique los comandos disponibles con la opción \e[1mayuda\e[21m."
			;;
	esac
done

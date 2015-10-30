#!/bin/bash

comm=""
ubicacion=$(pwd)
while [ "$comm" != "salir" ];
do
	read -p "$ubicacion->" comm p1 p2 p3 p4 p5 p6 p7 p8 p9 p10
	if [ -z $comm ]
	then
		continue
	fi
	if [ $comm == 'buscar' ];
	then
		if [ $p1 == 'ayuda' ];
		then
			echo "use el comando de las siguiente manera"
			echo "buscar  -nombre archivo -permisos 0000 -usuario nombre -tamaño 0M -ultimamod +n"
		else
			newcomm=$(echo $p1 $p2 $p3 $p4 $p5 $p6 | sed 's/nombre/name/g')
			newcomm=$(echo $newcomm | sed 's/permisos/perm/g')
			newcomm=$(echo $newcomm | sed 's/usuario/user/g')
			newcomm=$(echo $newcomm | sed 's/tamaño/size/g')
			newcomm=$(echo $newcomm | sed 's/ultimamod/mtime/g')
			find . $newcomm
		fi
	elif [ $comm == 'comprimir' ];
	then
		if [ -z $p1 ];
		then
			echo "comprimir: falta el nombre del directorio"
			continue
		fi
		if [ -d $p1 ];
		then 
			echo '1. tar.bz'
			echo '2. tar.gz'
			echo '3. zip'
			echo '4. rar'
			read -p 'Selecione tipo->' tipo
			case $tipo in
				1)
				tar -czvf $p1.tar.bz $p1
				;;
				2) 
				tar -czvf $p1.tar.gz $p1
				;;
				3) 
				zip -r $p1.zip $p1
				;;
				4)
				rar a $p1.rar $p1/*
				;;
			esac
		else
			echo "comprimir: el directorio no existe"
		fi
# descompresion de archivos comando: descomprimir tipo archivo
	elif [ $comm == 'descomprimir' ];
	then
		if [ -z $p1 ];
		then
			echo "descomprimir: falta el nombre del archivo"
			continue
		fi
		if [ -f $p2 ];
		then
			case $p1 in
				tar)
				tar -xvf $p2
				;;
				tar) 
				tar -xzvf $p2
				;;
				zip) 
				unzip $p2
				;;
				rar)
				rar x $p2
				;;
			esac
		else 
			echo "descomprimir: el archivo no existe!"
		fi
	elif [ $comm == 'listar' ];
	then
		for n in *
		do
			if [ -d $n ];
			then
				echo -e "\e[1;34m$n\e[0m"
			else
				echo $n
			fi
		done
	elif [ $comm == 'chdir' ];
	then
		if [ -d $p1 ];
		then 
			cd $p1
			ubicacion=$(pwd)
		else
			echo "chdir: el directorio no existe"
		fi
	elif [ $comm == 'mostrar' ];
	then 
		if [ -f $p1 ];
		then 
			cat $p1
		else
			echo "mostrar: el archivo no existe o no es regular"
		fi
	elif [ $comm == 'ayuda' ];
	then
		echo "||======================================================||"
		echo "|| COMANDO               ||    MODO DE EMPLEO           ||"
		echo "||======================================================||"
		echo "|| buscar archivo        ||    buscar ayuda             ||"
		echo "|| comprimir             ||    comprimir carpeta        ||"
		echo "|| descomprimir          ||    descomprimir tipo archivo||"
		echo "|| listar archivos       ||    listar                   ||"
		echo "|| cambiar de directorio ||    chdir directorio         ||"
		echo "|| mostra contenido      ||    mostrar archivo          ||"
		echo "|| ayuda                 ||    ayuda                    ||"
		echo "|| salir                 ||    salir                    ||"
		echo "||======================================================||"
	else
		echo "escriba 'ayuda' para mas informacion"
	fi
done



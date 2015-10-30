#!/bin/sh
#interprete de comandos
while [ true ] ; do
	echo "$ mostrarComandos"
	echo "["$PWD"]$"
	read -a COMANDO
	COM=${COMANDO[0]}
	j=0
	ARGS=""
	for i in "${COMANDO[@]}" ; do
		if [ "$j" == 0 ]
		then
			((j++))
			continue
		fi
		ARGS=$ARGS" "$i
		((j++))
	done
	if [ "$COM" == "buscar" ]
	then
		find $ARGS 2>>"errLog.txt"
		if [ "$?" != 0 ]
		then
			echo "error: no se encuentra el archivo "
		fi		
	elif [ "$COM" == "comprimir" ]
	then
		tar $ARGS 2>>"errLog.txt"
		if [ "$?" != 0 ]
		then
			echo "error: no se puede procesar la orden "
		fi
	elif [ "$COM" == "descomprimir" ]
	then	
		tar $ARGS 2>>"errLog.txt"
		if [ "$?" != 0 ]
		then
			echo "error: no se puede procesar la orden "
		fi
	elif [ "$COM" == "mostrarArchivos" ]
	then
		ls --color $ARGS 2>>"errLog.txt"
		if [ "$?" != 0 ]
		then
			echo "error: no se puede procesar la orden "
		fi
	elif [ "$COM" == "movermeA" ]
	then
		cd $ARGS 2>>"errLog.txt"
		if [ "$?" != 0 ]
		then
			echo "error: ruta no encontrada"
		fi
	elif [ "$COM" == "abrirArchivo" ]
	then
		cat $ARGS 2>>"errLog.txt"
		if [ "$?" != 0 ]
		then
			echo "error: archivo no encontrado"
		fi
	elif [ "$COM" == "mostrarComandos" ]
	then
		echo "COMANDOS ADMITIDOS:"
		echo "$ buscar [-name 'nombre'] [-user <nombre>] [<directory> -size <+/-tamaño>] [-mtime -<dias>] [-perm <permisos>]"
		echo "$ comprimir [-czvf](tar.gz) [-cvf](tar) [-czf](zip) [-rar] <nombre.tar/tar.gz/zip/rar> carpeta_a_comprimir/"
		echo "$ descomprimir [-xzvf](tar.gz) [-xvf](tar) [-xzf](zip) carpeta_a_descomprimir"
		echo "$ mostrarArchivos <ruta>"
		echo "$ movermeA <ruta>"
		echo "$ abrirArchivo <archivo>"
		echo "$ salir"
	elif [ "$COM" == "salir" ]
	then
		echo "finalizado"
		break 
	else
		echo "comando invalido"
	fi	
done



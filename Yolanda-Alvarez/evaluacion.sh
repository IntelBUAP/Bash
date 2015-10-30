#!/bin/bash

trap '' 2

while [ "${sep[0]}" != "salir" ]; do
    ppwd=`pwd`
    lugar=(${ppwd//// })
    tampwd=${#lugar[@]}
    echo -n '<super_sh ' ${lugar[$tampwd - 1]} '>& '    
    read comando
    sep=(${comando// / })
    if [ "${sep[0]}" == "mover" ]
    then
        cd ${sep[1]}
    elif [ "${sep[0]}" == "mostrar" ]
    then
	tmpa=${#sep[@]}
	param=${sep[@]:1:$tmpa}
	ls --color=tty $param
    elif [ "${sep[0]}" == "buscar" ]
    then
	tmpa=${#sep[@]}
	param=${sep[@]:1:$tmpa}
	find $param
    elif [ "${sep[0]}" == "ver" ]
    then
	tmpa=${#sep[@]}
	param=${sep[@]:1:$tmpa}
	more $param
    elif [ "${sep[0]}" == "comprimir" ]
    then
	tmpa=${#sep[@]}
	param=${sep[@]:2:$tmpa}
	if [ "${sep[1]}" == ".tar.bz" ]
	then
	    param=${sep[@]:3:$tmpa}
	    tar -c $param | bzip2 > ${sep[2]}
	elif [ "${sep[1]}" == ".tar.gz" ]
	then
	    tar -czfv $param
	elif [ "${sep[1]}" == ".zip" ]
	then
	    zip $param
	elif [ "${sep[1]}" == ".rar" ]
	then
	    rar -a $param
	fi
    elif [ "${sep[0]}" == "descomprimir" ]
    then
	tmpa=${#sep[@]}
	param=${sep[@]:2:$tmpa}
	if [ "${sep[1]}" == ".tar.bz2" ]
	then
	    bzip2 -dc $param | tar -xv
	elif [ "${sep[1]}" == ".tar.gz" ]
	then
	    tar -xzfv $param
	elif [ "${sep[1]}" == ".zip" ]
	then
	    unzip $param
	elif [ "${sep[1]}" == ".rar" ]
	then
	    unrar -x $param
	fi
    elif [ "${sep[0]}" == "ayuda" ]
    then
	tmpa=${#sep[@]}
	param=${sep[@]:1:$tmpa}
	if [ "${sep[1]}" == "mover" ]
	then
	    echo
	    echo mover [directorio]
	    echo Cambia el directorio de trabajo de shell
	    echo
	elif [ "${sep[1]}" == "mostrar" ]
	then
	    echo
	    echo mostrar [opciones]
	    echo Lista el contenido de los directorios
	    echo Opciones:
	    echo "-l     listado en forma larga o detallada."
	    echo "-a     todos los archivos, incluso los que comienzan con punto (.)"
	    echo
	elif [ "${sep[1]}" == "buscar" ]
	then
	    echo
	    echo buscar [ruta] [opciones] [adicional]
	    echo Busca el archivo o directorio especificado
	    echo Opciones:	    
	    echo -name   busca todos los archivos o directorios con el nombre en [adicional]
	    echo -size   busca todos los archivos del tamaño especificado en [adicional]
	    echo -user   busca todos los archivos y directorios del usuario en [adicional]
            echo -perm   busca todos los archivos con los permisos especificados en [adicional]
	    echo -mtime  busca todos los archivos por ultima modificacion en los dias en [adicional]
	    echo
	elif [ "${sep[1]}" == "ver" ]
	then
	    echo
	    echo ver [archivo]
	    echo Mustra el contenido del archivo en [archivo]
	    echo
	elif [ "${sep[1]}" == "comprimir" ]
	then
	    echo
	    echo comprimir [modo_compresion] [nombre] [ficheros] 
	    echo Comprime los [ficheros] con el [modo_compresion] seleccionado
	    echo y el [nombre] del archivo destino.
	    echo Modos de compresion permitidos:
	    echo .tar.bz2
	    echo .tar.gz
	    echo .zip
	    echo .rar
	    echo
	elif [ "${sep[1]}" == "descomprimir" ]
	then
	    echo
	    echo descomprimir [modo_compresion] [fichero] 
	    echo Descomprime el [fichero] con el [modo_compresion] seleccionado.
	    echo Modos de descompresion permitidos:
	    echo .tar.bz2
	    echo .tar.gz
	    echo .zip
	    echo .rar
	    echo
	else
	    echo
	    echo ayuda [comando]
	    echo Mustra la forma de usar el comando en [comando]
	    echo
	fi
    elif [ "${sep[0]}" == "salir" ]
    then
	echo
    else
	echo
	echo ${sep[0]} no es un comando.
	echo Los comandos son: mover, mostrar, buscar, ver, comprimir, 
	echo descomprimir, ayuda, salir.
	echo 
    fi
done

trap 2

#!/bin/bash
PATHAYUDA=`pwd`
clear
echo 'teclee "ayuda" para ver una explicacion de los comandos de Skynet Shell'
while true; do
	
	echo -n "$HOSTNAME -> " 
	read COMANDO PARAM1 PARAM2 PARAM3
	if [ $COMANDO = "buscar" ];
	then
		ER=""
		if [ -z "$PARAM1" ];
		then
			ER="SI"
			echo Falto especificar la direccion inicio de busqueda
		fi
		if [ -z "$PARAM2" ];
		then
			ER="SI"
			echo Falto el tipo de busqueda
		fi
		if [ -z "$PARAM3" ];
		then
			ER="SI"
			echo Falto el criterio de la busqueda
		fi



		if [ -n "$ER" ];
		then
			echo 'Utilice comando "ayuda" para ver mas detalles'
			continue
		fi


		if [ $PARAM2 = "permiso" ];
		then
			find $PARAM1 -perm $PARAM3
		else if [ $PARAM2 = "tamaño" ];
		then
			find $PARAM1 -size $PARAM3
		else if [ $PARAM2 = "usuario" ];
		then 
			find $PARAM1 -user $PARAM3
		else if [ $PARAM2 = "fecha" ];
		then 
			find $PARAM1 -mtime $PARAM3
		else if [ $PARAM2 = "nombre" ];
		then 
			find $PARAM1 -name $PARAM3
		fi
		fi
		fi
		fi
		fi
	
		
	else if [ $COMANDO = "salir" ];
	then
	    echo Saliendo interprete Skynet 1.0.0
		exit 0
	else if [ $COMANDO = "ayuda" ];
	then
		PATHAYUDA+="/help.txt"
		cat $PATHAYUDA
		echo ""
	else if [ $COMANDO = "contenido" ];
	then
		ls -color $PARAM1
	else if [ $COMANDO = "ver" ]; 
	then
		if [ -z "$PARAM1" ];
		then
			echo Falto el nombre de archivo
			echo 'Utilice comando "ayuda" para ver mas detalles'
			continue
		fi
		cat $PARAM1
		echo ""
	else if [ $COMANDO = "movera" ];
	then
	 	if [ -z "$PARAM1" ];
	 	then
	 		echo Falto el nombre de la carpeta o Path
	 		echo 'Utilice comando "ayuda" para ver mas detalles'
	 		continue
	 	fi
		cd $PARAM1
	else if [ $COMANDO = "compr" ];
	then
		ERW=""
		if [ -z "$PARAM1" ];
		then
			ERW="SI"
			echo Falto la carpeta o archivo a comprimir
		fi
		if [ -z "$PARAM2" ];
		then
			ERW="SI"
			echo Falto el nombre que se le dara al comprimido
		fi
		if [ -z "$PARAM3" ];
		then 
			ERW="SI"
			echo Falto el tipo de compresion
		fi


		if [ -n "$ERW" ];
		then
			echo 'Utilice comando "ayuda" para ver mas detalles'
			continue
		fi


		if [ $PARAM3 = "tar.gz" ];
		then
			PARAM2+=".tar.gz"
			tar -czvf $PARAM2 $PARAM1
		else if [ $PARAM3 = "tar.bz" ];
		then
			PARAM2+=".tar.bz2"
			tar -c $PARAM1 | bzip2 > $PARAM2
		else if [ $PARAM3 = "zip" ];
		then 
			PARAM2+=".zip"
			zip $PARAM2 $PARAM1
		else if [ $PARAM3 = "rar" ];
		then 
			PARAM2+=".rar"
			rar -a $PARAM2 $PARAM1
		fi
		fi
		fi
		fi
	else if [ $COMANDO = "dcompr" ];
	then
		ERC=""
		if [ -z "$PARAM1" ];
		then
			ERC="SI"
			echo Falto la carpeta o archivo a descomprimir
		fi
		if [ -z "$PARAM2" ];
		then
			ERC="SI"
			echo Falto el tipo
			continue
		fi


		if [ -n "$ERC" ];
		then
			echo 'Utilice comando "ayuda" para ver mas detalles'
			continue
		fi

		

		if [ $PARAM2 = "tar.gz" ];
		then
			PARAM1+=".tar.gz"
			tar -xzvf $PARAM1
		else if [ $PARAM2 = "tar.bz2" ];
		then
			PARAM1+=".tar.bz2"
			tar -jvxf $PARAM1
		else if [ $PARAM2 = "zip" ];
		then 
			PARAM1+=".zip"
			unzip $PARAM1
		else if [ $PARAM2 = "rar" ];
		then 
			PARAM1+=".rar"
			rar -x $PARAM1
		fi
		fi
		fi
		fi
		 
	fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi

	#echo $Bash 
done
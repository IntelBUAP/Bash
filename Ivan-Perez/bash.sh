#!/bin/bash
echo "Oprime listar para mostrar los comandos disponibles"
echo -n "-> "
read opcion
while [ "$opcion" != "Si" ]; do
 
 case $opcion in
    buscar)
        echo '1) Tamaño'
	echo '2) Nombre'
	echo '3) Usuario'
	echo '4) Permisos'
	echo '5) Fechas'
	echo -n 'Opcion Buscar -> '
	read buscar
	case $buscar in
		1)
		opc='-size'
		;;
		2)
		opc=''
		;;
		3)
		opc='-user'
		;;
		4)
		opc='-perm'
		;;
		5)
		opc= '-atime +'
		;;
		*)
		echo 'Opcion no valida'
		;;
	
	esac
	echo -n 'Buscar -> '
        read archivo
	for i in $( find $opc $archivo 2>/dev/null && echo "Archivo no encontrado");do
		echo $i
	done	
	;;
    compresion)
	echo '1)Comprimir'
	echo '2)Descomprimir' 
	echo -n 'Selecciona la opcion -> '
	read acto
	case $acto in
		1)
		echo '1)tar.gz'
		echo '2)tar.bz'
		echo '3)zip'
		echo '4)rar'
		echo -n 'Selecciona opcion -> '
		read opcion
		sig=0
		case $opcion in
			1)
			tipo='tar'
			opc='-czvf'
			ext='.tar.gz'
			;;
			2)
			tipo='tar'
			opc='-czvf'
			ext='.tar'
			sig='1'
			;;
			3)
			tipo='zip'
			opc=''
			ext='.zip'
			;;
			4)
			tipo='rar'
			opc=''
			ext='.rar'
			;;	
			*);;
		esac
		echo -n 'El archivo a comprimir -> '
		read archivo
		$tipo $opc $archivo$ext  $archivo 2>/dev/null || echo 'error en la compresion' 
		if [ $sig -eq 1 ]
			then bzip2 $archivo$ext 2>/dev/null || echo 'Error en el bzip2' 
		fi
		;;
		2)
		echo '1)tar.gz'
                echo '2)tar.bz'
                echo '3)zip'
                echo '4)rar'
                echo -n 'Selecciona opcion -> '
                read opcion
                sig=0
		case $opcion in
                        1)
                        tipo='tar'
                        opc='-xzvf'
                        
                        ;;
                        2)
                        tipo='tar'
                        opc='-jvxf'
                        sig=1
                        ;;
                        3)
                        tipo='unzip'
                        opc='-v'
                       
                        ;;
                        4)
                        tipo='rar'
                        opc=''
                        
                        ;;
                        *);;
                esac
                echo -n 'El archivo a descomprimir -> '
                read archivo
		$tipo $opc $archivo  2>/dev/null || echo 'Error al descomprimir'  
		;;
		*)
		;;
		
	esac
       ;; 
    mostrar)
        echo -n 'Mostrar -> '
	echo "lala"
	for i in $( ls --color); do
            echo  $i
        done	
	echo "lele"
        ;;
    mover)
	echo -n 'Mover ->'
	read mover
	cd $mover 2>/dev/null || echo "No existe el directorio "
	;;
    listar)
	echo "Listar"
	;;
    *)
        echo "Comando no valido"
	;;
 esac
 echo -n "-> "
 read opcion
 #realizar la opcion  
 
 #Preguntar si desea salir

done

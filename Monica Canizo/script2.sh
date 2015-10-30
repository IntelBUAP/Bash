#!/bin/sh
#prueba con while
accion="0"
diez="7"
clear

function todas()
{	case $comando in
		"1 || 2 || 3 || 4 || 5 || 6 || 7") 
			echo -e " "
		;;
		"buscar")	vim $texto1
		;;
		
		"compritar")	tar czvf $texto1 $texto2		#tar czvf archivo.tar.gz /directorio/*				
		;;
		"descotar")	tar xzvf $texto1	     		#tar xzvf archivo.tar.gz
		;;
		"vertar")	tar tzvf $texto1			#tar tzvf archivo.tar.gz
		;;
		"compritarb")	tar -c $texto2 | bzip2 &gt; $texto1	#tar -c /directorio/* | bzip2 &gt; archivo.tar.bz2
		;;
		"descotarb")	bzip2 -dc $texto1 | tar -xv		#bzip2 -dc archivo.tar.bz2 | tar -xv
		;;
		"vertarb")	bzip2 -dc $texto1 | tar -tv		#bzip2 -dc archivo.tar.bz2 | tar -tv
		;;
		"comprizip")	zip $texto1 $texto2			#zip archivo.zip /directorio/fichero
		;;
		"descozip")	unzip $texto1				#unzip archivo.zip
		;;
		"verzip")	unzip -v $texto1			#unzip -v archivo.zip
		;;
		"comprirar")	rar -a $texto1 $texto2			#rar -a archivo.rar /directorio/fichero
		;;
		"descorar")	rar -x $texto1				#rar -x archivo.rar
		;;
		"verrar")	rar -v $texto1				#rar -v archivo.rar
		;;	
		"listadir")
				ls --color
		;;
		"moversea")
				cd $texto1	
		;;
		"moverseantes")
				cd ..
		;;
		"muestraarch")
				cat $texto1
		;;
		"arbol")	
				tree
		;;
		"salir")
				echo -e "G R A C I A S"	
				exit	
		;;
		*)
        		echo -e "Error comando"
     		;;
  	esac	
}
while [ "$accion" != "$diez" ]; do
	echo -e "\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m"
	echo -e "\e[1;32m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m"
	echo -e "\e[1;36m**\e[0m	 		 \e[1;31mM E N U\e[0m                      \e[1;35m**\e[0m"
	echo -e "\e[1;31m**\e[0m Ingrese el numero de la accion que desea realizar: \e[1;33m**\e[0m"
	echo -e "\e[1;35m**\e[0m	    	1) Busqueda			      \e[1;33m**\e[0m"
	echo -e "\e[1;33m**\e[0m	    	2) Compresion/descompresion	      \e[1;37m**\e[0m"
	echo -e "\e[1;37m**\e[0m	    	3) Mostrar directorios	 	      \e[1;34m**\e[0m"
	echo -e "\e[1;37m**\e[0m	    	4) Mover		 	      \e[1;34m**\e[0m"
	echo -e "\e[1;36m**\e[0m	    	5) Mostrar contenido archivos  	      \e[1;31m**\e[0m"
	echo -e "\e[1;31m**\e[0m	    	6) Comandos	                      \e[1;35m**\e[0m"
	echo -e "\e[1;35m**\e[0m	    	7) Salir		              \e[1;33m**\e[0m"
	echo -e "\e[1;32m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m"
	echo -e "\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m\e[1;36m**\e[0m\e[1;31m**\e[0m\e[1;35m**\e[0m\e[1;33m**\e[0m\e[1;37m**\e[0m\e[1;34m**\e[0m\e[1;32m**\e[0m"
	read comando texto1 texto2
	todas $comando $texto1 $texto2
	case $comando in
     		"1")	clear		
			#Busqueda
			
			echo -e "Busqueda de un archivo"
		;;
     		"2")	clear
			#Compresion 
			echo -e "\e[1;33mCompresion EJEMPLOS:\e[0m"
			echo -e "TIPO DE ARCHIVOS .tar.gz – .tar.z – .tgz (tar con gzip)"
			echo -e "Empaquetar y comprimir:       \e[1;31compritar\e[0m archivo.tar.gz directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descotar\e[0m archivo.tar.gz"
			echo -e "Ver el contenido sin extraer: \e[1;31vertar\e[0m archivo.tar.gz"
			
			echo -e "TIPO DE ARCHIVOS .tar.bz2 (tar con bzip2)"
			echo -e "Empaquetar y comprimir:       \e[1;31compritarb\e[0m archivo.tar.bz2 directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descotarb\e[0m archivo.tar.bz2"
			echo -e "Ver el contenido sin extraer: \e[1;31vertarb\e[0m archivo.tar.bz2"
									
			echo -e "TIPO DE ARCHIVOS .zip (zip)"
			echo -e "Empaquetar y comprimir:       \e[1;31comprizip\e[0m archivo.zip directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descozip\e[0m archivo.zip"
			echo -e "Ver el contenido sin extraer: \e[1;31verzip\e[0m archivo.zip"
			
			echo -e "TIPO DE ARCHIVOS .rar (rar)"
			echo -e "Empaquetar y comprimir:       \e[1;31comprirar\e[0m archivo.rar directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descorar\e[0m archivo.rar"
			echo -e "Ver el contenido sin extraer: \e[1;31verrar\e[0m archivo.rar"
			
			read comando texto1 texto2
			todas $comando $texto1 $texto2
     		;;
		"3")	clear
			#MOSTRAR DIRECTORIO
			echo -e "Listar el contenido a colores"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31mlistadir\e[0m"
			read comando texto1 texto2
			todas $comando $texto1 $texto2
     		;;
		"4")	clear
			#MOVER
			echo -e "Moverse entre directorios"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31moversea\e[0m ruta"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31moverseantes\e[0m"
			read comando texto1 texto2
			todas $comando $texto1 $texto2			
     		;;
		"5")	clear
			#MOSTRAR CONTENIDO ARCHIVO
			echo -e "Muestra el contenido de un archivo"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31mmuestraarch\e[0m nombre"
			read comando texto1 texto2
			todas $comando $texto1 $texto2
		;;
		"6")	clear
			#COMANDOS
			clear		
			#Busqueda
			
			echo -e "Busqueda de un archivo"

			#Compresion 
			echo -e "\e[1;33mCompresion EJEMPLOS:\e[0m"
			echo -e "TIPO DE ARCHIVOS .tar.gz – .tar.z – .tgz (tar con gzip)"
			echo -e "Empaquetar y comprimir:       \e[1;31compritar\e[0m archivo.tar.gz directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descotar\e[0m archivo.tar.gz"
			echo -e "Ver el contenido sin extraer: \e[1;31vertar\e[0m archivo.tar.gz"
			
			echo -e "TIPO DE ARCHIVOS .tar.bz2 (tar con bzip2)"
			echo -e "Empaquetar y comprimir:       \e[1;31compritarb\e[0m archivo.tar.bz2 directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descotarb\e[0m archivo.tar.bz2"
			echo -e "Ver el contenido sin extraer: \e[1;31vertarb\e[0m archivo.tar.bz2"
									
			echo -e "TIPO DE ARCHIVOS .zip (zip)"
			echo -e "Empaquetar y comprimir:       \e[1;31comprizip\e[0m archivo.zip directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descozip\e[0m archivo.zip"
			echo -e "Ver el contenido sin extraer: \e[1;31verzip\e[0m archivo.zip"
			
			echo -e "TIPO DE ARCHIVOS .rar (rar)"
			echo -e "Empaquetar y comprimir:       \e[1;31comprirar\e[0m archivo.rar directorio"
			echo -e "Desempaquetar y descomprimir: \e[1;31descorar\e[0m archivo.rar"
			echo -e "Ver el contenido sin extraer: \e[1;31verrar\e[0m archivo.rar"
			
			#MOSTRAR DIRECTORIO
			echo -e "Listar el contenido a colores"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31mlistadir\e[0m"
			
			#MOVER
			echo -e "Moverse entre directorios"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31moversea\e[0m ruta"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31moverseantes\e[0m"
			
			#MOSTRAR CONTENIDO ARCHIVO
			echo -e "Muestra el contenido de un archivo"
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31mmuestraarch\e[0m nombre"
			
			#SALIR
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31msalir\e[0m"

			read comando texto1 texto2
			todas $comando $texto1 $texto2
						
		;;
		"7")	clear	
			#SALIR
			echo -e "\e[1;33mEJEMPLO:\e[0m	\e[1;31msalir\e[0m"
			read comando texto1 texto2
			todas $comando $texto1 $texto2
		;;		
		*)
        		echo -e "Numero desconocido"
     		;; 
  	esac
done

#!/bin/bash
clear

salir()
{
 exit
}

muestra()
{
  clear
  echo "ingresa el nombre de archivo o su ruta absoluta: "
  read archivo1
  cat $archivo1.*
  echo "Presiona una tecla para continuar..."
  read any1
}

comandinfo()
{
    clear
    echo "busqueda:  "
    echo "         1) Tamaño ejemplo:"
    echo "             Ingresa una ruta absoluta: /home/martin/bashM "
    echo "             ¿A partir de que tamaño deseas buscar?: 90"
    echo "         2) Nombre ejemplo:"	
    echo "             Ingresa una ruta absoluta: /home/martin/bashM"
    echo "             Ingresa el nombre de archivo junto con extension: examen.sh"
    echo "         3) Usuario ejemplo:"
    echo "              Ingresa una ruta absoluta: /home/martin/bashM"
    echo "              Ingresa nombre de usuario: martin"
    echo "         4) Permisos ejemplo:"
    echo "               Ingresa una ruta absoluta: /home/martin/bashM" 
    echo "               Ingresa el valor octal del permiso: 775"
    echo "         5) Fecha ejemplo:"
    echo "               Ingresa una ruta absoluta: /home/martin/bashM"
    echo "               Ingresa un numero entero de los ultimos dias a buscar: 3"
    echo "Compresion:"
    echo "         1)Compresion .tar.bz ejempo:"
    echo "               Ingresa el nombre de archivo con extension o ruta del directorio: examen.sh"
    echo "             o Ingresa el nombre de archivo con extension o ruta del directorio: /home/martin/bashM/examen.sh"
    echo "               Escriba el nombre de la compresion: paquete1"
    echo "         1)Compresion .tar.gz ejempo:"
    echo "               Ingresa el nombre de archivo con extension o ruta del directorio: examen.sh"
    echo "             o Ingresa el nombre de archivo con extension o ruta del directorio: /home/martin/bashM/examen.sh"
    echo "               Escriba el nombre de la compresion: paquete1"
    echo "         1)Compresion .zip ejempo:"
    echo "               Ingresa el nombre de archivo con extension o ruta del directorio: examen.sh"
    echo "             o Ingresa el nombre de archivo con extension o ruta del directorio: /home/martin/bashM/examen.sh"
    echo "               Escriba el nombre de la compresion: paquete1"
    echo "         1)Compresion .rar ejempo:"
    echo "               Ingresa el nombre de archivo con extension o ruta del directorio: examen.sh"
    echo "             o Ingresa el nombre de archivo con extension o ruta del directorio: /home/martin/bashM/examen.sh"
    echo "               Escriba el nombre de la compresion: paquete1"
    echo "Descompresion:"
    echo "         1)Descompresion .tar.bz ejempo:"
    echo "               Ingresa el nombre de archivo o ruta del directorio: paquete"
    echo "             o Ingresa el nombre de archivo o ruta del directorio: /home/martin/bashM/paquete"
    echo "         2)Descompresion .tar.gz ejempo:"
    echo "               Ingresa el nombre de archivo o ruta del directorio: paquete"
    echo "             o Ingresa el nombre de archivo o ruta del directorio: /home/martin/bashM/paquete"
    echo "         3)Descompresion .zip ejempo:"
    echo "               Ingresa el nombre de archivo o ruta del directorio: paquete"
    echo "             o Ingresa el nombre de archivo o ruta del directorio: /home/martin/bashM/paquete"
    echo "         4)Descompresion .rar ejempo:"
    echo "               Ingresa el nombre de archivo o ruta del directorio: paquete"
    echo "             o Ingresa el nombre de archivo o ruta del directorio: /home/martin/bashM/paquete"
    echo "Carpetas a colores:"
    echo "          Ejemplo:"
    echo "               Ingresa ruta: /home/martin/bashM"
    echo "Mover entre carpetas:"
    echo "          Ejemplo:"
    echo "               Ingresa a la ruta a la cual deseas cambiar: /home/martin"
    echo "MOstrar el contenido de un archivo:"
    echo "          Ejemplo:"
    echo "                Ingresa el nombre del archivo o su ruta absoluta: /home/martin/examen"
    echo "               o Ingresa el nombre del archivo o su ruta absoluta: examen"
}

mover()
{
    clear
    ruta=pwd
    echo "Esta es la ruta actual: `$ruta`"
    echo "Ingresa a la ruta a cual deseas cambiar: "
    read ruta2
    cd $ruta2
    clear
    ruta=pwd
    echo "Esta es la ruta actual: `$ruta`"
    echo "Presiona una tecla para continuar..."
    read any1
}

dircolor()
{
    clear
    echo "ingresa ruta: "
    read col
    cd $col
    ls --color=auto
    echo "Presiona una tecla para continuar..."
    read any1
}

descompresion()
{
    clear
    while :
    do
      submenu3
      read opc
      case $opc in
      1)
        clear
        echo "< descompresion--> .tar.bz  >"
        echo "Ingresa el nombre de archivo o ruta absoluta del directorio: "
        read decomar
        tar -xvf $decomar.tar.bz
        echo "presiona tecla para continuar.."
        read any1
      ;;
      2)
	clear
        echo "< descompresion--> .tar.gz  >"
        echo "Ingresa el nombre de archivo o ruta absoluta del directorio: "
        read decomar
        tar -xzvf $decomar.tar.gz
        echo "presiona tecla para continuar.."
        read any1
      ;;
      3)
	clear
        echo "< descompresion--> .zip  >"
        echo "Ingresa el nombre de archivo o ruta absoluta del directorio: "
        read decomar
        unzip $decomar.zip
        echo "presiona tecla para continuar.."
        read any1
      ;;
      4)
	clear
        echo "< descompresion--> .rar  >"
        echo "Ingresa el nombre de archivo o ruta absoluta del directorio: "
        read decomar
        rar x $decomar.rar
        echo "presiona tecla para continuar.."
        read any1
      ;;
      5)
	break 
      ;;
      *)
	echo "Opcion no validad"
	echo "presiona una tecla para continuar..."
	read any1
      ;;
      esac
    done
}
compresion()
{
    while :
    do
      submenu2
      read opc
      case $opc in
      1)
        clear
        echo "< compresion--> .tar.bz  >"
        echo "Ingresa el nombre de archivo con extension o ruta absoluta del directorio: "
        read comar
        echo "Escriba el nombre de la compresion: "
        read comname
	tar czfv $comname.tar.bz $comar
        ##echo "compresion lista!!"
        echo "presiona tecla para continuar.."
        read any1
      ;;
      2)
        clear
        echo "< compresion---> .tar.gz >"
        echo "Ingresa el nombre de archivo con extension o ruta absoluta del directorio: "
        read comar
        echo "Escriba el nombre de la compresion: "
	read comname 
	tar czfv $comname.tar.gz $comar
        ##echo "compresion lista!!"
        echo "presiona tecla para continuar..."
        read any1
      ;;
      3)
        clear
        echo "< compesion---> .zip >"
        echo "Ingresa el nombre del archivo con extension o ruta absoluta del directorio: "
        read comar
        echo "Escriba el nombre de la compresion: "
        read comname
        zip $comname.zip $comar
        echo "presiona tecla para continuar...."
        read any1
      ;;
      4)
	clear 
       	echo "< comresion---> .rar >"
      	echo "Ingresa el nombre del archivo con extension o ruta absoluta del directoro: "
 	read comar
	echo "Escriba el nombre de la compresion: "
        read comname
        rar a $comname.rar $comar
	echo "presiona tecla para continuar..."
        read any1
      ;;
      5)
 	break
      ;;
      *)
	clear 
	echo "opcion no valida"
	echo "presiona tecla para continuar..."
	read any1
      ;;
      esac      
    done ##while_submenu2
}

busqueda()
{
      read opc
      case $opc in
      1)
        clear
        echo "Tamaño"
        echo "Ingresa una ruta absoluta: "
	read path1
        echo "¿A partir de que tamaño deseas buscar?(bytes): "
        read vnu1 
        find $path1 -size +$vnu1 -print
        echo "presiona una tecla para continuar..."
        read any1
      ;;
      2)
        clear
        echo "nombre"
    	echo "Ingresa una ruta absoluta: "
        read path1
        echo "Ingresa el nombre de archivo junto con extension: "
        read archi
        find $path1 -name $archi -print
        echo "presiona una tecla para continuar..."
        read any1
      ;;
      3)
        clear
        echo "usuario"
        echo "Ingresa una ruta absoluta: "
        read path1
        echo "Ingresa nombre de usuario: "
        read usuariop
        find $path1 -user $usuariop -print
        echo "presiona una tecla para continuar..."
        read any1
      ;;
      4)
        clear
        echo "Permisos"
        echo "Ingresa una ruta absoluta: "
        read path1
        echo "Ingresa el valor octal del permiso: "
	read permi1
	find $path1 -perm -$permi1 -print
        echo "presiona una tecla"
        read any1
      ;;
      5)
        clear 
        echo "fecha" 
	echo "Ingresa una ruta absoluta: "
	read path1
	echo "Ingresa un numero entero de los ultimos dias a buscar: "
	read dia1
	find $path1 -mtime -$dia1 -print
        echo "presiona una tecla para continuar..."
        read any1
      ;;
      6)
        break
      ;;
      *)
        clear 
        echo "Opcion no valida"
        echo "presiona un tecla para continuar..."
        read any1
      ;;
      esac 
}
submenu3()
{
 clear 
 echo "<-------Descompresion--->"
 echo "    1)tar.bz"
 echo "    2)tar.gz"
 echo "    3)zip   "
 echo "    4)rar   "
 echo "    5)salir "
 echo
 echo -n "opcion: "
}

submenu2()
{
 clear
 echo "<-------Compresion------>"
 echo "   1)tar.bz"
 echo "   2)tar.gz"
 echo "   3)zip"
 echo "   4)rar"
 echo "   5)salir"
 echo
 echo -n "opcion: "
}

submenu1()
{
  clear
  echo "<----Busquedas------->"
  echo "   1)Tamaño" 
  echo "   2)Nombre"
  echo "   3)Usuario"
  echo "   4)Permisos"
  echo "   5)Fecha"
  echo "   6)Salir"
  echo
  echo -n "opcion: "
}

function mainMenu()
{
  clear
  echo "########################################################"
  echo "|1)Comando para busquedas por tamaño, nombre,usuario   |"
  echo "|    permisos y fecha				       |"
  echo "|2)Comando para compresion de archivos por medio de    |"
  echo "|         .tar.bz, tar.gz,zip,rar                      |"
  echo "|3)Comando para descompresion de archivos por medio de |"
  echo "|  .tar.bz,tar.gz,zip,rar                              |"
  echo "|4)Comando para mostrar archivos con carpetas a colores|"
  echo "|5)Comando que permite moverte entre carpetas          |"
  echo "|6)Comando que muestra el contenido de un archivo      |"
  echo "|7)Comando que muestra los comandos del script         |"
  echo "|8)Comando de salida                                   |"
  echo "|9)Salir de menu                                       |"
  echo "########################################################"
  echo 
  echo -n "opcion: "
}

##main``
opc=0
##while [ $opc -ne 8]
while :
do
  mainMenu
  read opc
  case $opc in
  1)
    clear
    while :
    do
      submenu1 
      busqueda
    done
  ;;
  2)
    clear
    compresion
  ;;##2)
  3)
    descompresion
  ;;##3)
  4)
    dircolor
  ;;##4)
  5)
    mover
  ;;##5)
  6)
   muestra
  ;;##6)
  7)
    comandinfo
    echo "presinoa una tecla para continuar..."
    read any1
  ;;##7)
  8)
    salir
  ;;
  9)
    echo "opcion 8"
    echo "Saliendo de aplicacion...."
    sleep 2
    break
  ;;##8)
  *)
    echo "opcion no valida"
    echo "Presiona una tecla para continuar..."
    read any1
  ;;##*)
  esac
done ##while main


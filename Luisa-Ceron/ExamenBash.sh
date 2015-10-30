#!/bin/bash

op="n"

while test $op != "Salir" 
do

  trap "salga con otra opcion" 2
  echo " "
  echo " Buscar archivo ----------------------> Buscar"
  echo " Comprimir y desconpromir archivos----> Compresion"
  echo " Mostrar carpetas a colores-----------> Mostrar"
  echo " Moverte entre carpetas---------------> Mover"
  echo " Contenido de un archivo--------------> Contenido "
  echo " Salir "
  echo " "
  echo Ingresa tu opcion
  read op

  if test $op = "Buscar"
  then
     Busca

  elif test $op = "Compresion"
  then
    opc=0
    echo "compresion y desconpresion "
    echo "1) Compresion"
    echo "2) Descompresion"
    echo "elige una opcion"
    read opc
    if test $opc = "1"
    then
      echo "Compresion de archivos"
      comprime
    elif test $opc = "2"
    then
      echo "Descompresion de archivos"
      descomprime
    else
      echo "Opcion no valida"
    fi
  elif test $op = "Mostrar"
  then
    echo "cambia color a carpetas"
    color

  elif test $op = "Mover"
  then
    echo "Moviendo entre carpetas"
    Mover

  elif test $op = "Contenido"
  then
    echo "Mostrar contenido"
    Contenido

  elif test $op = "Salir"
  then
           break
  else
    echo Opcion no valida
  fi
done


Busca()
{
  opcion="n"
  echo como desea buscar su archivo
  echo "tamanio"
  echo "nombre"
  echo "usuario"
  echo "permiso"
  echo "fecha"
  read opcion

  if test $opcion = "tamanio"
  then
    op=0
    echo "1)bytes"
    echo "2)Kilobytes"
    echo seleccione tamaño
    read op 
    echo Tamaño del archivo a buscar
    read Tam 
    if test $op = "1" 
    then
      echo `find /home -size $tam c`
    elif test $op = "2"
    then
      echo `find /home -size $tam k`
    else
      echo Opcion no valida
    fi

   elif test $opcion = "nombre"
   then
     echo Nombre del archivo a buscar
     read nombre 
     echo `find /home -name $nombre`

  elif test $opcion = "usuario"
  then
    echo Nombre del usuario
    read Usuario
    echo `find /home -user $Usuario`

  elif test $opcion = "permiso"
  then
    echo permisos
    read permisos
    echo `find /home -perm $permisos` 

  elif test $opcion = "fecha"
  then
    echo Proporcione fecha
    read fecha
    echo `find /home -mtime $fecha`

  else
    echo Opcion no valida
  fi
}


Contenido()
{
  echo nombre del archivo
  read arch
  echo `cat $arch`
}

Mover()
{
  dir=""
  direc="cd"
  echo Directorio actual antes de movernos
  echo `pwd`
  echo Directorio al cual movernos
  read dir
  direc="$direc $dir"
  $direc
  echo Directorio actual despues de movernos
  echo `pwd`
}
color()
{
  echo `ls --color=auto`
}

comprime()

  op=0
  num=0
  echo "1) .tar.bz"
  echo "2) .tar.gz"
  echo "3) .zip"
  echo "4) .rar"
  echo Elige una opcion
  read op
  echo Ingrese Archivo a comprimir
  read fichero
  echo Ingrese nombre del comprimido
  read compri
  if test $op = "1"
  then 
    compri="$compri.tar.bz"
    echo `tar czfv $compri $fichero`
  elif test $op = "2"
  then
    compri="$compri.tar.gz"
    echo `tar czfv $compri $fichero`
  elif test $op = "3"
  then
    compri="$compri.zip"
    echo `zip -r $compri $fichero`
  elif test $op = "4"
  then 
    echo "Ingrese el directorio"
    read direc
    compri="$compri.rar"
    echo `rar -a $compri $fichero`
  else
    echo "Opcion no valida"
  fi 
}

descomprime()
{
  op=0
  num=0
  echo "1) .tar.bz"
  echo "2) .tar.gz"
  echo "3) .zip"
  echo "4) .rar"
  echo Proporciona el numero de opcion que desee
  read op
  echo Ingrese nombre del archivo a descomprimir
  read descompri
  if test $op = "1"
  then 
    descompri="$descompri.tar.bz"
    echo `tar -xvf $descompri`
  elif test $op = "2"
  then
    descompri="$descompri.tar.gz"
    echo `tar -xzvf $descompri`
  elif test $op = "3"
  then
    descompri="$descompri.zip"
    echo `unzip -v $descompri`
  elif test $op = "4"
  then
    descompri="$descompri.rar"
    echo `unrar -x -v $descompri`
  else
    echo "Opcion no valida"
  fi  
}





#!/bin/bash

Busca()
{
  opcion=0
  echo Elige una opcion
  echo "1)Por tamaño"
  echo "2)Por nombre"
  echo "3)Por usuario"
  echo "4)Por permisos"
  echo "5)Por fechas"
  read opcion
  if test $opcion = "1"
  then
    op=0
    echo "1)bytes"
    echo "2)Kilobytes"
    echo seleccione unidad de medida para la busqueda
    read op 
    echo Tamaño del archivo a buscar
    read Tam 
    if test $op = "1" 
    then
      echo `find . -size $tamc`
    elif test $op = "2"
    then
      echo `find . -size $tamk`
    else
      echo Opcion no valida
    fi
  elif test $opcion = "2"
  then
    echo Nombre del archivo a buscar
    read nombre 
    echo `find . -name $nombre`
  elif test $opcion = "3"
  then
    echo Nombre del usuario
    read Usuario
    echo `find . -user $Usuario`
  elif test $opcion = "4"
  then
    echo permisos
    read permisos
    echo `find . -perm $permisos` 
  elif test $opcion = "5"
  then
    echo Ingrese fecha de ultima modificacion
    read fecha
    echo `find . -mtime $fecha`
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

Cambia()
{
  dir=""
  direc="cd"
  echo Directorio actual antes de movernos
  echo `pwd`
  echo Directorio al cual movernos
  read dir
  direc="$direc $dir/"
  $direc
  echo Directorio actual despues de movernos
  echo `pwd`
}
color()
{
  echo `ls --color=auto`
}

comprime()
{
  op=0
  num=0
  echo "1) .tar.bz"
  echo "2) .tar.gz"
  echo "3) .zip"
  echo "4) .rar"
  echo Elige una opcion
  read op
  echo Ingrese fichero a comprimir
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
  echo Elige una opcion
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

ctrl_c()
{
  echo "Cachando salida con ctrl c"
}
op="n"

while test $op != "Salir" 
do

  trap "ctrl_c" 2
  echo "******************"
  echo "*      Menu      *"
  echo "*     Buscar     *"
  echo "*   Compresion   *"
  echo "*    Colores     *"
  echo "*     Mover      *"
  echo "*   Contenido    *"
  echo "*     Salir      *"
  echo "******************"
  echo Ingresa tu opcion
  read op

  if test $op = "Buscar"
  then
    echo "Busqueda"
    Busca
  elif test $op = "Compresion"
  then
    opc=0
    echo "Compresion/Descompresion"
    echo "1) Compresion"
    echo "2) Descompresion"
    echo "elige una opcion"
    read opc
    if test $opc = "1"
    then
      echo "Compresion"
      comprime
    elif test $opc = "2"
    then
      echo "Descompresion"
      descomprime
    else
      echo "Opcion no valida"
    fi
  elif test $op = "Colores"
  then
    echo "Color"
    color
  elif test $op = "Mover"
  then
    echo "Moviendo"
    Cambia
  elif test $op = "Contenido"
  then
    echo "Contenido"
    Contenido
  elif test $op = "Salir"
  then
      echo Saliendo
      break
  else
    echo Opcion no valida
  fi
done

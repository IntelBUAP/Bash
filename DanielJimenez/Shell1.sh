#!/bin/bash
# This script provides wisdom
# You can now exit in a decent way.

Arg1=();

f_ls(){
    printf "%-32s %s\n" "Nombre de Archivo" "Tipo de Archivo"
    for i in *;
    do
      if [ -d $i ];			then
				echo -e "\e[1;34m$i\e[0m"
        printf "%-32s " "$i"
        if [ -d "$i" ]; then
           echo "Directorio"
        elif [ -h "$i" ]; then
            echo "Enlace Simbolico"
        elif [ -f "$i" ]; then
            echo "Archivo"
        else
        echo "Desconocido"
        fi
			else
        printf "%-32s " "$i"
        if [ -d "$i" ]; then
           echo "Directorio"
        elif [ -h "$i" ]; then
            echo "Enlace Simbolico"
        elif [ -f "$i" ]; then
            echo "Archivo"
        else
        echo "Desconocido"
        fi
      fi
      done
}

#   count=$(( $count + 1 ))

f_tk(){
 unset Arg1
 for L in $choice; do
   Arg1=("${Arg1[@]}" "$L")
 done
}

f_tree(){
    tree /run/media/intel/xz/Bash  #Renombrar segun ls pc
}

f_mvd(){
    mv ${Arg1[1]} ${Arg1[2]}
}

f_renombrarf(){
    mv ${Arg1[1]} ${Arg1[2]}
}

f_atributosSet(){
    case ${Arg1[2]} in   # L = lectura; E = escritura; X ejecucion

        'LEX')
            chmod u+rwx ${Arg1[1]}
        ;;
        '-EX')
            chmod u+rwx ${Arg1[1]}
            chmod u-r ${Arg1[1]}
        ;;
        'L-X')
            chmod u+rwx ${Arg1[1]}
            chmod u-w ${Arg1[1]}
        ;;
        'LE-')
            chmod u+rwx ${Arg1[1]}
            chmod u-x ${Arg1[1]}
        ;;
        '--X')
            chmod u+rwx ${Arg1[1]}
            chmod u-rw ${Arg1[1]}
        ;;
        'L--')
            chmod u+rwx ${Arg1[1]}
            chmod u-wx ${Arg1[1]}
        ;;
        '-E-')
            chmod u+rwx ${Arg1[1]}
            chmod u-rx ${Arg1[1]}
        ;;
        *)
            echo "Sentencia no válida"
            echo "Prueba con: atributosfs 'Nombre' 'Atributos'"
            echo "O preba:    'ayuda atributosfs'   para obtener ayuda"
        ;;

    esac

}

f_crearf(){
    > ${Arg1[1]}
}

f_borrarf(){
    rm ${Arg1[1]}
}

f_buscarf(){

  case ${Arg1[1]} in
      'Tamaño')
        find -size "${Arg1[2]}"
       			;;
      'Nombre')
        find -name "${Arg1[2]}"
      			 ;;
      'Usuario')
        find -user "${Arg1[2]}"
      			 ;;
    	'Permiso')
        find -type f -perm "${Arg1[2]}"
      			 ;;
    	'Fecha')
        find -mtime "${Arg1[2]}"
      			 ;;
    	 	*) echo 'Opcion no válida'
         		 ;;
    esac


}

f_atributosGet(){
  printf "%-27s %s\n" "Nombre de Archivo" "Atributos del Archivo"

    for i in *;
    do
        printf "\n%-22s %s" "$i"
        if [ -r "$i" ]; then
           printf "Lectura "

            if [ -w "$i" ]; then
                printf " Escritura "
                if [ -x "$i" ]; then
                printf " Ejecucion"
                fi;
            elif [ -x "$i" ]; then
                printf "           "
                printf " Ejecucion"
            fi;
        elif [ -w "$i" ]; then
            printf "        "
            printf " Escritura "
        elif [ -x "$i" ]; then
            printf "        "
            printf "           "
            printf " Ejecucion"
        fi;
    done
}

f_atributosG(){
  printf "%-27s %s\n" "Nombre de Archivo" "Atributos del Archivo"
   i=${Arg1[1]}

        printf "\n%-22s %s" "$i"
        if [ -r "$i" ]; then
           printf "Lectura "

            if [ -w "$i" ]; then
                printf " Escritura "
                if [ -x "$i" ]; then
                printf " Ejecucion"
                fi;
            elif [ -x "$i" ]; then
                printf "           "
                printf " Ejecucion"
            fi;
        elif [ -w "$i" ]; then
            printf "        "
            printf " Escritura "
        elif [ -x "$i" ]; then
            printf "        "
            printf "           "
            printf " Ejecucion"
        fi;

}

f_abrirf(){
    ${Arg1[1]}  #   Se debe indicar en el argumento el programa de edicion
}

f_leerf(){
    cat ${Arg1[1]}
}

f_escribirf(){
    ${Arg1[1]}
}

f_copiarf(){
    cp ${Arg1[1]} ${Arg1[2]}
}

f_mover(){
    mv ${Arg1[1]} ${Arg1[2]}
}

f_creard(){
    mkdir ${Arg1[1]}
}

f_borrard(){
    rm -R ${Arg1[1]}
}

f_abrird(){
    cd ${Arg1[1]}
}

f_cerrard(){
    cd ..
}

f_leerd(){
    cd ${Arg1[1]}
    f_ls
    cd ..

}

f_renombrard(){
    f_mover
}

f_comandos(){

    printf "\n%-32s %s" "Comando" "Descripcion"

    printf "\n %-22s %s"     'abrird Dir'     'Abrir direcotio'
    printf "\n %-22s %s"     'abrirf Dir'     'Abrir fichero'
    printf "\n %-22s %s"     'atributosfg' 'Consultar Atributos de Ficheros'
    printf "\n %-22s %s"     'atributosfs' 'Fijar Atributos a Fichero'
    printf "\n %-22s %s"     'atributosfu' 'Consultar Atributos de un Fichero'
    printf "\n %-22s %s"     'arbol'       'Mostrar estructura de directorios y ficheros'
    printf "\n %-22s %s"     'borrard Dir'     'Borrar directorio'
    printf "\n %-22s %s"     'borrarf Dir'     'Borrar Fichero'
    printf "\n %-22s %s"     'buscarf'     'Buscar dentro de Fichero'
    printf "\n %-22s %s"     'cerrard Dir'     'Cerrar Direcotiro'
    printf "\n %-22s %s"     'comandos'    'Mostrar Comandos disponibles'
    printf "\n %-22s %s"     'copiarf File'     'Copiar Fichero'
    printf "\n %-22s %s"     'creard Dir'      'Crear Direcotiro'
    printf "\n %-22s %s"     'crearf File'      'Crear Fichero'
    printf "\n %-22s %s"     'escribirf File'   'Escribir Fichero'
    printf "\n %-22s %s"     'mover S D'       'Mover Ficheros'
    printf "\n %-22s %s"     'leerd Dir'       'Leer / Listar Direcotiro'
    printf "\n %-22s %s"     'leerf File'       'Leer / Mostrar contenido de Fichero'
    printf "\n %-22s %s"     'limpiar'     'limpiar pantalla'
    printf "\n %-22s %s"     'listar'      'listar Ficheros y Direcotiros'
    printf "\n %-22s %s"     'renombrard S D'  'Renombrar Direcotiro'
    printf "\n %-22s %s"     'renombrarf S D'  'Renombrar Fichero'
    printf "\n %-22s %s"     'comprimir'  'comprime Fichero o directorio'
    printf "\n %-22s %s"     'descomprimir'  'descomprime Fichero o directorio'
    printf "\n %-22s %s"     'salir'       'Salir de ls Terminal'

}

f_comprimir(){
    if [ -d ${Arg1[1]} ];
      then
        printf "\n %-22s %s"     'Seleccione compresion'
        printf "\n %-22s %s"     '1. rar'
        printf "\n %-22s %s"     '2. zip'
        printf "\n %-22s %s"     '3. tar.bz'
        printf "\n %-22s %s"     '4. tar.gz'

        read choice

        f_tk choice

        case ${Arg1[1]} in
          1)
  				rar a $p1.rar $p1/*
  				;;
  				2)
  				zip -r $p1.zip $p1
  				;;
  				3)
  				tar -czvf $p1.tar.bz $p1
  				;;
  				4)
  				tar -czvf $p1.tar.gz $p1
  				;;
  			esac


    else
      printf "\n %-22s %s"     'El directorio o archivos no existe.'
    fi
}

f_descomprimir(){
  if [ -d ${Arg1[1]} ];
    then
      printf "\n %-22s %s"     'Seleccione tipo'
      printf "\n %-22s %s"     '1. rar'
      printf "\n %-22s %s"     '2. zip'
      printf "\n %-22s %s"     '3. tar.bz'
      printf "\n %-22s %s"     '4. tar.gz'

      read choice

      f_tk choice

      case ${Arg1[1]} in
        1)
        rar x ${Arg1[1]}
        ;;
        2)
        unzip ${Arg1[1]}
        ;;
        3)
        tar -xvf ${Arg1[1]}
        ;;
        4)
        tar -xzvf ${Arg1[1]}
        ;;

      esac
  else
    printf "\n %-22s %s"     'El directorio o archivos no existe.'
  fi
}


f_limpiar(){
    clear
    clear
}

while true; do
echo
echo -n "?& "

read choice

f_tk choice


case ${Arg1[0]} in

##  first set

    'renombrarf')
        f_renombrarf
        ;;

    'atributosfs')
        f_atributosSet
        ;;

    'crearf')
        f_crearf
        ;;

    'borrarf')
        f_borrarf
        ;;

##  second set


    'buscarf')
        echo "buscarf tipo argumentos"
        echo "tipo: Nombre, Tamaño, Usuario, Permiso, Fecha"
        f_buscarf
        ;;

    'atributosfg')
        f_atributosGet
        ;;

    'atributosfu')
        f_atributosG
        ;;

##  third set

    'abrirf')
        f_abrirf
        ;;

    'leerf')
        f_leerf
        ;;

    'escribirf')
        f_escribirf
        ;;

    'copiarf')
        f_copiarf
        ;;

##  moving files and directories into directory

    'mover')
        f_mover
        ;;

#   directory operations
#
    'creard')
        f_creard
        ;;

    'borrard')
        f_borrard
        ;;

    'abrird')
        f_abrird
        ;;

    'cerrard')
        f_cerrard
        ;;

    'leerd')
        f_leerd
        ;;

    'renombrard')
        f_renombrard
        ;;

#   Mostrar archivos

    'listar')
        f_ls
        ;;

    'arbol')
        f_tree
        ;;

    'comandos')
        f_comandos
        ;;

    'limpiar')
        f_limpiar
        ;;

    'comprimir')
        f_comprimir
        ;;

    'descomprimir')
        f_descomprimir
        ;;


    'salir')
        echo "OK, Adios!"
        break
        ;;
    *)
        echo "Comando No válido, intenta de nuevo o escribe \" Comandos\" "
        ;;
esac
done

#!/bin/bash

while :
do
    echo ""
    cat<<EOF
    ==============================
    Menu
    ------------------------------
    Selecciona una opcion:

    (1) Imprimir comandos y como ejecutarlos
    (2) Realizar busquedas por tamaño, nombre, usuario, permisos, fechas
    (3) Permitir realizar compresion de archivos por medio de .tar.bz, tar.gz, zip, rar
    (4) Permitir realizar decompresion de archivos por medio de .tar.bz, tar.gz, zip, rar
    (5) Mostrar archivos con las carpetas a colores
    (6) Permitir moverte entre carptetas (solo ruta absoluta ej. /home/{user}/...)
    (7) Mostrar el contenido de un archivo
    (8) Escribir salir

    ------------------------------
EOF
    read opcion

    # Imprimir comandos
    if [[ $opcion == '1' ]]; then
        echo ">dondeesta {parametros [-name 'nombre'] [-user <nombre>] [<directory> -size <+/-tamaño>] [-mtime -<dias>] [-perm <permisos>]}" 
        echo ">compresion {formato-de-compresion <tar, zip, etc>} {nombre-archivo-comprimir} {ruta-archivo-destino}"
        echo ">descompresion {formato-compresion<tar, zip, etc>} {nombre-archivo-comprimir} {ruta-archivo-destino}"
        echo ">listarcolor {ruta}"
        echo ">moverte {ruta}"
        echo ">mostrar {nombre-archivo}"
    fi

    # BUSQUEDA
    if [[ $opcion == '2' ]]; then
        echo "BUSQUEDA >dondeesta {parametros [-name 'nombre'] [-user <nombre>] [<directory> -size <+/-tamaño>] [-mtime -<dias>] [-perm <permisos>]}"
        read op
        a=( $op )

        if [[ ${a[0]} == 'dondeesta' ]]; then
                            
            t=0
            b=""
            for i in "${a[@]}" ; do
                if [ "$t" == 0 ]; then
                    ((t++))
                    continue
                fi
                b=$b" "$i
                ((t++))
            done
            echo $b
            find $b
        else
            e=$?
            echo "Sintaxis incorrecta."
            echo ""
        fi        
    fi

    # COMPRESION
    if [[ $opcion == '3' ]]; then
        echo "COMPRESION"
        echo ">compresion {formato-compresion<tar.bz, tar.gz, zip, rar>} {nombre-archivo} {ruta-abosoluta-directorio-a-comprimir}"
        read op
        a=( $op )

        if [[ -d ${a[3]} ]]; then
            if [ ${a[0]} == 'compresion' ] ; then
                if [ ${a[1]} == 'tar.bz' ] ; then
                    tar -jcvf ${a[2]}.tar.bz ${a[3]}
                    echo ""
                elif [ ${a[1]} == 'tar.gz' ] ; then
                    tar -zcvf ${a[2]}.tar.gz ${a[3]}
                    echo ""
                elif [ ${a[1]} == 'zip' ] ; then
                    zip -r ${a[2]}.zip ${a[3]}
                    echo ""
                elif [ ${a[1]} == 'rar' ] ; then
                    rar a ${a[2]}.rar ${a[3]}
                    echo ""
                else
                    echo "Sintaxis incorrecta."
                    echo ""
                fi
            else
               echo "Sintaxis incorrecta."
               echo ""
            fi
        else
            e=$?
            if [ "${e}" -eq "1" ]; then
               echo "Salida con codigo 1, la ruta no existe"
               echo ""
            elif [ "${e}" -gt "1" ]; then
               echo "Se retorno salida incorrecta codigo ${e}"
               echo ""
            fi
        fi        

    fi

    # DESCOMPRESION
    if [[ $opcion == '4' ]]; then
        echo "DESCOMPRESION"
        echo ">descompresion {formato-compresion<tar.bz, tar.gz, zip, rar>} {ruta-absoluta-archivo}"        
        read op
        a=( $op )

        if [[ -f ${a[2]} ]]; then
            if [ ${a[0]} == 'descompresion' ] ; then
                if [ ${a[1]} == 'tar.bz' ] ; then
                    tar -jxvf ${a[2]}
                    echo ""
                elif [ ${a[1]} == 'tar.gz' ] ; then
                    tar -zxvf ${a[2]}
                    echo ""
                elif [ ${a[1]} == 'zip' ] ; then
                    unzip ${a[2]}
                    echo ""
                elif [ ${a[1]} == 'rar' ] ; then
                    unrar x ${a[2]}
                    echo ""
                else
                    echo "Sintaxis incorrecta."
                    echo ""
                fi
            else
               echo "Sintaxis incorrecta."
               echo ""
            fi
        else
            e=$?
            if [ "${e}" -eq "1" ]; then
               echo "Salida con codigo 1, la ruta no existe"
               echo ""
            elif [ "${e}" -gt "1" ]; then
               echo "Se retorno salida incorrecta codigo ${e}"
               echo ""
            fi
        fi        

    fi

    # "CARPETA A COLOR"
    if [[ $opcion == '5' ]]; then
        echo "CARPETA A COLOR >listarcolor {ruta}"
        read op
        a=( $op )                

        if [[ -d ${a[1]} ]]; then
            if [[ ${a[0]} == 'listarcolor' ]]; then
                ls --color ${a[1]}
                echo ""
            else
               echo "Sintaxis incorrecta."
               echo ""
            fi
        else
            e=$?
            if [ "${e}" -eq "1" ]; then
               echo "Salida con codigo 1, la ruta no existe"
               echo ""
            elif [ "${e}" -gt "1" ]; then
               echo "Se retorno salida incorrecta codigo ${e}"
               echo ""
            fi
        fi        
    fi

    # "MOVERTE ENTRE CARPETAS"
    if [[ $opcion == '6' ]]; then
        echo "MOVERTE ENTRE CARPETAS >moverte {ruta}"
        read op
        a=( $op )
        
        if [ -d ${a[1]} ]; then
            if [[ ${a[0]} == 'moverte' ]]; then
                echo "Existe la ruta"
                echo ""
            else
                echo "Sintaxis incorrecta."
                echo ""
            fi
        else
            e=$?
            if [ "${e}" -eq "1" ]; then
               echo "Salida con codigo 1, la ruta no existe"
               echo ""
            elif [ "${e}" -gt "1" ]; then
               echo "Se retorno salida incorrecta codigo ${e}"
               echo ""
            fi
        fi        
    
    fi

    # "VER CONTENIDO DE UN ARCHIVO"
    if [[ $opcion == '7' ]]; then
        echo "CONTENIDO DE UN ARCHIVO >mostrar {nombre-archivo}"
        read op
        a=( $op )

        if [[ -f ${a[1]} ]]; then
            if [[ ${a[0]} == 'mostrar' ]]; then
                cat ${a[1]}
                echo ""
            else
               echo "Sintaxis incorrecta."
               echo ""
            fi
        else
            e=$?
            if [ "${e}" -eq "1" ]; then
               echo "Salida con codigo 1, el archivo o ruta no existe"
               echo ""
            elif [ "${e}" -gt "1" ]; then
               echo "Se retorno salida incorrecta codigo ${e}"
               echo ""
            fi
        fi        
    fi

    # exit
    if [[ $opcion == '8' ]]; then
        echo "SALIR >salir"
        read op
        a=( $op )
        if [[ ${a[0]} == 'salir' ]]; then
                echo "finalizado"
                break 
            else
               echo "Sintaxis incorrecta."
               echo ""
        fi
    else
        echo "comando invalido"
    fi

done
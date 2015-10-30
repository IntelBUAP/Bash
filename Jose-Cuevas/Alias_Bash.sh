#!/bin/bash

# Muestra el menu general
_menu()
{
    echo "*********Comandos Existentes*********"
    echo "lista"
    echo "camdir"
    echo "mostcont"
    echo "bscr"
    echo "ayuda"
    echo "salirme"
    echo "**************************************"
}
 
# Muestra la opcion seleccionada del menu
_mostrarResultado()
{
#    clear
    echo ""
    echo "------------------------------------"
    echo "Has seleccionado la opcion $opc"
    echo "------------------------------------"
    echo ""
}


# opcion por defecto

# bucle mientas la opcion indicada sea diferente de Irme (salir)
prompt=$(pwd)
	echo -e "\e[4;35m"
while [ "$opc" != "salir" ];
do
	read -p "$prompt->" opc p1 p2 p3 p4 p5 p6 p7 p8 p9 p10
    
    if [ "$opc" == "lista" ];
    then
		for n in *
		do
			if [ -d "$n" ];
			then
				echo -e "\e[4;35m"
			else
				echo $n
			fi
		done
    elif [ "$opc" == "camdir" ]
    then
		if [ -d $p1 ];
		then 
			cd $p1
			prompt=$(pwd)
		else
			echo "camdir: el directorio no existe"
		fi
	elif [ "$opc" == "mostcont" ]
	then 
		if [ -f $p1 ];
		then 
			cat $p1
		else
			echo "mostcont: el archivo no existe o no es regular"
		fi
	elif [ "$opc" == "bscr" ]
	then
			newcomm=$(echo $p1 $p2 $p3 $p4 $p5 $p6 | sed 's/nombre/name/g')
			newcomm=$(echo $newcomm | sed 's/permisos/perm/g')
			newcomm=$(echo $newcomm | sed 's/usuario/user/g')
			newcomm=$(echo $newcomm | sed 's/tamaño/size/g')
			newcomm=$(echo $newcomm | sed 's/ultimamod/mtime/g')
			find $newcomm
	elif [ "$opc" == "ayuda" ]
	then
		_menu
	elif [ "$opc" == "salirme" ]
	then
		exit		
	fi
done

























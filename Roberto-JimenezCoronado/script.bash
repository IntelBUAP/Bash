#!/bin/bash

trap salida_Inter INT
trap salida_Inter  SIGQUIT
trap salida_Inter SIGTSTP

function salida_Inter() {
	echo ""
        echo "Salida bloqueada"
	echo -n -e "\e[92mInstruccion ---> \e[0m"
}


while 	 true; do
	echo -n -e "\e[92mInstruccion ---> \e[0m"
	read instruccion
	IFS=' ' read -a array <<< "$instruccion"
	comando="${array[0]}"
	op="${array[1]}"
	case "$comando" in
		'busqueda')
			case $op in
				'-t')
					find -size "${array[2]}"
				;;
				'-n')
					find -name "${array[2]}"
				;;
				'-u')
					find -user "${array[2]}"
				;;
				'-p')
					find -perm "${array[2]}"
				;;
				'-f')
					find -mtime "${array[2]}"
				;;
				*)
					echo -e "\e[31mOpcion desconicida\e[0m"
				;;
			esac
		;;
		'compresion')
			case $op in
				'-c')
					case "${array[2]}" in 
					'targz')
						tar -czvf "${array[3]}".tar.gz "${array[3]}"
					;;
					'gzip')
						"${array[2]}" -9 "${array[3]}"
					;;
					'zip')
						"${array[2]}" "${array[3]}".zip "${array[3]}" 
					;;
					'rar')
						"${array[2]}" a "${array[3]}".rar "${array[3]}" 
					;;
					esac
				;;
				'-d')
					case "${array[2]}" in 
					'targz')
						"${array[2]}" -xzvf "${array[3]}"
					;;
					'gzip')
						"${array[2]}" -d "${array[3]}"
					;;
					'unzip')
						"${array[2]}" "${array[3]}"
					;;
					'unrar')
						"${array[2]}" x "${array[3]}"
					;;
					esac
				;;
				*)
					echo -e "\e[31mOpcion desconicida\e[0m"
				;;
			esac
		;;
		'mostrar')
			if [ "${#array[@]}" > 1 ]; then
				ls $op --color
			else
				ls --color
			fi
		;;
		'mover')
			cd $op
		;;
		'desplegar')
			cat $op
		;;
		'man')
			more man.txt
		;;
		'salir')
			break
		;;
		*)
			
			echo -e "\e[31mInstrucción desconocida\e[0m"
		;;
	esac
done

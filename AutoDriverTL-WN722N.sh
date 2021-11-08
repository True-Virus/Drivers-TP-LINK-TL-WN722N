#!/bin/bash

# Author: True Virus

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# ctrl_c
function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} SALIENDO...${endColour}"; sleep 3
	exit 0
}

# Main Functions
#-----------------------------------------------------------------------------------------------------------------
function dependencias {
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} INSTALANDO DEPENDENCIAS... ${endColour}"; sleep 2
	sudo apt update
	sudo apt install bc
	sudo rmmod r8188eu.ko
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} DEPENCIAS COMPLETAS ${endColour}"; sleep 3
}
#-----------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------
function carpeta {
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} DESCARGANDO ARCHIVOS NECESARIOS... ${endColour}"; sleep 2
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Tiene Una Carpeta Que se llama rtl8188eus? ${endColour}"
        echo -e "${yellowColour}[1]${endColour}${grayColour} Si ${endColour}"
        echo -e "${yellowColour}[2]${endColour}${grayColour} No ${endColour}"
        echo -n -e "${yellowColour}[*]${endColour} ${grayColour}Seleccione una opcion: ${endColour}"
        read seleccion
        if [ $seleccion = 1 ]; then
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} ELIMANDO CARPETA... ${endColour}"; sleep 2
                rm -r -v rtl8188eus
                clear
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} DESCARGANDO NUEVA CARPETA... ${endColour}"
                git clone https://github.com/aircrack-ng/rtl8188eus
        elif [ $seleccion = 2 ]; then
                git clone https://github.com/aircrack-ng/rtl8188eus
        else :
                echo -e "${redColour} Elije una opcion permitida ${endColour}"
        fi
}
#-----------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------
function install_drivers {
	echo -e  "\n${yellowColour}[*]${endColour}${grayColour} INSTALANDO DRIVERS... ${endColour}"; sleep 2
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} ESCRIBE : EXIT... ${endColour}"; sleep 1
	cd rtl8188eus
	sudo -i
	echo "blacklist r8188eu" > "/etc/modprobe.d/realtek.conf"; sleep 3
	sudo exit
	make
	make install
	modprobe 8188eu
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} DRIVERS INSTALADOS... ${endColour}"; sleep 1
}
#-----------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------
# Main Program

dependencias
clear
carpeta
clear
install_drivers


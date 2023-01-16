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
function Actualizacion {
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} PREPARANDO ALGUNAS COSAS... ${endColour}"; sleep 2
	sudo apt update
	sudo parrot-upgrade
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} COMPLETADO ${endColour}"; sleep 3
}
#-----------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------
function carpeta {
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} DESCARGANDO ARCHIVOS NECESARIOS... ${endColour}"; sleep 2
				sudo apt install bc
                git clone https://github.com/aircrack-ng/rtl8188eus
}
#-----------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------
function install_drivers {
	echo -e  "\n${yellowColour}[*]${endColour}${grayColour} INSTALANDO DRIVERS... ${endColour}"; sleep 2
	echo 'blacklist r8188eu'|sudo tee -a '/etc/modprobe.d/realtek.conf'; sleep 3
	cd rtl8188eus
	make && sudo make install
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} DRIVERS INSTALADOS... ${endColour}"; sleep 1
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} SOLO FALTA REINICIAR EL PC... ${endColour}"
}
#-----------------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------
# Main Program

Actualizacion
clear
Archivos
clear
install_drivers


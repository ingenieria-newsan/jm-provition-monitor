#! /bin/bash

# config
ping_server='educ.ar'
bios_ver='2.01.00.JM21'
find_provition=true
cicle_counter=0
cicle_time=5
cicle_alert=100
m_ok='\033[1;32m OK \033[0m'
m_nok='\033[1;31m NO \033[0m'

# directorio de trabajo
SCRIPT=$(readlink -f $0);
dir_base=`dirname $SCRIPT`;

# main
while $find_provition
do

	# banner
	clear
	printf "\n\033[1;32m"
	figlet -c -f big Juana Manso
	printf "\033[0m"
	printf "\t MONITOR DE APROVISIONAMIENTO | Espere por favor...\n\n"
	
	# conexión a internet
	if ping $ping_server -c 1 &> /dev/null;
		then
			printf "\t [${m_ok}]"
		else
			printf "\t [${m_nok}]"
	fi
	printf " Conexión con educ.ar.\n"

	#bios
	bs_out=$( sudo dmidecode -t bios -q | grep -c "$bios_ver" )
	if [ $bs_out -eq 1 ]
		then
			printf "\t [${m_ok}]"
		else
			printf "\t [${m_nok}]"
	fi
	printf " Versión de BIOS.\n"

	# procesos
	ps_out=$( ps aux | grep -c TheftDeterrent )
	if [ $ps_out -eq 8 ]
		then
			printf "\t [${m_ok}]"
		else
			printf "\t [${m_nok}]"
	fi
	printf " Procesos vinculados a TD+.\n"
	
	# aprovisionamiento
	ss_out=$( $dir_base/res/ssdoctor -s | grep -c Provisioned )
	if [ $ss_out -eq 1 ]
		then
			printf "\t [${m_ok}]"
			find_provition=false
		else
			printf "\t [${m_nok}]"
	fi
	printf " Aprovisionamiento.\n"

	# info de tiempo
	printf "\n\t (${cicle_counter}s)\n\n"
		
	# alerta
	if [ $cicle_counter -ge $cicle_alert ]
		then
			printf "\n\033[1;31m"
			figlet -c -f big ATENCION
			printf "\033[0m \t\t EL PROCESO ESTÁ DEMORANDO MAS DE LO ESPERADO"
	fi

	#pausa
	sleep ${cicle_time}
	cicle_counter=$((cicle_counter+cicle_time))

done

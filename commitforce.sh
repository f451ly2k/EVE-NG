#!/bin/bash 
#title          : commit.sh
#description    : This script will make commit all your chnage of in EVE-NG to setting up preconfigured source images of CISCO siwtchs,Routers , NOD, etc...
#author 	: f451ly2k 
#date           : 20200418
#version        : 0.1
#usage 		: chmod +x commit.sh && ./commit.sh
#notes          : Install nano to use this script,run this in EVE-NG Machine
#bash_version   : GNU bash, version 4.3.48(1)-release (x86_64-pc-linux-gnu)
#git		: https://github.com/f451ly2k/EVE-NG


# Source progress bar
progreSh() {
    LR='\033[1;31m'
    LG='\033[1;32m'
    LY='\033[1;33m'
    LC='\033[1;36m'
    LW='\033[1;37m'
    NC='\033[0m'
    if [ "${1}" = "0" ]; then TME=$(date +"%s"); fi
    SEC=`printf "%04d\n" $(($(date +"%s")-${TME}))`; SEC="$SEC sec"
    PRC=`printf "%.0f" ${1}`
    SHW=`printf "%3d\n" ${PRC}`
    LNE=`printf "%.0f" $((${PRC}/2))`
    LRR=`printf "%.0f" $((${PRC}/2-12))`; if [ ${LRR} -le 0 ]; then LRR=0; fi;
    LYY=`printf "%.0f" $((${PRC}/2-24))`; if [ ${LYY} -le 0 ]; then LYY=0; fi;
    LCC=`printf "%.0f" $((${PRC}/2-36))`; if [ ${LCC} -le 0 ]; then LCC=0; fi;
    LGG=`printf "%.0f" $((${PRC}/2-48))`; if [ ${LGG} -le 0 ]; then LGG=0; fi;
    LRR_=""
    LYY_=""
    LCC_=""
    LGG_=""
    for ((i=1;i<=13;i++))
    do
    	DOTS=""; for ((ii=${i};ii<13;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LRR_="${LRR_}#"; else LRR_="${LRR_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${DOTS}${LY}............${LC}............${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 1 ]; then sleep .01; fi
    done
    for ((i=14;i<=25;i++))
    do
    	DOTS=""; for ((ii=${i};ii<25;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LYY_="${LYY_}#"; else LYY_="${LYY_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${DOTS}${LC}............${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 14 ]; then sleep .01; fi
    done
    for ((i=26;i<=37;i++))
    do
    	DOTS=""; for ((ii=${i};ii<37;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LCC_="${LCC_}#"; else LCC_="${LCC_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${LC}${LCC_}${DOTS}${LG}............ ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 26 ]; then sleep .01; fi
    done
    for ((i=38;i<=49;i++))
    do
    	DOTS=""; for ((ii=${i};ii<49;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LGG_="${LGG_}#"; else LGG_="${LGG_}."; fi
    	echo -ne "  ${LW}${SEC}  ${LR}${LRR_}${LY}${LYY_}${LC}${LCC_}${LG}${LGG_}${DOTS} ${SHW}%${NC}\r"
    	if [ ${LNE} -ge 38 ]; then sleep .01; fi
    done
}

now=$(date)
qemu=/opt/unetlab/addons/qemu/

printf "EVE-NG Commit OS bash Shell Script %s\n"
printf "Author: f451ly2k %s\n"
printf "Date and Time:%s\n" "$now"
sleep 1
progreSh 0

#Collecting PID UID  NODID
read -p "Enter POD ID :" pod
sleep 1
progreSh 10
read -p "Enter LAB UID :" uid
sleep 1
progreSh  11
read -p "Enter NOD ID :" nodid
sleep 1
progreSh 12

#Entering to OS Path
path=/opt/unetlab/tmp/$pod/$uid/$nodid
#Debug enable  printing current directory
#cd "${path}"
#printf "Current working directory is:%s\n"
#pwd

printf "\nEntering to LAB %s\n" "$now"
sleep 1
progreSh 20
printf "Fetching filename %s\n" "$now"
sleep 1
progreSh 60
filename=$(ls -lh $path | grep qcow2 | awk {'print $9'})
printf "QCOW2 File name is:%s\n" "$filename"
sleep 1
progreSh 70
filesize=$(ls -lh $path | grep qcow2 | awk {'print $5'})
printf "QCOW2  file size is:%s\n" "$filesize"
sleep 1
progreSh 80
printf "\ncommiting image %s\n" "$now"
cd "${path}"
#qemu-img commit "$filename"
#IF THE ABOVE ONE NOT SUCCESS ENABLE BELOW
/opt/qemu/bin/qemu-img convert -c -O qcow2   $filename /tmp/$filename
printf "\nConvertion Completed to QCOW2 MANUALLY%s\n" "$now"
sleep 1
progreSh 90
filetmp=$(ls -lh /tmp/ | grep qcow2 | awk {'print $9'})
printf "converted QCOW2 file name is:%s\n" "$filetmp"
sleep 1
progreSh 95
filetmpsize=$(ls -lh /tmp/ | grep qcow2 | awk {'print $5'})
printf "converted QCOW2 file size is:%s\n" "$filetmpsize"
sleep 1
progreSh 96
qemupath=$(ls -lh $qemu | awk {'print $9'})
printf "\nReplace QCOW2 image to exact path, Please typo the directoryname which listed below: %s\n" "$qemupath"
sleep 1
progreSh 97
read -p "Enter the path of qemu image:"  qemuimage
cp /tmp/$filename $qemu/$qemuimage/
cd $qemu/$qemuimage/
ls -lh
sleep 1
progreSh 98
progreSh 100
exit

#!/usr/bin/env bash
#----- program list for be install in the run script-----------
PROGRAM_LIST=()

#-----function for auto generate list of tool contained in scripts_install dir ----
function get_tool_list()
{
	idx=0
	for tool_path in ./assets/scripts_install/*
	do
		tool_name="$(basename "$tool_path" | tr '.' '\n' | head -n 1)"
		PROGRAM_LIST=("${PROGRAM_LIST[@]}" "$tool_name")
		idx+=1

	done
}

#--------auto generate var prompt dict (only for bash v4.0.0 or high------------
declare -A PROMP_DICT
for i in "${PROGRAM_LIST[@]}"
do
	PROMP_DICT["$i"]="NA"
done

#--------auto generate var control dict (only for bash v4.0.0 or high----------
declare -A CTRL_DICT
for i in "${PROGRAM_LIST[@]}"
do
	CTRL_DICT["$i"]+="NA"
done
# function that handles command-not-found message.

# ---------user prompt message.------------
prompt()
{
	clear;
	echo 	'*********************************************************';
	echo	'*   My personal configurator v1.0  - for HOLBIES        *';
	echo 	'*                                                       *';
	echo  '*   Developed by:                                       *';
	echo 	'*                                                       *';
	echo -e	'*      \033[0;32mRonnie Barrios\033[0m  &  \033[0;32mJose Vallejo\033[0m (COLOMBIA)       *';
	echo 	'* ===================================================== *';
	echo -e	'* use it by your OWN RISK, tested: \033[1;35mUBUNTU: 14, 18, 20.\033[0m  *';
	echo 	'*                                                       *';
	echo -e	'* \033[1;35mGithub:\033[0m ronniebm          \033[1;35mE:\033[0m ronnie.coding@gmail.com  *';
	echo -e	'* \033[1;35mGithub:\033[0m josevallejo1984   \033[1;35mE:\033[0m josevallejo25@gmail.com  *';
	echo 	'* ----------------------------------------------------- *';
	echo 	'*                                                       *';
#echo 	'*  0. Automatic Installation                            *';
# ------ Autogenerate prompt -------------------------------------------------
	len=${#PROGRAM_LIST[@]}
	for ((i=0; i<"$len"; i++))
	do
		tool="${PROGRAM_LIST[i]}"
		tool_state="${PROMP_DICT["$tool"]}"
		echo -e "*  "$i"."$tool"\t.......................[ "$tool_state" ]    *";

	done

	echo '*                                                       *';
	echo '*********************************************************';
	echo '';
}

#--------- color settings for promp funtion --------------
color_settings()
{
	RED="\033[0;31m"; GREEN="\033[0;32m"; CYAN="\033[0;36m";
	YELLOW="\033[1;33m"; WHITE="\033[1;37m"; NC="\033[0m";
}

#------ installed programs checker.---------------------
function prog_validator()
{
	RED="\033[0;31m"
	GREEN="\033[0;32m"
	NC="\033[0m"
	len=${#PROGRAM_LIST[@]}

	for ((i=0; i<"$len"; i++))
	do
		tool="${PROGRAM_LIST[$i]}"
		tool_stat="${CTRL_DICT["$tool"]}"
		if [ "$tool_stat" != "SKIPPED" ]
		then
			if [ -e "$(which "$tool")" ];
			then
				CTRL_DICT["$tool"]="INSTALLED";
				PROMP_DICT["$tool"]="${GREEN}INSTALLED${NC}";
			else
				if [ -e "$HOME/.git-credentials" ] && [ "$tool" == "git_config" ]
				then
					CTRL_DICT["$tool"]="INSTALLED";
					PROMP_DICT["$tool"]="${GREEN}INSTALLED${NC}";
				else
					CTRL_DICT["$tool"]="NOT FOUND";
					PROMP_DICT["$tool"]="${RED}NOT FOUND${NC}";
				fi

			fi
		fi
	done
}

#------- checker if sudo is in pc else it install ------
function install_sudo()
{
	if [ -e "$(which "sudo")" ];
	then
		return;
	else
		apt install sudo;
	fi
}

#---- Funtion for handle install of all tool that user need ------
function install_tools()
{
	if [ "${CTRL_DICT["$1"]}" != "SKIPPED" ]
	then
		echo "The tool $1 is not Install, do you want install $1 ? (y/n)";
		read -r VAR_TOOL;
		if [ "$VAR_TOOL" == "y" ]
		then
			install_sudo
			echo "llamando para installar $tool"
			eval "$(cat assets/scripts_install/"$1.sh")"
			sleep 5


		elif [ "$VAR_TOOL" == "n" ]
		then
			echo "No llamando para installar $1"
			sleep 3;
			CTRL_DICT["$1"]="SKIPPED"
			PROMP_DICT["$1"]="${CYAN} SKIPPED ${NC}"

		fi
	fi
}

# -----------------------------------------
# main program of the script (entry point).
# -----------------------------------------
# ------ Autogenerate prompt -------------------------------------------------
get_tool_list
color_settings
prog_validator
prompt

len="${#PROGRAM_LIST[@]}"

for ((i=0; i<"$len"; i++))
do
	tool="${PROGRAM_LIST["$i"]}"
	tool_stat="${CTRL_DICT["$tool"]}"
	if [ "$tool_stat" == "NOT FOUND" ]
	then
		install_tools "$tool"
	fi
	echo "$(prog_validator; prompt)"
done
ENDING="n";
while [ "$ENDING" == "n" ];
do
	echo 	" Dear user, all the TOOLS are already installed.         ";
	echo 	"                                                         ";
	echo -e "   ${CYAN}*** IMPORTANT: Zsh program will require your ***${NC}     ";
	echo -e "   ${CYAN}*** authorization after this script ENDs. ***${NC}        ";
	echo 	"                                                         ";
	echo 	" Do you want to EXIT now ? --- (y/n)                     ";
	echo 	"*********************************************************";
	read -r ENDING
done

cls;
if [ -e "$PWD/ohmyzsh/tools/install.sh" ]
then
    sh "$PWD"/ohmyzsh/tools/install.sh;
fi

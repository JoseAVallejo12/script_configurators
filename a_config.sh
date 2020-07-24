#!/usr/bin/env bash
#----- program list for be install in the run script-----------
PROGRAM_LIST=(
	betty
	zsh
	git
	shellcheck
	valgrind
	mysql
	vim
	emacs
	caracoles
	ereslomeju
)
#--------auto generate var promp dict (only for bash v4.0.0 or high------------
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
command_not_found_handle()
{
return 127;
}

# user prompt message.
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
echo -e '*  1. betty (C code style validator) ..[ '"$BETTY_P"' ]    *';
echo -e '*  2. Zsh (Oh my Zsh shell) ...........[ '"$ZSH_P"' ]    *';
echo -e '*  3. git .............................[ '"$GIT_P"' ]    *';
echo -e '*  4. git credential helper ...........[ '"$GITCRED_P"' ]    *';
echo -e	'*  5. shellcheck validator ............[ '"$SHELLCHECK_P"' ]    *';
echo -e	'*  6. valgrind memory tester ..........[ '"$VALGRIND_P"' ]    *';
echo -e	'*  7. MYSQL database ..................[ '"$MYSQL_P"' ]    *';
echo -e	'*  8. VIM   [customized] ..............[ '"$VIM_P"' ]    *';
echo -e	'*  9. EMACS [customized] ..............[ '"$EMACS_P"' ]    *';
echo 	'*                                                       *';
echo 	'*********************************************************';
echo 	'';
}

# color settings
color_settings()
{
	RED="\033[0;31m"; GREEN="\033[0;32m"; CYAN="\033[0;36m";
	YELLOW="\033[1;33m"; WHITE="\033[1;37m"; NC="\033[0m";
}

skip_flags()
{
	BETTY_SKIP=0; ZSH_SKIP=0; GIT_SKIP=0; GITCRED_SKIP=0;
	SHELLCHECK_SKIP=0; VALGRIND_SKIP=0; MYSQL_SKIP=0;
	VIM_SKIP=0; EMACS_SKIP=0;
}

# installed programs checker.
prog_validator()
{
	FILE1=/$HOME/.git-credentials
	COUNTER=0;

	# -------------------------------
	CHECK=$(betty --version);
	if [ $BETTY_SKIP = 0 ];
	then
		if [ -e "$(which "betty")" ];
		then
			BETTY_STAT="INSTALLED";
			BETTY_P="${GREEN}INSTALLED${NC}";
		else
			BETTY_STAT="NOT FOUND";
			BETTY_P="${RED}NOT FOUND${NC}";
		fi
	fi
	# -------------------------------
	CHECK=$(zsh --version);
	if [ $ZSH_SKIP = 0 ];
	then
		if [ -e "$(which "zsh")" ];
		then
			ZSH_STAT="INSTALLED";
			ZSH_P="${GREEN}INSTALLED${NC}";
		else
			ZSH_STAT="NOT FOUND"
			ZSH_P="${RED}NOT FOUND${NC}"
		fi
	fi
	# -------------------------------
	CHECK=$(git --version);
	if [ $GIT_SKIP = 0 ];
	then
		if [ -e "$(which "git")" ];
		then
			GIT_STAT="INSTALLED"
			GIT_P="${GREEN}INSTALLED${NC}"
		else
			GIT_STAT="NOT FOUND"
			GIT_P="${RED}NOT FOUND${NC}"
		fi
	fi
	# ------------------------------
	if [ $GITCRED_SKIP = 0 ];
	then
		if test -f "$FILE1";
		then
			GITCRED_STAT="INSTALLED"
			GITCRED_P="${GREEN}INSTALLED${NC}"
		else
			GITCRED_STAT="NOT FOUND"
			GITCRED_P="${RED}NOT FOUND${NC}"
		fi
	fi
	# -------------------------------
	CHECK=$(shellcheck --version);
	if [ $SHELLCHECK_SKIP = 0 ];
	then
		if [ -e "$(which "shellcheck")" ];
		then
			SHELLCHECK_STAT="INSTALLED"
			SHELLCHECK_P="${GREEN}INSTALLED${NC}"
		else
			SHELLCHECK_STAT="NOT FOUND"
			SHELLCHECK_P="${RED}NOT FOUND${NC}"
		fi
	fi
	# -------------------------------
	CHECK=$(valgrind --version);
	if [ $VALGRIND_SKIP = 0 ];
	then
		if [ -e "$(which "valgrind")" ];
		then
			VALGRIND_STAT="INSTALLED"
			VALGRIND_P="${GREEN}INSTALLED${NC}"
		else
			VALGRIND_STAT="NOT FOUND"
			VALGRIND_P="${RED}NOT FOUND${NC}"
		fi
	fi
	# -------------------------------
	CHECK=$(mysql --version);
	if [ $MYSQL_SKIP = 0 ];
	then
		if [ -e "$(which "mysql")" ];
		then
			MYSQL_STAT="INSTALLED"
			MYSQL_P="${GREEN}INSTALLED${NC}"
		else
			MYSQL_STAT="NOT FOUND"
			MYSQL_P="${RED}NOT FOUND${NC}"
		fi
	fi
	# -------------------------------
	CHECK=$(vim --version);
	wait;
	if [ $VIM_SKIP = 0 ];
	then
		if [ -e "$(which "vim")" ];
		then
			VIM_STAT="INSTALLED"
			VIM_P="${GREEN}INSTALLED${NC}"
		else
			VIM_STAT="NOT FOUND"
			VIM_P="${RED}NOT FOUND${NC}"
		fi
	fi
	# -------------------------------
	CHECK=$(emacs --version);
	wait;
	if [ $EMACS_SKIP = 0 ];
	then
		if [ -e "$(which "emacs")" ];
		then
			EMACS_STAT="INSTALLED"
			EMACS_P="${GREEN}INSTALLED${NC}"
		else
			EMACS_STAT="NOT FOUND"
			EMACS_P="${RED}NOT FOUND${NC}"
		fi
	fi
}

# 0. SUDO Install.
install_sudo()
{
	if [ -e "$(which "sudo")" ];
	then
		return;
	else
		apt install sudo;
	fi
}

# 1. Betty "C" code style install proccess.
install_betty()
{
	if [ $BETTY_SKIP = 0 ];
	then
		echo '1. Install Betty "C" code style validator ? (y/n)';
		read -r VAR1_BETTY;
		if [ "$VAR1_BETTY" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			wait;
			git clone https://github.com/holbertonschool/Betty.git;
			wait;
			echo '*******************************************';
			echo 'preparing for installation proccess. wait !';
			echo '*******************************************';
			sleep 2;
			cd $PWD/Betty;
			source ./install.sh;
			sudo -y cp assets/scripts_config/betty /bin/;
			rm -rf $PWD/Betty;
		elif [ "$VAR1_BETTY" == "n" ];
		then
			BETTY_SKIP=1;
			BETTY_STAT="SKIPPED";
			BETTY_P="${CYAN} SKIPPED ${NC}";
		fi
	fi
}

# 2. Zsh Oh My ZSH shell.
install_zsh()
{
	if [ $ZSH_SKIP = 0 ];
	then
		echo '2. Install Zsh (Oh my Zsh shell) ? (y/n)';
		read -r VAR1_ZSH;
		if [ "$VAR1_ZSH" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			sudo apt-get install -y zsh;
			wait
			git clone https://github.com/ohmyzsh/ohmyzsh.git;
			chmod u+x $PWD/oh-my-zsh/tools/install.sh;
			clear;
			echo "**************************************";
			echo "  Zsh Shell successfully Installed... ";
			echo "**************************************";
			sleep 2;
		elif [ "$VAR1_ZSH" == "n" ];
		then
			ZSH_SKIP=1;
			ZSH_STAT="SKIPPED";
			ZSH_P="${CYAN} SKIPPED ${NC}"
		fi
	fi
}

# 3. git installation.
install_git()
{
	if [ $GIT_SKIP = 0 ];
	then
		echo '3. Install git ? (y/n)';
		read -r VAR1_GIT;
		if [ "$VAR1_GIT" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			sudo apt-get install -y git;
			wait;
			clear;
			echo "**************************************";
			echo "     git successfully Installed...    ";
			echo "**************************************";
			sleep 2;
		elif [ "$VAR1_GIT" == "n" ];
		then
			GIT_SKIP=1;
			GIT_STAT="SKIPPED";
			GIT_P="${CYAN} SKIPPED ${NC}"
		fi
	fi
}

# 4. git_credentials installation.
install_git_credentials()
{
	if [ $GITCRED_SKIP = 0 ];
	then
		echo '4. Install git credential helper ? (y/n)';
		read -r VAR1_GITCRED;
		if [ "$VAR1_GITCRED" == "y" ];
		then
			install_sudo;
			wait;
			echo "";
			echo -e "*Please write your github ${GREEN}USER NAME${NC} account:";
			read -r GIT_USER;
			echo "";
			echo -e "*Please write your github ${GREEN}PASSWORD${NC} account:";
			read -r GIT_PASSW;
			echo "";
			echo -e "*Please write your github ${GREEN}EMAIL${NC} account:";
			read -r GIT_EMAIL;
			#git config --global user.name $GIT_USER;
			#git config --global user.email $GIT_EMAIL;
			#git config --global push.default matching
			# ----------------------------------------------------------------
			echo "[user]" > $HOME/.gitconfig
			echo "     name = $GIT_USER" >> $HOME/.gitconfig
			echo "     email = $GIT_EMAIL" >> $HOME/.gitconfig
			echo "[push]" >> $HOME/.gitconfig
			echo "     default = matching" >> $HOME/.gitconfig
			echo "[credential]" >> $HOME/.gitconfig
			echo "     helper = store" >> $HOME/.gitconfig
			# ----------------------------------------------------------------
			echo "https://$GIT_USER:$GIT_PASSW@github.com" >> $HOME/.git-credentials
			return;

			clear;
			echo "**************************************";
			echo "   Github Credentials installing...   ";
			echo "**************************************";
			sleep 2;
		elif [ "$VAR1_GITCRED" == "n" ];
		then
			GITCRED_SKIP=1;
			GITCRED_STAT="SKIPPED";
			GITCRED_P="${CYAN} SKIPPED ${NC}"
		fi
	fi
}

# 5. shellcheck installation.
install_shellcheck()
{
	if [ $SHELLCHECK_SKIP = 0 ];
	then
		echo '5. Install shellcheck script validator ? (y/n)';
		read -r VAR1_SHELLCHECK;
		if [ "$VAR1_SHELLCHECK" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			sudo apt-get install -y shellcheck;
			wait;
			clear;
			echo "**************************************";
			echo "         shellcheck Installing...     ";
			echo "**************************************";
			sleep 2;
		elif [ "$VAR1_SHELLCHECK" == "n" ];
		then
			SHELLCHECK_SKIP=1;
			SHELLCHECK_STAT="SKIPPED";
			SHELLCHECK_P="${CYAN} SKIPPED ${NC}"
		fi
	fi
}

# 6. valgrind installation.
install_valgrind()
{
	if [ $VALGRIND_SKIP = 0 ];
	then
		echo '6. Install valgrind memory tester ? (y/n)';
		read -r VAR1_VALGRIND;
		if [ "$VAR1_VALGRIND" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			sudo apt-get install -y valgrind;
			wait;
			clear;
			echo "**************************************";
			echo "       Valgrind  Installing...        ";
			echo "**************************************";
			sleep 2;
		elif [ "$VAR1_VALGRIND" == "n" ];
		then
			VALGRIND_SKIP=1;
			VALGRIND_STAT="SKIPPED"
			VALGRIND_P="${CYAN} SKIPPED ${NC}"
		fi
	fi
}

# 7. MYSQL installation.
install_mysql()
{
	if [ $MYSQL_SKIP = 0 ];
	then
		echo '7. Install mysql ? (y/n)';
		read -r VAR1_MYSQL;
		if [ "$VAR1_MYSQL" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			sudo apt-get install -y mysql-server;
			wait;
			clear;
			echo "**************************************";
			echo "          MYSQL Installing...         ";
			echo "**************************************";
			sleep 2;
		elif [ "$VAR1_MYSQL" == "n" ];
		then
			MYSQL_SKIP=1;
			MYSQL_STAT="SKIPPED"
			MYSQL_P="${CYAN} SKIPPED ${NC}"
		fi
	fi
}

# 8. VIM installation.
install_vim()
{
	if [ $VIM_SKIP = 0 ];
	then
		echo '8. Install VIM [customized] ? (y/n)';
		read -r VAR1_VIM;
		if [ "$VAR1_VIM" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			sudo apt-get install -y vim;
			wait;
			git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
			wait;
			sudo rm "$HOME/.vimrc";
      sudo cp "assets/scripts_config/.vimrc" "$HOME/.vimrc";
			sudo vim +PluginInstall +qall;
			clear;
			echo "**************************************";
			echo "           VIM Installing...          ";
			echo "**************************************";
			sleep 2;
		elif [ "$VAR1_VIM" == "n" ];
		then
			VIM_SKIP=1;
			VIM_STAT="SKIPPED"
			VIM_P="${CYAN} SKIPPED ${NC}"
		fi
	fi
}

# 9. EMACS installation.
install_emacs()
{
	if [ $EMACS_SKIP = 0 ];
	then
		echo '9. Install EMACS [customized] ? (y/n)';
		read -r VAR1_EMACS;
		if [ "$VAR1_EMACS" == "y" ];
		then
			install_sudo;
			wait;
			sudo apt-get update -y;
			sudo apt-get install -y emacs;
			wait;
			sh $PWD/assets/scripts_config/emacs.sh;
			wait;
		fi
	fi
}

# -----------------------------------------
# main program of the script (entry point).
# -----------------------------------------
ENDING="n";
color_settings;
skip_flags;
prog_validator;

while [ $ENDING == "n" ];
do
	prompt;
	if [ "$BETTY_STAT" == "NOT FOUND" ];
	then
		install_betty;

	elif [ "$ZSH_STAT" == "NOT FOUND" ];
	then
		install_zsh;

	elif [ "$GIT_STAT" == "NOT FOUND" ];
	then
		install_git;

	elif [ "$GITCRED_STAT" == "NOT FOUND" ];
	then
		install_git_credentials;

	elif [ "$SHELLCHECK_STAT" == "NOT FOUND" ];
	then
		install_shellcheck;

	elif [ "$VALGRIND_STAT" == "NOT FOUND" ];
	then
		install_valgrind;

	elif [ "$MYSQL_STAT" == "NOT FOUND" ];
	then
		install_mysql;

	elif [ "$VIM_STAT" == "NOT FOUND" ];
	then
		install_vim;

	elif [ "$EMACS_STAT" == "NOT FOUND" ];
	then
		install_emacs;

	else
		echo 	" Dear user, all the TOOLS are already installed.         ";
		echo 	"                                                         ";
		echo -e "   ${CYAN}*** IMPORTANT: Zsh program will require your ***${NC}     ";
		echo -e "   ${CYAN}*** authorization after this script ENDs. ***${NC}        ";
		echo 	"                                                         ";
		echo 	" Do you want to EXIT now ? --- (y/n)                     ";
		echo 	"*********************************************************";
		read -r ENDING
	fi
	prog_validator;
done
cls;
if [ -f "$PWD/ohmyzsh/tools/install.sh" ]
then
    sh $PWD/ohmyzsh/tools/install.sh;
fi

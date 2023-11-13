# ! /bin/bash


alreadyInstalled()
    {
        echo -e "\n"
        echo "|_  _  _   _ | _ _  _  _|    |_  _  _  _   . _ _ _|_ _ || _  _|"
        echo "| |(_|_\  (_||| (/_(_|(_|\/  |_)(/_(/_| |  |_\| | | (_|||(/_(_|"
        echo "                         /                                     "

        read -n1 -p "PRESS ENTER TO CONTINUE..." keyb
    }

zshlogo()
{
    echo -e "\n"
    echo "▒███████▒  ██████  ██░ ██ "
    echo "▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒"
    echo "░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░"
    echo "  ▄▀▒   ░  ▒   ██▒░▓█ ░██ "
    echo "▒███████▒▒██████▒▒░▓█▒░██▓"
    echo "░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒"
    echo "░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░"
    echo "░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░"
    echo " ░ ░          ░   ░  ░  ░"
    echo "░"
}

tilixlogo()
{
    echo -e "\n"
    echo "▄▄▄█████▓ ██▓ ██▓     ██▓▒██   ██▒"
    echo "▓  ██▒ ▓▒▓██▒▓██▒    ▓██▒▒▒ █ █ ▒░"
    echo "▒ ▓██░ ▒░▒██▒▒██░    ▒██▒░░  █   ░"
    echo "░ ▓██▓ ░ ░██░▒██░    ░██░ ░ █ █ ▒ "
    echo "  ▒██▒ ░ ░██░░██████▒░██░▒██▒ ▒██▒"
    echo "  ▒ ░░   ░▓  ░ ▒░▓  ░░▓  ▒▒ ░ ░▓ ░"
    echo "    ░     ▒ ░░ ░ ▒  ░ ▒ ░░░   ░▒ ░"
    echo "  ░       ▒ ░  ░ ░    ▒ ░ ░    ░  "
    echo "          ░      ░  ░ ░   ░    ░ "
}

option=0

while :
do
  
    clear

    echo "▄▄▄█████▓▓█████ ███▄    █ ▒███████▒ ▒█████   ▒█████   ███▄    █▓█████" 
    echo "▓  ██▒ ▓▒▓█   ▀ ██ ▀█   █ ▒ ▒ ▒ ▄▀░▒██▒  ██▒▒██▒  ██▒ ██ ▀█   █▓█   ▀ "
    echo "▒ ▓██░ ▒░▒███  ▓██  ▀█ ██▒░ ▒ ▄▀▒░ ▒██░  ██▒▒██░  ██▒▓██  ▀█ ██▒███   "
    echo "░ ▓██▓ ░ ▒▓█  ▄▓██▒  ▐▌██▒  ▄▀▒   ░▒██   ██░▒██   ██░▓██▒  ▐▌██▒▓█  ▄ "
    echo "  ▒██▒ ░ ░▒████▒██░   ▓██░▒███████▒░ ████▓▒░░ ████▓▒░▒██░   ▓██░▒████▒"
    echo "  ▒ ░░   ░░ ▒░ ░ ▒░   ▒ ▒ ░▒▒ ▓░▒░▒░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░   ▒ ▒░░ ▒░ ░"
    echo "    ░     ░ ░  ░ ░░   ░ ▒░░░▒ ▒ ░ ▒  ░ ▒ ▒░   ░ ▒ ▒░ ░ ░░   ░ ▒░░ ░  ░"
    echo "  ░         ░     ░   ░ ░ ░ ░ ░ ░ ░░ ░ ░ ▒  ░ ░ ░ ▒     ░   ░ ░   ░   "
    echo "            ░  ░        ░   ░ ░        ░ ░      ░ ░           ░   ░  ░"
    echo "                          ░                                           v1.0"
    echo "1. Tilix"
    echo "2. Zsh"
    echo "2. make magic..."
    echo "8. exit"

    read -n1 -p "Enter an option [1-8]:" option

    

    case $option in
        1)
            tilixlogo
            verifyInstall=$(which tilix)
            if [ $? -eq 0 ]; then
                alreadyInstalled
            else
                read -sp $'\n Enter sudo password' password
                echo "$password" | sudo -S dnf update
                echo "$password" | sudo -S dnf install tilix
            fi
            ;;
        2)
            
            zshlogo
            verifyInstall=$(which zsh)
            if [ $? -eq 0 ]; then 
                alreadyInstalled
            else
                currentDirectory=pwd
                
                read -sp $'\n Enter sudo password' password 
                echo "$password" | sudo -S dnf update
                echo "$password" | sudo -S dnf install zsh
                
                read -p "Do you want to take dotfiles from my repo [y/n]: " yesno
                    case $yesno in
                        [Yy]*) 
                                
                                read -sp $'\n Enter sudo password' password 
                                echo "$password" | sudo -S sudo cp -r zsh/.oh-my-zsh zsh/.p10k.zsh zsh/.zshrc /home/

                             ;;
                        [Nn]*) 

                                echo -e "\n Making zsh by default"
                                chsh -s $(which zsh)

                                echo -e "\n Downloading OH-MY-ZSH"
                                sh-c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

                                echo -e "\n Downloading powerLevel10K"
                                git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

                                read -p "Do you want configure  powerLevel10K [y/n]: " yn
                                    case $yn in 
                                        [Yy]*) p10k configure ;;
                                        [Nn]*) echo "aborted"; return 1 ;;
                                    esac
                            ;;
                    esac

                
                
                
                
            fi
            sleep 3
            ;;

        8) 
            echo -e "\nThanks for use TenzoOne's Installer"
            exit 0
            ;;
        *)
            echo "Invalid choise"
            ;;
    esac
done
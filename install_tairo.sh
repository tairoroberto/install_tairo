#!/bin/bash
#-------------------------------------------------------------------------
#
# @FILESOURCE install_tairo.sh
# @AUTHOR Tairo Roberto Miguel de Assunção
# @DATE Qua 21 Out, 01:39 - 2015
# @VERSION 1.0.1
#
# Este script monta o Ambiente de desenvolvimento em distribuições linux
# Baseadas em Debian
#-------------------------------------------------------------------------


    mostrarMenuOpcoes(){
        clear
        echo "    #######################################################################################"
        echo "    #     Scrypt para instalação de ambiente de desenvolvimento PHP-ANDROID-C-JAVA        #"
        echo "    #                            - TAIRO ROBERTO M. ASSUNÇÃO -                            #"
        echo "    #                                                                                     #"
        echo "    #######################################################################################"
        echo -e "\n"
        echo "    #######################################################################################"
        echo "    #                            Digite a opção desejada                                  #"
        echo "    #-------------------------------------------------------------------------------------#"
        echo "    #  1 - Instalar 'Ambiente desenvolvimento'     PHP, Apache, Mysql, Java e etc.        #"
        echo "    #-------------------------------------------------------------------------------------#"
        echo "    #  2 - Remover  'Ambiente desenvolvimento'     PHP, Apache, Mysql, Java e etc.        #"
        echo "    #-------------------------------------------------------------------------------------#"
        echo "    #  0 - Mostra Menu de opções                                                          #"
        echo "    #-------------------------------------------------------------------------------------#"
        echo "    #  Obs: Digite a opção --help, para mostar menu de ajuda     ex:  --help              #"
        echo "    #######################################################################################"
        echo -e "\n"
        read opcao

        if [[ $opcao == "--help" || $opcao == "help" || $opcao == "ajuda" || $opcao == "h" ]]; then
            mostrarAjuda
        else
            case $opcao in
             0) mostrarMenuOpcoes  ;;
             1) instalarAmbienteDesenvolvimento "storm" "idea" "webstorm" ;;
             2) removerAmbienteDesenvolvimento "storm" "idea" "webstorm" ;;
            79) teste ;;
            esac
                clear
                echo "Opção inválida..."
                read res
                mostrarMenuOpcoes
        fi
    }

    #-------------------------------------------------------------------------
    # Captura usuario e senha
    #-------------------------------------------------------------------------
    capturaUsuario(){
        clear
        echo "    ########################### Insira seu usuario Linux ##################################"
        read usuario
    }

    capturaUsuarioSenha(){
        clear
        echo "    ########################### Insira a senha do usuario Linux ##################################"
        read usuarioSenha
    }

    capturarVersaoPhp(){
        clear
        echo "    ########################## Qual a versão do PHP deseja intalar? #######################"
        echo "    1 - PHP5.6"
        echo "    2 - PHP7.0"
        read phpVersion
    }

    capturarUsuarioFtp(){
        clear
        echo "    ########################## Digite o seu usuario do FTP  #######################"
        read userFtp
        clear
    }

    capturarSenhaFtp(){
        clear
        echo "    ########################## Digite o sua senha do FTP  #######################"
        read passwordFtp
        clear
    }

    # __BEGIN_METHODS__
    # Lista um diretorio
    #Recebe o caminho do diretorio como parametro
    listarDiretorio(){
        if [ ! -z $1  ]; then
            list=$(ls -h $1)
        else
            list=$(ls -h)
        fi

        clear
        echo "    ############################  INÍCIO ARQUIVOS E PASTAS  ###############################"
        echo "$list"
        echo "    ############################  FIM ARQUIVOS E PASTAS  ##################################"
    }

    # cria um diretorio
    #Recebe o caminho do diretorio comparametro
    criarDiretorio(){
        if [ ! -d "$1" ]; then
            echo "Criando diretório $1 ..."
            mkdir -p $1

            if [ $? -eq 0 ]; then
                echo "Diretório criado com sucesso !!!"
            fi
        else
            echo "Diretório $1 já existe!"
        fi
    }

    #Mostra o sistema e a plataforma da versão
    versaoLinux(){
        versao=$(uname && uname -i)
        echo $versao
    }


    # IDE de desenvolvimento Servidor Php, Apache Mysql#
    instalarAmbienteDesenvolvimento(){
        clear
        echo "    Será instalado o ambiente Php que contém:"
        echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug  memcache"
        echo "    Apache-2.4"
        echo "    Mysql"
        echo "    Postgresql"
        echo "    Subversion"
        echo "    Skype"
        echo "    Sublime-text-3"
        echo "    Dropbox"
        echo "    Eclipse"
        echo "    AcetoneIso programa para rodar isos"
        echo "    Steam"
        echo "    Gdebi Instalador de pacotes"
        echo "    Synaptic Gerenciador de dependencias"
        echo "    Klavaro treinamento de digitação"
        echo "    ubuntu-restricted-extras  pacotes extras com flash e codecs mp4"
        echo "    Rar descompactador"
        echo "    Filezilla cliente Ftp"
        echo "    Wine para rodar programas do windows"
        echo "    Gimp para edição de imagens"
        echo "    Inkscape para edição de imagens"
        echo "    Spotify cliente de audio"
        echo "    java 8"
        echo "    Android Studio IDE Android"
        echo "    Curl lib para uso com php"
        echo "    Playonlinux gerenciamento de plataforma wine"
        echo "    Git controle de versionamento"
        echo "    Virtualbox para rodar maquinas virtuais"
        echo "    Luckybackup gerenciador de backup"
        echo "    Freetds-commom php para conexão com banco de dados MSSQL"
        echo "    Composer intalador dependencias Php"
        echo "    laravel/installer instalador do Laravel 5"
        echo "    lumen/installer instalador Lumen"
        echo "    NodeJs"
        echo "    Sendmail"
        echo "    Unetbootin"
        echo "    alien"
        echo "    ntfs-config"
        echo "    ruby"
        echo "    Sublime"
        echo "    Dropbox"
        echo "    Eclipse"
        echo "    GoogleChrome"
        echo "    Para instalar a lib oci8.so certifique-se de que o Oracle Instant Client esteja instalado!"
        echo -e "\n"


        if [ ! $op == "s" ]; then
            mostrarMenuOpcoes
        fi

        echo "Deseja continuar? Sim[s], Não[n]"
        read op

        cd ~
        capturaUsuario
        capturarVersaoPhp
        capturarUsuarioFtp
        capturarSenhaFtp

        sudo apt-get update
        sudo apt-get install -y g++
        sudo apt-get install -y gcc
        sudo apt-get install -y make

        if [[ $phpVersion == 1 ]]; then
            instalarPHP56
        fi

        if [[ $phpVersion == 2 ]]; then
            instalarPHP7
        fi

        sudo apt-get install -y mysql-server
        sudo apt-get install -y phpmyadmin
        instalarJava
        instalarWine
        instalarSteam
        sudo apt-get install -y postgresql
        sudo apt-get install -y subversion
        sudo apt-get install -y memcached
        sudo apt-get install -y sendmail
        sudo apt-get install -y unetbootin
        criarDebZanthus
        instalarAndroidStudio

        #Instala os pacotes e programas

        #Intala o skype primeiro por que ele baixa varias libs 32bits que programas com Wine usam
        sudo apt-get -y install skype
        #Instala AcetoneIso programa para rodar isos
        sudo apt-get -y install acetoneiso
        #Plugin para abrir o terminal no diretório
        sudo apt-get -y install nautilus-open-terminal
        #Instala Gdebi Instalador de pacotes
        sudo apt-get -y install gdebi
        #Instala Gerenciador de dependencias
        sudo apt-get -y install synaptic
        #Instala treinamento de digitação
        sudo apt-get -y install klavaro
        #Instala pacotes extras com flash e codecs mp4
        sudo apt-get -y install ubuntu-restricted-extras
        #Instala descompactador
        sudo apt-get -y install rar
        #Instala cliente ftp
        sudo apt-get -y install filezilla
        #Instala gimp para edição de imagens
        sudo apt-get -y install gimp
        #Instala inkscape para edição de imagens
        sudo apt-get -y install inkscape
        #Instala cliente de audio do spotify
        instalarSpotify
        #Instala lib Curl para uso com php
        sudo apt-get -y install curl
        #Instala playonlinux gerenciaento de plataforma wine
        sudo apt-get -y install playonlinux
        #Instala controle de versionamento
        sudo apt-get -y install git-core
        instalarVirtualBox
        #Instala gerenciador de backup
        sudo apt-get -y install luckybackup
        #Instala  libs php para conexão com banco de dados MSSQL
        sudo apt-get -y install freetds-common
        #Atualiza os headers
        sudo apt-get update
        # reinicializa Apache
        sudo service apache2 restart
        #Da permição para a pasta do apache
        sudo chmod -R 777 /var/www

        #configura o git com meu email
        git config --global user.email "tairoroberto@hotmail.com"
        #configura o git com meu usuário
        git config --global user.name "tairoroberto"

        #Habilita o modrewrite do apache
        sudo a2enmod  rewrite
        #Instala o Composer
        instalarComposer

        #Adiciona o NodeJs ao bash para ser instalado
        sudo curl --silent --location https://deb.nodesource.com/setup_4.x |  bash -
        #Atualiza os headers
        sudo apt-get update
        #Instala o NodeJs
        sudo apt-get install --yes nodejs
        #Conversor de pacotes RPM
        sudo apt-get -y install alien
        #Configurador de discos Ntfs
        sudo apt-get -y install ntfs-config
        #Instala ruby
        sudo apt-get -y install ruby

        #verifica se é pra intalar PhpStorm
        if [[ $1 == "storm" ]]; then
            sudo instalarPhpStorm
        fi

        #verifica se é pra intalar IntelliJ-IDEA
        if [[ $2 == "idea" ]]; then
            sudo instalarIntelliJ
        fi

        #verifica se é pra intalar Clion
        if [[ $3 == "webstorm" ]]; then
            sudo instalarWebStorm
        fi

        #Instala Siblime-text 3 e Notepad++
        sudo instalarSublime

        #Instala Dropbox
        sudo instalarDropbox

        #Instala a IDE Eclipse Java EE
        sudo instalarEclipse

        #Instala O navegador GoogleChrome
        sudo instalarGoogleChrome

        #instala o banco oracle
        sudo instalarOracleDataBase11G

        #Instala sudo dictionary no terminal
        sudo curl https://raw.githubusercontent.com/badarsh2/Sudocabulary/master/script.sh | bash

        mostrarMenuOpcoes
    }

    removerAmbienteDesenvolvimento(){
        clear
        echo "    Será REMOVIDO Ambiente de desenvolvimento Php que contém:"
        echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug memcache"
        echo "    Apache-2.4"
        echo "    Mysql"
        echo "    Postgresql"
        echo "    Skype"
        echo "    Sublime-text-3"
        echo "    Dropbox"
        echo "    Eclipse"
        echo "    AcetoneIso programa para rodar isos"
        echo "    Steam"
        echo "    Gdebi Instalador de pacotes"
        echo "    Synaptic Gerenciador de dependencias"
        echo "    Klavaro treinamento de digitação"
        echo "    ubuntu-restricted-extras  pacotes extras com flash e codecs mp4"
        echo "    Rar descompactador"
        echo "    Filezilla cliente Ftp"
        echo "    Wine para rodar programas do windows"
        echo "    Gimp para edição de imagens"
        echo "    Inkscape para edição de imagens"
        echo "    Spotify cliente de audio"
        echo "    java 8"
        echo "    Android Studio IDE Android"
        echo "    Curl lib para uso com php"
        echo "    Playonlinux gerenciamento de plataforma wine"
        echo "    Git controle de versionamento"
        echo "    Virtualbox para rodar maquinas virtuais"
        echo "    Luckybackup gerenciador de backup"
        echo "    Freetds-commom php para conexão com banco de dados MSSQL"
        echo "    Composer intalador dependencias Php"
        echo "    laravel/installer instalador do Laravel 5"
        echo "    lumen/installer instalador Lumen"
        echo "    NodeJs"
        echo "    Alien"
        echo "    Ntfs-config"
        echo "    Sendmail"
        echo "    Unetbootin"
        echo "    ruby"
        echo "    Sublime"
        echo "    Dropbox"
        echo "    Eclipse"
        echo "    GoogleChrome"
        echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
        echo -e "\n"
        echo "    Deseja continuar? Sim[s], Não[n]"
        read op

        if [ ! $op == "s" ]; then
            mostrarMenuOpcoes
        fi

        capturaUsuario

        echo "    Excluindo pastas e arquivos..."

        sudo pecl  uninstall oci8
        sudo pecl  uninstall xdebug
        sudo pecl  uninstall dbase
        sudo apt-get -y purge php*
        sudo apt-get -y purge apache2
        sudo apt-get -y purge postgresql
        sudo apt-get -y purge mysql-server
        sudo apt-get -y purge subversion

        removerOracleInstantClient

        removerLibsZanthus

        #Desistala os pacotes e programas

        #Remove repositorio para php5-5.6
        sudo add-apt-repository  -r ppa:ondrej/php5-5.6
        sudo apt-get update

        sudo removerJava

        sudo removerAndroidStudio

        #Desistala sendmail
        sudo apt-get -y purge sendmail
        #Desistala AcetoneIso programa para rodar isos
        sudo apt-get -y purge acetoneiso
        #Plugin para abrir o terminal no diretório
        sudo apt-get -y purge nautilus-open-terminal
        removerSteam
        #Desistala Gdebi Instalador de pacotes
        sudo apt-get -y purge gdebi
        #Desistala Gerenciador de dependencias
        sudo apt-get -y purge synaptic
        #Desistala treinamento de digitação
        sudo apt-get -y purge klavaro
        #Desistala pacotes extras com flash e codecs mp4
        sudo apt-get -y purge ubuntu-restricted-extras
        #Desistala descompactador
        sudo apt-get -y purge rar
        #Desistala cliente ftp
        sudo apt-get -y purge filezilla
        #Desistala wine para rodar programas do windows
        sudo removerWine
        #Desistala gimp para edição de imagens
        sudo apt-get -y purge gimp
        #Desistala inkscape para edição de imagens
        sudo apt-get -y purge inkscape
        #Desistala lib Curl para uso com php
        sudo apt-get -y purge curl
        #Desistala playonlinux gerenciaento de plataforma wine
        sudo apt-get -y purge playonlinux
        #Desistala controle de versionamento
        sudo apt-get -y purge git-core
        sudo removerVirtualBox
        #Desistala gerenciador de backup
        sudo apt-get -y purge luckybackup
        #Desistala  libs php para conexão com banco de dados MSSQL
        sudo apt-get -y purge freetds-common
        #Desistala o Composer
        sudo removerComposer
        #Desistala o NodeJs
        sudo apt-get purge --yes nodejs
        #Desistala o skype por ultimo por que ele baixa varias libs 32bits que programas com Wine usam
        sudo apt-get -y purge skype
        #Desistala conversor de pacotes
        sudo apt-get -y purge alien
        #Desistala configurador de discos Ntfs
        sudo apt-get -y purge ntfs-config
        #Desistala Unetbootin
        sudo apt-get -y purge unetbootin
        #Desistala ruby
        sudo apt-get -y purge ruby

        #remove os pacotes não ultilizados
        sudo apt-get -y autoremove
        sudo apt-get clean

        #verifica se é pra remover PhpStorm
        if [[ $1 == "storm" ]]; then
            sudo removerPhpStorm
        fi

        #verifica se é pra remover IntelliJ-IDEA
        if [[ $2 == "idea" ]]; then
            sudo removerIntelliJ
        fi

        #verifica se é pra remover Clion
        if [[ $3 == "webstorm" ]]; then
            sudo removerWebStorm
        fi

        #Desistala Eclipse Java EE
        sudo removerEclipse

        #Desistala Dropbox
        sudo removerDropbox

        sudo removerLauchers $usuario

        echo "    Ambiente Servidor Ubuntu removido"

        mostrarMenuOpcoes
    }

    #Instala Eclipse Mars
    instalarEclipse(){

        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            sudo wget -c "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk.tar.gz&r=1" -O eclipse-jee-mars-1-linux-gtk.tar.gz
            sudo tar -zxvf eclipse-jee-mars-1-linux-gtk.tar.gz
            sudo mv eclipse /opt/eclipse
            sudo chmod +x /opt/eclipse/eclipse
            sudo chmod -R 777 /opt/eclipse

            #Cria arquivo executavel#
            sudo touch /usr/bin/eclipse
            sudo chmod 755 /usr/bin/eclipse
            sudo echo "#!/bin/sh" >> /usr/bin/eclipse
            sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/eclipse
            sudo echo "export ECLIPSE_HOME=/opt/eclipse" >> /usr/bin/eclipse
            sudo echo "\$ECLIPSE_HOME/eclipse $*" >> /usr/bin/eclipse
            sudo ln -s /usr/bin/eclipse /bin/eclipse

            #Cria icone do desktop#
            sudo touch /usr/share/applications/eclipse.desktop
            sudo echo "[Desktop Entry]" >> /usr/share/applications/eclipse.desktop
            sudo echo "Encoding=UTF-8" >> /usr/share/applications/eclipse.desktop
            sudo echo "Name=Eclipse" >> /usr/share/applications/eclipse.desktop
            sudo echo "Comment=Eclipse IDE" >> /usr/share/applications/eclipse.desktop
            sudo echo "Exec=eclipse" >> /usr/share/applications/eclipse.desktop
            sudo echo "Icon=/opt/eclipse/icon.xpm" >> /usr/share/applications/eclipse.desktop
            sudo echo "Terminal=false" >> /usr/share/applications/eclipse.desktop
            sudo echo "Type=Application" >> /usr/share/applications/eclipse.desktop
            sudo echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/eclipse.desktop
            sudo echo "StartupNotify=true" >> /usr/share/applications/eclipse.desktop

            sudo rm -r eclipse-jee-mars-1-linux-gtk.tar.gz

        else
            sudo wget -c "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz&r=1" -O eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
            sudo tar -zxvf eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
            sudo mv eclipse /opt/eclipse
            sudo chmod +x /opt/eclipse/eclipse
            sudo chmod -R 777 /opt/eclipse

            #Cria arquivo executavel#
            sudo touch /usr/bin/eclipse
            sudo chmod 755 /usr/bin/eclipse
            echo "#!/bin/sh" >> /usr/bin/eclipse
            sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/eclipse
            sudo echo "export ECLIPSE_HOME=/opt/eclipse" >> /usr/bin/eclipse
            sudo echo "\$ECLIPSE_HOME/eclipse $*" >> /usr/bin/eclipse
            sudo ln -s /usr/bin/eclipse /bin/eclipse

            #Cria icone do desktop#
            sudo touch /usr/share/applications/eclipse.desktop
            sudo echo "[Desktop Entry]" >> /usr/share/applications/eclipse.desktop
            sudo echo "Encoding=UTF-8" >> /usr/share/applications/eclipse.desktop
            sudo echo "Name=Eclipse" >> /usr/share/applications/eclipse.desktop
            sudo echo "Comment=Eclipse IDE" >> /usr/share/applications/eclipse.desktop
            sudo echo "Exec=eclipse" >> /usr/share/applications/eclipse.desktop
            sudo echo "Icon=/opt/eclipse/icon.xpm" >> /usr/share/applications/eclipse.desktop
            sudo echo "Terminal=false" >> /usr/share/applications/eclipse.desktop
            sudo echo "Type=Application" >> /usr/share/applications/eclipse.desktop
            sudo echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/eclipse.desktop
            sudo echo "StartupNotify=true" >> /usr/share/applications/eclipse.desktop

            sudo rm -r eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove IDE Eclipse
    removerEclipse(){
        sudo rm -r /usr/bin/eclipse
        sudo rm -r /bin/eclipse
        sudo rm -r /opt/eclipse
        sudo rm -r /usr/share/applications/eclipse.desktop

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala Google chrome
    instalarGoogleChrome(){
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            cd ~
            sudo wget -c "https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb"
            sudo dpkg -i google-chrome-stable_current_i386.deb
            sudo apt-get -y install libappindicator1
            sudo apt-get -f install
            sudo dpkg -i google-chrome-stable_current_i386.deb
            sudo rm -r google-chrome-stable_current_i386.deb
        else
            cd ~
            sudo wget -c "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
            sudo dpkg -i google-chrome-stable_current_amd64.deb
            sudo apt-get -y install libappindicator1
            sudo apt-get -f install
            sudo dpkg -i google-chrome-stable_current_amd64.deb
            sudo rm -r google-chrome-stable_current_amd64.deb
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove o navegador Google Chrome
    removerGoogleChrome(){
        sudo apt-get -y purge google-chrome-stable

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala o Editor de texto Sublime-Text 3 e o Notepad++
    instalarSublime(){
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            sudo wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_i386.deb
            sudo dpkg -i sublime-text_build-3083_i386.deb
            sudo rm -r sublime-text_build-3083_i386.deb

        else
            sudo wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
            sudo dpkg -i sublime-text_build-3083_amd64.deb
            sudo rm -r sublime-text_build-3083_amd64.deb
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    intalarNotePad(){
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            sudo wget -c "https://notepad-plus-plus.org/repository/6.x/6.8.6/npp.6.8.6.Installer.exe"
            sudo wine npp.6.8.6.Installer.exe
            sudo rm -r npp.6.8.6.Installer.exe
        else
            sudo wget -c "https://notepad-plus-plus.org/repository/6.x/6.8.6/npp.6.8.6.Installer.exe"
            sudo wine npp.6.8.6.Installer.exe
            sudo rm -r npp.6.8.6.Installer.exe
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }



    instalarDropbox(){
        #Instala Dropbox
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            sudo wget -c "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_i386.deb" -O dropbox.deb
            sudo dpkg -i dropbox.deb
            sudo rm -r dropbox.deb

        else
            sudo wget -c "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb" -O dropbox.deb
            sudo dpkg -i dropbox.deb
            sudo rm -r dropbox.deb
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    removerDropbox(){
        #Desistala Dropbox
        sudo apt-get -y purge dropbox

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    # IDE de desenvolvimento PHP #
    instalarPhpStorm(){
        clear
        cd ~
        sudo wget -c https://download.jetbrains.com/webide/PhpStorm-2016.1.2.tar.gz
        sudo tar -zxvf PhpStorm-2016.1.2.tar.gz
        sudo rm -f PhpStorm-2016.1.2.tar.gz

        sudo mv PhpStorm-* /opt/PhpStorm
        sudo chmod +x /opt/PhpStorm/bin/phpstorm.sh
        sudo chmod -R 777 /opt/PhpStorm

        #Cria arquivo executavel#
        sudo touch /usr/bin/phpstorm
        sudo chmod 755 /usr/bin/phpstorm
        sudo echo "#!/bin/sh" >> /usr/bin/phpstorm
        sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/phpstorm
        sudo echo "export PHPSTORM_HOME=/opt/PhpStorm" >> /usr/bin/phpstorm
        sudo echo "\"\$PHPSTORM_HOME/bin/phpstorm.sh\" %f" >> /usr/bin/phpstorm
        sudo ln -s /usr/bin/phpstorm /bin/phpstorm

        #Cria icone do desktop#
        sudo touch /usr/share/applications/phpstorm.desktop
        sudo echo "[Desktop Entry]" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Encoding=UTF-8" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Name=PhpStorm" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Comment=PhpStorm IDE" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Exec=phpstorm" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Icon=/opt/PhpStorm/bin/webide.png" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Terminal=false" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Type=Application" >> /usr/share/applications/phpstorm.desktop
        sudo echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/phpstorm.desktop
        sudo echo "StartupNotify=true" >> /usr/share/applications/phpstorm.desktop

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }



    removerPhpStorm(){
        clear
        echo "    Será removido a IDE de desenvolvimento PhpStorm-10"
        echo "    Deseja continuar? Sim[s], Não[n]"
        read op

        if [ ! $op == "s" ]; then
            mostrarMenuOpcoes
        fi

        sudo rm -r /usr/bin/phpstorm
        sudo rm -r /bin/phpstorm
        sudo rm -r /usr/share/applications/phpstorm.desktop
        sudo rm -r /opt/PhpStorm

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    # IDE de desenvolvimento JAVA #
    instalarIntelliJ(){
        cd ~
        sudo wget -c https://download.jetbrains.com/idea/ideaIU-2016.1.3.tar.gz
        sudo tar -zxvf ideaIU-2016.1.3.tar.gz
        sudo rm -f ideaIU-2016.1.3.tar.gz

        sudo mv idea-IU-* /opt/IntelliJ-IDEA
        sudo chmod +x /opt/IntelliJ-IDEA/bin/idea.sh
        sudo chmod -R 777 /opt/IntelliJ-IDEA

        #Cria arquivo executavel#
        sudo touch /usr/bin/idea
        sudo sudo chmod 755 /usr/bin/idea
        sudo echo "#!/bin/sh" >> /usr/bin/idea
        sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/idea
        sudo echo "export IntelliJ_HOME=/opt/IntelliJ-IDEA" >> /usr/bin/idea
        sudo echo "\"\$IntelliJ_HOME/bin/idea.sh\" %f" >> /usr/bin/idea
        sudo ln -s /usr/bin/idea /bin/idea

        #Cria icone do desktop#
        sudo touch /usr/share/applications/idea.desktop
        sudo echo "[Desktop Entry]" >> /usr/share/applications/idea.desktop
        sudo echo "Encoding=UTF-8" >> /usr/share/applications/idea.desktop
        sudo echo "Name=IntelliJ-IDEA" >> /usr/share/applications/idea.desktop
        sudo echo "Comment=IntelliJ-IDEA IDE" >> /usr/share/applications/idea.desktop
        sudo echo "Exec=idea" >> /usr/share/applications/idea.desktop
        sudo echo "Icon=/opt/IntelliJ-IDEA/bin/idea.png" >> /usr/share/applications/idea.desktop
        sudo echo "Terminal=false" >> /usr/share/applications/idea.desktop
        sudo echo "Type=Application" >> /usr/share/applications/idea.desktop
        sudo echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/idea.desktop
        sudo echo "StartupNotify=true" >> /usr/share/applications/idea.desktop

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    removerIntelliJ(){
        clear
        echo "    Será removido a IDE de desenvolvimento Intellij-IDEA"
        echo "    Deseja continuar? Sim[s], Não[n]"
        read op

        if [ ! $op == "s" ]; then
            mostrarMenuOpcoes
        fi
        sudo rm -r /usr/bin/idea
        sudo rm -r /bin/idea
        sudo rm -r /opt/IntelliJ-IDEA
        sudo rm -r /usr/share/applications/idea.desktop

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    # IDE de desenvolvimento JavaScript #
    instalarWebStorm(){
        clear
        cd ~
        sudo wget -c https://download.jetbrains.com/webstorm/WebStorm-2016.1.3.tar.gz
        sudo tar -zxvf WebStorm-2016.1.3.tar.gz
        sudo rm -f WebStorm-2016.1.3.tar.gz

        sudo mv WebStorm-* /opt/WebStorm
        sudo chmod +x /opt/WebStorm/bin/webstorm.sh
        sudo chmod -R 777 /opt/WebStorm

        #Cria arquivo executavel#
        sudo touch /usr/bin/webstorm
        sudo chmod 755 /usr/bin/webstorm
        sudo echo "#!/bin/sh" >> /usr/bin/webstorm
        sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/webstorm
        sudo echo "export WEBSTORM_HOME=/opt/WebStorm" >> /usr/bin/webstorm
        sudo echo "\"\$WEBSTORM_HOME/bin/webstorm.sh\" %f" >> /usr/bin/webstorm
        sudo ln -s /usr/bin/webstorm /bin/webstorm

        #Cria icone do desktop#
        sudo touch /usr/share/applications/webstorm.desktop
        sudo echo "[Desktop Entry]" >> /usr/share/applications/webstorm.desktop
        sudo echo "Encoding=UTF-8" >> /usr/share/applications/webstorm.desktop
        sudo echo "Name=WebStorm" >> /usr/share/applications/webstorm.desktop
        sudo echo "Comment=WebStorm IDE" >> /usr/share/applications/webstorm.desktop
        sudo echo "Exec=webstorm" >> /usr/share/applications/webstorm.desktop
        sudo echo "Icon=/opt/WebStorm/bin/webstorm.svg" >> /usr/share/applications/webstorm.desktop
        sudo echo "Terminal=false" >> /usr/share/applications/webstorm.desktop
        sudo echo "Type=Application" >> /usr/share/applications/webstorm.desktop
        sudo echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/webstorm.desktop
        sudo echo "StartupNotify=true" >> /usr/share/applications/webstorm.desktop

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    removerWebStorm(){
        clear
        echo "    Será removido a IDE de desenvolvimento WebStorm-11"
        echo "    Deseja continuar? Sim[s], Não[n]"
        read op

        if [ ! $op == "s" ]; then
            mostrarMenuOpcoes
        fi

        sudo rm -r /usr/bin/webstorm
        sudo rm -r /bin/webstorm
        sudo rm -r /usr/share/applications/webstorm.desktop
        sudo rm -r /opt/WebStorm

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }



    #Converte o arquivo .rpm para .deb e instala no caminho padrão do oracle
    instalarOracleInstantClient(){

        cd ~
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            sudo wget ftp://ftp.zanthus.com.br/interno/Tairo/intant_client_12.1_32bits/instant_client_12.1.tar.gz --ftp-user=$userFtp --ftp-password=$passwordFtp .

        else
            sudo wget ftp://ftp.zanthus.com.br/interno/Tairo/intant_client_12.1_64bits/instant_client_12.1.tar.gz --ftp-user=$userFtp --ftp-password=$passwordFtp .
        fi

        #Verifica se ultima ação foi efetuada com sucesso
        if [ -e instant_client_12.1.tar.gz ]; then

            #Descompacta intant Client
            tar -zxvf instant_client_12.1.tar.gz

            #Instala pacotes
            sudo dpkg -i oracle-instantclient12.1-basic.deb
            sudo dpkg -i oracle-instantclient12.1-devel.deb
            sudo dpkg -i oracle-instantclient12.1-jdbc.deb
            sudo dpkg -i oracle-instantclient12.1-odbc.deb
            sudo dpkg -i oracle-instantclient12.1-sqlplus_.deb
            sudo dpkg -i oracle-instantclient12.1-tools.deb

            #Remove pacotes pacotes
            sudo rm -r oracle-instantclient12.1-basic.deb
            sudo rm -r oracle-instantclient12.1-devel.deb
            sudo rm -r oracle-instantclient12.1-jdbc.deb
            sudo rm -r oracle-instantclient12.1-odbc.deb
            sudo rm -r oracle-instantclient12.1-sqlplus.deb
            sudo rm -r oracle-instantclient12.1-tools.deb
            sudo rm -r instant_client_12.1.tar.gz

            clear
            echo -e " Oracle Instant Client instalado com sucesso.. \n"
            if [[ $1 == "op" ]]; then
                mostrarMenuOpcoes
            fi
        else
            clear
            echo "    Não foi possível fazer o download dos arquivos do instant_client verifique a conexão ou o link dos arquivos"
            if [[ $1 == "op" ]]; then
                mostrarMenuOpcoes
            fi
        fi
    }


    removerOracleInstantClient(){
        clear
        echo -e "\n"
        echo "    Deseja continuar? Sim[s], Não[n]"
        read op

        if [ ! $op == "s" ]; then
            mostrarMenuOpcoes
        fi

        sudo apt-get -y purge oracle-instantclient12.1-basic
        sudo apt-get -y purge oracle-instantclient12.1-devel
        sudo apt-get -y purge oracle-instantclient12.1-jdbc
        sudo apt-get -y purge oracle-instantclient12.1-odbc
        sudo apt-get -y purge oracle-instantclient12.1-sqlplus
        sudo apt-get -y purge oracle-instantclient12.1-tools
        sudo rm -r /usr/lib/oracle

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Adiciona os lauchers na barra lateral do Unity para Unbutu
    #parametro 'usuario'
    adicionarLauchers(){
        gsettings set com.canonical.Unity.Launcher favorites "['application://gnome-terminal.desktop', 'application://nautilus.desktop', 'application://google-chrome.desktop', 'application://firefox.desktop', 'application://phpstorm.desktop', 'application://android-studio.desktop', 'application://idea.desktop', 'application://clion.desktop', 'application://gedit.desktop', 'application://sublime_text.desktop', 'application://wine-Programs-Notepad++-Notepad++.desktop', 'application://virtualbox.desktop', 'application://filezilla.desktop', 'application://skype.desktop', 'application://spotify.desktop', 'application://rhythmbox.desktop', 'application://PlayOnLinux.desktop', 'application://ubuntu-software-center.desktop', 'application://dropbox.desktop', 'application://ntfs-config.desktop', 'application://unity-control-center.desktop', 'application://gnome-system-monitor.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices', 'unity://desktop-icon']"

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove os lauchers na barra lateral do Unity para Unbutu
    #parametro 'usuario'
    removerLauchers(){
        gsettings reset com.canonical.Unity.Launcher favorites

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    criarDebZanthus(){
    ########################### Libs da Zanthus #################################
        capturarVersaoPhp
        capturaUsuario
        capturaUsuarioSenha
        capturarUsuarioFtp
        capturarSenhaFtp
        sudo rm -f -r /Zanthus
        sudo rm -f -r /usr/share/applications/pdv.desktop
        clear

        cd /home/$usuario/

        #Crio o diretório para criar os .deb
        echo    "    ########################################################################################"
        echo    "    #                       VÁ TOMAR UM CAFÉ ISSO PODE DEMORAR UM POUCO                    #"
        echo    "    #                                                                                      #"
        echo    "    ########################################################################################"
        echo -e "\n"
        echo    "    Criando e baixando bibliotecas..."

        #Baixo os arquivos e descompacto
        sudo wget -c ftp://ftp.zanthus.com.br/interno/Tairo/Zanthus_pdv.tar.gz --ftp-user=$userFtp --ftp-password=$passwordFtp
        sudo tar -zxvf Zanthus_pdv.tar.gz
        sudo rm -f Zanthus_pdv.tar.gz
        sudo mv Zanthus /Zanthus

        # Abre o diretório
        cd /Zanthus/Zeus/lib

        # baixa as Libs 32bits atualizadas do ftp
        cd /Zanthus/Zeus/lib
        #wget -c ftp://ftp.zanthus.com.br/interno/Tairo/lib_zanthus/* --ftp-user=$userFtp --ftp-password=$passwordFtp
        sudo wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so/*
        sudo wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/ZANSINC/Linux/lib/*

        # Cria o diretório e baixa as libs 64bits
        sudo criarDiretorio "/Zanthus/Zeus/lib_64"
        cd /Zanthus/Zeus/lib_64
        sudo wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/*

        sudo criarDiretorio "/Zanthus/Zeus/lib_co5"
        cd /Zanthus/Zeus/lib_co5
        wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_co5/*

        sudo criarDiretorio "/Zanthus/Zeus/lib_ubu"
        cd /Zanthus/Zeus/lib_ubu
        sudo wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_ubu/*

        # Nomes das variáveis
        KC_ZMAN_CZ_EXL="KC_ZMAN_1_X_102_263_CZ.EXL"
        KC_ZMAN_CZ_TARGZ="KC_ZMAN_1_X_102_263_CZ.tar.gz"

        KC_ZMAN_CW_EXL="KC_ZMAN_1_X_102_263_CW.EXL"
        KC_ZMAN_CW_TARGZ="KC_ZMAN_1_X_102_263_CW.tar.gz"

        criarDiretorio "/Zanthus/Zeus/lib_kernz"
        cd /Zanthus/Zeus/lib_kernz
        sudo wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/v_1_X_102/$KC_ZMAN_CZ_EXL
        sudo wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/v_1_X_102/$KC_ZMAN_CW_EXL
        sudo wget -c ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so
        sudo wget -c ftp://ftp.zanthus.com.br/interno/Tairo/Kernz_php5.6/kernz.so --ftp-user=$userFtp --ftp-password=$passwordFtp
        sudo wget -c ftp://ftp.zanthus.com.br/interno/Tairo/mssql/php5.6/mssql.so --ftp-user=$userFtp --ftp-password=$passwordFtp
        sudo wget -c ftp://ftp.zanthus.com.br/interno/Tairo/Kernz_php5.6/ZendGuardLoader.so --ftp-user=$userFtp --ftp-password=$passwordFtp

        sudo mv $KC_ZMAN_CZ_EXL $KC_ZMAN_CZ_TARGZ
        sudo mv $KC_ZMAN_CW_EXL $KC_ZMAN_CW_TARGZ

        sudo tar vxf $KC_ZMAN_CZ_TARGZ  lib_rotkernC_CZ.so.rh9
        sudo tar vxf $KC_ZMAN_CZ_TARGZ  lib_rotkernC_CZ.so.r64

        sudo tar vxf $KC_ZMAN_CW_TARGZ  lib_rotkernC_CW.so.rh9
        sudo tar vxf $KC_ZMAN_CW_TARGZ  lib_rotkernC_CW.so.r64

        #Remove o pacote baixado
        sudo rm -f -r $KC_ZMAN_CZ_TARGZ
        sudo rm -f -r $KC_ZMAN_CW_TARGZ

        sudo ln -s -f /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.6
        sudo ln -s -f /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/x86_64-linux-gnu/libssl.so.6

        sudo echo -e "\n" >> /etc/ld.so.conf
        sudo echo -e "/Zanthus" >> /etc/ld.so.conf
        sudo echo -e "/Zanthus/Zeus/lib" >> /etc/ld.so.conf
        sudo echo -e "/Zanthus/Zeus/lib_64" >> /etc/ld.so.conf
        sudo echo -e "/Zanthus/Zeus/lib_kernz" >> /etc/ld.so.conf
        sudo echo -e "/Zanthus/Zeus/lib_co5" >> /etc/ld.so.conf
        sudo echo -e "/Zanthus/Zeus/lib_ubu" >> /etc/ld.so.conf
        sudo echo -e "/Zanthus/Zeus/pdvJava" >> /etc/ld.so.conf

        sudo ldconfig
        sudo chmod -R 777 /Zanthus/

        #Cria icone do desktop#
        sudo chmod +x /Zanthus/Zeus/pdvJava/pdvJava2
        sudo touch /usr/share/applications/pdv.desktop
        sudo echo "[Desktop Entry]" >> /usr/share/applications/pdv.desktop
        sudo echo "Encoding=UTF-8" >> /usr/share/applications/pdv.desktop
        sudo echo "Name=PDV" >> /usr/share/applications/pdv.desktop
        sudo echo "Comment=PDV Zanthus" >> /usr/share/applications/pdv.desktop
        sudo echo -e "Exec=bash -c \"echo $usuarioSenha | sudo -S sh /Zanthus/Zeus/pdvJava/pdvJava2\"" >> /usr/share/applications/pdv.desktop
        sudo echo "Icon=/Zanthus/Zeus/icons/logo_zanthus.png" >> /usr/share/applications/pdv.desktop
        sudo echo "Terminal=false" >> /usr/share/applications/pdv.desktop
        sudo echo "Type=Application" >> /usr/share/applications/pdv.desktop
        sudo echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/pdv.desktop
        sudo echo "StartupNotify=true" >> /usr/share/applications/pdv.desktop

        #Insere a Kernz no .ini do Php e Apache para php5.6
        if [[ $phpVersion == 1 ]]; then
            pathkernz="/Zanthus/Zeus/lib_kernz/kernz.so"
            if [[ -e $pathkernz && -e /etc/php/5.6/apache2/php.ini ]]; then
                sudo echo "extension=$pathkernz" >> /etc/php/5.6/apache2/php.ini
                sudo echo "extension=$pathkernz" >> /etc/php/5.6/cli/php.ini
            fi
            pathZendGuardLoader="/Zanthus/Zeus/lib_kernz/ZendGuardLoader.so"
            if [[ -e $pathZendGuardLoader && -e /etc/php/5.6/apache2/php.ini ]]; then
                sudo echo "zend_extension=$pathZendGuardLoader" >> /etc/php/5.6/apache2/php.ini
                sudo echo "zend_extension=$pathZendGuardLoader" >> /etc/php/5.6/cli/php.ini
            fi
            pathMssql="/Zanthus/Zeus/lib_kernz/mssql.so"
            if [[ -e $pathMssql && -e /etc/php/5.6/apache2/php.ini ]]; then
                sudo echo "extension=$pathMssql" >> /etc/php/5.6/apache2/php.ini
                sudo echo "extension=$pathMssql" >> /etc/php/5.6/cli/php.ini
            fi
        fi

        #Insere a Kernz no .ini do Php e Apache para ph7.0
        if [[ $phpVersion == 2 ]]; then
            pathkernz="/Zanthus/Zeus/lib_kernz/kernz.so"
            if [[ -e $pathkernz && -e /etc/php/7.0/apache2/php.ini ]]; then
                sudo echo "extension=$pathkernz" >> /etc/php/7.0/apache2/php.ini
                sudo echo "extension=$pathkernz" >> /etc/php/7.0/cli/php.ini
            fi
            pathZendGuardLoader="/Zanthus/Zeus/lib_kernz/ZendGuardLoader.so"
            if [[ -e $pathZendGuardLoader && -e /etc/php/7.0/apache2/php.ini ]]; then
                sudo echo "zend_extension=$pathZendGuardLoader" >> /etc/php/7.0/apache2/php.ini
                sudo echo "zend_extension=$pathZendGuardLoader" >> /etc/php/7.0/cli/php.ini
            fi
            pathMssql="/Zanthus/Zeus/lib_kernz/mssql.so"
            if [[ -e $pathMssql && -e /etc/php/7.0/apache2/php.ini ]]; then
                sudo echo "extension=$pathMssql" >> /etc/php/7.0/apache2/php.ini
                sudo echo "extension=$pathMssql" >> /etc/php/7.0/cli/php.ini
            fi
        fi

        sudo service apache2 restart

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
        ########################### Libs da Zanthus #################################
    }

    removerLibsZanthus(){
        ############### Libs ZAnthus #############
        sudo apt-get -y purge zanthus-server-debian
        sudo rm -f -r /Zanthus
        sudo rm -f -r /usr/share/applications/pdv.desktop
        ############### Libs ZAnthus #############

        #Reconfigura carregamento de bibliotecas
        sudo ldconfig

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }



    #instala repositorio para Spotify - programador também gosta de música :)
    instalarSpotify(){

        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
        sudo echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
        sudo apt-get update

        sudo wget -c "https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb"
        sudo dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
        sudo sudo apt-get -y install spotify-client-0.9.17

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Rmove cliente de audio do spotify
    removerSpotify(){
        sudo apt-get -y purge spotify-client
        sudo apt-get -y autoremove
        sudo add-apt-repository  --remove 'deb http://repository.spotify.com stable non-free'

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    #Instala virtualbox para rodar maquinas virtuais
    instalarVirtualBox(){
        sudo apt-get -y install virtualbox
        sudo wget -c http://download.virtualbox.org/virtualbox/5.0.18/Oracle_VM_VirtualBox_Extension_Pack-5.0.18-106667.vbox-extpack
        virtualbox Oracle_VM_VirtualBox_Extension_Pack-5.0.18-106667.vbox-extpack
        sudo rm -f -r Oracle_VM_VirtualBox_Extension_Pack-5.0.18-106667.vbox-extpack

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Desistala virtualbox para rodar maquinas virtuais
    removerVirtualBox(){
        sudo apt-get -y purge virtualbox

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #instala repositorio para Java 8
    instalarJava(){
        sudo add-apt-repository  -y ppa:webupd8team/java
        sudo apt-get update
        #Instala java 8
        sudo apt-get -y install oracle-java8-installer

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove repositorio para Java 8
    removerJava(){
        sudo add-apt-repository  -r ppa:webupd8team/java
        sudo apt-get update
        #Desistala java 8
        sudo apt-get -y purge oracle-java8-installer

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala wine para rodar programas do windows
    instalarWine(){
        sudo apt-get -y install wine

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove wine para rodar programas do windows
    removerWine(){
        sudo apt-get -y purge wine

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #instala repositorio para Android Studio
    instalarAndroidStudio(){
        sudo apt-add-repository -y ppa:paolorotolo/android-studio
        sudo apt-get update
        #Instala Android Studio IDE Android
        sudo apt-get -y install android-studio

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    removerAndroidStudio(){
        #Remove repositorio para Android Studio
        sudo apt-add-repository -r ppa:paolorotolo/android-studio
        sudo apt-get update
        #Desistala Android Studio IDE Android
        sudo apt-get -y purge android-studio

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala Steam
    instalarSteam(){
        sudo apt-get -y install steam

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Desistala Steam
    removerSteam(){
        sudo apt-get -y purge steam

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi

    }

    #Monta uma partição de Swap de 8GB
    instalarSwap(){
        sudo dd if=/dev/zero of=/swapfile bs=1024 count=8388608
        sudo mkswap /swapfile
        echo "/swapfile swap swap defaults 0 0 " >> /etc/fstab

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Desabilita Swap
    desabilitarSwap(){
        sudo swapoff /swapfile
    }

    configurarWebProxy(){
        gsettings set org.gnome.system.proxy autoconfig-url http://$usuario:$senha@$ipServidor:$porta
        gsettings set org.gnome.system.proxy ignore-hosts [ 'localhost', '127.0.0.0/8' ]
        gsettings set org.gnome.system.proxy mode 'none'
        gsettings set org.gnome.system.proxy use-same-proxy false
        gsettings set org.gnome.system.proxy.ftp host $ipServidor
        gsettings set org.gnome.system.proxy.ftp port $porta
        gsettings set org.gnome.system.proxy.http authentication-password $senha
        gsettings set org.gnome.system.proxy.http authentication-user $usuario
        gsettings set org.gnome.system.proxy.http enabled false
        gsettings set org.gnome.system.proxy.http host $ipServidor
        gsettings set org.gnome.system.proxy.http port $porta
        gsettings set org.gnome.system.proxy.http use-authentication false
        gsettings set org.gnome.system.proxy.https host $ipServidor
        gsettings set org.gnome.system.proxy.https port $porta
        gsettings set org.gnome.system.proxy.socks host $ipServidor
        gsettings set org.gnome.system.proxy.socks port $porta
    }

    configurarAptProxy(){

        echo -e "Digite o usuario"
        read usuario

        echo -e "Digite a senha"
        read senha

        echo -e "Digite o ip do servidor"
        read ipServidor

        echo -e "Digite a porta"
        read porta

        echo -e "\n" >> /etc/basch.bashrc
        echo -e "\n" >> /etc/basch.bashrc
        echo -e "\n" >> /etc/basch.bashrc
        echo -e "\n" >> /etc/basch.bashrc
        echo -e "PROXY_URL=http://$usuario:$senha@$ipServidor:$porta" >> /etc/basch.bashrc
        echo -e "export HTTP_PROXY=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export http_proxy=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export HTTPS_PROXY=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export https_proxy=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export FTP_PROXY=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export ftp_proxy=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export dns_proxy=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export rsync_proxy=$PROXY_URL" >> /etc/basch.bashrc
        echo -e "export no_proxy=\'localhost,127.0.0.1,192.168.*.*\'" >> /etc/basch.bashrc
        echo -e "alias curl=\'curl -x $PROXY_URL\'" >> /etc/basch.bashrc
        echo -e "git config --global http.proxy $PROXY_URL" >> /etc/basch.bashrc
        echo -e "git config --global https.proxy $PROXY_URL" >> /etc/basch.bashrc


        echo -e "Acquire {" >> /etc/apt/apt.conf
        echo -e "HTTP::Proxy \"$PROXY_URL\";" >> /etc/apt/apt.conf
        echo -e "HTTPS::Proxy \"$PROXY_URL\";" >> /etc/apt/apt.conf
        echo -e "FTP::Proxy \"$PROXY_URL\";" >> /etc/apt/apt.conf
        echo -e "SOCKS::proxy \"$PROXY_URL\";" >> /etc/apt/apt.conf
        echo -e "};" >> /etc/apt/apt.conf
        echo -e "\n" >> /etc/apt/apt.conf
        echo -e "\n" >> /etc/apt/apt.conf


        echo -e "\n" >> /etc/wgetrc
        echo -e "\n" >> /etc/wgetrc
        echo -e "\n" >> /etc/wgetrc
        echo -e "\n" >> /etc/wgetrc
        echo -e "https_proxy = $PROXY_URL/" >> /etc/wgetrc
        echo -e "http_proxy = $PROXY_URL/" >> /etc/wgetrc
        echo -e "ftp_proxy = $PROXY_URL/" >> /etc/wgetrc
        echo -e "use_proxy = on" >> /etc/wgetrc
    }

    mostarProxy(){
        gsettings get org.gnome.system.proxy autoconfig-url
        gsettings get org.gnome.system.proxy ignore-hosts
        gsettings get org.gnome.system.proxy mode
        gsettings get org.gnome.system.proxy use-same-proxy
        gsettings get org.gnome.system.proxy.ftp host
        gsettings get org.gnome.system.proxy.ftp port
        gsettings get org.gnome.system.proxy.http authentication-password
        gsettings get org.gnome.system.proxy.http authentication-user
        gsettings get org.gnome.system.proxy.http enabled
        gsettings get org.gnome.system.proxy.http host
        gsettings get org.gnome.system.proxy.http port
        gsettings get org.gnome.system.proxy.http use-authentication
        gsettings get org.gnome.system.proxy.https host
        gsettings get org.gnome.system.proxy.https port
        gsettings get org.gnome.system.proxy.socks host
        gsettings get org.gnome.system.proxy.socks port
    }


    resetarProxy(){
        gsettings reset org.gnome.system.proxy autoconfig-url
        gsettings reset org.gnome.system.proxy ignore-hosts
        gsettings reset org.gnome.system.proxy mode
        gsettings reset org.gnome.system.proxy use-same-proxy
        gsettings reset org.gnome.system.proxy.ftp host
        gsettings reset org.gnome.system.proxy.ftp port
        gsettings reset org.gnome.system.proxy.http authentication-password
        gsettings reset org.gnome.system.proxy.http authentication-user
        gsettings reset org.gnome.system.proxy.http enabled
        gsettings reset org.gnome.system.proxy.http host
        gsettings reset org.gnome.system.proxy.http port
        gsettings reset org.gnome.system.proxy.http use-authentication
        gsettings reset org.gnome.system.proxy.https host
        gsettings reset org.gnome.system.proxy.https port
        gsettings reset org.gnome.system.proxy.socks host
        gsettings reset org.gnome.system.proxy.socks port
    }

    instalarPHP56(){
        sudo add-apt-repository  -y ppa:ondrej/php
        sudo apt-get update
        sudo apt-get install -y apache2
        sudo apt-get install -y php5.6
        sudo apt-get install -y php5.6-dev
        sudo apt-get install -y php5.6-curl
        sudo apt-get install -y php5.6-json
        sudo apt-get install -y php5.6-ldap
        sudo apt-get install -y php5.6-odbc
        sudo apt-get install -y php5.6-pgsql
        sudo apt-get install -y php5.6-mcrypt
        sudo apt-get install -y php5.6-sybase
        sudo apt-get install -y php5.6-xml
        sudo apt-get install -y php5.6-zip
        sudo apt-get install -y php5.6-soap
        sudo apt-get install -y php5.6-gd
        sudo apt-get install -y php5.6-sqlite3
        sudo apt-get install -y php-memcached
        sudo apt-get install -y libapache2-mod-php5.6
        sudo apt-get install -y php5.6-bcmath

        instalarOracleInstantClient

        ###################  Instala a .so do oracle ######################
        sudo pecl  uninstall oci8
        sudo pecl  install oci8-2.0.11
        #Verifica se o caminho padrão para a pasta oracle existe
        pathOci8="/usr/lib/php/20131226/oci8.so"
        if [ -e $pathOci8 ]; then
            sudo echo "extension=$pathOci8 " >> /etc/php/5.6/apache2/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/apache2/php.ini
            sudo echo "extension=$pathOci8" >> /etc/php/5.6/cli/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi

        ################### Instala a .so do Xdebug ########################
        sudo pecl  uninstall xdebug
        sudo pecl  install xdebug
        pathxdebug="/usr/lib/php/20131226/xdebug.so"

        if [[ -e $pathxdebug && -e /etc/php/5.6/apache2/php.ini ]]; then
            sudo echo "[XDebug]" >> /etc/php/5.6/apache2/php.ini
            sudo echo "zend_extension=$pathxdebug" >> /etc/php/5.6/apache2/php.ini
            sudo echo "xdebug.default_enable = 1" >> /etc/php/5.6/apache2/php.ini
            sudo echo "xdebug.show_exception_trace = 1" >> /etc/php/5.6/apache2/php.ini
            sudo echo "xdebug.show_local_vars = 1" >> /etc/php/5.6/apache2/php.ini
            sudo echo "xdebug.remote_enable = 1" >> /etc/php/5.6/apache2/php.ini
            sudo echo "xdebug.var_display_max_data   = 50000" >> /etc/php/5.6/apache2/php.ini
            sudo echo "xdebug.max_nesting_level = 250" >> /etc/php/5.6/apache2/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/apache2/php.ini

            sudo echo "[XDebug]" >> /etc/php/5.6/cli/php.ini
            sudo echo "zend_extension=$pathxdebug" >> /etc/php/5.6/cli/php.ini
            sudo echo "xdebug.default_enable = 1" >> /etc/php/5.6/cli/php.ini
            sudo echo "xdebug.show_exception_trace = 1" >> /etc/php/5.6/cli/php.ini
            sudo echo "xdebug.show_local_vars = 1" >> /etc/php/5.6/cli/php.ini
            sudo echo "xdebug.remote_enable = 1" >> /etc/php/5.6/cli/php.ini
            sudo echo "xdebug.var_display_max_data   = 50000" >> /etc/php/5.6/cli/php.ini
            sudo echo "xdebug.max_nesting_level = 250" >> /etc/php/5.6/cli/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi


        ################### Instala a .so do dbase ########################
        sudo pecl  uninstall dbase
        sudo pecl  install dbase
        pathdbase="/usr/lib/php/20131226/dbase.so"
        if [[ -e $pathdbase && -e /etc/php/5.6/apache2/php.ini ]]; then
            sudo echo "extension=$pathdbase" >> /etc/php/5.6/apache2/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/apache2/php.ini
            sudo echo "extension=$pathdbase" >> /etc/php/5.6/cli/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi

        ################### Instala a mssql.so ########################
        pathMssql="/Zanthus/Zeus/lib/mssql.so"
        if [[ -e $pathMssql && -e /etc/php/5.6/apache2/php.ini ]]; then
            sudo echo "extension=$pathMssql" >> /etc/php/5.6/apache2/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/apache2/php.ini
            sudo echo "extension=$pathMssql" >> /etc/php/5.6/cli/php.ini
            sudo echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi

        #Configura Timezone e charset
        sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php/5.6/apache2/php.ini
        sudo echo -e "\n" >> /etc/php/5.6/apache2/php.ini
        sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/5.6/apache2/php.ini
        sudo echo -e "\n" >> /etc/php/5.6/apache2/php.ini

        #Configura Timezone e charset
        sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php/5.6/cli/php.ini
        sudo echo -e "\n" >> /etc/php/5.6/cli/php.ini
        sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/5.6/cli/php.ini
        sudo echo -e "\n" >> /etc/php/5.6/cli/php.ini

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    instalarPHP7(){
        sudo add-apt-repository  -y ppa:ondrej/php
        sudo apt-get update
        sudo apt-get install -y apache2
        sudo apt-get install -y php
        sudo apt-get install -y php-dev
        sudo apt-get install -y php-curl
        sudo apt-get install -y php-json
        sudo apt-get install -y php-ldap
        sudo apt-get install -y php-odbc
        sudo apt-get install -y php-pgsql
        sudo apt-get install -y php-mcrypt
        sudo apt-get install -y php-sybase
        sudo apt-get install -y php-xml
        sudo apt-get install -y php-zip
        sudo apt-get install -y php-soap
        sudo apt-get install -y php-gd
        sudo apt-get install -y php-sqlite3
        sudo apt-get install -y php-memcached
        sudo apt-get install -y libapache2-mod-php

        instalarOracleInstantClient

        ###################  Instala a .so do oracle ######################
        sudo pecl  install oci8
        #Verifica se o caminho padrão para a pasta oracle existe
        pathOci8="/usr/lib/php/20151012/oci8.so"
        if [[ -e $pathOci8 && -e /etc/php/7.0/apache2/php.ini ]]; then
            sudo echo "extension=$pathOci8" >> /etc/php/7.0/apache2/php.ini
            sudo echo -e "\n" >> /etc/php/7.0/apache2/php.ini
            sudo echo "extension=$pathOci8" >> /etc/php/7.0/cli/php.ini
            sudo echo -e "\n" >> /etc/php/7.0/cli/php.ini
        fi

        ################### Instala a .so do Xdebug ########################
        sudo pecl  install xdebug
        pathxdebug="/usr/lib/php/20151012/xdebug.so"

        if [[ -e $pathxdebug && -e /etc/php/7.0/apache2/php.ini ]]; then
            sudo echo "[XDebug]" >> /etc/php/7.0/apache2/php.ini
            sudo echo "zend_extension=$pathxdebug" >> /etc/php/7.0/apache2/php.ini
            sudo echo "xdebug.default_enable = 1" >> /etc/php/7.0/apache2/php.ini
            sudo echo "xdebug.show_exception_trace = 1" >> /etc/php/7.0/apache2/php.ini
            sudo echo "xdebug.show_local_vars = 1" >> /etc/php/7.0/apache2/php.ini
            sudo echo "xdebug.remote_enable = 1" >> /etc/php/7.0/apache2/php.ini
            sudo echo "xdebug.var_display_max_data   = 50000" >> /etc/php/7.0/apache2/php.ini
            sudo echo "xdebug.max_nesting_level = 250" >> /etc/php/7.0/apache2/php.ini
            sudo echo -e "\n" >> /etc/php/7.0/apache2/php.ini

            sudo echo "[XDebug]" >> /etc/php/7.0/cli/php.ini
            sudo echo "zend_extension=$pathxdebug" >> /etc/php/7.0/cli/php.ini
            sudo echo "xdebug.default_enable = 1" >> /etc/php/7.0/cli/php.ini
            sudo echo "xdebug.show_exception_trace = 1" >> /etc/php/7.0/cli/php.ini
            sudo echo "xdebug.show_local_vars = 1" >> /etc/php/7.0/cli/php.ini
            sudo echo "xdebug.remote_enable = 1" >> /etc/php/7.0/cli/php.ini
            sudo echo "xdebug.var_display_max_data   = 50000" >> /etc/php/7.0/cli/php.ini
            sudo echo "xdebug.max_nesting_level = 250" >> /etc/php/7.0/cli/php.ini
            sudo echo -e "\n" >> /etc/php/7.0/cli/php.ini
        fi


        ################### Instala a .so do dbase ########################
        sudo pecl  install dbase
        pathdbase="/usr/lib/php/20151012/dbase.so"
        if [[ -e $pathdbase && -e /etc/php/7.0/apache2/php.ini ]]; then
            sudo echo "extension=$pathdbase" >> /etc/php/7.0/apache2/php.ini
            sudo echo -e "\n" >> /etc/php/7.0/apache2/php.ini
            sudo echo "extension=$pathdbase" >> /etc/php/7.0/cli/php.ini
            sudo echo -e "\n" >> /etc/php/7.0/cli/php.ini
        fi

        #Configura Timezone e charset
        sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php/7.0/apache2/php.ini
        sudo echo -e "\n" >> /etc/php/7.0/apache2/php.ini
        sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/7.0/apache2/php.ini
        sudo echo -e "\n" >> /etc/php/7.0/apache2/php.ini

        #Configura Timezone e charset
        sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php/7.0/cli/php.ini
        sudo echo -e "\n" >> /etc/php/7.0/cli/php.ini
        sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/5.6/cli/php.ini
        sudo echo -e "\n" >> /etc/php/7.0/cli/php.ini

#       Compilando lib GD para imagens
#       sudo apt-get install libjpeg62-dev
#       sudo apt-get install libpng-dev
#       sudo apt-get install libfreetype6-dev
#       phpize
#       ./configure --with-gd=shared --with-freetype-dir=/usr/include/freetype2/  --with-png-dir  --with-freetype-dir  --with-gd --with-jpeg-dir=/usr/lib64
#       make clean
#       make

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    instalarOracleDataBase11G(){

        # Baixo os arquivos para fazer a instalação
        echo    "    ########################################################################################"
        echo    "    #                       VÁ TOMAR UM CAFÉ ISSO PODE DEMORAR UM POUCO                    #"
        echo    "    #                                                                                      #"
        echo    "    ########################################################################################"
        echo -e "\n"
        echo    "    Criando e baixando arquivos..."

        #Captura as senha para baixar as libs
        capturaUsuario
        capturaUsuarioSenha
        capturarUsuarioFtp
        capturarSenhaFtp

        #Baoixa aslibs necessarias
        sudo apt-get -y install libaio1
        sudo apt-get -y install libaio1-dbg
        sudo apt-get -y install unixodbc

        #Baixo os arquivos e descompacto
        wget -c ftp://ftp.zanthus.com.br/interno/Tairo/oracle_11g_64bits/oracle-xe_11.2.0-2_amd64.deb --ftp-user=$userFtp --ftp-password=$passwordFtp

        #Cria arquivo de configuração do oracle
        sudo touch /sbin/chkconfig
        sudo echo -e "#!/bin/bash"  >> /sbin/chkconfig
        sudo echo -e "# Oracle 11gR2 XE installer chkconfig hack for Ubuntu"  >> /sbin/chkconfig
        sudo echo -e "file=/etc/init.d/oracle-xe"  >> /sbin/chkconfig
        sudo echo -e "if [[ ! \`tail -n1 \$file | grep INIT\` ]]; then"  >> /sbin/chkconfig
        sudo echo -e "echo >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '### BEGIN INIT INFO' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '# Provides: OracleXE' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '# Required-Start: \$remote_fs \$syslog' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '# Required-Stop: \$remote_fs \$syslog' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '# Default-Start: 2 3 4 5' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '# Default-Stop: 0 1 6' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '# Short-Description: Oracle 11g Express Edition' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "echo '### END INIT INFO' >> \$file"  >> /sbin/chkconfig
        sudo echo -e "fi"  >> /sbin/chkconfig
        sudo echo -e "update-rc.d oracle-xe defaults 80 01"  >> /sbin/chkconfig

        sudo chmod +x /sbin/chkconfig
        sudo chmod 755 /sbin/chkconfig

        # Adiciona parametros para o Kernel
        sudo touch /etc/sysctl.d/60-oracle.conf
        sudo echo -e "# Oracle 11g XE kernel parameters" >> /etc/sysctl.d/60-oracle.conf
        sudo echo -e "fs.file-max=6815744" >> /etc/sysctl.d/60-oracle.conf
        sudo echo -e "net.ipv4.ip_local_port_range=9000 65000" >> /etc/sysctl.d/60-oracle.conf
        sudo echo -e "kernel.sem=250 32000 100 128" >> /etc/sysctl.d/60-oracle.conf
        sudo echo -e "kernel.shmmax=536870912" >> /etc/sysctl.d/60-oracle.conf

        sudo service procps start
        sysctl -q fs.file-max

        #Cria script para evitar erro de memoria do oracle
        sudo touch /etc/rc2.d/S01shm_load
        sudo echo -e "#!/bin/sh" >> /etc/rc2.d/S01shm_load
        sudo echo -e "case \"\$1\" in" >> /etc/rc2.d/S01shm_load
        sudo echo -e "start) mkdir /var/lock/subsys 2>/dev/null" >> /etc/rc2.d/S01shm_load
        sudo echo -e "       touch /var/lock/subsys/listener" >> /etc/rc2.d/S01shm_load
        sudo echo -e "       rm /dev/shm 2>/dev/null" >> /etc/rc2.d/S01shm_load
        sudo echo -e "       mkdir /dev/shm 2>/dev/null" >> /etc/rc2.d/S01shm_load
        sudo echo -e "       mount -t tmpfs shmfs -o size=2048m /dev/shm ;;" >> /etc/rc2.d/S01shm_load
        sudo echo -e "*) echo error" >> /etc/rc2.d/S01shm_load
        sudo echo -e "     exit 1 ;;" >> /etc/rc2.d/S01shm_load
        sudo echo -e "esac" >> /etc/rc2.d/S01shm_load

        sudo chmod +x /etc/rc2.d/S01shm_load
        sudo chmod 755 /etc/rc2.d/S01shm_load

        sudo ln -s /usr/bin/awk /bin/awk
        sudo mkdir /var/lock/subsys
        sudo touch /var/lock/subsys/listener

        #Instala realmente o .deb
        sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb

        #Chama o configurador do oracle
        sudo /etc/init.d/oracle-xe configure

        export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe >> ~/.bashrc
        export ORACLE_SID=XE >> ~/.bashrc
        export NLS_LANG=\`\$ORACLE_HOME/bin/nls_lang.sh\` >> ~/.bashrc
        export ORACLE_BASE=/u01/app/oracle >> ~/.bashrc
        export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH >> ~/.bashrc
        export PATH=$ORACLE_HOME/bin:$PATH >> ~/.bashrc
        export ORACLE_SID=asdb >> ~/.bashrc

#       /** Altera as permissões para o usuario e cria o TABLESPACE */
#       create directory db_dumps  as '/u01/app/oracle/dbs_to_load';
#       sudo mkdir /u01/app/oracle/dbs_to_load
#       sudo sudo chmod -R 777 /u01/app/oracle/dbs_to_load
#       grant read,write on directory db_dumps to desenvolvimento;
#       grant create any directory to desenvolvimento;
#       grant imp_full_database to desenvolvimento;
#       ALTER SYSTEM SET DB_CREATE_FILE_DEST='/u01/app/oracle/oradata/XE' SCOPE=BOTH;
#       create tablespace zeusretail;
#       ALTER USER desenvolvimento QUOTA 100M ON zeusretail;
#       GRANT UNLIMITED TABLESPACE TO desenvolvimento;
#       grant connect to desenvolvimento;
#       grant resource to desenvolvimento;

#       exportar base de dados completos
#       expdp system DIRECTORY=db_dumps DUMPFILE=desenvolvimento.dmp FULL=y logfile=data_pump_dir:export.log

#       exportar base de dados de schema
#       expdp desenvolvimento DIRECTORY=db_dumps DUMPFILE=desenvolvimento.dmp SCHEMAS=desenvolvimento logfile=data_pump_dir:exportDB.log

#       importar base de dados
#       impdp desenvolvimento DIRECTORY=db_dumps DUMPFILE=desenvolvimento.dmp SCHEMAS=desenvolvimento logfile=data_pump_dir:exportDB.log

        rm -rf oracle-xe_11.2.0-2_amd64.deb
    }

    removerOracleDataBase11G(){

        sudo /etc/init.d/oracle-xe stop
        sudo ps -ef | grep oracle | grep -v grep | awk '{print $2}' | xargs kill
        sudo dpkg --purge oracle-xe
        sudo rm -rf /u01
        sudo rm -rf /etc/default/oracle-xe
        sudo update-rc.d -f oracle-xe remove
        sudo rm -rf /etc/oratab
        sudo rm -rf /etc/init.d/oracle-xe
        sudo rm -rf /var/lock/subsys
        sudo rm -rf /bin/awk
        sudo rm -rf /etc/rc2.d/S01shm_load
        sudo rm -rf /etc/sysctl.d/60-oracle.conf
        sudo rm -rf /sbin/chkconfig

    }

    instalarComposer(){
        capturaUsuario
        #Baixa o composer
        sudo curl -s https://getcomposer.org/installer | php
        #Move o Composer
        sudo mv composer.phar /usr/local/bin/composer
        #Instala o instalador do laravel
        composer global require "laravel/installer=~1.1"
        #Instala o guzzle
        composer global require "guzzlehttp/guzzle:~5.0"
        #Instala o instalador do lumen
        composer global require "laravel/lumen-installer=~1.0"
        #Adiciona os vendors do composer as variáveis de ambiente
        echo "export PATH=$PATH:/home/$usuario/.composer/vendor/bin" >> /home/$usuario/.bashrc
    }

    removerComposer(){
        capturaUsuario
        sudo rm -rf /usr/local/bin/composer
        sudo rm -rm /home/$usuario/.composer
    }

    teste(){
        clear
        echo "    Teste..."

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    mostrarAjuda(){
        clear
        echo    "    ########################################################################################"
        echo    "    #                           Menu de ajuda para script linux                            #"
        echo    "    ########################################################################################"
        echo -e "    #--------------------------------------------------------------------------------------#"
        echo -e "    #                                 METODOS DO SCRIP                                     #"
        echo -e "    #--------------------------------------------------------------------------------------#"
        echo -e "    #    mostrarMenuOpcoes                                                                 #"
        echo -e "    #    capturaUsuario                                    instalarAmbienteServidorUbuntu  #"
        echo -e "    #    listarDiretorio                                   removerAmbienteServidorUbuntu   #"
        echo -e "    #    criarDiretorio                                    instalarOracleInstantClient     #"
        echo -e "    #    versaoLinux                                       removerOracleInstantClient      #"
        echo -e "    #    instalarAmbienteDesenvolvimento                   adicionarLauchers               #"
        echo -e "    #    removerAmbienteDesenvolvimento                    removerLauchers                 #"
        echo -e "    #    instalarEclipse                                   criarDebZanthus                 #"
        echo -e "    #    removerEclipse                                    removerLibsZanthus              #"
        echo -e "    #    instalarGoogleChrome                              instalarSpotify                 #"
        echo -e "    #    removerGoogleChrome                               removerSpotify                  #"
        echo -e "    #    instalarSublime                                   instalarVirtualBox              #"
        echo -e "    #    intalarNotePad                                    removerVirtualBox               #"
        echo -e "    #    instalarDropbox                                   instalarJava                    #"
        echo -e "    #    removerDropbox                                    removerJava                     #"
        echo -e "    #    instalarPhpStorm                                  instalarWine                    #"
        echo -e "    #    removerPhpStorm                                   removerWine                     #"
        echo -e "    #    instalarIntelliJ                                  instalarAndroidStudio           #"
        echo -e "    #    removerIntelliJ                                   removerAndroidStudio            #"
        echo -e "    #    instalarClion                                     instalarSteam                   #"
        echo -e "    #    removerClion                                      removerSteam                    #"
        echo -e "    #    instalarWebStorm                                  instalarSwap                    #"
        echo -e "    #    removerWebStorm                                   desabilitarSwap                 #"
        echo -e "    #    instalarAmbienteServidorCentOs                    instalarPHP56                   #"
        echo -e "    #    removerAmbienteServidorCentOs                     instalarPHP7                    #"
        echo -e "    #    configurarWebProxy                                instalarOracleDataBase11G       #"
        echo -e "    #    configurarAptProxy                                removerOracleDataBase11G        #"
        echo -e "    #    mostarProxy                                                                       #"
        echo -e "    #    resetarProxy                                                                      #"
        echo -e "    #                                                                                      #"
        echo -e "    #    teste                                                                             #"
        echo -e "    ########################################################################################"
        echo    "    ########################################################################################"
        echo    "    #                       DIGITE O NOME DA TAREFA A SER EXECUTADA                        #"
        echo    "    ########################################################################################"
        read res

        if [[ $res == "" ]]; then
            mostrarMenuOpcoes
        else
            $res "op"
        fi

    }



    # __END_METHODS__







    ##############################   Executa os metodos ###################################
    cd ~
    mostrarMenuOpcoes






    #################### Expressões condicionais shell ####################################
    # -eq : igual
    # -ne : diferente
    # -gt : maior
    # -ge : maior ou igual
    # -lt : menor
    # -le : menor ou igual
    # -d : se é um diretório
    # -e : se existe
    # -z : se é vazio
    # -f : se contem texto.
    # -r : se o arquivo possui permissão de leitura
    # -w : se o arquivo possui permissão de escrita.
    # -x : se o arquivo é executavel.
    # != : que propõe, que duas expressões sejam diferentes;
    # >  : ou "-gt" que propõe, que uma expressão seja maior que outra;
    # >= : que propõe, que uma expressão seja maior ou igual a outra;
    # <  : ou "-lt" que propõe, que uma expressão seja menor que outra;
    # <= : que propõe, que uma expressão seja menor ou igual a outra;
    #  echo -e \$VARIAVEL : imprime a string, não o conteúdo
    #  echo $VARIAVEL : imprime o conteúdo da variável
    #######################################################################################

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

        apt-get update
        apt-get install -y g++
        apt-get install -y gcc
        apt-get install -y make

        if [[ $phpVersion == 1 ]]; then
            instalarPHP56
        fi

        if [[ $phpVersion == 2 ]]; then
            instalarPHP7
        fi

        apt-get install -y mysql-server
        apt-get install -y phpmyadmin
        instalarJava
        instalarWine
        instalarSteam
        apt-get install -y postgresql
        apt-get install -y subversion
        apt-get install -y memcached
        apt-get install -y sendmail
        apt-get install -y unetbootin
        criarDebZanthus
        instalarAndroidStudio

        #Instala os pacotes e programas

        #Intala o skype primeiro por que ele baixa varias libs 32bits que programas com Wine usam
        apt-get -y install skype
        #Instala AcetoneIso programa para rodar isos
        apt-get -y install acetoneiso
        #Plugin para abrir o terminal no diretório
        apt-get -y install nautilus-open-terminal
        #Instala Gdebi Instalador de pacotes
        apt-get -y install gdebi
        #Instala Gerenciador de dependencias
        apt-get -y install synaptic
        #Instala treinamento de digitação
        apt-get -y install klavaro
        #Instala pacotes extras com flash e codecs mp4
        apt-get -y install ubuntu-restricted-extras
        #Instala descompactador
        apt-get -y install rar
        #Instala cliente ftp
        apt-get -y install filezilla
        #Instala gimp para edição de imagens
        apt-get -y install gimp
        #Instala inkscape para edição de imagens
        apt-get -y install inkscape
        #Instala cliente de audio do spotify
        instalarSpotify
        #Instala lib Curl para uso com php
        apt-get -y install curl
        #Instala playonlinux gerenciaento de plataforma wine
        apt-get -y install playonlinux
        #Instala controle de versionamento
        apt-get -y install git-core
        instalarVirtualBox
        #Instala gerenciador de backup
        apt-get -y install luckybackup
        #Instala  libs php para conexão com banco de dados MSSQL
        apt-get -y install freetds-common
        #Atualiza os headers
        apt-get update
        # reinicializa Apache
        service apache2 restart
        #Da permição para a pasta do apache
        chmod -R 777 /var/www

        #configura o git com meu email
        git config --global user.email "tairoroberto@hotmail.com"
        #configura o git com meu usuário
        git config --global user.name "tairoroberto"

        #Habilita o modrewrite do apache
        a2enmod  rewrite
        #Instala o Composer
        instalarComposer

        #Adiciona o NodeJs ao bash para ser instalado
        curl --silent --location https://deb.nodesource.com/setup_4.x |  bash -
        #Atualiza os headers
        apt-get update
        #Instala o NodeJs
        apt-get install --yes nodejs
        #Conversor de pacotes RPM
        apt-get -y install alien
        #Configurador de discos Ntfs
        apt-get -y install ntfs-config
        #Instala ruby
        apt-get -y install ruby

        #verifica se é pra intalar PhpStorm
        if [[ $1 == "storm" ]]; then
            instalarPhpStorm
        fi

        #verifica se é pra intalar IntelliJ-IDEA
        if [[ $2 == "idea" ]]; then
            instalarIntelliJ
        fi

        #verifica se é pra intalar Clion
        if [[ $3 == "webstorm" ]]; then
            instalarWebStorm
        fi

        #Instala Siblime-text 3 e Notepad++
        instalarSublime

        #Instala Dropbox
        instalarDropbox

        #Instala a IDE Eclipse Java EE
        instalarEclipse

        #Instala O navegador GoogleChrome
        instalarGoogleChrome

        #instala o banco oracle
        instalarOracleDataBase11G

        #Instala dictionary no terminal
        curl https://raw.githubusercontent.com/badarsh2/Sudocabulary/master/script.sh | bash

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

        pecl  uninstall oci8
        pecl  uninstall xdebug
        pecl  uninstall dbase
        apt-get -y purge php*
        apt-get -y purge apache2
        apt-get -y purge postgresql
        apt-get -y purge mysql-server
        apt-get -y purge subversion

        removerOracleInstantClient

        removerLibsZanthus

        #Desistala os pacotes e programas

        #Remove repositorio para php5-5.6
        add-apt-repository  -r ppa:ondrej/php5-5.6
        apt-get update

        removerJava

        removerAndroidStudio

        #Desistala sendmail
        apt-get -y purge sendmail
        #Desistala AcetoneIso programa para rodar isos
        apt-get -y purge acetoneiso
        #Plugin para abrir o terminal no diretório
        apt-get -y purge nautilus-open-terminal
        removerSteam
        #Desistala Gdebi Instalador de pacotes
        apt-get -y purge gdebi
        #Desistala Gerenciador de dependencias
        apt-get -y purge synaptic
        #Desistala treinamento de digitação
        apt-get -y purge klavaro
        #Desistala pacotes extras com flash e codecs mp4
        apt-get -y purge ubuntu-restricted-extras
        #Desistala descompactador
        apt-get -y purge rar
        #Desistala cliente ftp
        apt-get -y purge filezilla
        #Desistala wine para rodar programas do windows
        removerWine
        #Desistala gimp para edição de imagens
        apt-get -y purge gimp
        #Desistala inkscape para edição de imagens
        apt-get -y purge inkscape
        #Desistala lib Curl para uso com php
        apt-get -y purge curl
        #Desistala playonlinux gerenciaento de plataforma wine
        apt-get -y purge playonlinux
        #Desistala controle de versionamento
        apt-get -y purge git-core
        removerVirtualBox
        #Desistala gerenciador de backup
        apt-get -y purge luckybackup
        #Desistala  libs php para conexão com banco de dados MSSQL
        apt-get -y purge freetds-common
        #Desistala o Composer
        removerComposer
        #Desistala o NodeJs
        apt-get purge --yes nodejs
        #Desistala o skype por ultimo por que ele baixa varias libs 32bits que programas com Wine usam
        apt-get -y purge skype
        #Desistala conversor de pacotes
        apt-get -y purge alien
        #Desistala configurador de discos Ntfs
        apt-get -y purge ntfs-config
        #Desistala Unetbootin
        apt-get -y purge unetbootin
        #Desistala ruby
        apt-get -y purge ruby

        #remove os pacotes não ultilizados
        apt-get -y autoremove
        apt-get clean

        #verifica se é pra remover PhpStorm
        if [[ $1 == "storm" ]]; then
            removerPhpStorm
        fi

        #verifica se é pra remover IntelliJ-IDEA
        if [[ $2 == "idea" ]]; then
            removerIntelliJ
        fi

        #verifica se é pra remover Clion
        if [[ $3 == "webstorm" ]]; then
            removerWebStorm
        fi

        #Desistala Eclipse Java EE
        removerEclipse

        #Desistala Dropbox
        removerDropbox

        removerLauchers $usuario

        echo "    Ambiente Servidor Ubuntu removido"

        mostrarMenuOpcoes
    }

    #Instala Eclipse Mars
    instalarEclipse(){

        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            wget -c "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk.tar.gz&r=1" -O eclipse-jee-mars-1-linux-gtk.tar.gz
            tar -zxvf eclipse-jee-mars-1-linux-gtk.tar.gz
            mv eclipse /opt/eclipse
            chmod +x /opt/eclipse/eclipse
            chmod -R 777 /opt/eclipse

            #Cria arquivo executavel#
            touch /usr/bin/eclipse
            chmod 755 /usr/bin/eclipse
            echo "#!/bin/sh" >> /usr/bin/eclipse
            echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/eclipse
            echo "export ECLIPSE_HOME=/opt/eclipse" >> /usr/bin/eclipse
            echo "\$ECLIPSE_HOME/eclipse $*" >> /usr/bin/eclipse
            ln -s /usr/bin/eclipse /bin/eclipse

            #Cria icone do desktop#
            touch /usr/share/applications/eclipse.desktop
            echo "[Desktop Entry]" >> /usr/share/applications/eclipse.desktop
            echo "Encoding=UTF-8" >> /usr/share/applications/eclipse.desktop
            echo "Name=Eclipse" >> /usr/share/applications/eclipse.desktop
            echo "Comment=Eclipse IDE" >> /usr/share/applications/eclipse.desktop
            echo "Exec=eclipse" >> /usr/share/applications/eclipse.desktop
            echo "Icon=/opt/eclipse/icon.xpm" >> /usr/share/applications/eclipse.desktop
            echo "Terminal=false" >> /usr/share/applications/eclipse.desktop
            echo "Type=Application" >> /usr/share/applications/eclipse.desktop
            echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/eclipse.desktop
            echo "StartupNotify=true" >> /usr/share/applications/eclipse.desktop

            rm -r eclipse-jee-mars-1-linux-gtk.tar.gz

        else
            wget -c "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz&r=1" -O eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
            tar -zxvf eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
            mv eclipse /opt/eclipse
            chmod +x /opt/eclipse/eclipse
            chmod -R 777 /opt/eclipse

            #Cria arquivo executavel#
            touch /usr/bin/eclipse
            chmod 755 /usr/bin/eclipse
            echo "#!/bin/sh" >> /usr/bin/eclipse
            echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/eclipse
            echo "export ECLIPSE_HOME=/opt/eclipse" >> /usr/bin/eclipse
            echo "\$ECLIPSE_HOME/eclipse $*" >> /usr/bin/eclipse
            ln -s /usr/bin/eclipse /bin/eclipse

            #Cria icone do desktop#
            touch /usr/share/applications/eclipse.desktop
            echo "[Desktop Entry]" >> /usr/share/applications/eclipse.desktop
            echo "Encoding=UTF-8" >> /usr/share/applications/eclipse.desktop
            echo "Name=Eclipse" >> /usr/share/applications/eclipse.desktop
            echo "Comment=Eclipse IDE" >> /usr/share/applications/eclipse.desktop
            echo "Exec=eclipse" >> /usr/share/applications/eclipse.desktop
            echo "Icon=/opt/eclipse/icon.xpm" >> /usr/share/applications/eclipse.desktop
            echo "Terminal=false" >> /usr/share/applications/eclipse.desktop
            echo "Type=Application" >> /usr/share/applications/eclipse.desktop
            echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/eclipse.desktop
            echo "StartupNotify=true" >> /usr/share/applications/eclipse.desktop

            rm -r eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove IDE Eclipse
    removerEclipse(){
        rm -r /usr/bin/eclipse
        rm -r /bin/eclipse
        rm -r /opt/eclipse
        rm -r /usr/share/applications/eclipse.desktop

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala Google chrome
    instalarGoogleChrome(){
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            cd ~
            wget -c "https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb"
            dpkg -i google-chrome-stable_current_i386.deb
            apt-get -y install libappindicator1
            apt-get -f install
            dpkg -i google-chrome-stable_current_i386.deb
            rm -r google-chrome-stable_current_i386.deb
        else
            cd ~
            wget -c "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
            dpkg -i google-chrome-stable_current_amd64.deb
            apt-get -y install libappindicator1
            apt-get -f install
            dpkg -i google-chrome-stable_current_amd64.deb
            rm -r google-chrome-stable_current_amd64.deb
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove o navegador Google Chrome
    removerGoogleChrome(){
        apt-get -y purge google-chrome-stable

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala o Editor de texto Sublime-Text 3 e o Notepad++
    instalarSublime(){
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_i386.deb
            dpkg -i sublime-text_build-3083_i386.deb
            rm -r sublime-text_build-3083_i386.deb

        else
            wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
            dpkg -i sublime-text_build-3083_amd64.deb
            rm -r sublime-text_build-3083_amd64.deb
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    intalarNotePad(){
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            wget -c "https://notepad-plus-plus.org/repository/6.x/6.8.6/npp.6.8.6.Installer.exe"
            wine npp.6.8.6.Installer.exe
            rm -r npp.6.8.6.Installer.exe
        else
            wget -c "https://notepad-plus-plus.org/repository/6.x/6.8.6/npp.6.8.6.Installer.exe"
            wine npp.6.8.6.Installer.exe
            rm -r npp.6.8.6.Installer.exe
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }



    instalarDropbox(){
        #Instala Dropbox
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            wget -c "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_i386.deb" -O dropbox.deb
            dpkg -i dropbox.deb
            rm -r dropbox.deb

        else
            wget -c "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb" -O dropbox.deb
            dpkg -i dropbox.deb
            rm -r dropbox.deb
        fi

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    removerDropbox(){
        #Desistala Dropbox
        apt-get -y purge dropbox

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    # IDE de desenvolvimento PHP #
    instalarPhpStorm(){
        clear
        cd ~
        wget -c https://download.jetbrains.com/webide/PhpStorm-2017.1.3.tar.gz
        tar -zxvf PhpStorm-2017.1.3.tar.gz
        rm -f PhpStorm-2017.1.3.tar.gz

        mv PhpStorm-* /opt/PhpStorm
        chmod +x /opt/PhpStorm/bin/phpstorm.sh
        chmod -R 777 /opt/PhpStorm

        #Cria arquivo executavel#
        touch /usr/bin/phpstorm
        chmod 755 /usr/bin/phpstorm
        echo "#!/bin/sh" >> /usr/bin/phpstorm
        echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/phpstorm
        echo "export PHPSTORM_HOME=/opt/PhpStorm" >> /usr/bin/phpstorm
        echo "\"\$PHPSTORM_HOME/bin/phpstorm.sh\" %f" >> /usr/bin/phpstorm
        ln -s /usr/bin/phpstorm /bin/phpstorm

        #Cria icone do desktop#
        touch /usr/share/applications/phpstorm.desktop
        echo "[Desktop Entry]" >> /usr/share/applications/phpstorm.desktop
        echo "Encoding=UTF-8" >> /usr/share/applications/phpstorm.desktop
        echo "Name=PhpStorm" >> /usr/share/applications/phpstorm.desktop
        echo "Comment=PhpStorm IDE" >> /usr/share/applications/phpstorm.desktop
        echo "Exec=phpstorm" >> /usr/share/applications/phpstorm.desktop
        echo "Icon=/opt/PhpStorm/bin/webide.png" >> /usr/share/applications/phpstorm.desktop
        echo "Terminal=false" >> /usr/share/applications/phpstorm.desktop
        echo "Type=Application" >> /usr/share/applications/phpstorm.desktop
        echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/phpstorm.desktop
        echo "StartupNotify=true" >> /usr/share/applications/phpstorm.desktop

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

        rm -r /usr/bin/phpstorm
        rm -r /bin/phpstorm
        rm -r /usr/share/applications/phpstorm.desktop
        rm -r /opt/PhpStorm

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    # IDE de desenvolvimento JAVA #
    instalarIntelliJ(){
        cd ~
        wget -c https://download.jetbrains.com/idea/ideaIU-2016.1.3.tar.gz
        tar -zxvf ideaIU-2016.1.3.tar.gz
        rm -f ideaIU-2016.1.3.tar.gz

        mv idea-IU-* /opt/IntelliJ-IDEA
        chmod +x /opt/IntelliJ-IDEA/bin/idea.sh
        chmod -R 777 /opt/IntelliJ-IDEA

        #Cria arquivo executavel#
        touch /usr/bin/idea
        chmod 755 /usr/bin/idea
        echo "#!/bin/sh" >> /usr/bin/idea
        echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/idea
        echo "export IntelliJ_HOME=/opt/IntelliJ-IDEA" >> /usr/bin/idea
        echo "\"\$IntelliJ_HOME/bin/idea.sh\" %f" >> /usr/bin/idea
        ln -s /usr/bin/idea /bin/idea

        #Cria icone do desktop#
        touch /usr/share/applications/idea.desktop
        echo "[Desktop Entry]" >> /usr/share/applications/idea.desktop
        echo "Encoding=UTF-8" >> /usr/share/applications/idea.desktop
        echo "Name=IntelliJ-IDEA" >> /usr/share/applications/idea.desktop
        echo "Comment=IntelliJ-IDEA IDE" >> /usr/share/applications/idea.desktop
        echo "Exec=idea" >> /usr/share/applications/idea.desktop
        echo "Icon=/opt/IntelliJ-IDEA/bin/idea.png" >> /usr/share/applications/idea.desktop
        echo "Terminal=false" >> /usr/share/applications/idea.desktop
        echo "Type=Application" >> /usr/share/applications/idea.desktop
        echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/idea.desktop
        echo "StartupNotify=true" >> /usr/share/applications/idea.desktop

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
        rm -r /usr/bin/idea
        rm -r /bin/idea
        rm -r /opt/IntelliJ-IDEA
        rm -r /usr/share/applications/idea.desktop

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    # IDE de desenvolvimento JavaScript #
    instalarWebStorm(){
        clear
        cd ~
        wget -c https://download.jetbrains.com/webstorm/WebStorm-2016.1.3.tar.gz
        tar -zxvf WebStorm-2016.1.3.tar.gz
        rm -f WebStorm-2016.1.3.tar.gz

        mv WebStorm-* /opt/WebStorm
        chmod +x /opt/WebStorm/bin/webstorm.sh
        chmod -R 777 /opt/WebStorm

        #Cria arquivo executavel#
        touch /usr/bin/webstorm
        chmod 755 /usr/bin/webstorm
        echo "#!/bin/sh" >> /usr/bin/webstorm
        echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/webstorm
        echo "export WEBSTORM_HOME=/opt/WebStorm" >> /usr/bin/webstorm
        echo "\"\$WEBSTORM_HOME/bin/webstorm.sh\" %f" >> /usr/bin/webstorm
        ln -s /usr/bin/webstorm /bin/webstorm

        #Cria icone do desktop#
        touch /usr/share/applications/webstorm.desktop
        echo "[Desktop Entry]" >> /usr/share/applications/webstorm.desktop
        echo "Encoding=UTF-8" >> /usr/share/applications/webstorm.desktop
        echo "Name=WebStorm" >> /usr/share/applications/webstorm.desktop
        echo "Comment=WebStorm IDE" >> /usr/share/applications/webstorm.desktop
        echo "Exec=webstorm" >> /usr/share/applications/webstorm.desktop
        echo "Icon=/opt/WebStorm/bin/webstorm.svg" >> /usr/share/applications/webstorm.desktop
        echo "Terminal=false" >> /usr/share/applications/webstorm.desktop
        echo "Type=Application" >> /usr/share/applications/webstorm.desktop
        echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/webstorm.desktop
        echo "StartupNotify=true" >> /usr/share/applications/webstorm.desktop

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

        rm -r /usr/bin/webstorm
        rm -r /bin/webstorm
        rm -r /usr/share/applications/webstorm.desktop
        rm -r /opt/WebStorm

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


        # IDE de desenvolvimento C/C++ #
        instalarClion(){
            clear
            cd ~
            wget -c https://download.jetbrains.com/cpp/CLion-2017.1.1.tar.gz
            tar -zxvf CLion-2017.1.1.tar.gz
            rm -f CLion-2017.1.1.tar.gz

            mv clion-* /opt/clion
            chmod +x /opt/clion/bin/clion.sh
            chmod -R 777 /opt/clion

            #Cria arquivo executavel#
            touch /usr/bin/clion
            chmod 755 /usr/bin/clion
            echo "#!/bin/sh" >> /usr/bin/clion
            echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/clion
            echo "export CLION_HOME=/opt/clion" >> /usr/bin/clion
            echo "\"\$CLION_HOME/bin/clion.sh\" %f" >> /usr/bin/clion
            ln -s /usr/bin/clion /bin/clion

            #Cria icone do desktop#
            touch /usr/share/applications/clion.desktop
            echo "[Desktop Entry]" >> /usr/share/applications/clion.desktop
            echo "Encoding=UTF-8" >> /usr/share/applications/clion.desktop
            echo "Name=Clion" >> /usr/share/applications/clion.desktop
            echo "Comment=Clion IDE" >> /usr/share/applications/clion.desktop
            echo "Exec=clion" >> /usr/share/applications/clion.desktop
            echo "Icon=/opt/clion/bin/clion.svg" >> /usr/share/applications/clion.desktop
            echo "Terminal=false" >> /usr/share/applications/clion.desktop
            echo "Type=Application" >> /usr/share/applications/clion.desktop
            echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/clion.desktop
            echo "StartupNotify=true" >> /usr/share/applications/clion.desktop

            if [[ $1 == "op" ]]; then
                mostrarMenuOpcoes
            fi
        }



        removerClion(){
            clear
            echo "    Será removido a IDE de desenvolvimento PhpStorm-10"
            echo "    Deseja continuar? Sim[s], Não[n]"
            read op

            if [ ! $op == "s" ]; then
                mostrarMenuOpcoes
            fi

            rm -r /usr/bin/clion
            rm -r /bin/clion
            rm -r /usr/share/applications/clion.desktop
            rm -r /opt/clion

            if [[ $1 == "op" ]]; then
                mostrarMenuOpcoes
            fi
        }



    #Converte o arquivo .rpm para .deb e instala no caminho padrão do oracle
    instalarOracleInstantClient(){

        cd ~
        versao=$(uname -i)
        if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
            wget ftp://ftp.zanthus.com.br:2142/interno/Tairo/intant_client_12.1_32bits/instant_client_12.1.tar.gz --ftp-user=$userFtp --ftp-password=$passwordFtp .

        else
            wget ftp://ftp.zanthus.com.br:2142/interno/Tairo/intant_client_12.1_64bits/instant_client_12.1.tar.gz --ftp-user=$userFtp --ftp-password=$passwordFtp .
        fi

        #Verifica se ultima ação foi efetuada com sucesso
        if [ -e instant_client_12.1.tar.gz ]; then

            #Descompacta intant Client
            tar -zxvf instant_client_12.1.tar.gz

            #Instala pacotes
            dpkg -i oracle-instantclient12.1-basic.deb
            dpkg -i oracle-instantclient12.1-devel.deb
            dpkg -i oracle-instantclient12.1-jdbc.deb
            dpkg -i oracle-instantclient12.1-odbc.deb
            dpkg -i oracle-instantclient12.1-sqlplus_.deb
            dpkg -i oracle-instantclient12.1-tools.deb

            #Remove pacotes pacotes
            rm -r oracle-instantclient12.1-basic.deb
            rm -r oracle-instantclient12.1-devel.deb
            rm -r oracle-instantclient12.1-jdbc.deb
            rm -r oracle-instantclient12.1-odbc.deb
            rm -r oracle-instantclient12.1-sqlplus.deb
            rm -r oracle-instantclient12.1-tools.deb
            rm -r instant_client_12.1.tar.gz

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

        apt-get -y purge oracle-instantclient12.1-basic
        apt-get -y purge oracle-instantclient12.1-devel
        apt-get -y purge oracle-instantclient12.1-jdbc
        apt-get -y purge oracle-instantclient12.1-odbc
        apt-get -y purge oracle-instantclient12.1-sqlplus
        apt-get -y purge oracle-instantclient12.1-tools
        rm -r /usr/lib/oracle

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
        rm -f -r /Zanthus
        rm -f -r /usr/share/applications/pdv.desktop
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
        wget -c ftp://ftp.zanthus.com.br:2142/interno/Tairo/Zanthus_pdv.tar.gz --ftp-user=$userFtp --ftp-password=$passwordFtp
        tar -zxvf Zanthus_pdv.tar.gz
        rm -f Zanthus_pdv.tar.gz
        mv Zanthus /Zanthus

        # Abre o diretório
        cd /Zanthus/Zeus/lib

        # baixa as Libs 32bits atualizadas do ftp
        cd /Zanthus/Zeus/lib
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so/*
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/ZANSINC/Linux/lib/*

        # Cria o diretório e baixa as libs 64bits
        criarDiretorio "/Zanthus/Zeus/lib_64"
        cd /Zanthus/Zeus/lib_64
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/*

        criarDiretorio "/Zanthus/Zeus/lib_co5"
        cd /Zanthus/Zeus/lib_co5
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_co5/*

        criarDiretorio "/Zanthus/Zeus/lib_ubu"
        cd /Zanthus/Zeus/lib_ubu
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_ubu/*

        # Nomes das variáveis
        KC_ZMAN_CZ_EXL="KC_ZMAN_1_X_104_276_CZ.EXL"
        KC_ZMAN_CZ_TARGZ="KC_ZMAN_1_X_104_276_CZ.tar.gz"

        criarDiretorio "/Zanthus/Zeus/lib_kernz"
        cd /Zanthus/Zeus/lib_kernz
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/v_1_X_104/$KC_ZMAN_CZ_EXL
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/v_1_X_104/$KC_ZMAN_CW_EXL
        wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so
        wget -c ftp://ftp.zanthus.com.br:2142/interno/Tairo/Kernz_php5.6/kernz.so --ftp-user=$userFtp --ftp-password=$passwordFtp
        wget -c ftp://ftp.zanthus.com.br:2142/interno/Tairo/mssql/php5.6/mssql.so --ftp-user=$userFtp --ftp-password=$passwordFtp
        wget -c ftp://ftp.zanthus.com.br:2142/interno/Tairo/Kernz_php5.6/ZendGuardLoader.so --ftp-user=$userFtp --ftp-password=$passwordFtp

        mv $KC_ZMAN_CZ_EXL $KC_ZMAN_CZ_TARGZ
        mv $KC_ZMAN_CW_EXL $KC_ZMAN_CW_TARGZ

        tar -zxvf $KC_ZMAN_CZ_TARGZ

        #Remove o pacote baixado
        rm -f -r $KC_ZMAN_CZ_TARGZ

        ln -s -f /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.6
        ln -s -f /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/x86_64-linux-gnu/libssl.so.6

        echo -e "\n" >> /etc/ld.so.conf
        echo -e "/Zanthus" >> /etc/ld.so.conf
        echo -e "/Zanthus/Zeus/lib" >> /etc/ld.so.conf
        echo -e "/Zanthus/Zeus/lib_64" >> /etc/ld.so.conf
        echo -e "/Zanthus/Zeus/lib_kernz" >> /etc/ld.so.conf
        echo -e "/Zanthus/Zeus/lib_co5" >> /etc/ld.so.conf
        echo -e "/Zanthus/Zeus/lib_ubu" >> /etc/ld.so.conf
        echo -e "/Zanthus/Zeus/pdvJava" >> /etc/ld.so.conf

        ldconfig
        chmod -R 777 /Zanthus/

        #Cria icone do desktop#
        chmod +x /Zanthus/Zeus/pdvJava/pdvJava2
        touch /usr/share/applications/pdv.desktop
        echo "[Desktop Entry]" >> /usr/share/applications/pdv.desktop
        echo "Encoding=UTF-8" >> /usr/share/applications/pdv.desktop
        echo "Name=PDV" >> /usr/share/applications/pdv.desktop
        echo "Comment=PDV Zanthus" >> /usr/share/applications/pdv.desktop
        echo -e "Exec=gnome-terminal -x bash -c \"cd /Zanthus/Zeus/pdvJava_159/ && echo $usuarioSenha | sudo -S ./lnx_virt\"" >> /usr/share/applications/pdv.desktop
        echo "Icon=/Zanthus/Zeus/icons/logo_zanthus.png" >> /usr/share/applications/pdv.desktop
        echo "Terminal=false" >> /usr/share/applications/pdv.desktop
        echo "Type=Application" >> /usr/share/applications/pdv.desktop
        echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/pdv.desktop
        echo "StartupNotify=true" >> /usr/share/applications/pdv.desktop

        #Insere a Kernz no .ini do Php e Apache para php5.6
        if [[ $phpVersion == 1 ]]; then
            pathkernz="/Zanthus/Zeus/lib_kernz/kernz.so"
            if [[ -e $pathkernz && -e /etc/php/5.6/apache2/php.ini ]]; then
                echo "extension=$pathkernz" >> /etc/php/5.6/apache2/php.ini
                echo "extension=$pathkernz" >> /etc/php/5.6/cli/php.ini
            fi
            pathZendGuardLoader="/Zanthus/Zeus/lib_kernz/ZendGuardLoader.so"
            if [[ -e $pathZendGuardLoader && -e /etc/php/5.6/apache2/php.ini ]]; then
                echo "zend_extension=$pathZendGuardLoader" >> /etc/php/5.6/apache2/php.ini
                echo "zend_extension=$pathZendGuardLoader" >> /etc/php/5.6/cli/php.ini
            fi
            pathZendOPcache="/Zanthus/Zeus/lib_kernz/opcache.so"
            if [[ -e $pathZendOPcache && -e /etc/php/5.6/apache2/php.ini ]]; then
                echo "zend_extension=$pathZendOPcache" >> /etc/php/5.6/apache2/php.ini
                echo "zend_extension=$pathZendOPcache" >> /etc/php/5.6/cli/php.ini
            fi
            pathMssql="/Zanthus/Zeus/lib_kernz/mssql.so"
            if [[ -e $pathMssql && -e /etc/php/5.6/apache2/php.ini ]]; then
                echo "extension=$pathMssql" >> /etc/php/5.6/apache2/php.ini
                echo "extension=$pathMssql" >> /etc/php/5.6/cli/php.ini
            fi
        fi

        #Insere a Kernz no .ini do Php e Apache para ph7.0
        if [[ $phpVersion == 2 ]]; then
            pathkernz="/Zanthus/Zeus/lib_kernz/kernz.so"
            if [[ -e $pathkernz && -e /etc/php/7.0/apache2/php.ini ]]; then
                echo "extension=$pathkernz" >> /etc/php/7.0/apache2/php.ini
                echo "extension=$pathkernz" >> /etc/php/7.0/cli/php.ini
            fi
            pathZendGuardLoader="/Zanthus/Zeus/lib_kernz/ZendGuardLoader.so"
            if [[ -e $pathZendGuardLoader && -e /etc/php/7.0/apache2/php.ini ]]; then
                echo "zend_extension=$pathZendGuardLoader" >> /etc/php/7.0/apache2/php.ini
                echo "zend_extension=$pathZendGuardLoader" >> /etc/php/7.0/cli/php.ini
            fi
            pathZendOPcache="/Zanthus/Zeus/lib_kernz/opcache.so"
            if [[ -e $pathZendOPcache && -e /etc/php/5.6/apache2/php.ini ]]; then
                echo "zend_extension=$pathZendOPcache" >> /etc/php/5.6/apache2/php.ini
                echo "zend_extension=$pathZendOPcache" >> /etc/php/5.6/cli/php.ini
            fi
            pathMssql="/Zanthus/Zeus/lib_kernz/mssql.so"
            if [[ -e $pathMssql && -e /etc/php/7.0/apache2/php.ini ]]; then
                echo "extension=$pathMssql" >> /etc/php/7.0/apache2/php.ini
                echo "extension=$pathMssql" >> /etc/php/7.0/cli/php.ini
            fi
        fi

        service apache2 restart

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
        ########################### Libs da Zanthus #################################
    }

    removerLibsZanthus(){
        ############### Libs ZAnthus #############
        apt-get -y purge zanthus-server-debian
        rm -f -r /Zanthus
        rm -f -r /usr/share/applications/pdv.desktop
        ############### Libs ZAnthus #############

        #Reconfigura carregamento de bibliotecas
        ldconfig

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }



    #instala repositorio para Spotify - programador também gosta de música :)
    instalarSpotify(){

        apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
        echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
        apt-get update

        wget -c "https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb"
        dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
        apt-get -y install spotify-client-0.9.17

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Rmove cliente de audio do spotify
    removerSpotify(){
        apt-get -y purge spotify-client
        apt-get -y autoremove
        add-apt-repository  --remove 'deb http://repository.spotify.com stable non-free'

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }


    #Instala virtualbox para rodar maquinas virtuais
    instalarVirtualBox(){
        apt-get -y install virtualbox
        wget -c http://download.virtualbox.org/virtualbox/5.0.18/Oracle_VM_VirtualBox_Extension_Pack-5.0.18-106667.vbox-extpack
        virtualbox Oracle_VM_VirtualBox_Extension_Pack-5.0.18-106667.vbox-extpack
        rm -f -r Oracle_VM_VirtualBox_Extension_Pack-5.0.18-106667.vbox-extpack

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Desistala virtualbox para rodar maquinas virtuais
    removerVirtualBox(){
        apt-get -y purge virtualbox

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #instala repositorio para Java 8
    instalarJava(){
        add-apt-repository  -y ppa:webupd8team/java
        apt-get update
        #Instala java 8
        apt-get -y install oracle-java8-installer

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove repositorio para Java 8
    removerJava(){
        add-apt-repository  -r ppa:webupd8team/java
        apt-get update
        #Desistala java 8
        apt-get -y purge oracle-java8-installer

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala wine para rodar programas do windows
    instalarWine(){
        apt-get -y install wine

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Remove wine para rodar programas do windows
    removerWine(){
        apt-get -y purge wine

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #instala repositorio para Android Studio
    instalarAndroidStudio(){
        apt-add-repository -y ppa:paolorotolo/android-studio
        apt-get update
        #Instala Android Studio IDE Android
        apt-get -y install android-studio

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    removerAndroidStudio(){
        #Remove repositorio para Android Studio
        apt-add-repository -r ppa:paolorotolo/android-studio
        apt-get update
        #Desistala Android Studio IDE Android
        apt-get -y purge android-studio

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Instala Steam
    instalarSteam(){
        apt-get -y install steam

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Desistala Steam
    removerSteam(){
        apt-get -y purge steam

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi

    }

    #Monta uma partição de Swap de 8GB
    instalarSwap(){
        dd if=/dev/zero of=/swapfile bs=1024 count=8388608
        mkswap /swapfile
        echo "/swapfile swap swap defaults 0 0 " >> /etc/fstab

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    #Desabilita Swap
    desabilitarSwap(){
        swapoff /swapfile
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
        add-apt-repository  -y ppa:ondrej/php
        apt-get update
        apt-get install -y apache2
        apt-get install -y php5.6
        apt-get install -y php5.6-dev
        apt-get install -y php5.6-curl
        apt-get install -y php5.6-json
        apt-get install -y php5.6-ldap
        apt-get install -y php5.6-odbc
        apt-get install -y php5.6-pgsql
        apt-get install -y php5.6-mcrypt
        apt-get install -y php5.6-sybase
        apt-get install -y php5.6-xml
        apt-get install -y php5.6-zip
        apt-get install -y php5.6-soap
        apt-get install -y php5.6-gd
        apt-get install -y php5.6-sqlite3
        apt-get install -y php-memcached
        apt-get install -y libapache2-mod-php5.6
        apt-get install -y php5.6-bcmath

        instalarOracleInstantClient

        ###################  Instala a .so do oracle ######################
        pecl  uninstall oci8
        pecl  install oci8-2.0.11
        #Verifica se o caminho padrão para a pasta oracle existe
        pathOci8="/usr/lib/php/20131226/oci8.so"
        if [ -e $pathOci8 ]; then
            echo "extension=$pathOci8 " >> /etc/php/5.6/apache2/php.ini
            echo -e "\n" >> /etc/php/5.6/apache2/php.ini
            echo "extension=$pathOci8" >> /etc/php/5.6/cli/php.ini
            echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi

        ################### Instala a .so do Xdebug ########################
        pecl  uninstall xdebug
        pecl  install xdebug
        pathxdebug="/usr/lib/php/20131226/xdebug.so"

        if [[ -e $pathxdebug && -e /etc/php/5.6/apache2/php.ini ]]; then
            echo "[XDebug]" >> /etc/php/5.6/apache2/php.ini
            echo "zend_extension=$pathxdebug" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.default_enable = 1" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.show_exception_trace = 1" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.show_local_vars = 1" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.var_display_max_data   = -1" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.max_nesting_level = 250" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.remote_enable = 1" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.remote_port = 9000" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.remote_autostart = 1" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.remote_handler=dbgp" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.remote_connect_back = 1" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.idekey=\"PHPSTORM\"" >> /etc/php/5.6/apache2/php.ini
            echo "xdebug.remote_host=127.0.0.1" >> /etc/php/5.6/apache2/php.ini
            echo -e "\n" >> /etc/php/5.6/apache2/php.ini

            echo "[XDebug]" >> /etc/php/5.6/cli/php.ini
            echo "zend_extension=$pathxdebug" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.default_enable = 1" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.show_exception_trace = 1" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.show_local_vars = 1" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.var_display_max_data   = -1" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.max_nesting_level = 250" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.remote_enable = 1" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.remote_port = 9000" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.remote_autostart = 1" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.remote_handler=dbgp" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.remote_connect_back = 1" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.idekey=\"PHPSTORM\"" >> /etc/php/5.6/cli/php.ini
            echo "xdebug.remote_host=127.0.0.1" >> /etc/php/5.6/cli/php.ini
            echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi


        ################### Instala a .so do dbase ########################
        pecl  uninstall dbase
        pecl  install dbase
        pathdbase="/usr/lib/php/20131226/dbase.so"
        if [[ -e $pathdbase && -e /etc/php/5.6/apache2/php.ini ]]; then
            echo "extension=$pathdbase" >> /etc/php/5.6/apache2/php.ini
            echo -e "\n" >> /etc/php/5.6/apache2/php.ini
            echo "extension=$pathdbase" >> /etc/php/5.6/cli/php.ini
            echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi

        ################### Instala a mssql.so ########################
        pathMssql="/Zanthus/Zeus/lib/mssql.so"
        if [[ -e $pathMssql && -e /etc/php/5.6/apache2/php.ini ]]; then
            echo "extension=$pathMssql" >> /etc/php/5.6/apache2/php.ini
            echo -e "\n" >> /etc/php/5.6/apache2/php.ini
            echo "extension=$pathMssql" >> /etc/php/5.6/cli/php.ini
            echo -e "\n" >> /etc/php/5.6/cli/php.ini
        fi

        #Configura Timezone e charset
        echo "date.timezone = America/Sao_Paulo" >> /etc/php/5.6/apache2/php.ini
        echo -e "\n" >> /etc/php/5.6/apache2/php.ini
        echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/5.6/apache2/php.ini
        echo -e "\n" >> /etc/php/5.6/apache2/php.ini

        #Configura Timezone e charset
        echo "date.timezone = America/Sao_Paulo" >> /etc/php/5.6/cli/php.ini
        echo -e "\n" >> /etc/php/5.6/cli/php.ini
        echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/5.6/cli/php.ini
        echo -e "\n" >> /etc/php/5.6/cli/php.ini

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }

    instalarPHP7(){
        add-apt-repository  -y ppa:ondrej/php
        apt-get update
        apt-get install -y apache2
        apt-get install -y php
        apt-get install -y php-dev
        apt-get install -y php-curl
        apt-get install -y php-json
        apt-get install -y php-ldap
        apt-get install -y php-odbc
        apt-get install -y php-pgsql
        apt-get install -y php-mcrypt
        apt-get install -y php-sybase
        apt-get install -y php-xml
        apt-get install -y php-zip
        apt-get install -y php-soap
        apt-get install -y php-gd
        apt-get install -y php-sqlite3
        apt-get install -y php-memcached
        apt-get install -y libapache2-mod-php

        instalarOracleInstantClient

        ###################  Instala a .so do oracle ######################
        pecl  install oci8
        #Verifica se o caminho padrão para a pasta oracle existe
        pathOci8="/usr/lib/php/20151012/oci8.so"
        if [[ -e $pathOci8 && -e /etc/php/7.0/apache2/php.ini ]]; then
            echo "extension=$pathOci8" >> /etc/php/7.0/apache2/php.ini
            echo -e "\n" >> /etc/php/7.0/apache2/php.ini
            echo "extension=$pathOci8" >> /etc/php/7.0/cli/php.ini
            echo -e "\n" >> /etc/php/7.0/cli/php.ini
        fi

        ################### Instala a .so do Xdebug ########################
        pecl  install xdebug
        pathxdebug="/usr/lib/php/20151012/xdebug.so"

        if [[ -e $pathxdebug && -e /etc/php/7.0/apache2/php.ini ]]; then
            echo "[XDebug]" >> /etc/php/7.0/apache2/php.ini
            echo "zend_extension=$pathxdebug" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.default_enable = 1" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.show_exception_trace = 1" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.show_local_vars = 1" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.var_display_max_data   = -1" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.max_nesting_level = 250" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.remote_enable = 1" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.remote_port = 9000" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.remote_autostart = 1" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.remote_handler=dbgp" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.remote_connect_back = 1" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.idekey=\"PHPSTORM\"" >> /etc/php/7.0/apache2/php.ini
            echo "xdebug.remote_host=127.0.0.1" >> /etc/php/7.0/apache2/php.ini
            echo -e "\n" >> /etc/php/7.0/apache2/php.ini

            echo "[XDebug]" >> /etc/php/7.0/cli/php.ini
            echo "zend_extension=$pathxdebug" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.default_enable = 1" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.show_exception_trace = 1" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.show_local_vars = 1" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.var_display_max_data   = -1" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.max_nesting_level = 250" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.remote_enable = 1" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.remote_port = 9000" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.remote_autostart = 1" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.remote_handler=dbgp" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.remote_connect_back = 1" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.idekey=\"PHPSTORM\"" >> /etc/php/7.0/cli/php.ini
            echo "xdebug.remote_host=127.0.0.1" >> /etc/php/7.0/cli/php.ini
            echo -e "\n" >> /etc/php/7.0/cli/php.ini

        fi


        ################### Instala a .so do dbase ########################
        pecl  install dbase
        pathdbase="/usr/lib/php/20151012/dbase.so"
        if [[ -e $pathdbase && -e /etc/php/7.0/apache2/php.ini ]]; then
            echo "extension=$pathdbase" >> /etc/php/7.0/apache2/php.ini
            echo -e "\n" >> /etc/php/7.0/apache2/php.ini
            echo "extension=$pathdbase" >> /etc/php/7.0/cli/php.ini
            echo -e "\n" >> /etc/php/7.0/cli/php.ini
        fi

        #Configura Timezone e charset
        echo "date.timezone = America/Sao_Paulo" >> /etc/php/7.0/apache2/php.ini
        echo -e "\n" >> /etc/php/7.0/apache2/php.ini
        echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/7.0/apache2/php.ini
        echo -e "\n" >> /etc/php/7.0/apache2/php.ini

        #Configura Timezone e charset
        echo "date.timezone = America/Sao_Paulo" >> /etc/php/7.0/cli/php.ini
        echo -e "\n" >> /etc/php/7.0/cli/php.ini
        echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php/5.6/cli/php.ini
        echo -e "\n" >> /etc/php/7.0/cli/php.ini

#       Compilando lib GD para imagens
#       apt-get install libjpeg62-dev
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
        apt-get -y install libaio1
        apt-get -y install libaio1-dbg
        apt-get -y install unixodbc

        #Baixo os arquivos e descompacto
        wget -c ftp://ftp.zanthus.com.br:2142/interno/Tairo/oracle_11g_64bits/oracle-xe_11.2.0-2_amd64.deb --ftp-user=$userFtp --ftp-password=$passwordFtp

        #Cria arquivo de configuração do oracle
        touch /sbin/chkconfig
        echo -e "#!/bin/bash"  >> /sbin/chkconfig
        echo -e "# Oracle 11gR2 XE installer chkconfig hack for Ubuntu"  >> /sbin/chkconfig
        echo -e "file=/etc/init.d/oracle-xe"  >> /sbin/chkconfig
        echo -e "if [[ ! \`tail -n1 \$file | grep INIT\` ]]; then"  >> /sbin/chkconfig
        echo -e "echo >> \$file"  >> /sbin/chkconfig
        echo -e "echo '### BEGIN INIT INFO' >> \$file"  >> /sbin/chkconfig
        echo -e "echo '# Provides: OracleXE' >> \$file"  >> /sbin/chkconfig
        echo -e "echo '# Required-Start: \$remote_fs \$syslog' >> \$file"  >> /sbin/chkconfig
        echo -e "echo '# Required-Stop: \$remote_fs \$syslog' >> \$file"  >> /sbin/chkconfig
        echo -e "echo '# Default-Start: 2 3 4 5' >> \$file"  >> /sbin/chkconfig
        echo -e "echo '# Default-Stop: 0 1 6' >> \$file"  >> /sbin/chkconfig
        echo -e "echo '# Short-Description: Oracle 11g Express Edition' >> \$file"  >> /sbin/chkconfig
        echo -e "echo '### END INIT INFO' >> \$file"  >> /sbin/chkconfig
        echo -e "fi"  >> /sbin/chkconfig
        echo -e "update-rc.d oracle-xe defaults 80 01"  >> /sbin/chkconfig

        chmod +x /sbin/chkconfig
        chmod 755 /sbin/chkconfig

        # Adiciona parametros para o Kernel
        touch /etc/sysctl.d/60-oracle.conf
        echo -e "# Oracle 11g XE kernel parameters" >> /etc/sysctl.d/60-oracle.conf
        echo -e "fs.file-max=6815744" >> /etc/sysctl.d/60-oracle.conf
        echo -e "net.ipv4.ip_local_port_range=9000 65000" >> /etc/sysctl.d/60-oracle.conf
        echo -e "kernel.sem=250 32000 100 128" >> /etc/sysctl.d/60-oracle.conf
        echo -e "kernel.shmmax=536870912" >> /etc/sysctl.d/60-oracle.conf

        service procps start
        sysctl -q fs.file-max

        #Cria script para evitar erro de memoria do oracle
        touch /etc/rc2.d/S01shm_load
        echo -e "#!/bin/sh" >> /etc/rc2.d/S01shm_load
        echo -e "case \"\$1\" in" >> /etc/rc2.d/S01shm_load
        echo -e "start) mkdir /var/lock 2>/dev/null" >> /etc/rc2.d/S01shm_load
        echo -e "       touch /var/lock/listener" >> /etc/rc2.d/S01shm_load
        echo -e "       rm /dev/shm 2>/dev/null" >> /etc/rc2.d/S01shm_load
        echo -e "       mkdir /dev/shm 2>/dev/null" >> /etc/rc2.d/S01shm_load
        echo -e "       mount -t tmpfs shmfs -o size=4096m /dev/shm ;;" >> /etc/rc2.d/S01shm_load
        echo -e "*) echo error" >> /etc/rc2.d/S01shm_load
        echo -e "     exit 1 ;;" >> /etc/rc2.d/S01shm_load
        echo -e "esac" >> /etc/rc2.d/S01shm_load

        chmod +x /etc/rc2.d/S01shm_load
        chmod 755 /etc/rc2.d/S01shm_load

        ln -s /usr/bin/awk /bin/awk
        mkdir /var/lock/subsys
        touch /var/lock/subsys/listener

        #Instala realmente o .deb
        dpkg --install oracle-xe_11.2.0-2_amd64.deb

        #Chama o configurador do oracle
        /etc/init.d/oracle-xe configure

        echo -e "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe" >> /etc/bash.bashrc
        echo -e "export ORACLE_SID=XE" >> /etc/bash.bashrc
        echo -e "export NLS_LANG='BRAZILIAN PORTUGUESE_BRAZIL.WE8MSWIN1252'" >> /etc/bash.bashrc
        echo -e "export ORACLE_BASE=/u01/app/oracle" >> /etc/bash.bashrc
        echo -e "export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:\$LD_LIBRARY_PATH" >> /etc/bash.bashrc
        echo -e "export PATH=\$ORACLE_HOME/bin:\$PATH" >> /etc/bash.bashrc

        source /etc/bash.bashrc

        usermod -a -G dba oracle
        usermod -a -G dba $usuario

        service oracle-xe start

#       /** Altera as permissões para o usuario e cria o TABLESPACE */
#       mkdir /u01/app/oracle/dbs_to_load && chmod -R 777 /u01/app/oracle/dbs_to_load
#       create directory db_dumps  as '/u01/app/oracle/dbs_to_load';
#       ALTER SYSTEM SET DB_CREATE_FILE_DEST='/u01/app/oracle/oradata/XE' SCOPE=BOTH;
#       create tablespace zeusretail;
#       Alter Session Set NLS_LANGUAGE = "PORTUGUESE";
#       Alter Session Set NLS_TERRITORY = "BRAZIL";
#       Alter System Set NLS_LANGUAGE='BRAZILIAN PORTUGUESE' scope=spfile;
#       Alter System Set NLS_TERRITORY='BRAZIL' SCOPE=SPFILE;
#       Update sys.props$ set value$ = 'WE8MSWIN1252' where name = 'NLS_NCHAR_CHARACTERSET';
#       Update sys.props$ set value$ = 'WE8MSWIN1252' where name = 'NLS_CHARACTERSET';
#       Update sys.props$ set value$ = 'BRAZILIAN PORTUGUESE' where name = 'NLS_LANGUAGE';
#       Update sys.props$ set value$ = 'BRAZIL' where name = 'NLS_TERRITORY';

#       grant connect to desenvolvimento;
#       grant resource to desenvolvimento;
#       ALTER USER desenvolvimento QUOTA 100M ON zeusretail;
#       GRANT UNLIMITED TABLESPACE TO desenvolvimento;
#       grant read,write on directory db_dumps to desenvolvimento;
#       grant create any directory to desenvolvimento;
#       grant restricted session to desenvolvimento;
#       grant imp_full_database to desenvolvimento;

#       Como saber o charset do banco
#       SELECT * FROM NLS_database_parameters
#
#       Para alterar o charset do banco oracle .
#       No servidor, entre no SqlPlus com o usuário sys as sysdba, depois derruba o banco, altera o charset e inicia o banco novamente. Segue os comandos a baixo
#
##      sqlplus /nolog
#
#       conn sys as sysdba;
#
#       SHUTDOWN IMMEDIATE;
#       STARTUP RESTRICT;
#       Alter database character set INTERNAL_USE WE8MSWIN1252;
#       SHUTDOWN IMMEDIATE;
#       STARTUP;

#       exportar base de dados completos
#       expdp system DIRECTORY=db_dumps DUMPFILE=desenvolvimento.dmp FULL=y logfile=data_pump_dir:export.log

#       exportar base de dados de schema
#       expdp desenvolvimento DIRECTORY=db_dumps DUMPFILE=desenvolvimento.dmp SCHEMAS=desenvolvimento logfile=data_pump_dir:exportDB.log

#       importar base de dados
#       impdp desenvolvimento DIRECTORY=db_dumps DUMPFILE=desenvolvimento.dmp SCHEMAS=desenvolvimento sqlfile=data_pump_dir:sqlddl.sql logfile=data_pump_dir:exportDB.log

        rm -rf oracle-xe_11.2.0-2_amd64.deb
    }

    removerOracleDataBase11G(){

        /etc/init.d/oracle-xe stop
        ps -ef | grep oracle | grep -v grep | awk '{print $2}' | xargs kill
        dpkg --purge oracle-xe
        rm -rf /u01
        rm -rf /etc/default/oracle-xe
        update-rc.d -f oracle-xe remove
        rm -rf /etc/oratab
        rm -rf /etc/init.d/oracle-xe
        rm -rf /var/lock/subsys
        rm -rf /bin/awk
        rm -rf /etc/rc2.d/S01shm_load
        rm -rf /etc/sysctl.d/60-oracle.conf
        rm -rf /sbin/chkconfig

    }

    instalarComposer(){
        capturaUsuario
        #Baixa o composer
        curl -s https://getcomposer.org/installer | php
        #Move o Composer
        mv composer.phar /usr/local/bin/composer
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
        rm -rf /usr/local/bin/composer
        rm -rm /home/$usuario/.composer
    }

    teste(){
        clear
        echo "    Teste..."

        if [[ $1 == "op" ]]; then
            mostrarMenuOpcoes
        fi
    }
    
    installJavaDeepin(){
        apt-get install software-properties-common
        apt-get install python-software-properties
        apt-get update
        echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
        echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
        apt-get update
        apt-get install oracle-java8-installer
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

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
    clear
    echo "    #################################################################################"
    echo "    #   Scrypt para instalação de ambiente de desenvolvimento PHP-ANDROID-C-JAVA    #"
    echo "    #                         - TAIRO ROBERTO M. ASSUNÇÃO -                         #"
    echo "    #                                                                               #"
    echo "    #################################################################################"
    echo -e "\n"

mostrarMenuOpcoes(){
    clear
    echo "    #######################################################################################"
    echo "    #                            Digite a opção desejada                                  #"
    echo "    #-------------------------------------------------------------------------------------#"
    echo "    #  1 - Instalar 'Ambiente desenvolvimento'     PHP, Apache, Mysql, Java e etc.        #"
    echo "    #-------------------------------------------------------------------------------------#"
    echo "    #  2 - Remover  'Ambiente desenvolvimento'     PHP, Apache, Mysql, Java e etc.        #"
    echo "    #-------------------------------------------------------------------------------------#"
    echo "    #  3 - Instalar 'Oracle Instant Client'   Bibliotecas para conexão com banco          #"
    echo "    #  4 - Remover  'Oracle Instant Client                                                #"
    echo "    #-------------------------------------------------------------------------------------#"
    echo "    #  5 - Instalar 'Servidor'        Ambiente Servidor Zanthus Linux Ubuntu/Debian       #"
    echo "    #  6 - Remover  'Servidor Ubuntu'                                                     #"
    echo "    #-------------------------------------------------------------------------------------#"
    echo "    #  7 - Instalar 'Servidor'        Ambiente Servidor Zanthus Linux CentOs              #"
    echo "    #  8 - Remover  'Servidor CentOs'                                                     #"
    echo "    #-------------------------------------------------------------------------------------#"
    echo "    #  0 - Mostra Menu de opções                                                          #"
    echo "    #-------------------------------------------------------------------------------------#"
    echo "    #  Obs: Digite a opção --help, para mostar menu de ajuda     ex:  --help              #"
    echo "    #######################################################################################"
    echo -e "\n"
    read opcao

    if [[ $opcao == "--help" || $opcao == "help" || $opcao == "ajuda" ]]; then
        mostrarAjuda
    else
        case $opcao in
         0) mostrarMenuOpcoes  ;;
         1) instalarAmbienteDesenvolvimento ;;
         2) removerAmbienteDesenvolvimento ;;
         3) instalarOracleInstantClient ;;
         4) removerOracleInstantClient ;;
         5) instalarAmbienteServidorUbuntu ;;
         6) removerAmbienteServidorUbuntu ;;
         7) instalarAmbienteServidorCentOs  ;;
         8) removerAmbienteServidorCentOs  ;;

         #Instalação de IDE
         9) instalarPhpStorm "op";;
        10) removerPhpStorm "op";;
        11) instalarIntelliJ "op";;
        12) removerIntelliJ "op";;
        13) instalarClion "op";;
        14) removerClion "op";;

        #Ambiente Tairo com PhpStorm, Intellij-IDEA e Clion
        15) instalarAmbienteDesenvolvimento "storm" "idea" "clion" ;;
        16) removerAmbienteDesenvolvimento "storm" "idea" "clion" ;;
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
    echo "    Para instalar a lib oci8.so certifique-se de que o Oracle Instant Client esteja instalado!"

    echo -e "\n"
    echo "Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    capturaUsuario

    cd ~
    add-apt-repository -y ppa:ondrej/php5-5.6
    apt-get update
    apt-get install -y php5
    apt-get install -y apache2
    apt-get install -y mysql-server
    apt-get install -y phpmyadmin
    apt-get install -y postgresql
    apt-get install -y subversion
    apt-get install -y php5-dev
    apt-get install -y php5-curl
    apt-get install -y php5-json
    apt-get install -y php5-ldap
    apt-get install -y php5-mssql
    apt-get install -y php5-odbc
    apt-get install -y php5-pgsql
    apt-get install -y php5-mcrypt
    apt-get install -y php5-sybase
    apt-get install -y php5-memcached
    apt-get install -y php5-openssl
    apt-get install -y memcached
    apt-get install -y sendmail
    apt-get install -y unetbootin

    ###################  Instala a .so do oracle ######################
    pecl install oci8
    #Verifica se o caminho padrão para a pasta oracle existe
    pathInstantClient = "/usr/lib/php5/20131226/oci8.so"
    if [ -e $pathInstantClient ]; then
        echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/apache2/php.ini
        echo -e "\n" >> /etc/php5/apache2/php.ini
        echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/cli/php.ini
        echo -e "\n" >> /etc/php5/cli/php.ini
    fi

    ################### Instala a .so do Xdebug ########################
    pecl install xdebug
    echo -e "Digite o caminho para a xdebug.so \n"
    read pathxdebug

    if [ -e $pathxdebug ]; then
        echo "[XDebug]" >> /etc/php5/apache2/php.ini
        echo "zend_extension=$pathxdebug" >> /etc/php5/apache2/php.ini
        echo "xdebug.default_enable = 1" >> /etc/php5/apache2/php.ini
        echo "xdebug.show_exception_trace = 1" >> /etc/php5/apache2/php.ini
        echo "xdebug.show_local_vars = 1" >> /etc/php5/apache2/php.ini
        echo "xdebug.remote_enable = 1" >> /etc/php5/apache2/php.ini
        echo "xdebug.var_display_max_data   = 50000" >> /etc/php5/apache2/php.ini
        echo "xdebug.max_nesting_level = 250" >> /etc/php5/apache2/php.ini
        echo -e "\n" >> /etc/php5/apache2/php.ini

        echo "[XDebug]" >> /etc/php5/cli/php.ini
        echo "zend_extension=$pathxdebug" >> /etc/php5/cli/php.ini
        echo "xdebug.default_enable = 1" >> /etc/php5/cli/php.ini
        echo "xdebug.show_exception_trace = 1" >> /etc/php5/cli/php.ini
        echo "xdebug.show_local_vars = 1" >> /etc/php5/cli/php.ini
        echo "xdebug.remote_enable = 1" >> /etc/php5/cli/php.ini
        echo "xdebug.var_display_max_data   = 50000" >> /etc/php5/cli/php.ini
        echo "xdebug.max_nesting_level = 250" >> /etc/php5/cli/php.ini
        echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    ########################### Libs da Zanthus #################################

    if [ ! -d /usr/src/libs_zanthus  ]; then
        echo "Criando e baixando bibliotecas para a pasta libs_zanthus..."
        criarDiretorio "/usr/src/libs_zanthus"
        cd /usr/src/libs_zanthus
        wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so/* .
        wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/* .
        wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so .

        #Adiciona ao carregamento de libs do sistema
        echo "/usr/src/libs_zanthus" >> /etc/ld.so.conf
        ldconfig

    else
        echo "libs_zanthus já existe..."
    fi
    cd ~
    ########################### Libs da Zanthus #################################
    
    #Insere a Kernz no .ini do Php e Apache
    echo -e "\n"
    echo -e "Digite o caminho para a kernz.so \n"
    read pathkernz
    if [ -d $pathkernz ]; then
        echo "extension=$pathkernz" >> /etc/php5/apache2/php.ini
        echo -e "\n" >> /etc/php5/apache2/php.ini
        echo "extension=$pathkernz" >> /etc/php5/cli/php.ini
        echo -e "\n" >> /etc/php5/cli/php.ini
    fi

    ################### Instala a .so do dbase ########################
    pecl install dbase
    pathdbase = "/usr/lib/php5/20131226/dbase.so"
    if [[ -e $pathdbase ]]; then
        echo "extension=$pathdbase" >> /etc/php5/apache2/php.ini
        echo -e "\n" >> /etc/php5/apache2/php.ini
        echo "extension=$pathdbase" >> /etc/php5/cli/php.ini
        echo -e "\n" >> /etc/php5/cli/php.ini
    fi
    

    #Configura Timezone e charset
    echo "date.timezone = America/Sao_Paulo" >> /etc/php5/apache2/php.ini
    echo -e "\n" >> /etc/php5/apache2/php.ini
    echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/apache2/php.ini
    echo -e "\n" >> /etc/php5/apache2/php.ini

    #Configura Timezone e charset
    echo "date.timezone = America/Sao_Paulo" >> /etc/php5/cli/php.ini
    echo -e "\n" >> /etc/php5/cli/php.ini
    echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/cli/php.ini
    echo -e "\n" >> /etc/php5/cli/php.ini


    #instala repositorio para Spotify - programador também gosta de música :)
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
    echo deb http://repository.spotify.com stable non-free |  tee /etc/apt/sources.list.d/spotify.list
    apt-get update

    #instala repositorio para Java 8
    add-apt-repository -y ppa:webupd8team/java
    apt-get update

    #instala repositorio para Android Studio
    apt-add-repository -y ppa:paolorotolo/android-studio

    #instala repositorio para Virtualbox
    echo -e   "\n" >> /etc/apt/sources.list
    echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- |  apt-key add -
    apt-get update

    #Instala os pacotes e programas

    #Intala o skype primeiro por que ele baixa varias libs 32bits que programas com Wine usam
    apt-get -y install skype
    #Instala AcetoneIso programa para rodar isos
    apt-get -y install acetoneiso
    #Plugin para abrir o terminal no diretório
    apt-get -y install nautilus-open-terminal
    #Instala Steam
    apt-get -y install steam
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
    #Instala wine para rodar programas do windows
    apt-get -y install wine
    #Instala gimp para edição de imagens
    apt-get -y install gimp
    #Instala inkscape para edição de imagens
    apt-get -y install inkscape
    #Instala cliente de audio do spotify
    apt-get -y install spotify-client
    #Instala java 8
    apt-get -y install oracle-java8-installer
    #Instala Android Studio IDE Android
    apt-get -y install android-studio
    #Instala lib Curl para uso com php
    apt-get -y install curl
    #Instala playonlinux gerenciaento de plataforma wine
    apt-get -y install playonlinux
    #Instala controle de versionamento
    apt-get -y install git-core
    #Instala virtualbox para rodar maquinas virtuais
    apt-get -y install virtualbox-5.0
    wget -c http://download.virtualbox.org/virtualbox/5.0.8/Oracle_VM_VirtualBox_Extension_Pack-5.0.8-103449.vbox-extpack
    virtualbox Oracle_VM_VirtualBox_Extension_Pack-5.0.8-103449.vbox-extpack
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
    echo -e "Digite seu email do Github, deixe nulo caso não queira configurar o github! \n"
    read emailGit
    if [[ $emailGit != "" ]]; then
        git config --global user.email $emailGit
    fi
    #configura o git com meu usuário
    echo -e "Digite seu usuario do Github, deixe nulo caso não queira configurar o github! \n"
    read userGit
    if [[ $userGit != "" ]]; then
        git config --global user.name $userGit
    fi

    #Habilita o modrewrite do apache
    a2enmod rewrite
    #Baixa o composer
    curl -s https://getcomposer.org/installer | php
    #Move o Composer
    mv composer.phar /usr/local/bin/composer
    #Intala o instalador do laravel
    composer global require "laravel/installer=~1.1"
    #Intala o instalador do lumen
    composer global require "laravel/lumen-installer=~1.0"
    #Adiciona os vendors do composer as variáveis de ambiente
    export PATH=$PATH:/home/$usuario/.composer/vendor/bin
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

    #verifica se é pra intalar PhpStorm
    if [[ $1 == "storm" ]]; then
   		instalarPhpStorm "-op"
    fi

	#verifica se é pra intalar IntelliJ-IDEA
	if [[ $2 == "idea" ]]; then
   		instalarIntelliJ "-op"
    fi

    #verifica se é pra intalar Clion
    if [[ $3 == "clion" ]]; then
        instalarClion "-op"
    fi

    #Instala Siblime-text 3 e Notepad++
    instalarSublime

    #Instala Dropbox
    instalarDropbox

    #Instala a IDE Eclipse Java EE
    instalarEclipse

    #Adiciona os Lauchers dos aplpicativos na sidebar
    adicionarLauchers

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
    echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    echo -e "\n"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op
    
    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    capturaUsuario

    echo "    Excluindo pastas e arquivos..."

    pecl uninstall oci8
    pecl uninstall xdebug
    pecl uninstall dbase
    apt-get -y purge php5.*
    apt-get -y purge apache2
    apt-get -y purge postgresql
    apt-get -y purge mysql-server
    apt-get -y purge subversion
    rm -r /usr/lib/oracle

    ############### Libs ZAnthus #############
    cd /usr/src
    rm -r /usr/src/libs_zanthus
    ############### Libs ZAnthus #############

    #Reconfigura carregamento de bibliotecas
    ldconfig

    #Desistala os pacotes e programas

    #Remove repositorio para php5-5.6
    add-apt-repository -r ppa:ondrej/php5-5.6
    apt-get update

    #Remove repositorio para Java 8
    add-apt-repository -r ppa:webupd8team/java
    apt-get update

    #Remove repositorio para Android Studio
    apt-add-repository -r ppa:paolorotolo/android-studio
    apt-get update

    #Desistala sendmail
    apt-get -y purge sendmail
    #Desistala AcetoneIso programa para rodar isos
    apt-get -y purge acetoneiso
    #Plugin para abrir o terminal no diretório
    apt-get -y purge nautilus-open-terminal
    #Desistala Steam
    apt-get -y install steam
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
    apt-get -y purge wine
    #Desistala gimp para edição de imagens
    apt-get -y purge gimp
    #Desistala inkscape para edição de imagens
    apt-get -y purge inkscape
    #Desistala cliente de audio do spotify
    apt-get -y purge spotify-client
    #Desistala java 8
    apt-get -y purge oracle-java8-installer
    #Desistala Android Studio IDE Android
    apt-get -y purge android-studio
    #Desistala lib Curl para uso com php
    apt-get -y purge curl
    #Desistala playonlinux gerenciaento de plataforma wine
    apt-get -y purge playonlinux
    #Desistala controle de versionamento
    apt-get -y purge git-core
    #Desistala virtualbox para rodar maquinas virtuais
    apt-get -y purge virtualbox-5.0
    #Desistala gerenciador de backup
    apt-get -y purge luckybackup
    #Desistala  libs php para conexão com banco de dados MSSQL
    apt-get -y purge freetds-common
    #Desistala o Composer
    rm -r /usr/local/bin/composer
    #Desistala o instalador do laravel
    rm -r /home/$usuario/.composer/vendor/
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

    #remove os pacotes não ultilizados
    apt-get -y autoremove
    apt-get clean

    #verifica se é pra remover PhpStorm
    if [[ $1 == "storm" ]]; then
   		removerPhpStorm "-op"
    fi

	#verifica se é pra remover IntelliJ-IDEA
	if [[ $2 == "idea" ]]; then
   		removerIntelliJ "-op"
    fi

    #verifica se é pra remover Clion
    if [[ $3 == "clion" ]]; then
        removerClion "-op"
    fi

    #Desistala Eclipse Java EE
    removerEclipse

    #Desistala Dropbox
    removerDropbox

    removerLauchers

    echo "    Ambiente Servidor Ubuntu removido"

    mostrarMenuOpcoes
}

#Instala Eclipse Mars
instalarEclipse(){

    versao = $(uname -i)
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

#Instala o Editor de texto Sublime-Text 3 e o Notepad++
instalarSublime(){
    versao = $(uname -i)
    if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
        wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_i386.deb
        dpkg -i sublime-text_build-3083_i386.deb
        rm -r sublime-text_build-3083_i386.deb

        wget -c "https://notepad-plus-plus.org/repository/6.x/6.8.6/npp.6.8.6.Installer.exe"
        wine npp.6.8.6.Installer.exe
    else
        wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
        dpkg -i sublime-text_build-3083_amd64.deb
        rm -r sublime-text_build-3083_amd64.deb

        wget -c "https://notepad-plus-plus.org/repository/6.x/6.8.6/npp.6.8.6.Installer.exe"
        wine npp.6.8.6.Installer.exe
    fi
}



instalarDropbox(){
    #Instala Dropbox
    versao = $(uname -i)
    if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
        wget -c "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_i386.deb" -O dropbox.deb
        dpkg -i dropbox.deb
        rm -r dropbox.deb

    else
        wget -c "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb" -O dropbox.deb
        dpkg -i dropbox.deb
        rm -r dropbox.deb
    fi
}

removerDropbox(){
    #Desistala Dropbox
    apt-get -y purge dropbox
}


# IDE de desenvolvimento PHP #
instalarPhpStorm(){
    clear
    cd ~
    echo "    Será instalado a IDE de desenvolvimento PhpStorm-10"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    wget -c http://download.jetbrains.com/webide/PhpStorm-10.0.tar.gz
    tar -zxvf PhpStorm-10.0.tar.gz
    mv PhpStorm-143.381.48 /opt/PhpStorm
    chmod +x /opt/PhpStorm/bin/phpstorm.sh
    chmod -R 777 /opt/PhpStorm

    #Cria arquivo executavel#
    touch /usr/bin/phpstorm
    chmod 755 /usr/bin/phpstorm
    echo "#!/bin/sh" >> /usr/bin/phpstorm
    echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/phpstorm
    echo "export PHPSTORM_HOME=/opt/PhpStorm" >> /usr/bin/phpstorm
    echo "\$PHPSTORM_HOME/bin/phpstorm.sh $*" >> /usr/bin/phpstorm
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

    rm -r PhpStorm-10.0.tar.gz

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
    clear
    echo "    Será instalado a IDE de desenvolvimento Intellij-IDEA"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    wget -c http://download.jetbrains.com/idea/ideaIU-14.1.5.tar.gz
    tar -zxvf ideaIU-14.1.5.tar.gz
    mv idea-IU-141.2735.5 /opt/IntelliJ-IDEA
    chmod +x /opt/IntelliJ-IDEA/bin/idea.sh
    chmod -R 777 /opt/IntelliJ-IDEA

    #Cria arquivo executavel#
    touch /usr/bin/idea
    chmod 755 /usr/bin/idea
    echo "#!/bin/sh" >> /usr/bin/idea
    echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/idea
    echo "export IntelliJ_HOME=/opt/IntelliJ-IDEA" >> /usr/bin/idea
    echo "\$IntelliJ_HOME/bin/idea.sh $*" >> /usr/bin/idea
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

    rm -r ideaIU-14.1.5.tar.gz

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

# IDE de desenvolvimento C/C++ #
instalarClion(){
    clear
    echo "    Será instalado a IDE de desenvolvimento Clion"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi
    wget -c https://download.jetbrains.com/cpp/clion-1.1.1.tar.gz
    tar -zxvf clion-1.1.1.tar.gz
    mv clion-1.1.1 /opt/Clion
    chmod +x /opt/Clion/bin/clion.sh
    chmod -R 777 /opt/Clion

    #Cria arquivo executavel#
    touch /usr/bin/clion
    chmod 755 /usr/bin/clion
    echo "#!/bin/sh" >> /usr/bin/clion
    echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/clion
    echo "export CLION_HOME=/opt/IntelliJ-IDEA" >> /usr/bin/clion
    echo "\$CLION_HOME/bin/clion.sh $*" >> /usr/bin/clion
    ln -s /usr/bin/clion /bin/clion

    #Cria icone do desktop#
    touch /usr/share/applications/clion.desktop
    echo "[Desktop Entry]" >> /usr/share/applications/clion.desktop
    echo "Encoding=UTF-8" >> /usr/share/applications/clion.desktop
    echo "Name=Clion" >> /usr/share/applications/clion.desktop
    echo "Comment=Clion IDE" >> /usr/share/applications/clion.desktop
    echo "Exec=clion" >> /usr/share/applications/clion.desktop
    echo "Icon=/opt/Clion/bin/clion.svg" >> /usr/share/applications/clion.desktop
    echo "Terminal=false" >> /usr/share/applications/clion.desktop
    echo "Type=Application" >> /usr/share/applications/clion.desktop
    echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/clion.desktop
    echo "StartupNotify=true" >> /usr/share/applications/clion.desktop

    rm -r clion-1.1.1.tar.gz

    if [[ $1 == "op" ]]; then
        mostrarMenuOpcoes
    fi
}

removerClion(){
    clear
    echo "    Será removido a IDE de desenvolvimento Clion"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    rm -r /usr/bin/clion
    rm -r /bin/clion
    rm -r /opt/Clion
    rm -r /usr/share/applications/clion.desktop

    if [[ $1 == "op" ]]; then
        mostrarMenuOpcoes
    fi
}

instalarAmbienteServidorCentOs(){
    clear
    echo "    Será instalado Ambiente para servidor CentOs que contém:"
    echo "    Php-5.6 com libs: memcache, phpize"
    echo "    Apache-2.4"
    echo "    Oracle Instant-Client"
    echo "    NodeJs"
    echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    echo -e "\n"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    echo "    Iniciando a instalação do servidor"
    cd /usr/src

    echo "    Baixando bibliotecas"

    criarDiretorio "libs_zanthus"
    cd libs_zanthus
    wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so/* .
    wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/* .
    wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so .
    cd ..

    echo "    Baixando pacotes de instalação"
    wget ftp://192.168.0.54/* --ftp-user=eber --ftp-password=123456 .

    #Verifica se conseguiu fazer o download de tudo para continuar senão sai do processo
    if [ $? == 0 ]; then

        echo "    Saindo do diretório"
        cd /
        echo "    Descompactando php"
        tar -xzvf /usr/src/instalar_apr_centos_6_5.tar.gz
        echo "    Descompactando Apache"
        tar -xzvf /usr/src/instalar_apache_centos_6_5.tar.gz
        echo "    Descompactando InstantClient"
        tar -xzvf /usr/src/instalar_instant_client_12_1.tar.gz
        echo "    Descompactando libEvent"
        tar -xzvf /usr/src/instalar_libevent_centos_6_5.tar.gz
        echo "    Descompactando memcached"
        tar -xzvf /usr/src/instalar_memcached_centos_6_5.tar.gz
        echo "    Descompactando node"
        tar -xzvf /usr/src/instalar_node_centos_6_5.tar.gz
        echo "    Descompactando php"
        tar -xzvf /usr/src/instalar_php_centos_6_5.tar.gz

        echo "    Criando links e copiando arquivos"
        cd /usr/src
        mv bibliotecas_zanthus.conf /etc/ld.so.conf.d/.
        mv instant_client.conf /etc/ld.so.conf.d/.
        mv -f index.html /usr/local/apache22/htdocs/.

        chmod +x memcached
        criarDiretorio "/usr/local/Zend"
        criarDiretorio "/usr/local/Zend/etc"
        cp php.ini /usr/local/Zend/etc/.
        #O php precisa ter o mesmo caminho do módulo php no apache
        ln -sf /usr/local/Zend/etc/php.ini  /usr/local/php/lib/php.ini
        ln -sf /usr/local/php/bin/php /usr/local/bin/php
        ln -sf /usr/local/php/bin/php-config /usr/local/bin/php-config
        ln -sf /usr/local/php/bin/phpize /usr/local/bin/phpize
        ln -sf /usr/local/memcached/bin/memcached /usr/local/bin/memcached
        ln -sf /usr/local/apache22/bin/apachectl /etc/init.d/apache
        ln -sf /usr/src/libevent-2.0.22-stable/.libs/libevent-2.0.so.5 /lib64/libevent-2.0.so.5
        ln -sf /usr/local/apr/lib/libaprutil-1.so.0 /lib64/libaprutil-1.so.0
        ln -sf /usr/local/memcached/bin/memcached /var/run/memcached
        ln -sf /usr/local/node/bin/node /usr/local/bin/node
        ln -sf /usr/src/memcached /etc/init.d/memcached
        ln -sf /etc/init.d/memcached /etc/rc3.d/S99memcached
        ln -sf /etc/init.d/apache /etc/rc3.d/S99apache
        ln -sf /usr/local/apache22/htdocs /web

        ldconfig

        echo "    vamos subir o serviço Apache"
        service apache start

        echo "    vamos subir o serviço do Memcached"
        service memcached start
        service apache start

        echo "    criando usuário"
        adduser zanthus

        echo "    fim"
        mostrarMenuOpcoes

    else
        echo "Erro ao fazer download de pacotes de instalação"
        read res
        mostrarMenuOpcoes
    fi
}


#Remove o Ambiente Servidor CentOs
removerAmbienteServidorCentOs(){
    clear
    echo "    Será REMOVIDO Ambiente para servidor CentOs que contém:"
    echo "    Php-5.6 com libs: memcache, phpize"
    echo "    Apache-2.4"
    echo "    Oracle Instant-Client"
    echo "    NodeJs"
    echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    echo -e "\n"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    echo "    Excluindo pastas e arquivos..."

    cd /usr/src
    rm -r /usr/src/libs_zanthus
    rm -r /usr/local/Zend
    rm -r /usr/local/apache22
    rm -r /etc/init.d/apache
    rm -r /etc/rc3.d/S99apache
    rm -r /usr/local/php
    rm -r /usr/local/bin/php
    rm -r /usr/local/bin/php-config
    rm -r /usr/local/bin/phpize

    rm -r /usr/local/memcached/
    rm -r /var/run/memcached
    rm -r /etc/init.d/memcached
    rm -r /etc/rc3.d/S99memcached
    rm -r /usr/local/bin/memcached

    rm -r /usr/local/node/
    rm -r /usr/local/bin/node
    rm -r /web
    rm -r /etc/init.d/apache
    rm -r /lib64/libevent-2.0.so.5
    rm -r /lib64/libaprutil-1.so.0
    rm -r /usr/local/instant_client_12_1

    ldconfig

    deluser zanthus

    echo "    Ambiente CentOs removido"
    mostrarMenuOpcoes
}



instalarAmbienteServidorUbuntu(){
    clear
    echo "    Será instalado o Ambiente para servidor Ubuntu/Debian que contém:"
    echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug memcache"
    echo "    Apache-2.4"
    echo "    Mysql"
    echo "    Postgresql"
    echo "    Subversion"
    echo "    Gdebi Instalador de pacotes"
    echo "    Synaptic Gerenciador de dependencias"
    echo "    Rar descompactador"
    echo "    Filezilla cliente Ftp"
    echo "    java 8"
    echo "    Curl lib para uso com php"
    echo "    Freetds-commom php para conexão com banco de dados MSSQL"
    echo "    Composer intalador dependencias Php"
    echo "    laravel/installer instalador do Laravel 5"
    echo "    lumen/installer instalador Lumen"
    echo "    NodeJs"
    echo "    Para instalar a lib oci8.so certifique-se de que o Oracle Instant Client esteja instalado!"

    echo -e "\n"
    echo "Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    capturaUsuario

    cd ~
    add-apt-repository -y ppa:ondrej/php5-5.6
    apt-get update
    apt-get install -y php5
    apt-get install -y apache2
    apt-get install -y mysql-server
    apt-get install -y phpmyadmin
    apt-get install -y postgresql
    apt-get install -y subversion
    apt-get install -y php5-dev
    apt-get install -y php5-curl
    apt-get install -y php5-json
    apt-get install -y php5-ldap
    apt-get install -y php5-mssql
    apt-get install -y php5-odbc
    apt-get install -y php5-pgsql
    apt-get install -y php5-mcrypt
    apt-get install -y php5-sybase
    apt-get install -y php5-memcached
    apt-get install -y php5-openssl
    apt-get install -y memcached
    apt-get install -y sendmail

    ###################  Instala a .so do oracle ###################### /home/tairo/extensions/no-debug-non-zts-20131226
    #Verifica se o caminho padrão para a pasta oracle existe
    pathInstantClient = /usr/lib/php5/20131226/oci8.so
    if [ -e $pathInstantClient ]; then
        pecl install oci8
        echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/apache2/php.ini
        echo -e "\n" >> /etc/php5/apache2/php.ini
        echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/cli/php.ini
        echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    ########################### Libs da Zanthus #################################
    cd /usr/src

    if [ ! -d /usr/src/libs_zanthus  ]; then
        echo "Criando e baixando bibliotecas para a pasta libs_zanthus..."
        criarDiretorio "/usr/src/libs_zanthus"
        cd libs_zanthus
        wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so/* .
        wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/* .
        wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so .

        #Adiciona ao carregamento de libs do sistema
        echo "/usr/src/libs_zanthus" >> /etc/ld.so.conf
        ldconfig

    else
        echo "libs_zanthus já existe..."
    fi
    ########################### Libs da Zanthus #################################

    #Insere a Kernz no .ini do Php e Apache
    echo -e "\n"
    echo -e "Digite o caminho para a kernz.so \n"
    read pathkernz
    if [ -d $pathkernz ]; then
        echo "extension=$pathkernz" >> /etc/php5/apache2/php.ini
        echo -e "\n" >> /etc/php5/apache2/php.ini
        echo "extension=$pathkernz" >> /etc/php5/cli/php.ini
        echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    ################### Instala a .so do dbase ########################
    pecl install dbase
    pathdbase = /usr/lib/php5/20131226/dbase.so
    if [[ -e $pathdbase ]]; then
        echo "extension=$pathdbase" >> /etc/php5/apache2/php.ini
        echo -e "\n" >> /etc/php5/apache2/php.ini
        echo "extension=$pathdbase" >> /etc/php5/cli/php.ini
        echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    #Configura Timezone e charset
    echo "date.timezone = America/Sao_Paulo" >> /etc/php5/apache2/php.ini
    echo -e "\n" >> /etc/php5/apache2/php.ini
    echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/apache2/php.ini
    echo -e "\n" >> /etc/php5/apache2/php.ini

    #Configura Timezone e charset
    echo "date.timezone = America/Sao_Paulo" >> /etc/php5/cli/php.ini
    echo -e "\n" >> /etc/php5/cli/php.ini
    echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/cli/php.ini
    echo -e "\n" >> /etc/php5/cli/php.ini


    #instala repositorio para Java 8
    add-apt-repository -y ppa:webupd8team/java
    apt-get update

    #Instala os pacotes e programas

    #Instala Gdebi Instalador de pacotes
    apt-get -y install gdebi
    #Instala Gerenciador de dependencias
    apt-get -y install synaptic
    #Instala descompactador
    apt-get -y install rar
    #Instala cliente ftp
    apt-get -y install filezilla
    #Instala java 8
    apt-get -y install oracle-java8-installer
    #Instala lib Curl para uso com php
    apt-get -y install curl
    #Instala  libs php para conexão com banco de dados MSSQL
    apt-get -y install freetds-common
    #Atualiza os headers
    apt-get update
    # reinicializa Apache
    service apache2 restart
    #Da permição para a pasta do apache
    chmod -R 777 /var/www
    #Habilita o modrewrite do apache
    a2enmod rewrite
    #Baixa o composer
    curl -s https://getcomposer.org/installer | php
    #Move o Composer
    mv composer.phar /usr/local/bin/composer
    #Intala o instalador do laravel
    composer global require "laravel/installer=~1.1"
    #Intala o instalador do lumen
    composer global require "laravel/lumen-installer=~1.0"
    #Adiciona os vendors do composer as variáveis de ambiente
    export PATH=$PATH:/home/$usuario/.composer/vendor/bin
    #Adiciona o NodeJs ao bash para ser instalado
    curl --silent --location https://deb.nodesource.com/setup_4.x |  bash -
    #Atualiza os headers
    apt-get update
    #Instala o NodeJs
    apt-get install --yes nodejs

    mostrarMenuOpcoes

}


#Remove Ambiente Servidor Ubuntu
removerAmbienteServidorUbuntu(){
    clear
    echo "    Será REMOVIDO o Ambiente para servidor Ubuntu/Debian que contém:"
    echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug memcache"
    echo "    Apache-2.4"
    echo "    Mysql"
    echo "    Postgresql"
    echo "    Gdebi Instalador de pacotes"
    echo "    Synaptic Gerenciador de dependencias"
    echo "    Rar descompactador"
    echo "    Filezilla cliente Ftp"
    echo "    java 8"
    echo "    Curl lib para uso com php"
    echo "    Freetds-commom php para conexão com banco de dados MSSQL"
    echo "    Composer intalador dependencias Php"
    echo "    laravel/installer instalador do Laravel 5"
    echo "    lumen/installer instalador Lumen"
    echo "    NodeJs"
    echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    echo -e "\n"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    capturaUsuario

    echo "    Excluindo pastas e arquivos..."

    pecl uninstall oci8
    pecl uninstall dbase
    apt-get -y purge php5.*
    apt-get -y purge apache2
    apt-get -y purge postgresql
    apt-get -y purge mysql-server
    apt-get -y purge subversion
    rm -r /usr/lib/oracle

    ############### Libs ZAnthus #############
    cd /usr/src
    rm -r /usr/src/libs_zanthus
    ############### Libs ZAnthus #############

    #Reconfigura carregamento de bibliotecas
    ldconfig

    #Desistala os pacotes e programas

    #Remove repositorio para php5-5.6
    add-apt-repository -r ppa:ondrej/php5-5.6
    apt-get update

    #Remove repositorio para Java 8
    add-apt-repository -r ppa:webupd8team/java
    apt-get update


    #Desistala sendmail
    apt-get -y purge sendmail
    #Desistala Gdebi Instalador de pacotes
    apt-get -y purge gdebi
    #Desistala Gerenciador de dependencias
    apt-get -y purge synaptic
    #Desistala descompactador
    apt-get -y purge rar
    #Desistala cliente ftp
    apt-get -y purge filezilla
    #Desistala java 8
    apt-get -y purge oracle-java8-installer
    #Desistala lib Curl para uso com php
    apt-get -y purge curl
    #Desistala  libs php para conexão com banco de dados MSSQL
    apt-get -y purge freetds-common
    #Desistala o Composer
    rm -r /usr/local/bin/composer
    #Desistala o instalador do laravel
    rm -r /home/$usuario/.composer/vendor/
    #Desistala o NodeJs
    apt-get purge --yes nodejs
    #Desistala o skype por ultimo por que ele baixa varias libs 32bits que programas com Wine usam
    apt-get -y purge skype

    #remove os pacotes não ultilizados
    apt-get -y autoremove
    apt-get clean

    echo "    Ambiente Servidor Ubuntu removido"

    mostrarMenuOpcoes
}


#Converte o arquivo .rpm para .deb e instala no caminho padrão do oracle
instalarOracleInstantClient(){

    cd ~
    #Insere a Kernz no .ini do Php e Apache
    echo -e "\n"
    echo -e "    Digite o para o instant_client \n"
    read pathOracleInstantClient

    if [[ $pathOracleInstantClient == "" ]]; then
        echo "Caminho inválido..."
    read res
        mostrarMenuOpcoes
    fi

    cd $pathOracleInstantClient

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
        read res
        mostrarMenuOpcoes

    else
        clear
        echo "    Não foi possível fazer o download dos arquivos do instant_client verifique a conexão ou o link dos arquivos"
        read res
    fi

    mostrarMenuOpcoes
}


removerOracleInstantClient(){
    clear
    echo -e "\n"
    echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
        mostrarMenuOpcoes
    fi

    rm -r /usr/lib/oracle
    echo ""
    read res
    mostrarMenuOpcoes
}


adicionarLauchers(){
     gsettings set com.canonical.Unity.Launcher favorites "['application://gnome-terminal.desktop', 'application://nautilus.desktop', 'application://google-chrome.desktop', 'application://firefox.desktop', 'application://phpstorm.desktop', 'application://idea.desktop', 'application://android-studio.desktop', 'application://sublime_text.desktop', 'application://wine-Programs-Notepad++-Notepad++.desktop', 'application://gedit.desktop', 'application://virtualbox.desktop', 'application://filezilla.desktop', 'application://skype.desktop', 'application://spotify.desktop', 'application://rhythmbox.desktop', 'application://PlayOnLinux.desktop', 'application://ubuntu-software-center.desktop', 'application://dropbox.desktop', 'application://ntfs-config.desktop', 'application://unity-control-center.desktop', 'application://gnome-system-monitor.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices', 'unity://desktop-icon']"
}

removerLauchers(){
     gsettings reset com.canonical.Unity.Launcher favorites
}

mostrarAjuda(){
    clear
    echo "    #######################################################################################"
    echo "    #                           Menu de ajuda para script linux                           #"
    echo "    #######################################################################################"
    echo -e "\n"
    echo -e "    Este script contém as principais aplicações para montar o ambiente"
    echo -e "    desenvolvimento."
    echo -e "    Não são mostradas as opções 9,10,11,12,13,14,15,16 e 79"
    echo -e "     9 - Instalação da IDE PhpStorm"
    echo -e "    10 - Remove IDE PhpStorm"
    echo -e "    11 - Instalação da IDE Intellij-IDEA"
    echo -e "    12 - Remove IDE Intellij-IDEA"
    echo -e "    13 - Instalação IDE Clion"
    echo -e "    14 - Remove IDE Clion"
    echo -e "    15 - Monta o Ambiente de desenvolvimento com PhpStorm, Intellij-IDEA e Clion"
    echo -e "    16 - Remove o Ambiente de desenvolvimento instalado na opção 15"
    echo -e "    79 - opção de teste"
    echo -e "\n"
    echo -e "\n"
    echo -e "#-------------------------------------------------------------------------------------#"
    echo -e "                                  METODOS DO SCRIP                                     "
    echo -e "#-------------------------------------------------------------------------------------#"
    echo -e "    mostrarMenuOpcoes"
    echo -e "    capturaUsuario"
    echo -e "    listarDiretorio"
    echo -e "    criarDiretorio"
    echo -e "    versaoLinux"
    echo -e "    instalarAmbienteDesenvolvimento"
    echo -e "    removerAmbienteDesenvolvimento"
    echo -e "    instalarEclipse"
    echo -e "    removerEclipse"
    echo -e "    instalarSublime"
    echo -e "    instalarDropbox"
    echo -e "    removerDropbox"
    echo -e "    instalarPhpStorm"
    echo -e "    removerPhpStorm"
    echo -e "    instalarIntelliJ"
    echo -e "    removerIntelliJ"
    echo -e "    instalarClion"
    echo -e "    removerClion"
    echo -e "    instalarAmbienteServidorCentOs"
    echo -e "    removerAmbienteServidorCentOs"
    echo -e "    instalarAmbienteServidorUbuntu"
    echo -e "    removerAmbienteServidorUbuntu"
    echo -e "    instalarOracleInstantClient"
    echo -e "    removerOracleInstantClient"
    echo -e "    adicionarLauchers"
    echo -e "    removerLauchers"
    echo -e "    mostrarAjuda"
    echo -e "    teste"
    echo "    #######################################################################################"
	read res

	if [[ $res == "" ]]; then
	    mostrarMenuOpcoes
    else
	    $res
	fi

}

teste(){
    echo "    Teste..."
    read res

    mostrarMenuOpcoes
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

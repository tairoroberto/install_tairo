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
    sudo echo "    #################################################################################"
    sudo echo "    #   Scrypt para instalação de ambiente de desenvolvimento PHP-ANDROID-C-JAVA    #"
    sudo echo "    #                         - TAIRO ROBERTO M. ASSUNÇÃO -                         #"
    sudo echo "    #                                                                               #"
    sudo echo "    #################################################################################"
    sudo echo -e "\n"

mostrarMenuOpcoes(){
    clear
    sudo echo "    #######################################################################################"
    sudo echo "    #                            Digite a opção desejada                                  #"
    sudo echo "    #-------------------------------------------------------------------------------------#"
    sudo echo "    #  1 - Instalar 'Ambiente desenvolvimento'     PHP, Apache, Mysql, Java e etc.        #"
    sudo echo "    #-------------------------------------------------------------------------------------#"
    sudo echo "    #  2 - Remover  'Ambiente desenvolvimento'     PHP, Apache, Mysql, Java e etc.        #"
    sudo echo "    #-------------------------------------------------------------------------------------#"
    sudo echo "    #  3 - Instalar 'Oracle Instant Client'   Bibliotecas para conexão com banco          #"
    sudo echo "    #  4 - Remover  'Oracle Instant Client                                                #"
    sudo echo "    #-------------------------------------------------------------------------------------#"
    sudo echo "    #  5 - Instalar 'Servidor'        Ambiente Servidor Zanthus Linux Ubuntu/Debian       #"
    sudo echo "    #  6 - Remover  'Servidor Ubuntu'                                                     #"
    sudo echo "    #-------------------------------------------------------------------------------------#"
    sudo echo "    #  7 - Instalar 'Servidor'        Ambiente Servidor Zanthus Linux CentOs              #"
    sudo echo "    #  8 - Remover  'Servidor CentOs'                                                     #"
    sudo echo "    #-------------------------------------------------------------------------------------#"
    sudo echo "    #  0 - Mostra Menu de opções                                                          #"
    sudo echo "    #-------------------------------------------------------------------------------------#"
    sudo echo "    #  Obs: Digite a opção --help, para mostar menu de ajuda     ex:  --help              #"
    sudo echo "    #######################################################################################"
    sudo echo -e "\n"
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
    sudo echo "    ########################### Insira seu usuario Linux ##################################"
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
    sudo echo "    ############################  INÍCIO ARQUIVOS E PASTAS  ###############################"
    sudo echo "$list"
    sudo echo "    ############################  FIM ARQUIVOS E PASTAS  ##################################"
}

# cria um diretorio
#Recebe o caminho do diretorio comparametro
criarDiretorio(){
    if [ ! -d "$1" ]; then
      sudo echo "Criando diretório $1 ..."
     sudo mkdir -p $1

     if [ $? -eq 0 ]; then
        sudo echo "Diretório criado com sucesso !!!"
     fi

    else
      sudo echo "Diretório $1 já existe!"
    fi
}

#Mostra o sistema e a plataforma da versão
versaoLinux(){
    versao=$(uname && uname -i)
    sudo echo $versao
}


# IDE de desenvolvimento Servidor Php, Apache Mysql#
instalarAmbienteDesenvolvimento(){
	clear
    sudo echo "    Será instalado o ambiente Php que contém:"
    sudo echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug  memcache" 
    sudo echo "    Apache-2.4"
    sudo echo "    Mysql"
    sudo echo "    Postgresql"
    sudo echo "    Subversion"
    sudo echo "    Skype"
    sudo echo "    Sublime-text-3"
    sudo echo "    AcetoneIso programa para rodar isos"
    sudo echo "    Steam"
    sudo echo "    Gdebi Instalador de pacotes"
    sudo echo "    Synaptic Gerenciador de dependencias"
    sudo echo "    Klavaro treinamento de digitação"
    sudo echo "    ubuntu-restricted-extras  pacotes extras com flash e codecs mp4"
    sudo echo "    Rar descompactador"
    sudo echo "    Filezilla cliente Ftp"
    sudo echo "    Wine para rodar programas do windows"
    sudo echo "    Gimp para edição de imagens"
    sudo echo "    Inkscape para edição de imagens"
    sudo echo "    Spotify cliente de audio"
    sudo echo "    java 8"
    sudo echo "    Android Studio IDE Android"
    sudo echo "    Curl lib para uso com php"
    sudo echo "    Playonlinux gerenciamento de plataforma wine"
    sudo echo "    Git controle de versionamento"
    sudo echo "    Virtualbox para rodar maquinas virtuais"
    sudo echo "    Luckybackup gerenciador de backup"
    sudo echo "    Freetds-commom php para conexão com banco de dados MSSQL"
    sudo echo "    Composer intalador dependencias Php"
    sudo echo "    laravel/installer instalador do Laravel 5"
    sudo echo "    lumen/installer instalador Lumen"
    sudo echo "    NodeJs"
    sudo echo "    Para instalar a lib oci8.so certifique-se de que o Oracle Instant Client esteja instalado!"

    sudo echo -e "\n"
    sudo echo "Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
      mostrarMenuOpcoes
    fi

    capturaUsuario

    cd ~
    sudo add-apt-repository -y ppa:ondrej/php5-5.6
    sudo apt-get update    
    sudo apt-get install -y php5
    sudo apt-get install -y apache2
    sudo apt-get install -y mysql-server    
    sudo apt-get install -y phpmyadmin
    sudo apt-get install -y postgresql 
    sudo apt-get install -y subversion   
    sudo apt-get install -y php5-dev  
    sudo apt-get install -y php5-curl 
    sudo apt-get install -y php5-json 
    sudo apt-get install -y php5-ldap 
    sudo apt-get install -y php5-mssql 
    sudo apt-get install -y php5-odbc 
    sudo apt-get install -y php5-pgsql 
    sudo apt-get install -y php5-mcrypt 
    sudo apt-get install -y php5-sybase 
    sudo apt-get install -y php5-memcached 
    sudo apt-get install -y php5-openssl
    sudo apt-get install -y memcached 
    sudo apt-get install -y sendmail  
    
    ###################  Instala a .so do oracle ######################
    sudo pecl install oci8
    #Verifica se o caminho padrão para a pasta oracle existe
    pathInstantClient = /usr/lib/php5/20131226/oci8.so 
    if [ -e $pathInstantClient ]; then
      sudo echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/apache2/php.ini
      sudo echo -e "\n" >> /etc/php5/apache2/php.ini
      sudo echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/cli/php.ini
      sudo echo -e "\n" >> /etc/php5/cli/php.ini
    fi    

    ################### Instala a .so do Xdebug ########################
    sudo pecl install xdebug
    sudo echo -e "Digite o caminho para a xdebug.so \n"
    read pathxdebug

    if [ -e $pathxdebug ]; then
        sudo echo "[XDebug]" >> /etc/php5/apache2/php.ini
        sudo echo "zend_extension=$pathxdebug" >> /etc/php5/apache2/php.ini
        sudo echo "xdebug.default_enable = 1" >> /etc/php5/apache2/php.ini
        sudo echo "xdebug.show_exception_trace = 1" >> /etc/php5/apache2/php.ini
        sudo echo "xdebug.show_local_vars = 1" >> /etc/php5/apache2/php.ini
        sudo echo "xdebug.remote_enable = 1" >> /etc/php5/apache2/php.ini
        sudo echo "xdebug.var_display_max_data   = 50000" >> /etc/php5/apache2/php.ini
        sudo echo "xdebug.max_nesting_level = 250" >> /etc/php5/apache2/php.ini
        sudo echo -e "\n" >> /etc/php5/apache2/php.ini

        sudo echo "[XDebug]" >> /etc/php5/cli/php.ini
        sudo echo "zend_extension=$pathxdebug" >> /etc/php5/cli/php.ini
        sudo echo "xdebug.default_enable = 1" >> /etc/php5/cli/php.ini
        sudo echo "xdebug.show_exception_trace = 1" >> /etc/php5/cli/php.ini
        sudo echo "xdebug.show_local_vars = 1" >> /etc/php5/cli/php.ini
        sudo echo "xdebug.remote_enable = 1" >> /etc/php5/cli/php.ini
        sudo echo "xdebug.var_display_max_data   = 50000" >> /etc/php5/cli/php.ini
        sudo echo "xdebug.max_nesting_level = 250" >> /etc/php5/cli/php.ini
        sudo echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    ########################### Libs da Zanthus #################################
    cd /usr/src

    if [ ! -d /usr/src/libs_zanthus  ]; then
      sudo echo "Criando e baixando bibliotecas para a pasta libs_zanthus..."
      criarDiretorio "/usr/src/libs_zanthus" 
      cd libs_zanthus
      sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so/* .
      sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/* .
      sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so . 
    
      #Adiciona ao carregamento de libs do sistema
      sudo echo "/usr/src/libs_zanthus" >> /etc/ld.so.conf
      sudo ldconfig

    else
      sudo echo "libs_zanthus já existe..."
    fi
    ########################### Libs da Zanthus #################################
    
    #Insere a Kernz no .ini do Php e Apache
    sudo echo -e "\n"
    sudo echo -e "Digite o caminho para a kernz.so \n"
    read pathkernz
    if [ -d $pathkernz ]; then
    	sudo echo "extension=$pathkernz" >> /etc/php5/apache2/php.ini
	    sudo echo -e "\n" >> /etc/php5/apache2/php.ini
	    sudo echo "extension=$pathkernz" >> /etc/php5/cli/php.ini
	    sudo echo -e "\n" >> /etc/php5/cli/php.ini
    fi
    
    ################### Instala a .so do dbase ########################
    sudo pecl install dbase
    pathdbase = /usr/lib/php5/20131226/dbase.so
    if [[ -e $pathdbase ]]; then
    	sudo echo "extension=$pathdbase" >> /etc/php5/apache2/php.ini
	    sudo echo -e "\n" >> /etc/php5/apache2/php.ini
	    sudo echo "extension=$pathdbase" >> /etc/php5/cli/php.ini
	    sudo echo -e "\n" >> /etc/php5/cli/php.ini
    fi
    

    #Configura Timezone e charset
    sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php5/apache2/php.ini
    sudo echo -e "\n" >> /etc/php5/apache2/php.ini
    sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/apache2/php.ini
    sudo echo -e "\n" >> /etc/php5/apache2/php.ini

    #Configura Timezone e charset
    sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php5/cli/php.ini
    sudo echo -e "\n" >> /etc/php5/cli/php.ini
    sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/cli/php.ini
    sudo echo -e "\n" >> /etc/php5/cli/php.ini
   

    #instala repositorio para Spotify - programador também gosta de música :)
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886 
    sudo sudo echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update 

    #instala repositorio para Java 8
    sudo add-apt-repository -y ppa:webupd8team/java 
    sudo apt-get update 

    #instala repositorio para Android Studio
    sudo apt-add-repository -y ppa:paolorotolo/android-studio 

    #instala repositorio para Virtualbox
    sudo -e sudo echo "\n" >> /etc/apt/sources.list
    sudo sudo echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list
    sudo wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt-get update

    #Instala os pacotes e programas

    #Intala o skype primeiro por que ele baixa varias libs 32bits que programas com Wine usam
    sudo apt-get -y install skype 
    #Instala AcetoneIso programa para rodar isos
    sudo apt-get -y install acetoneiso
    #Plugin para abrir o terminal no diretório
    sudo apt-get -y install nautilus-open-terminal
    #Instala Steam
    sudo apt-get -y install steam 
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
    #Instala wine para rodar programas do windows
    sudo apt-get -y install wine 
    #Instala gimp para edição de imagens
    sudo apt-get -y install gimp 
    #Instala inkscape para edição de imagens
    sudo apt-get -y install inkscape 
    #Instala cliente de audio do spotify
    sudo apt-get -y install spotify-client 
    #Instala java 8
    sudo apt-get -y install oracle-java8-installer 
    #Instala Android Studio IDE Android
    sudo apt-get -y install android-studio 
    #Instala lib Curl para uso com php
    sudo apt-get -y install curl 
    #Instala playonlinux gerenciaento de plataforma wine
    sudo apt-get -y install playonlinux 
    #Instala controle de versionamento
    sudo apt-get -y install git-core 
    #Instala virtualbox para rodar maquinas virtuais
    sudo apt-get -y install virtualbox-5.0
    sudo wget -c http://download.virtualbox.org/virtualbox/5.0.8/Oracle_VM_VirtualBox_Extension_Pack-5.0.8-103449.vbox-extpack
    sudo virtualbox Oracle_VM_VirtualBox_Extension_Pack-5.0.8-103449.vbox-extpack
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
    sudo a2enmod rewrite 
    #Baixa o composer 
    curl -s https://getcomposer.org/installer | php 
    #Move o Composer 
    sudo mv composer.phar /usr/local/bin/composer 
    #Intala o instalador do laravel
    composer global require "laravel/installer=~1.1" 
    #Intala o instalador do lumen
    composer global require "laravel/lumen-installer=~1.0" 
    #Adiciona os vendors do composer as variáveis de ambiente
    export PATH=$PATH:/home/$usuario/.composer/vendor/bin 
    #Adiciona o NodeJs ao bash para ser instalado
    curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash - 
    #Atualiza os headers 
    sudo apt-get update 
    #Instala o NodeJs
    sudo apt-get install --yes nodejs
    #Conversor de pacotes RPM
    sudo apt-get -y install alien
    #Configurador de discos Ntfs
    sudo apt-get -y install ntfs-config

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

    #Instala Siblime-text 3

    versao = $(uname -i)
    if [[  $versao == "i386" || $versao == "i486" || $versao == "i686" ]]; then
       sudo wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_i386.deb
       sudo dpkg -i sublime-text_build-3083_i386.deb
       sudo rm -r sublime-text_build-3083_i386.deb

    else
       sudo wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
       sudo dpkg -i sublime-text_build-3083_i386.deb
       sudo rm -r sublime-text_build-3083_amd64.deb
    fi

    #Adiciona os Lauchers dos aplpicativos na sidebar
    adicionarLauchers

    mostrarMenuOpcoes    
}

removerAmbienteDesenvolvimento(){
	clear
    sudo echo "    Será REMOVIDO Ambiente de desenvolvimento Php que contém:"
    sudo echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug memcache" 
    sudo echo "    Apache-2.4"
    sudo echo "    Mysql"
    sudo echo "    Postgresql"
    sudo echo "    Skype"
    sudo echo "    Sublime-text-3"
    sudo echo "    AcetoneIso programa para rodar isos"
    sudo echo "    Steam"
    sudo echo "    Gdebi Instalador de pacotes"
    sudo echo "    Synaptic Gerenciador de dependencias"
    sudo echo "    Klavaro treinamento de digitação"
    sudo echo "    ubuntu-restricted-extras  pacotes extras com flash e codecs mp4"
    sudo echo "    Rar descompactador"
    sudo echo "    Filezilla cliente Ftp"
    sudo echo "    Wine para rodar programas do windows"
    sudo echo "    Gimp para edição de imagens"
    sudo echo "    Inkscape para edição de imagens"
    sudo echo "    Spotify cliente de audio"
    sudo echo "    java 8"
    sudo echo "    Android Studio IDE Android"
    sudo echo "    Curl lib para uso com php"
    sudo echo "    Playonlinux gerenciamento de plataforma wine"
    sudo echo "    Git controle de versionamento"
    sudo echo "    Virtualbox para rodar maquinas virtuais"
    sudo echo "    Luckybackup gerenciador de backup"
    sudo echo "    Freetds-commom php para conexão com banco de dados MSSQL"
    sudo echo "    Composer intalador dependencias Php"
    sudo echo "    laravel/installer instalador do Laravel 5"
    sudo echo "    lumen/installer instalador Lumen"
    sudo echo "    NodeJs"
    sudo echo "    Alien"
    sudo echo "    Ntfs-config"
    sudo echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    sudo echo -e "\n"
    sudo echo "    Deseja continuar? Sim[s], Não[n]"
    read op
    
    if [ ! $op == "s" ]; then
      mostrarMenuOpcoes
    fi

    capturaUsuario

    sudo echo "    Excluindo pastas e arquivos..."
    
    sudo pecl uninstall oci8
    sudo pecl uninstall xdebug
    sudo pecl uninstall dbase
    sudo apt-get -y purge php5.*
    sudo apt-get -y purge apache2
    sudo apt-get -y purge postgresql
    sudo apt-get -y purge mysql-server
    sudo apt-get -y purge subversion
    sudo rm -r /usr/lib/oracle
    
    ############### Libs ZAnthus #############
    cd /usr/src
    sudo rm -r /usr/src/libs_zanthus
    ############### Libs ZAnthus #############

    #Reconfigura carregamento de bibliotecas
    sudo ldconfig

    #Desistala os pacotes e programas
   
    #Remove repositorio para php5-5.6
    sudo add-apt-repository -r ppa:ondrej/php5-5.6
    sudo apt-get update 

    #Remove repositorio para Java 8
    sudo add-apt-repository -r ppa:webupd8team/java 
    sudo apt-get update 

    #Remove repositorio para Android Studio
    sudo apt-add-repository -r ppa:paolorotolo/android-studio 
    sudo apt-get update 
    
    #Desistala sendmail
    sudo apt-get -y purge sendmail 
    #Desistala AcetoneIso programa para rodar isos
    sudo apt-get -y purge acetoneiso
    #Plugin para abrir o terminal no diretório
    sudo apt-get -y purge nautilus-open-terminal
    #Desistala Steam
    sudo apt-get -y install steam 
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
    sudo apt-get -y purge wine 
    #Desistala gimp para edição de imagens
    sudo apt-get -y purge gimp 
    #Desistala inkscape para edição de imagens
    sudo apt-get -y purge inkscape 
    #Desistala cliente de audio do spotify
    sudo apt-get -y purge spotify-client 
    #Desistala java 8
    sudo apt-get -y purge oracle-java8-installer 
    #Desistala Android Studio IDE Android
    sudo apt-get -y purge android-studio 
    #Desistala lib Curl para uso com php
    sudo apt-get -y purge curl 
    #Desistala playonlinux gerenciaento de plataforma wine
    sudo apt-get -y purge playonlinux 
    #Desistala controle de versionamento
    sudo apt-get -y purge git-core 
    #Desistala virtualbox para rodar maquinas virtuais
    sudo apt-get -y purge virtualbox-5.0 
    #Desistala gerenciador de backup
    sudo apt-get -y purge luckybackup
    #Desistala  libs php para conexão com banco de dados MSSQL
    sudo apt-get -y purge freetds-common   
    #Desistala o Composer 
    sudo rm -r /usr/local/bin/composer 
    #Desistala o instalador do laravel
    sudo rm -r /home/$usuario/.composer/vendor/
    #Desistala o NodeJs
    sudo apt-get purge --yes nodejs
    #Desistala o skype por ultimo por que ele baixa varias libs 32bits que programas com Wine usam
    sudo apt-get -y purge skype
    #Desistala conversor de pacotes
    sudo apt-get -y purge alien
    #Desistala configurador de discos Ntfs
    sudo apt-get -y purge ntfs-config

    #remove os pacotes não ultilizados
    sudo apt-get -y autoremove
    sudo apt-get clean

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

    removerLauchers

    sudo echo "    Ambiente Servidor Ubuntu removido"

    mostrarMenuOpcoes
}


# IDE de desenvolvimento PHP #
instalarPhpStorm(){
  clear
  sudo echo "    Será instalado a IDE de desenvolvimento PhpStorm-9"
  sudo echo "    Deseja continuar? Sim[s], Não[n]"
  read op

  if [ ! $op == "s" ]; then
    mostrarMenuOpcoes
  fi

  sudo wget -c http://download.jetbrains.com/webide/PhpStorm-9.0.2.tar.gz
  sudo tar -zxvf PhpStorm-9.0.2.tar.gz
  sudo mv PhpStorm-141.2462 /opt/PhpStorm
  sudo chmod +x /opt/PhpStorm2/bin/phpstorm.sh
  sudo chmod -R 777 /opt/PhpStorm2

  #Cria arquivo executavel#
  sudo touch /usr/bin/phpstorm
  sudo chmod 755 /usr/bin/phpstorm
  sudo echo "#!/bin/sh" >> /usr/bin/phpstorm
  sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/phpstorm
  sudo echo "export PHPSTORM_HOME=/opt/PhpStorm" >> /usr/bin/phpstorm
  sudo echo "\$PHPSTORM_HOME/bin/phpstorm.sh $*" >> /usr/bin/phpstorm
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

  sudo rm -r PhpStorm-9.0.2.tar.gz

  if [[ $1 == "op" ]]; then
     mostrarMenuOpcoes
  fi
  
}

removerPhpStorm(){
	clear
	sudo echo "    Será removido a IDE de desenvolvimento PhpStorm-9"
	sudo echo "    Deseja continuar? Sim[s], Não[n]"
	read op

	if [ ! $op == "s" ]; then
		mostrarMenuOpcoes
	fi

    sudo rm -r /usr/bin/phpstorm
    sudo rm -r /bin/phpstorm
    sudo rm -r /opt/PhpStorm
    sudo rm -r /usr/share/applications/phpstorm.desktop

    if [[ $1 == "op" ]]; then
    	mostrarMenuOpcoes
    fi
}


# IDE de desenvolvimento JAVA #
instalarIntelliJ(){
	clear
	sudo echo "    Será instalado a IDE de desenvolvimento Intellij-IDEA"
	sudo echo "    Deseja continuar? Sim[s], Não[n]"
	read op

	if [ ! $op == "s" ]; then
		mostrarMenuOpcoes
	fi

	sudo wget -c http://download.jetbrains.com/idea/ideaIU-14.1.5.tar.gz
	sudo tar -zxvf ideaIU-14.1.5.tar.gz
	sudo mv idea-IU-141.2735.5 /opt/IntelliJ-IDEA
	sudo chmod +x /opt/IntelliJ-IDEA/bin/idea.sh
	sudo chmod -R 777 /opt/IntelliJ-IDEA

	#Cria arquivo executavel#
	sudo touch /usr/bin/idea
	sudo chmod 755 /usr/bin/idea
	sudo echo "#!/bin/sh" >> /usr/bin/idea
	sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/idea
	sudo echo "export IntelliJ_HOME=/opt/IntelliJ-IDEA" >> /usr/bin/idea
	sudo echo "\$IntelliJ_HOME/bin/idea.sh $*" >> /usr/bin/idea
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

	sudo rm -r ideaIU-14.1.5.tar.gz

	if [[ $1 == "op" ]]; then
	 mostrarMenuOpcoes
	fi
}

removerIntelliJ(){
	clear
	sudo echo "    Será removido a IDE de desenvolvimento Intellij-IDEA"
	sudo echo "    Deseja continuar? Sim[s], Não[n]"
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

# IDE de desenvolvimento C/C++ #
instalarClion(){
	clear
	sudo echo "    Será instalado a IDE de desenvolvimento Clion"
	sudo echo "    Deseja continuar? Sim[s], Não[n]"
	read op

	if [ ! $op == "s" ]; then
		mostrarMenuOpcoes
	fi
    sudo wget -c https://download.jetbrains.com/cpp/clion-1.1.1.tar.gz
    sudo tar -zxvf clion-1.1.1.tar.gz
    sudo mv clion-1.1.1 /opt/Clion
    sudo chmod +x /opt/Clion/bin/clion.sh
    sudo chmod -R 777 /opt/Clion

    #Cria arquivo executavel#
    sudo touch /usr/bin/clion
    sudo chmod 755 /usr/bin/clion
    sudo echo "#!/bin/sh" >> /usr/bin/clion
    sudo echo "export UBUNTU_MENUPROXY=0" >> /usr/bin/clion
    sudo echo "export CLION_HOME=/opt/IntelliJ-IDEA" >> /usr/bin/clion
    sudo echo "\$CLION_HOME/bin/clion.sh $*" >> /usr/bin/clion
    sudo ln -s /usr/bin/clion /bin/clion

    #Cria icone do desktop#
    sudo touch /usr/share/applications/clion.desktop
    sudo echo "[Desktop Entry]" >> /usr/share/applications/clion.desktop
    sudo echo "Encoding=UTF-8" >> /usr/share/applications/clion.desktop
    sudo echo "Name=Clion" >> /usr/share/applications/clion.desktop
    sudo echo "Comment=Clion IDE" >> /usr/share/applications/clion.desktop
    sudo echo "Exec=clion" >> /usr/share/applications/clion.desktop
    sudo echo "Icon=/opt/Clion/bin/clion.svg" >> /usr/share/applications/clion.desktop
    sudo echo "Terminal=false" >> /usr/share/applications/clion.desktop
    sudo echo "Type=Application" >> /usr/share/applications/clion.desktop
    sudo echo "Categories=GNOME;Application;Development;" >> /usr/share/applications/clion.desktop
    sudo echo "StartupNotify=true" >> /usr/share/applications/clion.desktop

    sudo rm -r clion-1.1.1.tar.gz

    if [[ $1 == "op" ]]; then
     mostrarMenuOpcoes
    fi
}

removerClion(){
	clear
	sudo echo "    Será removido a IDE de desenvolvimento Clion"
	sudo echo "    Deseja continuar? Sim[s], Não[n]"
	read op

	if [ ! $op == "s" ]; then
		mostrarMenuOpcoes
	fi

    sudo rm -r /usr/bin/clion
    sudo rm -r /bin/clion
    sudo rm -r /opt/Clion
    sudo rm -r /usr/share/applications/clion.desktop

    if [[ $1 == "op" ]]; then
        mostrarMenuOpcoes
    fi
}

instalarAmbienteServidorCentOs(){
	clear
    sudo echo "    Será instalado Ambiente para servidor CentOs que contém:"
    sudo echo "    Php-5.6 com libs: memcache, phpize"
    sudo echo "    Apache-2.4"
    sudo echo "    Oracle Instant-Client"
    sudo echo "    NodeJs"
    sudo echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    sudo echo -e "\n"
    sudo echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
    mostrarMenuOpcoes
    fi

    sudo echo "    Iniciando a instalação do servidor"
    cd /usr/src

    sudo echo "    Baixando bibliotecas"

    criarDiretorio "libs_zanthus"
    cd libs_zanthus
    sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so/* .
    sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/* .
    sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so .
    cd ..

    sudo echo "    Baixando pacotes de instalação"
    sudo wget ftp://192.168.0.54/* --ftp-user=eber --ftp-password=123456 .

    #Verifica se conseguiu fazer o download de tudo para continuar senão sai do processo
    if [ $? == 0 ]; then

      sudo echo "    Saindo do diretório"
      cd /
      sudo echo "    Descompactando php"
      sudo tar -xzvf /usr/src/instalar_apr_centos_6_5.tar.gz
      sudo echo "    Descompactando Apache"
      sudo tar -xzvf /usr/src/instalar_apache_centos_6_5.tar.gz
      sudo echo "    Descompactando InstantClient"
      sudo tar -xzvf /usr/src/instalar_instant_client_12_1.tar.gz
      sudo echo "    Descompactando libEvent"
      sudo tar -xzvf /usr/src/instalar_libevent_centos_6_5.tar.gz
      sudo echo "    Descompactando memcached"
      sudo tar -xzvf /usr/src/instalar_memcached_centos_6_5.tar.gz
      sudo echo "    Descompactando node"
      sudo tar -xzvf /usr/src/instalar_node_centos_6_5.tar.gz
      sudo echo "    Descompactando php"
      sudo tar -xzvf /usr/src/instalar_php_centos_6_5.tar.gz

      sudo echo "    Criando links e copiando arquivos"
      cd /usr/src
      sudo mv bibliotecas_zanthus.conf /etc/ld.so.conf.d/.
      sudo mv instant_client.conf /etc/ld.so.conf.d/.
      sudo mv -f index.html /usr/local/apache22/htdocs/.

      sudo chmod +x memcached
      criarDiretorio "/usr/local/Zend"
      criarDiretorio "/usr/local/Zend/etc"
      sudo cp php.ini /usr/local/Zend/etc/.
      #O php precisa ter o mesmo caminho do módulo php no apache
      sudo ln -sf /usr/local/Zend/etc/php.ini  /usr/local/php/lib/php.ini
      sudo ln -sf /usr/local/php/bin/php /usr/local/bin/php
      sudo ln -sf /usr/local/php/bin/php-config /usr/local/bin/php-config
      sudo ln -sf /usr/local/php/bin/phpize /usr/local/bin/phpize
      sudo ln -sf /usr/local/memcached/bin/memcached /usr/local/bin/memcached
      sudo ln -sf /usr/local/apache22/bin/apachectl /etc/init.d/apache
      sudo ln -sf /usr/src/libevent-2.0.22-stable/.libs/libevent-2.0.so.5 /lib64/libevent-2.0.so.5
      sudo ln -sf /usr/local/apr/lib/libaprutil-1.so.0 /lib64/libaprutil-1.so.0
      sudo ln -sf /usr/local/memcached/bin/memcached /var/run/memcached
      sudo ln -sf /usr/local/node/bin/node /usr/local/bin/node
      sudo ln -sf /usr/src/memcached /etc/init.d/memcached
      sudo ln -sf /etc/init.d/memcached /etc/rc3.d/S99memcached
      sudo ln -sf /etc/init.d/apache /etc/rc3.d/S99apache
      sudo ln -sf /usr/local/apache22/htdocs /web

      sudo ldconfig

      sudo echo "    vamos subir o serviço Apache"
      sudo service apache start

      sudo echo "    vamos subir o serviço do Memcached"
      sudo service memcached start
      sudo service apache start

      sudo echo "    criando usuário"
      sudo adduser zanthus

      sudo echo "    fim"
      mostrarMenuOpcoes

     else
     sudo echo "Erro ao fazer download de pacotes de instalação"
     read res
     mostrarMenuOpcoes
    fi
}


#Remove o Ambiente Servidor CentOs
removerAmbienteServidorCentOs(){
	clear
    sudo echo "    Será REMOVIDO Ambiente para servidor CentOs que contém:"
    sudo echo "    Php-5.6 com libs: memcache, phpize"
    sudo echo "    Apache-2.4"
    sudo echo "    Oracle Instant-Client"
    sudo echo "    NodeJs"
    sudo echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    sudo echo -e "\n"
    sudo echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
    mostrarMenuOpcoes
    fi

    sudo echo "    Excluindo pastas e arquivos..."

    cd /usr/src
    sudo rm -r /usr/src/libs_zanthus
    sudo rm -r /usr/local/Zend
    sudo rm -r /usr/local/apache22
    sudo rm -r /etc/init.d/apache
    sudo rm -r /etc/rc3.d/S99apache
    sudo rm -r /usr/local/php
    sudo rm -r /usr/local/bin/php
    sudo rm -r /usr/local/bin/php-config
    sudo rm -r /usr/local/bin/phpize

    sudo rm -r /usr/local/memcached/
    sudo rm -r /var/run/memcached
    sudo rm -r /etc/init.d/memcached
    sudo rm -r /etc/rc3.d/S99memcached
    sudo rm -r /usr/local/bin/memcached

    sudo rm -r /usr/local/node/
    sudo rm -r /usr/local/bin/node
    sudo rm -r /web
    sudo rm -r /etc/init.d/apache
    sudo rm -r /lib64/libevent-2.0.so.5
    sudo rm -r /lib64/libaprutil-1.so.0
    sudo rm -r /usr/local/instant_client_12_1

    sudo ldconfig

    sudo deluser zanthus

    sudo echo "    Ambiente CentOs removido"
    mostrarMenuOpcoes
}



instalarAmbienteServidorUbuntu(){
	clear
    sudo echo "    Será instalado o Ambiente para servidor Ubuntu/Debian que contém:"
    sudo echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug memcache"
    sudo echo "    Apache-2.4"
    sudo echo "    Mysql"
    sudo echo "    Postgresql"
    sudo echo "    Subversion"
    sudo echo "    Gdebi Instalador de pacotes"
    sudo echo "    Synaptic Gerenciador de dependencias"
    sudo echo "    Rar descompactador"
    sudo echo "    Filezilla cliente Ftp"
    sudo echo "    java 8"
    sudo echo "    Curl lib para uso com php"
    sudo echo "    Freetds-commom php para conexão com banco de dados MSSQL"
    sudo echo "    Composer intalador dependencias Php"
    sudo echo "    laravel/installer instalador do Laravel 5"
    sudo echo "    lumen/installer instalador Lumen"
    sudo echo "    NodeJs"
    sudo echo "    Para instalar a lib oci8.so certifique-se de que o Oracle Instant Client esteja instalado!"

    sudo echo -e "\n"
    sudo echo "Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
      mostrarMenuOpcoes
    fi

    capturaUsuario

    cd ~
    sudo add-apt-repository -y ppa:ondrej/php5-5.6
    sudo apt-get update
    sudo apt-get install -y php5
    sudo apt-get install -y apache2
    sudo apt-get install -y mysql-server
    sudo apt-get install -y phpmyadmin
    sudo apt-get install -y postgresql
    sudo apt-get install -y subversion
    sudo apt-get install -y php5-dev
    sudo apt-get install -y php5-curl
    sudo apt-get install -y php5-json
    sudo apt-get install -y php5-ldap
    sudo apt-get install -y php5-mssql
    sudo apt-get install -y php5-odbc
    sudo apt-get install -y php5-pgsql
    sudo apt-get install -y php5-mcrypt
    sudo apt-get install -y php5-sybase
    sudo apt-get install -y php5-memcached
    sudo apt-get install -y php5-openssl
    sudo apt-get install -y memcached
    sudo apt-get install -y sendmail

    ###################  Instala a .so do oracle ###################### /home/tairo/extensions/no-debug-non-zts-20131226
    #Verifica se o caminho padrão para a pasta oracle existe
    pathInstantClient = /usr/lib/php5/20131226/oci8.so
    if [ -e $pathInstantClient ]; then
      sudo pecl install oci8
      sudo echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/apache2/php.ini
      sudo echo -e "\n" >> /etc/php5/apache2/php.ini
      sudo echo "extension=/usr/lib/php5/20131226/oci8.so" >> /etc/php5/cli/php.ini
      sudo echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    ########################### Libs da Zanthus #################################
    cd /usr/src

    if [ ! -d /usr/src/libs_zanthus  ]; then
      sudo echo "Criando e baixando bibliotecas para a pasta libs_zanthus..."
      criarDiretorio "/usr/src/libs_zanthus"
      cd libs_zanthus
      sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so/* .
      sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/so_r64/* .
      sudo wget ftp://ftp.zanthus.com.br/pub/Zeus_Frente_de_Loja/_Complementares/KernD/v2_1/*.so .

      #Adiciona ao carregamento de libs do sistema
      sudo echo "/usr/src/libs_zanthus" >> /etc/ld.so.conf
      sudo ldconfig

    else
      sudo echo "libs_zanthus já existe..."
    fi
    ########################### Libs da Zanthus #################################

    #Insere a Kernz no .ini do Php e Apache
    sudo echo -e "\n"
    sudo echo -e "Digite o caminho para a kernz.so \n"
    read pathkernz
    if [ -d $pathkernz ]; then
        sudo echo "extension=$pathkernz" >> /etc/php5/apache2/php.ini
        sudo echo -e "\n" >> /etc/php5/apache2/php.ini
        sudo echo "extension=$pathkernz" >> /etc/php5/cli/php.ini
        sudo echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    ################### Instala a .so do dbase ########################
    sudo pecl install dbase
    pathdbase = /usr/lib/php5/20131226/dbase.so
    if [[ -e $pathdbase ]]; then
        sudo echo "extension=$pathdbase" >> /etc/php5/apache2/php.ini
        sudo echo -e "\n" >> /etc/php5/apache2/php.ini
        sudo echo "extension=$pathdbase" >> /etc/php5/cli/php.ini
        sudo echo -e "\n" >> /etc/php5/cli/php.ini
    fi


    #Configura Timezone e charset
    sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php5/apache2/php.ini
    sudo echo -e "\n" >> /etc/php5/apache2/php.ini
    sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/apache2/php.ini
    sudo echo -e "\n" >> /etc/php5/apache2/php.ini

    #Configura Timezone e charset
    sudo echo "date.timezone = America/Sao_Paulo" >> /etc/php5/cli/php.ini
    sudo echo -e "\n" >> /etc/php5/cli/php.ini
    sudo echo -e "default_charset = \"ISO-8859-1\"" >> /etc/php5/cli/php.ini
    sudo echo -e "\n" >> /etc/php5/cli/php.ini


    #instala repositorio para Java 8
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get update

    #Instala os pacotes e programas

    #Instala Gdebi Instalador de pacotes
    sudo apt-get -y install gdebi
    #Instala Gerenciador de dependencias
    sudo apt-get -y install synaptic
    #Instala descompactador
    sudo apt-get -y install rar
    #Instala cliente ftp
    sudo apt-get -y install filezilla
    #Instala java 8
    sudo apt-get -y install oracle-java8-installer
    #Instala lib Curl para uso com php
    sudo apt-get -y install curl
    #Instala  libs php para conexão com banco de dados MSSQL
    sudo apt-get -y install freetds-common
    #Atualiza os headers
    sudo apt-get update
    # reinicializa Apache
    sudo service apache2 restart
    #Da permição para a pasta do apache
    sudo chmod -R 777 /var/www
    #Habilita o modrewrite do apache
    sudo a2enmod rewrite
    #Baixa o composer
    curl -s https://getcomposer.org/installer | php
    #Move o Composer
    sudo mv composer.phar /usr/local/bin/composer
    #Intala o instalador do laravel
    composer global require "laravel/installer=~1.1"
    #Intala o instalador do lumen
    composer global require "laravel/lumen-installer=~1.0"
    #Adiciona os vendors do composer as variáveis de ambiente
    export PATH=$PATH:/home/$usuario/.composer/vendor/bin
    #Adiciona o NodeJs ao bash para ser instalado
    curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
    #Atualiza os headers
    sudo apt-get update
    #Instala o NodeJs
    sudo apt-get install --yes nodejs

    mostrarMenuOpcoes

}


#Remove Ambiente Servidor Ubuntu
removerAmbienteServidorUbuntu(){
	clear
    sudo echo "    Será REMOVIDO o Ambiente para servidor Ubuntu/Debian que contém:"
    sudo echo "    Php-5.6 com as libs: php5-dev php5-curl php5-json php5-ldap php5-mssql php5-odbc php5-pgsql php5-mcrypt php5-sybase oci8 xdebug memcache"
    sudo echo "    Apache-2.4"
    sudo echo "    Mysql"
    sudo echo "    Postgresql"
    sudo echo "    Gdebi Instalador de pacotes"
    sudo echo "    Synaptic Gerenciador de dependencias"
    sudo echo "    Rar descompactador"
    sudo echo "    Filezilla cliente Ftp"
    sudo echo "    java 8"
    sudo echo "    Curl lib para uso com php"
    sudo echo "    Freetds-commom php para conexão com banco de dados MSSQL"
    sudo echo "    Composer intalador dependencias Php"
    sudo echo "    laravel/installer instalador do Laravel 5"
    sudo echo "    lumen/installer instalador Lumen"
    sudo echo "    NodeJs"
    sudo echo "    E bibliotecas Zanthus para rodar Zeus_Frente_de_Loja"
    sudo echo -e "\n"
    sudo echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
      mostrarMenuOpcoes
    fi

    capturaUsuario

    sudo echo "    Excluindo pastas e arquivos..."

    sudo pecl uninstall oci8
    sudo pecl uninstall dbase
    sudo apt-get -y purge php5.*
    sudo apt-get -y purge apache2
    sudo apt-get -y purge postgresql
    sudo apt-get -y purge mysql-server
    sudo apt-get -y purge subversion
    sudo rm -r /usr/lib/oracle

    ############### Libs ZAnthus #############
    cd /usr/src
    sudo rm -r /usr/src/libs_zanthus
    ############### Libs ZAnthus #############

    #Reconfigura carregamento de bibliotecas
    sudo ldconfig

    #Desistala os pacotes e programas

    #Remove repositorio para php5-5.6
    sudo add-apt-repository -r ppa:ondrej/php5-5.6
    sudo apt-get update

    #Remove repositorio para Java 8
    sudo add-apt-repository -r ppa:webupd8team/java
    sudo apt-get update


    #Desistala sendmail
    sudo apt-get -y purge sendmail
    #Desistala Gdebi Instalador de pacotes
    sudo apt-get -y purge gdebi
    #Desistala Gerenciador de dependencias
    sudo apt-get -y purge synaptic
    #Desistala descompactador
    sudo apt-get -y purge rar
    #Desistala cliente ftp
    sudo apt-get -y purge filezilla
    #Desistala java 8
    sudo apt-get -y purge oracle-java8-installer
    #Desistala lib Curl para uso com php
    sudo apt-get -y purge curl
    #Desistala  libs php para conexão com banco de dados MSSQL
    sudo apt-get -y purge freetds-common
    #Desistala o Composer
    sudo rm -r /usr/local/bin/composer
    #Desistala o instalador do laravel
    sudo rm -r /home/$usuario/.composer/vendor/
    #Desistala o NodeJs
    sudo apt-get purge --yes nodejs
    #Desistala o skype por ultimo por que ele baixa varias libs 32bits que programas com Wine usam
    sudo apt-get -y purge skype

    #remove os pacotes não ultilizados
    sudo apt-get -y autoremove
    sudo apt-get clean

    sudo echo "    Ambiente Servidor Ubuntu removido"

    mostrarMenuOpcoes
}


#Converte o arquivo .rpm para .deb e instala no caminho padrão do oracle
instalarOracleInstantClient(){

    cd ~
    #Insere a Kernz no .ini do Php e Apache
    sudo echo -e "\n"
    sudo echo -e "    Digite o link para baixar o instant_client \n"
    read pathOracleInstantClient

    if [[ $pathOracleInstantClient == "" ]]; then
        sudo echo "link inválido..."
        read res
        mostrarMenuOpcoes
    fi

    sudo wget "$pathOracleInstantClient"

    #Verifica se ultima ação foi efetuada com sucesso
    if [ -e instant_client_12.1.tar.gz ]; then

      #Descompacta intant Client
      sudo tar -zxvf instant_client_12.1.tar.gz

      #Instala pacotes
      sudo dpkg -i oracle-instantclient12.1-basic.deb
      sudo dpkg -i oracle-instantclient12.1-devel.deb
      sudo dpkg -i oracle-instantclient12.1-jdbc.deb
      sudo dpkg -i oracle-instantclient12.1-odbc.deb
      sudo dpkg -i oracle-instantclient12.1-sqlplus_.deb
      sudo dpkg -i oracle-instantclient12.1-tools.deb

      export ORACLE_HOME=$ORACLE_HOME:/usr/lib/oracle/12.1/client64/lib
      export ORACLE_HOME=$ORACLE_HOME:/usr/lib/oracle/12.1/client64/bin

      #Remove pacotes pacotes
      sudo rm -r oracle-instantclient12.1-basic.deb
      sudo rm -r oracle-instantclient12.1-devel.deb
      sudo rm -r oracle-instantclient12.1-jdbc.deb
      sudo rm -r oracle-instantclient12.1-odbc.deb
      sudo rm -r oracle-instantclient12.1-sqlplus.deb
      sudo rm -r oracle-instantclient12.1-tools.deb
      sudo rm -r instant_client_12.1.tar.gz

	  clear
      sudo echo -e " Oracle Instant Client instalado com sucesso.. \n"
      read res
      mostrarMenuOpcoes

    else
      clear
      sudo echo "    Não foi possível fazer o download dos arquivos do instant_client verifique a conexão ou o link dos arquivos"
      read res
    fi

    mostrarMenuOpcoes
}


removerOracleInstantClient(){
	clear
    sudo echo -e "\n"		
    sudo echo "    Deseja continuar? Sim[s], Não[n]"
    read op

    if [ ! $op == "s" ]; then
      mostrarMenuOpcoes
    fi

    sudo rm -r /usr/lib/oracle
    sudo echo ""
    read res
    mostrarMenuOpcoes
}


adicionarLauchers(){
    sudo gsettings set com.canonical.Unity.Launcher favorites "['application://gnome-terminal.desktop', 'application://nautilus.desktop', 'application://google-chrome.desktop', 'application://firefox.desktop', 'application://phpstorm.desktop', 'application://idea.desktop', 'application://android-studio.desktop', 'application://sublime_text.desktop', 'application://virtualbox.desktop', 'application://filezilla.desktop', 'application://skype.desktop', 'application://spotify.desktop', 'application://rhythmbox.desktop', 'application://PlayOnLinux.desktop', 'application://ubuntu-software-center.desktop', 'application://ntfs-config.desktop', 'application://unity-control-center.desktop', 'application://gnome-system-monitor.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices', 'unity://desktop-icon']"
}

removerLauchers(){
    sudo gsettings reset com.canonical.Unity.Launcher favorites
}

mostrarAjuda(){
	clear
	sudo echo "    #######################################################################################"
	sudo echo "    #                           Menu de ajuda para script linux                           #"
	sudo echo "    #######################################################################################"
	sudo echo -e "\n"
 	sudo echo -e "    Este script contém as principais aplicações para montar o ambiente"
 	sudo echo -e "    desenvolvimento."
 	sudo echo -e "    Não são mostradas as opções 9,10,11,12,13,14,15,16 e 79"
 	sudo echo -e "     9 - Instalação da IDE PhpStorm"
 	sudo echo -e "    10 - Remove IDE PhpStorm"
 	sudo echo -e "    11 - Instalação da IDE Intellij-IDEA"
 	sudo echo -e "    12 - Remove IDE Intellij-IDEA"
 	sudo echo -e "    13 - Instalação IDE Clion"
 	sudo echo -e "    14 - Remove IDE Clion"
 	sudo echo -e "    15 - Monta o Ambiente de desenvolvimento com PhpStorm, Intellij-IDEA e Clion"
 	sudo echo -e "    16 - Remove o Ambiente de desenvolvimento instalado na opção 15"
 	sudo echo -e "    79 - opção de teste"
 	sudo echo -e "\n"
	sudo echo "    #######################################################################################"
	read res
	mostrarMenuOpcoes
}

teste(){

   sudo wget -c http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
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
# sudo echo -e \$VARIAVEL : imprime a string, não o conteúdo
# sudo echo $VARIAVEL : imprime o conteúdo da variável
#######################################################################################

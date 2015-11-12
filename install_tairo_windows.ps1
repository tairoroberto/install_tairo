write-host "    #################################################################################"
write-host "    #   Scrypt para instalação de ambiente de desenvolvimento PHP-ANDROID-C-JAVA    #"
write-host "    #                         - TAIRO ROBERTO M. ASSUNÇÃO -                         #"
write-host "    #                                                                               #"
write-host "    #################################################################################"

#Primeiramente deve-se habilitar a execução de scripts no PowerShell com o commando 'Set-ExecutionPolicy Unrestricted'


#Baixa  os arquivos de instalação do ambiente
write-host "Baixando os pacotes para a montagem do ambiente de desenvolvimento..."
Clear
$origem = "http://url.com.br/Ambiente.zip"
$destino = $env:USERPROFILE + "\Desktop\Ambiente.zip"
$web = New-Object System.Net.WebClient
$web.DownloadFile($origem, $destino)
Write-Host "Descarregamento concluído. O ficheiro encontra-se no teu ambiente de trabalho." 

#Descompacta os pacotes
unzip($destino)





#Função que descompacta arquivos
function unzip($filename) { 
    if (!(test-path $filename)) { 
        throw "$filename does not exist" 
    } 

    $shell = new-object -com shell.application 
    $shell.namespace($pwd.path).copyhere($shell.namespace((join-path $pwd $filename)).items()) 
}
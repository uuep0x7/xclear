#!/bin/sh

# Dependecia Figlet & cMatrix

# Devidas limpezas e configurações de pacotes #
# Instale o figlet e o cmatrix
# apt install -y figlet cmatrix
clear
echo -n "\n\n"
figlet -f mini Login
echo -n "\n\n\n[+] Entre com um usuário > "
read nome
who| grep $nome > /dev/null

if [ $? -eq 0 ] ; then
	clear
	figlet -f mini $nome
	sleep 1
	
	echo -n "\n[+] Versão do apt: "
	apt-config -v
	sleep 2
	
	echo -n "[+] Limpando todos os pacotes de /var/cache/apt/archives \n"
	apt-get clean >> cls.l
	apt-get autoclean >> cls.l
	sleep 2
	
	echo -n "[+] Removendo todos os pacotes e seus arquivos de configuração\n"
	apt-get remove >> cls.l
	sleep 2
	
	echo -n "[+] Verificando as dependências e tenta corrigir os problemas\n"
	apt-get -f install >> cls.l
	sleep 2
	
	echo -n "[+] Configurando dpkg\n"
	dpkg --configure -a >> cls.l
	sleep 2
	
	echo -n "[+] Corrigindo erros de travamento de pacote\n"
	rm -rf /var/lib/apt/lists/*
	sleep 2
	
	echo -n "\n[+] Limpeza concluída [+]\n"
	sleep 2
		
	echo -n "\n[+] Preparando atualizações\n"
	sleep 2
	echo -n "[!] Aguarde, este processo pode demorar varios minutos...\n"
	sleep 2
	echo -n "[!] Você pode ir tomar um ar, ou ir tomar um chá :) \n"
	apt-get update >> att.l
	sleep 2
	
	echo -n "[+] Atualizando todo o sistema para uma nova versão da distribuição\n"
	apt-get dist-upgrade -y >> att.l
	sleep 2
		
	echo -n "[+] Corrigindo pacotes\n"
	apt-get autoremove >> cls.l
	sleep 2
	
	echo -n "\n[+] Atualização concluida [+]\n"
	rm -rf att.l
	rm -rf cls.l
	sleep 2
else
	clear
	figlet -f block Error 
	echo "\n[!] O usuário $nome não existe\n"
	sleep 3
	sh xclean.sh
fi
########

echo "[+] FIM [+]"
figlet xClear
sleep 1
cmatrix


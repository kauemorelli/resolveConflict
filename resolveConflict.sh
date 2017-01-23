#!/bin/bash

##########################################################
##########################################################
##														##
##   COMMAND TO USE THIS BASH:							##
##   ./resolveConflict.sh [BRANCH-TASK] [BRANCH-PACK]	##
##														##
##########################################################
##########################################################

# Functions
function branchInicial {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
function fileToCommit {
	git ls-files --others -m --exclude-standard | wc -l
}

# Script
echo -e "\033[01;36m******************************************************************\033[0m"
echo -e "\033[01;36m********************** Resolvendo Conflitos **********************\033[0m"
echo -e "\033[01;36m******************************************************************\033[0m"
echo ""
echo -e "*********************** Status Atual ************************"
echo -e "\033[01;1;37mBranch atual:\033[01;31m$(branchInicial)"
echo -e "\033[0m"
echo -e "\033[01;1;37mArquivos para comitar: \033[01;31m$(fileToCommit)\033[0m"
echo ""

echo -e "********************** Info Parametros **********************"
echo -e "\033[01;1;37mBranch da Tarefa:\033[01;31m $1"
echo -e "\033[0m"
echo -e "\033[01;1;37mBranch do Pacote:\033[01;31m $2"
echo -e "\033[0m"
echo -e "*************************************************************"
echo ""

if test $(fileToCommit) -eq 0;
then
	echo "Igual a 0"
	echo "Entrando na branch da Tarefa"
	#git checkout [BRANCH-TASK]
	#git pull origin [BRANCH-TASK]
	echo "Criando (como base a branch da task) e indo para nova Branch (para manter um backup)"
	#git branch [BRANCH-TASK] + "-RC"
	#git checkout [BRANCH-TASK] + "-RC"
	echo "Trazendo a Branch do pacote (para trazer os conflitos)"
	#git git pull origin [BRANCH-PACOTE]
	echo "Gerando os Arquivos compilados (Grunt / Gulp)"
	#grunt prod
	echo "Comitando"
	#git add --all
	#git commit -m "Resolvend conflict (bash)"
	echo "Efetuando PUSH na Branch"
	#git push origin [BRANCH-TASK] + "-RC"
	echo "Voltando à Branch anterior"
	#git checkout $(branchInicial)
else
	echo "Diferente de 0"
	echo "Alterações na branch atual não comitadas estao sendo adicionadas no Stash"
	#git add . && git stash
	echo "Entrando na branch da Tarefa"
	#git checkout [BRANCH-TASK]
	#git pull origin [BRANCH-TASK]
	echo "Criando (como base a branch da task) e indo para nova Branch (para manter um backup)"
	#git branch [BRANCH-TASK] + "-RC"
	#git checkout [BRANCH-TASK] + "-RC"
	echo "Trazendo a Branch do pacote (para trazer os conflitos)"
	#git git pull origin [BRANCH-PACOTE]
	echo "Gerando os Arquivos compilados (Grunt / Gulp)"
	#grunt prod
	echo "Comitando"
	#git add --all
	#git commit -m "Resolvend conflict (bash)"
	echo "Efetuando PUSH na Branch"
	#git push origin [BRANCH-TASK] + "-RC"
	echo "Voltando à Branch anterior"
	#git checkout $(branchInicial)
	echo "Voltando os arquivos do Stash"
	#git stash apply
fi
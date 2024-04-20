*** Settings ***
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/listar_diretoria.resource



*** Test Cases ***
CT01 - Listar Diretoria
    Criar sessão
    Entrar com usuário sysadmin
    Listar Diretoria 

    
CT02 - Contagem Diretoria
    Criar sessão
    Entrar com usuário sysadmin
    Contagem Diretoria 
    Conferir Contagem
    
CT03 - Mostrar Diretoria Id
    Criar sessão
    Entrar com usuário sysadmin
    Mostrar Diretoria Id
    Conferir Diretoria por id
    
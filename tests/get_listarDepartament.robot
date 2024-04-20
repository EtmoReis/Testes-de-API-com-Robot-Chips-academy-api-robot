*** Settings ***
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin11.resource
Resource    ../resource/listar_centrodeCustos.resource
Resource    ../resource/listar_Departament.resource



*** Test Cases ***
CT0 - Listar ,Contar e Mostrar id Departament
    Criar sessão
    Entrar com usuário sysadmin
    Listar Departament
    Contagem Departament
    Mostrar um Departament
    Conferir Departament por id
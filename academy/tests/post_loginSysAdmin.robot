*** Settings ***
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/arquivo_geral.resource

*** Test Cases ***
CT01 - Login de usuário
    Criar sessão
    Entrar com usuário sysadmin
    Validar o token e gravar em um header de autorização
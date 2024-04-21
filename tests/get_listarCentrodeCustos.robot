*** Settings ***
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin11.resource
Resource    ../resource/listar_centrodeCustos.resource




*** Test Cases ***
CT0 - Listar ,Contar e Mostrar id Centro de Custos
    Criar sessão
    Entrar com usuário sysadmin
    Listar Centro de Custos
    Contagem de centro de custos
    Mostrar um centro de custos
    Conferir Cento de Custos por id

CT1 - Listar Centro de Custos (N funcionais)
    Criar sessão
    Entrar com usuário sysadmin
    Listar Centro de Custos 403
    
CT2 -Contar Centro de Custos (N funcionais)
    Criar sessão
    Entrar com usuário sysadmin
    Contagem de centro de custos 403
    Contagem de centro de custos 500
CT3 -Mostrar Centro de Custos por id (N funcionais)
    Criar sessão
    Entrar com usuário sysadmin
    Mostrar um centro de custos 403
    Mostrar um centro de custos 404
    Mostrar um centro de custos 500
    #Conferir Cento de Custos por id
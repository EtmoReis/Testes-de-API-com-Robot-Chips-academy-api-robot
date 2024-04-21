*** Settings ***
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/criarCentrodeCustos.resource
*** Test Cases ***
CT01 - Criar Cenro de Custos
    Criar sessão
    Entrar com usuário sysadmin
    criarCentrodeCustos.Criar uma nova diretoria
    criarCentrodeCustos.Cadastrar a nova Diretoria criada
    criarCentrodeCustos.Criar um novo Cenro de Custos
    Cadastrar o novo Centro de Custos
    conferir se este novo centro de custos foi cadastrado corretamente
*** Settings ***
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/criarCentrodeCustos.resource
Resource    ../resource/alterar_CentrodeCustos.resource

*** Test Cases ***
CT01 - Alterar Centro de Custos
    Criar sessão
    Entrar com usuário sysadmin
    criarCentrodeCustos.Criar uma nova Diretoria
    criarCentrodeCustos.Cadastrar a nova Diretoria criada
    criarCentrodeCustos.Criar um novo Cenro de Custos
    criarCentrodeCustos.Cadastrar o novo Centro de Custos
     criarCentrodeCustos.conferir se este novo centro de custos foi cadastrado corretamente
    Alterar Centro de Custo por id
    Conferir se Cento de Custos foi alterada corretamente
    Alterar Status Centro de Custo por id
    Conferir se status Cento de Custos foi alterada corretamente
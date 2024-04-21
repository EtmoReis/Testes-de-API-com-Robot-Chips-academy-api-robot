*** Settings ***
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/criar_diretoria.resource
Resource    ../resource/criar_Departament.resource
*** Test Cases ***
CT01 - Criar Departament
    Criar sessão
    Entrar com usuário sysadmin
    criar_Departament.Criar uma nova Diretoria
    criar_Departament.Cadastrar a nova Diretoria criada
    criarCentrodeCustos.Criar um novo Cenro de Custos
    criarCentrodeCustos.Cadastrar o novo Centro de Custos
    criarCentrodeCustos.conferir se este novo centro de custos foi cadastrado corretamentE
    Criar um novo Departament
    Cadastrar o novo Departament
    conferir se este novo Departament foi cadastrado corretamente
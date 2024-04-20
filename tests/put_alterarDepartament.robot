*** Settings ***
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/alterar_Departament.resource
Resource    ../resource/alterar_CentrodeCustos.resource

*** Test Cases ***
CT01 - Alterar Departament
    Criar sessão
    Entrar com usuário sysadmin
    criar_Departament.Criar um novo Departament
    criar_Departament.Cadastrar o novo Departament
    criar_Departament.conferir se este novo Departament foi cadastrado corretamente
    Alterar um departamento passando o id.
    Alterar Status de um deparatamento false por id
    #lterar Status de um deparatamento true por id
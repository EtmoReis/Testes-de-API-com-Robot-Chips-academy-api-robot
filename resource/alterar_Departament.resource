*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/criar_diretoria.resource
Resource    ../resource/criarCentrodeCustos.resource
Resource   ../resource/criar_Departament.resource


Library  String
Library  Collections

*** Variables ***
${ID_COST}=  625113b32cfe27bbd205dc4

*** Keywords ***


 Alterar um departamento passando o id.
    ...    ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/department/${ID_DEPA}  expected_status=200  data={"departmentName":Etcwemelost","costCenterId": "${ID_DEPA}" }  headers=${headers}




Alterar Status de um deparatamento false por id 
    ...    ${headers}    Create Dictionary    Authorization=${TOKEN}
      ${body}   Create Dictionary  status=${TRUE}
  ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/department/status/${ID_BOARDI}  expected_status=202  json=${body}  headers=${headers}
  Log   ${alterar_CentrodeCustos.json()}

  
Alterar Status de um deparatamento true por id
    ...    ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/department/status/${ID_BOARDI}  expected_status=202  data={"status": "false"}  headers=${headers}
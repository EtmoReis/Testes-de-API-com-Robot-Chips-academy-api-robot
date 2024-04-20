*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/criarCentrodeCustos.resource
Resource    ../resource/alterar_CentrodeCustos.resource
Resource    ../resource/criar_Departament.resource
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***


*** Keywords ***
Alterar Centro de Custo por id
    ...    ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/costCenter/${ID_COST}    expected_status=200  data={"costCenterName":"st${BOARD_NAME}","boardId":"${ID_BOARDI}"}  headers=${headers}
  Log   ${alterar_CentrodeCustos}
  Set Test Variable    ${alterar_CentrodeCustos}      ${alterar_CentrodeCustos.json()}

Conferir se Cento de Custos foi alterada corretamente
    Dictionary Should Contain Item    ${alterar_CentrodeCustos}   msg    Cadastro atualizado com sucesso.


Alterar Status Centro de Custo por id
    ${headers}    Create Dictionary    Authorization=${TOKEN}
   ${novo_dado}=  Create Dictionary    status=true    
   ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/costCenter/status/${ID_COST}   expected_status=202  json=${novo_dado}  headers=${headers}
  Log   ${alterar_CentrodeCustos.content}   
  Set Test Variable           ${alterar_CentrodeCustos}     ${alterar_CentrodeCustos.json()}

Conferir se status Cento de Custos foi alterada corretamente
    Dictionary Should Contain Item    ${alterar_CentrodeCustos}   msg    Centro de custos inativado com sucesso!

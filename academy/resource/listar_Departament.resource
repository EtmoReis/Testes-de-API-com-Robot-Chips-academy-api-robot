*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource   ../resource/criar_Departament.resource
Library  RequestsLibrary
Library  String
Library  Collections
 

*** Variables ***
${ID_DEPA}  6585a32b31248304b069e103
*** Keywords ***
Listar Departament
    ${headers}    Create Dictionary     Authorization=${TOKEN}
  ${listar_cost}  GET On Session  alias=Chips  url=/api/department/   expected_status=200    headers=${headers}
  Log  ${Listar_cost.json()}
  Set Test Variable     ${LISTAR_COST}           ${listar_cost.json()}


Contagem Departament
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${contar_Cost}  GET On Session  alias=Chips  url=/api/department/count   expected_status=200    headers=${headers}

  Log  ${contar_Cost.json()}
  Set Test Variable    ${COUNT}                            ${contar_Cost.json()["count"]}
  Set Test Variable    ${CONTAR_COST}                     ${contar_Cost.json()}   
   Log   ${CONTAR_COST}
   Dictionary Should Contain Item    ${CONTAR_COST}    count    ${COUNT}

  
 Mostrar um Departament
 
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${Mostrar_Cost}  GET On Session  alias=Chips  url=/api/department/${ID_DEPA}   expected_status=200    headers=${headers}
  Log  ${Mostrar_Cost.json()}
  Set Test Variable     ${ID_DEPA}               ${Mostrar_Cost.json()["department"]["_id"]}
  Set Test Variable     ${MOSTRAR_COST}           ${Mostrar_Cost.json()} 
  
Conferir Departament por id
    Log   ${MOSTRAR_COST}
    Dictionary Should Contain Key     ${MOSTRAR_COST["department"]}      _id  
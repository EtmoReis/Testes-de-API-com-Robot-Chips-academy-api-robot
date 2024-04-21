*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Library  RequestsLibrary
Library  String
Library  Collections

 
 

*** Variables ***
${ID_USUARIO}  6582072531248304b069dfe5
${TOKEN_1}     eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTMzMGZlZWU3NjA2NGY0NTlkNWYxMGQiLCJmdWxsTmFtZSI6IlFhLUNvZGVycy1TWVNBRE1JTiIsIm1haWwiOiJzeXNhZG1pbkBxYWNvZGVycy5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRhTXo4NTRBRmpETWtwUWZ6a040alh1Q05rQWpWSEsvRlR5Lll0WmF3M2pHcHpzL1RnbUtpSyIsImFjY2Vzc1Byb2ZpbGUiOiJTWVNBRE1JTiIsImNwZiI6IjExMTExMTExMTExIiwic3RhdHVzIjp0cnVlLCJhdWRpdCI6W3sicmVnaXN0ZXJlZEJ5Ijp7InVzZXJJZCI6IjExMTExMTExMTExMTExMTExMSIsInVzZXJMb2dpbiI6InN5c2FkbWluQHFhY29kZXJzLmNvbSJ9LCJyZWdpc3RyYXRpb25EYXRlIjoic2V4dGEtZmVpcmEsIDIwLzEwLzIwMjMsIDIwOjQwOjMwIEJSVCIsInJlZ2lzdHJhdGlvbk51bWJlciI6IjAxIiwiY29tcGFueUlkIjoiUWEuQ29kZXJzIiwiX2lkIjoiNjUzMzBmZWVlNzYwNjRmNDU5ZDVmMTBlIn1dLCJfX3YiOjAsImlhdCI6MTcxMjQxODYxNiwiZXhwIjoxNzEyNTA1MDE2fQ.nYImv7EZ3_r_ws3pHFVsIrshhAxbpq-CTuNmeHY3j0B
*** Keywords ***
 Listar Centro de Custos
    ${headers}    Create Dictionary     Authorization=${TOKEN}
  ${listar_cost}  GET On Session  alias=Chips  url=/api/costCenter/   expected_status=200    headers=${headers}
  Log  ${Listar_cost.json()}
  Set Test Variable     ${LISTAR_COST}           ${listar_cost.json()}
  

Contagem de centro de custos
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${contar_Cost}  GET On Session  alias=Chips  url=/api/costCenter/count   expected_status=200    headers=${headers}

  Log  ${contar_Cost.json()}
  Set Test Variable    ${COUNT}                            ${contar_Cost.json()["count"]}
  Set Test Variable    ${CONTAR_COST}                     ${contar_Cost.json()}   
   Log   ${CONTAR_COST}
   Dictionary Should Contain Item    ${CONTAR_COST}    count    ${COUNT}

  
 Mostrar um centro de custos
 
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${Mostrar_Cost}  GET On Session  alias=Chips  url=/api/costCenter/${ID_USUARIO}    expected_status=200    headers=${headers}
  Log  ${Mostrar_Cost.json()}
  Set Test Variable     ${ID_BOARD}               ${Mostrar_Cost.json()["costCenter"]["_id"]}
  Set Test Variable     ${MOSTRAR_COST}           ${Mostrar_Cost.json()} 
  
Conferir Cento de Custos por id
    Log   ${MOSTRAR_COST}
    Dictionary Should Contain Key     ${MOSTRAR_COST["costCenter"]}      _id  




Listar Centro de Custos 403
    ${headers}    Create Dictionary     Authorization=${TOKEN_1}
  ${listar_cost}  GET On Session  alias=Chips  url=/api/costCenter/   expected_status=403    headers=${headers}
  Log  ${Listar_cost.json()}
  Set Test Variable     ${LISTAR_COST}           ${listar_cost.json()}
  
Listar Centro de Custos 404
  ${headers}    Create Dictionary     Authorization=${TOKEN}
  ${listar_cost}  GET On Session  alias=Chips  url=/api/costCenter/   expected_status=404    headers=${headers}
  Log  ${Listar_cost.json()}
  Set Test Variable     ${LISTAR_COST}           ${listar_cost.json()}




Contagem de centro de custos 403
  ${headers}    Create Dictionary    Authorization=${TOKEN_1}
  ${contar_Cost}  GET On Session  alias=Chips  url=/api/costCenter/count   expected_status=403    headers=${headers}
   Log  ${contar_Cost.json()}
 




Contagem de centro de custos 500
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${contar_Cost}  GET On Session  alias=Chips  url=/api/costCenter/coun   expected_status=500    headers=${headers}
  Log  ${contar_Cost.json()}
 


 Mostrar um centro de custos 403
 
  ${headers}    Create Dictionary    Authorization=${TOKEN_1}
  ${Mostrar_Cost}  GET On Session  alias=Chips  url=/api/costCenter/${ID_USUARIO}    expected_status=403    headers=${headers}
  Log  ${Mostrar_Cost.json()}
  Set Test Variable     ${MOSTRAR_COST}           ${Mostrar_Cost.json()} 

 
 
 Mostrar um centro de custos 404
 
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${Mostrar_Cost}  GET On Session  alias=Chips  url=/api/costCente/${ID_USUARIO}    expected_status=404    headers=${headers}
  


Mostrar um centro de custos 500
 
  ${headers}    Create Dictionary    Authorization=${TOKEN_1}
  ${Mostrar_Cost}  GET On Session  alias=Chips  url=/api/costCenter/6582072531248304b069dfe6   expected_status=403    headers=${headers}
  Log  ${Mostrar_Cost.json()}
  Set Test Variable     ${MOSTRAR_COST}           ${Mostrar_Cost.json()} 
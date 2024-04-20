*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/criar_diretoria.resource
Resource   ../resource/login_Sysadmin.resource
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***
${ID_BOARD}   6581f80a31248304b069dfd6

*** Keywords *** 
 Listar Diretoria 
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${listar_diretoria}  GET On Session  alias=Chips  url=/api/board/    expected_status=200    headers=${headers}
  Log  ${Listar_diretoria.json()}
  Set Test Variable     ${LISTAR_DIRETORIA}           ${Listar_diretoria.json()}
   
Contagem Diretoria
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${contar_diretoria}  GET On Session  alias=Chips  url=/api/board/count   expected_status=200    headers=${headers}

  Log  ${contar_diretoria.json()}
  Set Test Variable    ${COUNT}                            ${contar_diretoria.json()["count"]}
  Set Test Variable    ${CONTAR_DIRETORIA}                ${contar_diretoria.json()}   
  
   
Conferir Contagem 
    Log   ${CONTAR_DIRETORIA}
    Dictionary Should Contain Item    ${CONTAR_DIRETORIA}    count    ${COUNT}

 Mostrar Diretoria Id
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${Mostrar_diretoria}  GET On Session  alias=Chips  url=/api/board/${ID_BOARD}    expected_status=200    headers=${headers}
  Log  ${Mostrar_diretoria.json()}
  Set Test Variable     ${STATUS_BOARD}               ${Mostrar_diretoria.json()["board"]["_id"]}
  Set Test Variable     ${MOSTRAR_DIRETORIA}           ${Mostrar_diretoria.json()} 
  
Conferir Diretoria por id
    Log   ${MOSTRAR_DIRETORIA}
    Dictionary Should Contain Key     ${MOSTRAR_DIRETORIA["board"]}      _id  
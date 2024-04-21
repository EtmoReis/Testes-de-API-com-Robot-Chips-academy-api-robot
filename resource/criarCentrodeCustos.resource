*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource  
Resource    ../resource/criar_diretoria.resource
Resource    ../resource/alterar_diretoria.resource
Library  String
Library  Collections

*** Variables ***

*** Keywords ***

Criar uma nova Diretoria
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${BOARD_NAME}             ${palavra_randomica}
    Log                     ${BOARD_NAME}

Cadastrar a nova Diretoria criada
    ${body}    Create Dictionary    boardName=${BOARD_NAME}    
    Log  ${body}
    Criar sessão
    Entrar com usuário sysadmin
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    POST On Session     alias=Chips    url=/api/board/  json=${body}  headers=${headers}   expected_status=201
    Log    ${resposta.json()}
    Set Test Variable    ${ID_BOARDI}      ${resposta.json()["newBoard"]["_id"]}
    Set Test Variable    ${RESPOSTA}      ${resposta.json()}




















Criar um novo Cenro de Custos
    ${palavra_randomica}    Generate Random String    length=10    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case          ${palavra_randomica}
    Set Test Variable       ${COSTCENTER_NAME}             ${palavra_randomica}
    Log                     ${COSTCENTER_NAME}
Cadastrar o novo Centro de Custos
    ${body}    Create Dictionary    costCenterName=${COSTCENTER_NAME}     boardId=${ID_BOARDI}    
    Log  ${body}
    Criar sessão
    Entrar com usuário sysadmin
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    POST On Session     alias=Chips    url=/api/costCenter/  json=${body}  headers=${headers}   expected_status=201
    Log    ${resposta.json()}
   
    Set Test Variable    ${ID_COST}      ${resposta.json()["newCostCenter"]["_id"]}
    Set Test Variable    ${RESPOSTA}      ${resposta.json()}

conferir se este novo centro de custos foi cadastrado corretamente
    Log   ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}                    msg    Cadastro realizado com sucesso.
    Dictionary Should Contain Key     ${RESPOSTA["newCostCenter"]}   board     
    Status Should Be    201
    
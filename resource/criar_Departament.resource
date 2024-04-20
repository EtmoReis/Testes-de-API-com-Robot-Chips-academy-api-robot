*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Library  RequestsLibrary
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

Criar um novo Departament
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     L${palavra_randomica} Losat
    Set Test Variable       ${DEPARTA_NAME}           L${palavra_randomica} Losat
    Log                     ${DEPARTA_NAME}

Cadastrar o novo Departament
    ${body}    Create Dictionary    departmentName=${DEPARTA_NAME}  costCenterId= ${ID_COST} 
  
    Log  ${body}
    Criar sessão
    Entrar com usuário sysadmin
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    POST On Session     alias=Chips    url=/api/department/  json=${body}  headers=${headers}   expected_status=201
    Log    ${resposta.json()}
    Set Test Variable    ${ID_DEPA}      ${resposta.json()["newDepartment"]["costCenter"]}
    Set Test Variable    ${RESPOSTA}      ${resposta.json()}
conferir se este novo Departament foi cadastrado corretamente
    Log   ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}   msg    Cadastro realizado com sucesso.
    Dictionary Should Contain Key     ${RESPOSTA["newDepartment"]}   costCenter      
    Status Should Be    201
    
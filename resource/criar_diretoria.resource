*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***

*** Keywords ***

Criar uma nova diretoria
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     ${palavra_randomica}
    Set Test Variable       ${BOARD_NAME}             ${palavra_randomica}
    Log                     ${BOARD_NAME}

Cadastrar a nova diretoria criada
    ${body}    Create Dictionary    boardName=${BOARD_NAME}    
    Log  ${body}
    Criar sessão
    Entrar com usuário sysadmin
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    POST On Session     alias=Chips    url=/api/board/  json=${body}  headers=${headers}   expected_status=201
    Log    ${resposta.json()}
    Set Test Variable    ${ID_BOARDI}      ${resposta.json()["newBoard"]["_id"]}
    Set Test Variable    ${RESPOSTA}      ${resposta.json()}

Conferir se esta nova diretoria foi cadastrada corretamente
    Log   ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}   msg    Cadastro realizado com sucesso!
    Dictionary Should Contain Key     ${RESPOSTA["newBoard"]}   _id      
    Status Should Be    201
    
    
    
Cadastrar a nova diretoria criada 400
    ${body}    Create Dictionary    boardName=123456    
    Log  ${body}
    Criar sessão
    Entrar com usuário sysadmin
    ${headers}    Create Dictionary    Authorization=${TOKEN}
    ${resposta}    POST On Session     alias=Chips    url=/api/board/  json=${body}  headers=${headers}   expected_status=400
    Log    ${resposta}
    Set Test Variable    ${response_json}      ${RESPOSTA.json()}

Conferir se esta nova diretoria erro 400 
    Should Contain    ${response_json['error'][0]}    O campo 'diretoria' só pode conter letras e o caractere especial '&'.

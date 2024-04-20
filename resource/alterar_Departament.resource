*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/criar_diretoria.resource
Resource    ../resource/criarCentrodeCustos.resource


Library  String
Library  Collections

*** Variables ***

*** Keywords ***
Criar um novo Departament
    ${palavra_randomica}    Generate Random String    length=8    chars=[LETTERS]
    ${palavra_randomica}    Convert To Lower Case     L${palavra_randomica} Losat
    Set Test Variable       ${DEPARTA_NAME}           L${palavra_randomica} 
    Log                     ${DEPARTA_NAME}

Cadastrar o novo Departament
    ${body}    Create Dictionary    departmentName=${DEPARTA_NAME}  costCenterId=${ID_COST}
  
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
    

 Alterar um departamento passando o id.
    ...    ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/department/${ID_DEPA} expected_status=200  data={"departmentName":"${DEPARTA_NAME}","costCenterId": "${ID_DEPA}" }  headers=${headers}




Alterar Status de um deparatamento false por id 
    ...    ${headers}    Create Dictionary    Authorization=${TOKEN}
      ${body}   Create Dictionary  status=${TRUE}
  ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/department/status/${ID_BOARDI}  expected_status=202  json=${body}  headers=${headers}
  Log   ${alterar_CentrodeCustos.json()}

  
Alterar Status de um deparatamento true por id
    ...    ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${alterar_CentrodeCustos}  PUT On Session  alias=Chips  url=/api/department/status/${ID_BOARDI}  expected_status=202  data={"status": "false"}  headers=${headers}
*** Settings ***
Resource    ../resource/data/login.robot
Resource    ../resource/arquivo_geral.resource
Resource    ../resource/login_Sysadmin.resource
Resource    ../resource/criar_diretoria.resource
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***

*** Keywords ***
Alterar diretoria 
  ${headers}    Create Dictionary    Authorization=${TOKEN}
  ${alterar_diretoria}  PUT On Session  alias=Chips  url=/api/board/${ID_BOARDI}    expected_status=200  data={"boardName":"${BOARD_NAME}"}  headers=${headers}
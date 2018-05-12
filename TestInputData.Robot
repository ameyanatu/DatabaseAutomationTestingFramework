*** Settings ***
Documentation  This file used to get data from test input data excel sheet
Library  ./CustomLib/ReadExcelFile.py
*** Keywords ***
get Database1Query Content
    [Arguments]  ${FILEPATH}
    ${DATA} =  get Database1Query  ${FILEPATH}
    [Return]  ${DATA}

get Database2Query Content
    [Arguments]  ${FILEPATH}
    ${DATA} =  get Database2Query  ${FILEPATH}
    [Return]  ${DATA}

get TestCaseID Content
    [Arguments]  ${FILEPATH}
    ${DATA} =  get TestCaseID  ${FILEPATH}
    [Return]  ${DATA}

*** Settings ***
Resource  TestInputData.Robot
Library  DiffLibrary
Library  DatabaseLibrary
Library  CSVLibrary
Library  OperatingSystem
Library  Collections
#Robot -d Results MainTestFile.Robot
*** Variables ***
${DBHost}  localhost
${DBName1}  DatabaseAutomation1
${DBName2}  DatabaseAutomation2
${DBPass}  PavanD605
${DBPort}  5432
${DBUser}  postgres
${FILEPATH} =  TestData.xlsx
*** Test Cases ***
Connect & Validate databses
# Get TestCaseID from excel sheet
  ${TestCaseID} =  TestInputData.get TestCaseID Content  ${FILEPATH}
# Get First Database queries
  ${DB1Query} =  TestInputData.get Database1Query Content  ${FILEPATH}
# Get Second Database queries
  ${DB2Query} =  TestInputData.get Database1Query Content  ${FILEPATH}

#First Database Queries execution
  :FOR  ${DB1Element}  IN  @{DB1Query}
  \  connect to database  psycopg2  ${DBName1}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}
  \  ${output} =  query  ${DB1Element}
  \  Log  ${output}
  \  append to csv file  CSVFile1.csv  ${output}
  \  disconnect from database

#Second Database Queries execution
  :FOR  ${DB2Element}  IN  @{DB2Query}
  \  connect to database  psycopg2  ${DBName2}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}
  \  ${output} =  query  ${DB2Element}
  \  Log  ${output}
  \  append to csv file  CSVFile2.csv  ${output}
  \  disconnect from database

  #Compare Two CSV Files
  diff files  CSVFile1.csv  CSVFile2.csv  fail=false
  #Remove those CSV Files
  remove file  CSVFile1.csv
  remove file  CSVFile2.csv




import pandas as pd
from pandas import ExcelFile

def get_Database1Query(FilePath):
    Db1Sheet = pd.read_excel(FilePath,sheet_name='Sheet1')
    Db1Query = Db1Sheet['Database1 Query']
    return Db1Query
def get_Database2Query(FilePath):
    Db2Sheet = pd.read_excel(FilePath,sheet_name='Sheet1')
    Db2Query = Db2Sheet['Database2 Query']
    return Db2Query
def get_TestCaseID(FilePath):
    TestCaseIdSheet = pd.read_excel(FilePath,sheet_name='Sheet1')
    TestCaseId = TestCaseIdSheet['Test Case ID']
    return TestCaseId
**
FUNCTION GetDatabase
GETDATABASE_RET = 0
GETDATABASE_CONSTR = SQLGETPROP(ODBC_ANT2000, 'ConnectString')
DO CASE
CASE AT("FIL=MS Access", GETDATABASE_CONSTR)>1
GETDATABASE_RET = 1
ENDCASE
RETURN GETDATABASE_RET
ENDFUNC
**

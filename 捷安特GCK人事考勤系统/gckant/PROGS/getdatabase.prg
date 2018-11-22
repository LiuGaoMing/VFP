**
FUNCTION GetDatabase
getdatabase_ret = 0
getdatabase_constr = SQLGETPROP(odbc_ant2000,  ;
                     'ConnectString')
DO CASE
     CASE AT("FIL=MS Access",  ;
          getdatabase_constr) >  ;
          1
          getdatabase_ret = 1
ENDCASE
RETURN getdatabase_ret
ENDFUNC
**

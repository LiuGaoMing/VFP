PUBLIC PUB_ID,PUB_M_NO,ODBC_MANAGER
DO ODBC
ODBC_MANAGER=SQLCONNECT("CHANGSHANG","wewit","wewit")
STRSQL="SELECT * FROM [supplier_manager].[dbo].[SYS_INI] WHERE SYS_NO='KAOQIN_IP'"
SQLRUN(0000000016,SYS(16),STRSQL,"KAQQIN_IP")
PUB_IP=ALLTRIM(KAQQIN_IP.SYS_COMMENT)

STRSQL="SELECT * FROM [supplier_manager].[dbo].[SYS_INI] WHERE SYS_NO='MACHINE'"
SQLRUN(0000000017,SYS(16),STRSQL,"MACHINE")
PUB_M_NO=VAL(ALLTRIM(MACHINE.SYS_COMMENT))
DO FORM READCARD
QUIT
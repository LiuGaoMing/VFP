DECLARE INTEGER SQLConfigDataSource IN odbccp32 INTEGER, INTEGER, STRING, STRING
Declare SHORT InternetGetConnectedState In wininet Integer @, Integer
lnWindowHandle=0 
lcODBCDriver='SQL Server'      &&DRIVER���� 
lcODBCName='CHANGSHANG'      &&����Դ���� 
lcODBCDesc='�ݰ��س��̽�������ϵͳ' &&����Դ���� 
lcODBCServer='192.168.1.50'   &&SQL SERVER���� 
lcODBCDatabase='supplier_manager'   &&Ҫ���ӵ����ݿ����� 
**����ͼ�޸����е�ODBC����������ڣ�����0�� 
lreturn=SQLConfigDataSource(lnWindowHandle, 2, lcODBCDriver, ; 
'DSN=' + lcODBCName + CHR(0) ; 
+ 'Description=' + lcODBCDesc + CHR(0) ; 
+ 'Server=' + lcODBCServer + CHR(0) ; 
+ 'Database=' + lcODBCDatabase + CHR(0))
IF lreturn=0 &&������.����µ�ODBC 
 lreturn=SQLConfigDataSource(lnWindowHandle, 1, lcODBCDriver, ;
 'DSN=' + lcODBCName + CHR(0) ; 
 + 'Description=' + lcODBCDesc + CHR(0) ; 
 + 'Server=' + lcODBCServer + CHR(0) ; 
 + 'Database=' + lcODBCDatabase + CHR(0))
IF  lreturn=0  &&ʧ�� 
	MessageBox('���ODBC����Դʧ��',16,'BUFFER') 
 ENDIF
ENDIF

lreturn=SQLCONNECT("CHANGSHANG",'wewit','wewit') 

DECLARE INTEGER SQLConfigDataSource IN odbccp32 INTEGER, INTEGER, STRING, STRING
Declare SHORT InternetGetConnectedState In wininet Integer @, Integer
lnWindowHandle=0 
lcODBCDriver='SQL Server'      &&DRIVER类型 
lcODBCName='CHANGSHANG'      &&数据源名字 
lcODBCDesc='捷安特厂商进出管理系统' &&数据源描述 
lcODBCServer='192.168.1.50'   &&SQL SERVER名字 
lcODBCDatabase='supplier_manager'   &&要连接的数据库名字 
**先试图修改已有的ODBC，如果不存在，返回0。 
lreturn=SQLConfigDataSource(lnWindowHandle, 2, lcODBCDriver, ; 
'DSN=' + lcODBCName + CHR(0) ; 
+ 'Description=' + lcODBCDesc + CHR(0) ; 
+ 'Server=' + lcODBCServer + CHR(0) ; 
+ 'Database=' + lcODBCDatabase + CHR(0))
IF lreturn=0 &&不存在.添加新的ODBC 
 lreturn=SQLConfigDataSource(lnWindowHandle, 1, lcODBCDriver, ;
 'DSN=' + lcODBCName + CHR(0) ; 
 + 'Description=' + lcODBCDesc + CHR(0) ; 
 + 'Server=' + lcODBCServer + CHR(0) ; 
 + 'Database=' + lcODBCDatabase + CHR(0))
IF  lreturn=0  &&失败 
	MessageBox('添加ODBC数据源失败',16,'BUFFER') 
 ENDIF
ENDIF

lreturn=SQLCONNECT("CHANGSHANG",'wewit','wewit') 

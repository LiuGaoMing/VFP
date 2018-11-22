FUNCTION SendMail(; &&参数列表
cMail,;         && 收件人列表
cCC,;           && 抄送收件人列表
cBCC,;          && 密件抄送收件人列表
cSubject,;      && 主题
cBody,;         && 邮件内容
cAttachFile,;   && 附件文件列表
cSmtp,;         && SMTP服务器名或地址（必须）
cFrom,;         && 发件人邮件地址（需验证发信的服务器需要）
cUid,;          && 用户名（需验证发信的服务器需要）
cPwd)           && 口令（需验证发信的服务器需要）

* 参数错误判断
* ...............
* ...............

LOCAL cError,cErrMsg,m,N,i,j,k,objFields
m.cErrMsg = ""
m.cError = ON("ERROR")
ON ERROR m.cErrMsg = MESSAGE()

*服务器设置
m.objMail = CREATEOBJECT("CDO.Message")

* 清除原默认配置
m.objFields = m.objMail.Configuration.FIELDS
FOR i = 0 TO objFields.COUNT - 1
	m.objFields.DELETE(i)
ENDFOR
m.objFields.UPDATE

* 设置发信服务配置
m.objConf = m.objMail.Configuration
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/languagecode",2)
m.objConf.FIELDS(0).VALUE = "zh-cn"
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/postusing",2)
m.objConf.FIELDS(1).VALUE = 0
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendemailaddress",2)
m.objConf.FIELDS(2).VALUE = m.cFrom     &&发送邮件地址
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendpassword",2)
m.objConf.FIELDS(3).VALUE = m.cPwd      &&发件口令
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendusername",2)
m.objConf.FIELDS(4).VALUE = m.cUid      &&用户名
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendusing",2)
m.objConf.FIELDS(5).VALUE = 2
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpaccountname",2)
m.objConf.FIELDS(6).VALUE = "网易服务器" &&Smtp名称
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate",2)
m.objConf.FIELDS(7).VALUE = 1
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout",2)
m.objConf.FIELDS(8).VALUE = 180
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpserver",2)
m.objConf.FIELDS(9).VALUE = m.cSmtp     &&SMTP服务器
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpserverport",2)
m.objConf.FIELDS(10).VALUE = 25
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/usemessageresponsetext",2)
m.objConf.FIELDS(11).VALUE = .T.
m.objConf.FIELDS.APPEND("urn:schemas:calendar:timezoneid",2)
m.objConf.FIELDS(12).VALUE = 21
m.objConf.FIELDS.UPDATE

*邮件设置
*注：邮件地址和附件文件可以同时多个，在字符串中使用分号（;）分隔
m.objMail.TO = m.cMail           &&收件人
m.objMail.CC = m.cCC             &&抄送
objMail.BCC = m.cBCC             &&密件抄送
m.objMail.Subject = m.cSubject   &&主题
m.objMail.htmlBody = m.cBody     &&内容
objMail.FROM = m.cFrom           &&发件人（服务器要校验的）

*根据附件列表添加附件
IF !EMPTY(m.cAttachFile)
	m.cAttachFile = m.cAttachFile + ";"
	m.j = 0
	m.n = OCCURS(";", m.cAttachFile)
	FOR m.i = 1 TO m.n
		m.k = AT(";", m.cAttachFile, m.i)
		m.cFile = SUBSTR(m.cAttachFile, m.j+1, m.k-m.j-1)
		IF !FILE(m.cFile)
			MESSAGEBOX("附件文件["+m.cFile+"没找到！ ",16,"出错消息")
			ON ERROR &cError
			RETURN m.cErrMsg
		ENDIF
		objMail.AddAttachment(m.cFile)    &&添加附件
		m.j = m.k
	ENDFOR
ENDIF

*发送邮件
m.objMail.SEND
ON ERROR &cError
RETURN m.cErrMsg
ENDFUNC

************************************************************************************************************************************************
FUNCTION spt(tlcSqlCommand,tlcConnString,tlcDataBase,tcCursorName,tcNomesgsta)
************************************************************
LOCAL LNCONNHANDLE, LNRETVAL
IF PARAMETERS() =3
	tcNomesgsta =.T.
ENDIF

IF TYPE('tlcSqlCommand')<>'C' OR EMPTY(TLCSQLCOMMAND)
	RETURN .F.
ENDIF
IF TYPE('tlcConnString')<>'C' OR EMPTY(TLCCONNSTRING)
	RETURN .F.
ENDIF
IF TYPE('tlcDataBase')='C' AND !EMPTY(TLCDATABASE)
	IF FILE('D:\PROGRAM\yonglihr.dbc')
		TLCDATABASE='D:\PROGRAM\yonglihr.dbc'
	ELSE
		TLCDATABASE='\\192.168.1.50\yonglihr\yonglihr.dbc'
	ENDIF
	OPEN DATABASE (TLCDATABASE) SHARED NOUPDATE
ELSE
	OPEN DATABASE MRPSDB SHARED NOUPDATE
ENDIF
IF TYPE('tcNoMesgSta') <> 'L'
	tcNoMesgSta=.F.
ENDIF
STORE SQLCONNECT(TLCCONNSTRING) TO LNCONNHANDLE
IF LNCONNHANDLE <= 0
	?? CHR(7)
	= MESSAGEBOX('DISCONNECT失败', 16, 'SQL Connect Error')
	RETURN .F.
ENDIF
= SQLSETPROP(LNCONNHANDLE, 'asynchronous', .F.)
= SQLSETPROP(LNCONNHANDLE, 'batchmode', .T.)
IF PARAMETERS() < 4
	lnRetVal=SQLEXEC(lnConnHandle, tlcSqlCommand)
ELSE
	lnRetVal=SQLEXEC(lnConnHandle, tlcSqlCommand, tcCursorName)
ENDIF
IF LNRETVAL<0
	IF !TCNOMESGSTA
		=AERROR(LAERROR)
		?? CHR(7)
		TLCMESSAGE="Command="+TLCSQLCOMMAND+CHR(13)+"ConnectString="+TLCCONNSTRING+CHR(13)+"ReturnValue="+ALLTRIM(STR(LNRETVAL))+CHR(13)+CHR(13);
			+"laError(1)="+ALLTRIM(STR(LAERROR(1)))+CHR(13)+"laError(2)="+LAERROR(2)+CHR(13)+"laError(3)="+LAERROR(3)
		=MESSAGEBOX(TLCMESSAGE, 16, 'SQL Connect Error')
	ENDIF
ENDIF
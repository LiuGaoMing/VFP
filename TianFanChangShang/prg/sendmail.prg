FUNCTION SendMail(; &&�����б�
cMail,;         && �ռ����б�
cCC,;           && �����ռ����б�
cBCC,;          && �ܼ������ռ����б�
cSubject,;      && ����
cBody,;         && �ʼ�����
cAttachFile,;   && �����ļ��б�
cSmtp,;         && SMTP�����������ַ�����룩
cFrom,;         && �������ʼ���ַ������֤���ŵķ�������Ҫ��
cUid,;          && �û���������֤���ŵķ�������Ҫ��
cPwd)           && �������֤���ŵķ�������Ҫ��

* ���������ж�
* ...............
* ...............

LOCAL cError,cErrMsg,m,N,i,j,k,objFields
m.cErrMsg = ""
m.cError = ON("ERROR")
ON ERROR m.cErrMsg = MESSAGE()

*����������
m.objMail = CREATEOBJECT("CDO.Message")

* ���ԭĬ������
m.objFields = m.objMail.Configuration.FIELDS
FOR i = 0 TO objFields.COUNT - 1
	m.objFields.DELETE(i)
ENDFOR
m.objFields.UPDATE

* ���÷��ŷ�������
m.objConf = m.objMail.Configuration
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/languagecode",2)
m.objConf.FIELDS(0).VALUE = "zh-cn"
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/postusing",2)
m.objConf.FIELDS(1).VALUE = 0
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendemailaddress",2)
m.objConf.FIELDS(2).VALUE = m.cFrom     &&�����ʼ���ַ
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendpassword",2)
m.objConf.FIELDS(3).VALUE = m.cPwd      &&��������
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendusername",2)
m.objConf.FIELDS(4).VALUE = m.cUid      &&�û���
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/sendusing",2)
m.objConf.FIELDS(5).VALUE = 2
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpaccountname",2)
m.objConf.FIELDS(6).VALUE = "���׷�����" &&Smtp����
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate",2)
m.objConf.FIELDS(7).VALUE = 1
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout",2)
m.objConf.FIELDS(8).VALUE = 180
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpserver",2)
m.objConf.FIELDS(9).VALUE = m.cSmtp     &&SMTP������
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/smtpserverport",2)
m.objConf.FIELDS(10).VALUE = 25
m.objConf.FIELDS.APPEND("http://schemas.microsoft.com/cdo/configuration/usemessageresponsetext",2)
m.objConf.FIELDS(11).VALUE = .T.
m.objConf.FIELDS.APPEND("urn:schemas:calendar:timezoneid",2)
m.objConf.FIELDS(12).VALUE = 21
m.objConf.FIELDS.UPDATE

*�ʼ�����
*ע���ʼ���ַ�͸����ļ�����ͬʱ��������ַ�����ʹ�÷ֺţ�;���ָ�
m.objMail.TO = m.cMail           &&�ռ���
m.objMail.CC = m.cCC             &&����
objMail.BCC = m.cBCC             &&�ܼ�����
m.objMail.Subject = m.cSubject   &&����
m.objMail.htmlBody = m.cBody     &&����
objMail.FROM = m.cFrom           &&�����ˣ�������ҪУ��ģ�

*���ݸ����б���Ӹ���
IF !EMPTY(m.cAttachFile)
	m.cAttachFile = m.cAttachFile + ";"
	m.j = 0
	m.n = OCCURS(";", m.cAttachFile)
	FOR m.i = 1 TO m.n
		m.k = AT(";", m.cAttachFile, m.i)
		m.cFile = SUBSTR(m.cAttachFile, m.j+1, m.k-m.j-1)
		IF !FILE(m.cFile)
			MESSAGEBOX("�����ļ�["+m.cFile+"û�ҵ��� ",16,"������Ϣ")
			ON ERROR &cError
			RETURN m.cErrMsg
		ENDIF
		objMail.AddAttachment(m.cFile)    &&��Ӹ���
		m.j = m.k
	ENDFOR
ENDIF

*�����ʼ�
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
	= MESSAGEBOX('DISCONNECTʧ��', 16, 'SQL Connect Error')
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
**
FUNCTION IsSubAdmin
PARAMETER subsys
marea = ALLTRIM(STR(SELECT()))
mret = .F.
= sqlexe_run(00000000015, SYS(16),  ;
  "select * from sys_user where name=?pub_user and quanxian=1",  ;
  "tmpuser")
IF RECCOUNT("tmpuser") = 0
     RETURN mret
ENDIF
fieldname = UPPER(subsys)
IF fieldname = "TL"
     fieldname = "TOOL"
ENDIF
SELECT tmpuser
if &FieldName. = 1
     mret = .T.
ENDIF
USE
select &marea
RETURN mret
ENDFUNC
**

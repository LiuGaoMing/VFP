PARAMETER checkdate_datestr
checkdate_str = ALLTRIM(checkdate_datestr)
IF ISNULL(checkdate_datestr) .OR.  ;
   CTOD(checkdate_datestr) <>  ;
   CTOD("") .OR.  ;
   EMPTY(checkdate_str) .OR.  ;
   checkdate_str = '//' .OR.  ;
   checkdate_str = "/ /" .OR.  ;
   checkdate_str = "/  /"
     mret = .T.
ELSE
     IF pub_language
          = MESSAGEBOX(getlanguage("s_ShiJianShuRuCuoWu"),  ;
            64,  ;
            "ANT2000 SYSTEM")
     ELSE
          = MESSAGEBOX("�Ƿ����������룬��ȷ�ϡ�",  ;
            64,  ;
            "ANT2000 SYSTEM")
     ENDIF
     mret = .F.
ENDIF
RETURN mret
ENDFUNC
**

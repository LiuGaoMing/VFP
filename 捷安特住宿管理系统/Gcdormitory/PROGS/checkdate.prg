PARAMETER CHECKDATE_DATESTR
CHECKDATE_STR = ALLTRIM(CHECKDATE_DATESTR)
IF ISNULL(CHECKDATE_DATESTR) .OR. CTOD(CHECKDATE_DATESTR)<>CTOD("") .OR. EMPTY(CHECKDATE_STR) .OR. CHECKDATE_STR='//' .OR. CHECKDATE_STR="/ /" .OR. CHECKDATE_STR="/  /"
MRET = .T.
ELSE
IF PUB_LANGUAGE
= MESSAGEBOX(GETLANGUAGE("s_ShiJianShuRuCuoWu"), 64, "ANT2000 SYSTEM")
ELSE
= MESSAGEBOX("非法的日期输入！", 64, "ANT2000 SYSTEM")
ENDIF
MRET = .F.
ENDIF
RETURN MRET
ENDFUNC
**

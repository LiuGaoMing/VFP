IF PUB_BANBEN<>"��ʾ��"
RETURN
ENDIF
MDT = TTOC(DATETIME())
MDT_ = SYSPASS(MDT, .T.)
LMD = SYSPASS(GETANTENV('SYSPARA', 'LMD'), .F.)
IF LMD<>"9"+"4"+"1"+"0"
IF LMD="6"+"3"+"7"+"1"
SETANTENV('SYSPARA', 'LMD', MDT_)
ELSE
LMD_ = SYSPASS(GETANTENV('SYSPARA', 'LMD_'), .F.)
IF CTOT(MDT)<CTOT(LMD_)
= MESSAGEBOX("Please check the system date.", 64, "Ant2000 System")
DO SYSEXIT
RETURN .F.
ELSE
IF CTOT(MDT)>CTOT(LMD)+(CTOT("2001/04/01")-CTOT("2001/01/01"))
= MESSAGEBOX("Please check the system date.", 64, "Ant2000 System")
DO SYSEXIT
RETURN .F.
ENDIF
ENDIF
ENDIF
SETANTENV('SYSPARA', 'LMD_', MDT_)
ENDIF
ENDFUNC
**

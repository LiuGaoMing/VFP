**
FUNCTION OpenLanguage
PUBLIC LANGUAGEFILEPOINTER, SYSLANGUAGE, SYSXIANSHISJ, SYSBAOHANXR
SYSLANGUAGE = ""
SYSXIANSHISJ = 1
SYSBAOHANXR = 1
IF  .NOT. FILE("client.mem")
RETURN .F.
ENDIF
RESTORE FROM client ADDITIVE
IF SYSLANGUAGE<>"eng" .AND. SYSLANGUAGE<>"bg5"
RETURN .F.
ENDIF
IF  .NOT. FILE("language\ant2000."+SYSLANGUAGE)
RETURN .F.
ENDIF
LANGUAGEFILEPOINTER = FOPEN("language\ant2000."+SYSLANGUAGE, 0)
IF LANGUAGEFILEPOINTER<0
RETURN .F.
ENDIF
RETURN .T.
ENDFUNC
**

**
FUNCTION OpenLanguage
PUBLIC languagefilepointer,  ;
       syslanguage, sysxianshisj,  ;
       sysbaohanxr
syslanguage = ""
sysxianshisj = 1
sysbaohanxr = 1
IF  .NOT. FILE("client.mem")
     RETURN .F.
ENDIF
RESTORE FROM client ADDITIVE
IF syslanguage <> "eng" .AND.  ;
   syslanguage <> "bg5"
     RETURN .F.
ENDIF
IF  .NOT.  ;
    FILE("language\ant2000." +  ;
    syslanguage)
     RETURN .F.
ENDIF
languagefilepointer = FOPEN("language\ant2000." +  ;
                      syslanguage,  ;
                      0)
IF languagefilepointer < 0
     RETURN .F.
ENDIF
RETURN .T.
ENDFUNC
**

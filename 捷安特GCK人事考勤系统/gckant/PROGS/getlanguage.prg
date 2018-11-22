**
FUNCTION GetLanguage
PARAMETER variable
SET EXACT ON
sret = ""
svariable = ALLTRIM(UPPER(variable))
IF languagefilepointer > 0
     FSEEK(languagefilepointer, 0,  ;
          0)
     DO WHILE  .NOT.  ;
        FEOF(languagefilepointer)
          sbuf = LTRIM(FGETS(languagefilepointer))
          sstr = UPPER(sbuf)
          l = AT("=", sstr)
          IF l < 2 .OR. svariable <>  ;
             ALLTRIM(SUBSTR(sstr,  ;
             1, l - 1))
               LOOP
          ENDIF
          sret = ALLTRIM(SUBSTR(sbuf,  ;
                 l + 1, 1024))
          EXIT
     ENDDO
ENDIF
SET EXACT ON
RETURN sret
ENDFUNC
**

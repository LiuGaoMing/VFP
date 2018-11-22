**
FUNCTION GetAntIni
PARAMETER section, variable
SET EXACT ON
sret = ""
ssection = ALLTRIM(UPPER(section))
svariable = ALLTRIM(UPPER(variable))
IF FILE("ANT2000.INI")
     fp = FOPEN("ANT2000.INI")
ELSE
     fp = -1
ENDIF
IF fp >= 0
     bsw = .T.
     DO WHILE bsw
          IF FEOF(fp)
               EXIT
          ENDIF
          sbuf = LTRIM(FGETS(fp))
          IF LEFT(sbuf, 1) <> "["
               LOOP
          ENDIF
          sstr = UPPER(sbuf)
          l = AT("]", sstr)
          IF l < 3 .OR. ssection <>  ;
             ALLTRIM(SUBSTR(sstr,  ;
             2, l - 2))
               LOOP
          ENDIF
          DO WHILE .T.
               IF FEOF(fp)
                    EXIT
               ENDIF
               sbuf = LTRIM(FGETS(fp))
               IF LEFT(sbuf, 1) =  ;
                  "["
                    bsw = .F.
                    EXIT
               ENDIF
               sstr = UPPER(sbuf)
               l = AT("=", sstr)
               IF l < 2 .OR.  ;
                  svariable <>  ;
                  ALLTRIM(SUBSTR(sstr,  ;
                  1, l - 1))
                    LOOP
               ENDIF
               sret = ALLTRIM(SUBSTR(sbuf,  ;
                      l + 1,  ;
                      1024))
               bsw = .F.
               EXIT
          ENDDO
     ENDDO
     FCLOSE(fp)
ENDIF
SET EXACT ON
RETURN sret
ENDFUNC
**

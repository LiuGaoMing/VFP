**
FUNCTION GetAntIni
PARAMETER SECTION, VARIABLE
SET EXACT ON
SRET = ""
SSECTION = ALLTRIM(UPPER(SECTION))
SVARIABLE = ALLTRIM(UPPER(VARIABLE))
IF FILE("GCDORMITORY.INI")
FP = FOPEN("GCDORMITORY.INI")
ELSE
FP = -1
ENDIF
IF FP>=0
BSW = .T.
DO WHILE BSW
IF FEOF(FP)
EXIT
ENDIF
SBUF = LTRIM(FGETS(FP))
IF LEFT(SBUF, 1)<>"["
LOOP
ENDIF
SSTR = UPPER(SBUF)
L = AT("]", SSTR)
IF L<3 .OR. SSECTION<>ALLTRIM(SUBSTR(SSTR, 2, L-2))
LOOP
ENDIF
DO WHILE .T.
IF FEOF(FP)
EXIT
ENDIF
SBUF = LTRIM(FGETS(FP))
IF LEFT(SBUF, 1)="["
BSW = .F.
EXIT
ENDIF
SSTR = UPPER(SBUF)
L = AT("=", SSTR)
IF L<2 .OR. SVARIABLE<>ALLTRIM(SUBSTR(SSTR, 1, L-1))
LOOP
ENDIF
SRET = ALLTRIM(SUBSTR(SBUF, L+1, 1024))
BSW = .F.
EXIT
ENDDO
ENDDO
FCLOSE(FP)
ENDIF
SET EXACT ON
RETURN SRET
ENDFUNC
**

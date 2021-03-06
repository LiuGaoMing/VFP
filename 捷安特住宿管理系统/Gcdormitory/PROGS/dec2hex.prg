**
FUNCTION dec2hex
PARAMETER DEC_STR
HEX_STR = ''
DEC_TMP = 0
DEC_STR = ALLTRIM(DEC_STR)
DO WHILE LEFT(DEC_STR, 1)=='0'
DEC_STR = SUBSTR(DEC_STR, 2)
ENDDO
IF LEN(DEC_STR)>15
RETURN .NULL.
ENDIF
IF  .NOT. ISDIGIT(DEC_STR)
RETURN .NULL.
ENDIF
DEC_INT = VAL(DEC_STR)
DO WHILE DEC_INT>15
DEC_TMP = MOD(DEC_INT, 16)
DEC_INT = INT(DEC_INT/16)
IF DEC_TMP>=10
HEX_STR = CHR(DEC_TMP+55)+HEX_STR
ELSE
HEX_STR = ALLTRIM(STR(DEC_TMP))+HEX_STR
ENDIF
ENDDO
IF DEC_INT>=10
HEX_STR = CHR(DEC_INT+55)+HEX_STR
ELSE
HEX_STR = ALLTRIM(STR(DEC_INT))+HEX_STR
ENDIF
RETURN HEX_STR
ENDFUNC
**

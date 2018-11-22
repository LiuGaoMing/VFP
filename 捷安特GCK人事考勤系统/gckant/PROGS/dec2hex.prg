**
FUNCTION dec2hex
PARAMETER dec_str
hex_str = ''
dec_tmp = 0
dec_str = ALLTRIM(dec_str)
DO WHILE LEFT(dec_str, 1)=='0'
     dec_str = SUBSTR(dec_str, 2)
ENDDO
IF LEN(dec_str) > 15
     RETURN .NULL.
ENDIF
IF  .NOT. ISDIGIT(dec_str)
     RETURN .NULL.
ENDIF
dec_int = VAL(dec_str)
DO WHILE dec_int>15
     dec_tmp = MOD(dec_int, 16)
     dec_int = INT(dec_int / 16)
     IF dec_tmp >= 10
          hex_str = CHR(dec_tmp +  ;
                    55) +  ;
                    hex_str
     ELSE
          hex_str = ALLTRIM(STR(dec_tmp)) +  ;
                    hex_str
     ENDIF
ENDDO
IF dec_int >= 10
     hex_str = CHR(dec_int + 55) +  ;
               hex_str
ELSE
     hex_str = ALLTRIM(STR(dec_int)) +  ;
               hex_str
ENDIF
RETURN hex_str
ENDFUNC
**

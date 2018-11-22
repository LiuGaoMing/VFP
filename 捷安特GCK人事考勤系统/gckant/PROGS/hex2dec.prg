**
FUNCTION hex2dec
PARAMETER hex_str
dec_int = 0
dec_tmp = 0
dec_str = ''
hex_str = ALLTRIM(hex_str)
DO WHILE LEFT(hex_str, 1)=='0'
     hex_str = SUBSTR(hex_str, 2)
ENDDO
IF LEN(hex_str) > 13
     RETURN .NULL.
ENDIF
FOR i = LEN(hex_str) TO 1 STEP -1
     str_tmp = SUBSTR(hex_str,  ;
               LEN(hex_str) - i +  ;
               1, 1)
     DO CASE
          CASE str_tmp $  ;
               'ABCDEFabcdef'
               dec_tmp = ASC(UPPER(str_tmp)) -  ;
                         55
          CASE str_tmp $  ;
               '0123456789'
               dec_tmp = VAL(str_tmp)
          OTHERWISE
               RETURN .NULL.
     ENDCASE
     dec_int = dec_int + dec_tmp *  ;
               (16 ^ (i - 1))
ENDFOR
dec_str = ALLTRIM(STR(dec_int,  ;
          16))
RETURN dec_str
ENDFUNC
**

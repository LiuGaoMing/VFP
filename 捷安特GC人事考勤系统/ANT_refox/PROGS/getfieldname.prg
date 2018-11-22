**
FUNCTION GetFieldName
LPARAMETERS fieldtitle
f = ALLTRIM(fieldtitle)
invalidchar = "~`!@#$%^&*()-=+\|{}[]:;',.<>/? "
invalidchar = invalidchar + '"'
FOR i = 1 TO LEN(invalidchar)
     f = STRTRAN(f,  ;
         SUBSTR(invalidchar, i,  ;
         1), '')
ENDFOR
widedigitchar = "£°£±£²£³£´£µ£¶£·£¸£¹"
IF ISDIGIT(f)
     f = STRTRAN(f, LEFT(f, 1),  ;
         SUBSTR(widedigitchar,  ;
         VAL(LEFT(f, 1)) * 2 + 1,  ;
         2), 1, 1)
ENDIF
IF LEN(f) > 10
     i = 0
     DO WHILE i<10
          IF ISLEADBYTE(SUBSTR(f,  ;
             i + 1, 1))
               IF i + 2 < 10
                    i = i + 2
               ELSE
                    EXIT
               ENDIF
          ELSE
               i = i + 1
          ENDIF
     ENDDO
     f = LEFT(f, i)
ENDIF
RETURN f
ENDFUNC
**

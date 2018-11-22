PARAMETER strrec, secno,  ;
          seperator
IF EMPTY(strrec) .OR. secno = 0
     RETURN ""
ENDIF
strrec = strrec + seperator
len1 = LEN(strrec)
s1 = STRTRAN(strrec, seperator +  ;
     seperator, seperator)
DO WHILE len1<>LEN(s1)
     len1 = LEN(s1)
     s1 = STRTRAN(strrec,  ;
          seperator + seperator,  ;
          seperator)
ENDDO
IF secno = 1
     pos1 = 0
ELSE
     pos1 = AT(seperator, s1,  ;
            secno - 1)
ENDIF
pos2 = AT(seperator, s1, secno)
RETURN SUBSTR(s1, pos1 + 1, pos2 -  ;
       pos1 - 1)
ENDFUNC
**

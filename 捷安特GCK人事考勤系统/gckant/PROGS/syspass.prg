**
FUNCTION SYSPASS
PARAMETER pass_str, mod
mstr = ' '
i = 1
j = LEN(pass_str)
IF mod
     DO WHILE i<=j
          zf = CHR(MOD(ASC(SUBSTR(pass_str,  ;
               i, 1)) + j * 33,  ;
               100)) +  ;
               CHR(INT((ASC(SUBSTR(pass_str,  ;
               i, 1)) + j * 33) /  ;
               100))
          mstr = mstr + zf
          i = i + 1
     ENDDO
ELSE
     DO WHILE i<=j
          mchr = ASC(SUBSTR(pass_str,  ;
                 i + 1, 1)) * 100 +  ;
                 ASC(SUBSTR(pass_str,  ;
                 i, 1)) - j / 2 *  ;
                 33
          IF mchr < 0 .OR. mchr >  ;
             255
               mstr = ' '
               EXIT
          ENDIF
          zf = CHR(mchr)
          mstr = mstr + zf
          i = i + 2
     ENDDO
ENDIF
RETURN LTRIM(mstr)
ENDFUNC
**

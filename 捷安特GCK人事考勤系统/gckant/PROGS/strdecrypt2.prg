**
FUNCTION strDecrypt2
PARAMETER encryptionstring
decrypt = ""
= RAND(100001)
n = 0
DO WHILE n<8
     x = hexval(encryptionstring,  ;
         2 * n + 1)
     = RAND(INT(RAND() * x) + 1)
     n = n + 1
ENDDO
l = LEN(RTRIM(encryptionstring))
DO WHILE n<l/2
     x = hexval(encryptionstring,  ;
         2 * n + 1)
     x = BITXOR(INT(RAND() * 255),  ;
         x)
     decrypt = decrypt + CHR(x)
     n = n + 1
ENDDO
RETURN decrypt
ENDFUNC
**
FUNCTION HexVal
PARAMETER x, n
x1 = SUBSTR(x, n, 1)
x2 = SUBSTR(x, n + 1, 1)
DO CASE
     CASE BETWEEN(x1, '0', '9')
          x1val = ASC(x1) - 48
     CASE BETWEEN(x1, 'A', 'F')
          x1val = ASC(x1) - 65 +  ;
                  10
     OTHERWISE
          x1val = 0
ENDCASE
DO CASE
     CASE BETWEEN(x2, '0', '9')
          x2val = ASC(x2) - 48
     CASE BETWEEN(x2, 'A', 'F')
          x2val = ASC(x2) - 65 +  ;
                  10
     OTHERWISE
          x2val = 0
ENDCASE
hexval = x1val * 16 + x2val
RETURN hexval
ENDFUNC
**

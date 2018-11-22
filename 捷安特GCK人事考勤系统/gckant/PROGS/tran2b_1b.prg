PARAMETER t21_str
t21_ret = STRTRAN(t21_str, "£¬",  ;
          ",")
t21_ret = STRTRAN(t21_ret, "£¨",  ;
          "(")
t21_ret = STRTRAN(t21_ret, "£©",  ;
          ")")
t21_ret = STRTRAN(t21_ret, " ",  ;
          "")
RETURN t21_ret
ENDFUNC
**

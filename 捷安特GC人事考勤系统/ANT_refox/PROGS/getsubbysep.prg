**
FUNCTION GetSubBySep
LPARAMETERS gsb_str, gsb_sep,  ;
            gsb_idx
IF gsb_idx < 1
     RETURN ""
ENDIF
gsb_ret = ""
gsb_str = gsb_str + gsb_sep
gsb_pos = AT(gsb_sep, gsb_str,  ;
          gsb_idx)
IF gsb_pos > 0
     IF gsb_idx > 1
          gsb_pos0 = AT(gsb_sep,  ;
                     gsb_str,  ;
                     gsb_idx -  ;
                     1)
          gsb_ret = SUBSTR(gsb_str,  ;
                    gsb_pos0 + 1,  ;
                    gsb_pos -  ;
                    gsb_pos0 -  ;
                    1)
     ELSE
          gsb_ret = SUBSTR(gsb_str,  ;
                    1, gsb_pos -  ;
                    1)
     ENDIF
ENDIF
RETURN gsb_ret
ENDFUNC
**

**
FUNCTION IsInteger
LPARAMETERS v
LOCAL i
DO CASE
     CASE TYPE("v") = "N"
          IF CEILING(v) = v
               RETURN .T.
          ELSE
               RETURN .F.
          ENDIF
     CASE TYPE("v") = "C"
          FOR i = 1 TO LEN(v)
               IF  .NOT.  ;
                   ISDIGIT(SUBSTR(v,  ;
                   i, 1))
                    RETURN .F.
               ENDIF
          ENDFOR
          RETURN .T.
     OTHERWISE
          RETURN .F.
ENDCASE
ENDFUNC
**

**
FUNCTION IsAccessTo
LPARAMETERS smodule, sformid
IF PARAMETERS() = 1
     IF TYPE("pub_qx_module") =  ;
        "L"
          RETURN .F.
     ENDIF
     ACOPY(pub_qx_module,  ;
          array_qx)
     LOCAL i
     FOR i = 1 TO ALEN(array_qx,  ;
         1)
          IF TRIM(array_qx(i, 1)) ==  ;
             UPPER(TRIM(smodule))
               IF array_qx(i, 2) >  ;
                  0 .AND.  ;
                  SUBSTR(pub_ver,  ;
                  i, 1) == "1"
                    RETURN .T.
               ENDIF
          ENDIF
     ENDFOR
     RETURN .F.
ELSE
     DO CASE
          CASE UPPER(smodule) =  ;
               "KQ"
               IF TYPE("pub_qx_kq") =  ;
                  "L"
                    RETURN .F.
               ENDIF
               ACOPY(pub_qx_kq,  ;
                    array_qx)
          CASE UPPER(smodule) =  ;
               "RS"
               IF TYPE("pub_qx_rs") =  ;
                  "L"
                    RETURN .F.
               ENDIF
               ACOPY(pub_qx_rs,  ;
                    array_qx)
          CASE UPPER(smodule) =  ;
               "GZ"
               IF TYPE("pub_qx_gz") =  ;
                  "L"
                    RETURN .F.
               ENDIF
               ACOPY(pub_qx_gz,  ;
                    array_qx)
          CASE UPPER(smodule) =  ;
               "FT"
               IF TYPE("pub_qx_ft") =  ;
                  "L"
                    RETURN .F.
               ENDIF
               ACOPY(pub_qx_ft,  ;
                    array_qx)
     ENDCASE
     LOCAL i
     FOR i = 1 TO ALEN(array_qx,  ;
         1)
          IF TRIM(array_qx(i, 1)) ==  ;
             sformid
               IF array_qx(i, 2) >  ;
                  0
                    RETURN .T.
               ENDIF
          ENDIF
     ENDFOR
     RETURN .F.
ENDIF
ENDFUNC
**

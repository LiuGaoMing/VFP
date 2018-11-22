**
PROCEDURE GetAccess
LPARAMETERS smodule
LOCAL isall
IF TYPE("sModule") = "L"
     isall = .T.
ELSE
     IF UPPER(smodule) = "ALL"  ;
        .OR. EMPTY(smodule)
          isall = .T.
     ENDIF
ENDIF
IF isall .OR. UPPER(smodule) ==  ;
   "SYS"
     strsql = "Select * From sys_user where name=?pub_user"
     sqlexe_run(00000000012,  ;
               SYS(16), strsql,  ;
               "qx")
     pub_qx_module = .F.
     IF RECCOUNT("qx") > 0
          DIMENSION pub_qx_module(4,  ;
                    2)
          pub_qx_module(1, 1) =  ;
                       "KQ"
          pub_qx_module(1, 2) =  ;
                       qx.kq
          pub_qx_module(2, 1) =  ;
                       "RS"
          pub_qx_module(2, 2) =  ;
                       qx.rs
          pub_qx_module(3, 1) =  ;
                       "GZ"
          pub_qx_module(3, 2) =  ;
                       qx.gz
          pub_qx_module(4, 1) =  ;
                       "FT"
          pub_qx_module(4, 2) =  ;
                       qx.ft
     ENDIF
     SELECT qx
     USE
ENDIF
IF isall .OR. UPPER(smodule) ==  ;
   "KQ"
     strsql = "Select Hmbh,qx from kq_qx_hm where name=?pub_User"
     sqlexe_run(00000000031,  ;
               SYS(16), strsql,  ;
               "qx")
     pub_qx_kq = .F.
     IF RECCOUNT("qx") > 0
          DIMENSION pub_qx_kq(1)
          SELECT * FROM qx INTO  ;
                   ARRAY  ;
                   pub_qx_kq
     ENDIF
     SELECT qx
     USE
ENDIF
IF isall .OR. UPPER(smodule) ==  ;
   "RS"
     strsql = "Select Hmbh,qx from rs_qx_hm where name=?pub_User"
     sqlexe_run(00000000043,  ;
               SYS(16), strsql,  ;
               "qx")
     pub_qx_rs = .F.
     IF RECCOUNT("qx") > 0
          DIMENSION pub_qx_rs(1)
          SELECT * FROM qx INTO  ;
                   ARRAY  ;
                   pub_qx_rs
     ENDIF
     SELECT qx
     USE
ENDIF
IF isall .OR. UPPER(smodule) ==  ;
   "GZ"
     strsql = "Select Hmbh,qx from gz_qx_hm where name=?pub_User"
     sqlexe_run(00000000055,  ;
               SYS(16), strsql,  ;
               "qx")
     pub_qx_gz = .F.
     IF RECCOUNT("qx") > 0
          DIMENSION pub_qx_gz(1)
          SELECT * FROM qx INTO  ;
                   ARRAY  ;
                   pub_qx_gz
     ENDIF
     SELECT qx
     USE
ENDIF
IF isall .OR. UPPER(smodule) ==  ;
   "FT"
     strsql = "Select Hmbh,qx from ft_qx_hm where name=?pub_User"
     sqlexe_run(00000000067,  ;
               SYS(16), strsql,  ;
               "qx")
     pub_qx_ft = .F.
     IF RECCOUNT("qx") > 0
          DIMENSION pub_qx_ft(1)
          SELECT * FROM qx INTO  ;
                   ARRAY  ;
                   pub_qx_ft
     ENDIF
     SELECT qx
     USE
ENDIF
pub_qx_mj = .F.
DIMENSION pub_qx_mj(1)
ENDPROC
**

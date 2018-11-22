**
FUNCTION GetRepKey
LPARAMETERS grk_mod
grk_ret = ""
DO CASE
     CASE grk_mod = "KEY"
          DO CASE
               CASE replist.attr1 =  ;
                    1
                    grk_ret = "RQ,ZGBH"
               CASE replist.attr1 =  ;
                    2
                    grk_ret = "RQ,BMBH"
               CASE replist.attr1 =  ;
                    3
                    grk_ret = "RQ,RIQI"
               CASE replist.attr1 =  ;
                    4
                    grk_ret = "RQ,ZGLB"
               CASE replist.attr1 =  ;
                    5 .OR.  ;
                    replist.attr1 =  ;
                    6
                    grk_ret = ALLTRIM(replist.pkey)
          ENDCASE
     CASE grk_mod = "WHERE"
          DO CASE
               CASE replist.attr1 =  ;
                    1
                    grk_ret = "RQ=?RQ AND ZGBH=?ZGBH"
               CASE replist.attr1 =  ;
                    2
                    grk_ret = "RQ=?RQ AND BMBH=?BMBH"
               CASE replist.attr1 =  ;
                    3
                    grk_ret = "RQ=?RQ AND RIQI=?RIQI"
               CASE replist.attr1 =  ;
                    4
                    grk_ret = "RQ=?RQ AND ZGLB=?ZGLB"
               CASE replist.attr1 =  ;
                    5 .OR.  ;
                    replist.attr1 =  ;
                    6
                    mpkey = ALLTRIM(replist.pkey)
                    mlen = LEN(mpkey)
                    DO WHILE mlen> ;
                       0
                         mpos = AT( ;
                                ",",  ;
                                mpkey)
                         mfd = LEFT(mpkey,  ;
                               IIF(mpos =  ;
                               0,  ;
                               mlen,  ;
                               mpos -  ;
                               1))
                         IF  .NOT.  ;
                             EMPTY(grk_ret)
                              grk_ret =  ;
                               grk_ret +  ;
                               " AND " +  ;
                               mfd +  ;
                               "=?" +  ;
                               mfd
                         ELSE
                              grk_ret =  ;
                               mfd +  ;
                               "=?" +  ;
                               mfd
                         ENDIF
                         mpkey = RIGHT(mpkey,  ;
                                 mlen -  ;
                                 LEN(mfd) -  ;
                                 1)
                         mlen = LEN(mpkey)
                    ENDDO
          ENDCASE
     CASE grk_mod = "INDEX"
          DO CASE
               CASE replist.attr1 =  ;
                    1
                    grk_ret = "ZGBH"
               CASE replist.attr1 =  ;
                    2
                    grk_ret = "BMBH"
               CASE replist.attr1 =  ;
                    3
                    grk_ret = "RIQI"
               CASE replist.attr1 =  ;
                    4
                    grk_ret = "ZGLB"
               CASE replist.attr1 =  ;
                    5 .OR.  ;
                    replist.attr1 =  ;
                    6
                    mpkey = ALLTRIM(replist.pkey)
                    mlen = LEN(mpkey)
                    DO WHILE mlen> ;
                       0
                         mpos = AT( ;
                                ",",  ;
                                mpkey)
                         mfd = LEFT(mpkey,  ;
                               IIF(mpos =  ;
                               0,  ;
                               mlen,  ;
                               mpos -  ;
                               1))
                         IF mfd =  ;
                            "RQ"
                              LOOP
                         ENDIF
                         IF TYPE("repfile." +  ;
                            mfd) =  ;
                            "N"
                              mfd =  ;
                               "str(" +  ;
                               mfd +  ;
                               ")"
                         ENDIF
                         IF  .NOT.  ;
                             EMPTY(grk_ret)
                              grk_ret =  ;
                               grk_ret +  ;
                               " + " +  ;
                               mfd
                         ELSE
                              grk_ret =  ;
                               mfd
                         ENDIF
                         mpkey = RIGHT(mpkey,  ;
                                 mlen -  ;
                                 LEN(mfd) -  ;
                                 1)
                         mlen = LEN(mpkey)
                    ENDDO
          ENDCASE
ENDCASE
RETURN grk_ret
ENDFUNC
**

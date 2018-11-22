**
FUNCTION CheckJbBA
LPARAMETERS cjb_sbsk, cjb_xbsk,  ;
            cjb_sbsj, cjb_xbsj,  ;
            cjb_jbss
msbsj = IIF(cjb_sbsj < delta0,  ;
        1440 + cjb_sbsj,  ;
        cjb_sbsj)
mxbsj = IIF(cjb_sbsj > clfx.xbsj,  ;
        1440 + cjb_xbsj,  ;
        cjb_xbsj)
msbsk = IIF(cjb_sbsk < delta0,  ;
        1440 + cjb_sbsk,  ;
        cjb_sbsk)
mxbsk = IIF(cjb_sbsk > cjb_xbsk,  ;
        1440 + cjb_xbsk,  ;
        cjb_xbsk)
msjjb2 = IIF(sjjb2 > 0, sjjb2, 1)
mbefore = msjjb2 * INT((msbsj -  ;
          msbsk) / msjjb2)
mafter = msjjb2 * INT((mxbsk -  ;
         mxbsj) / msjjb2)
DO CASE
     CASE mbefore <= 0
          cjb_ret = mafter
     CASE mbefore >= 0 .AND.  ;
          mafter <= 0
          cjb_ret = mbefore
     OTHERWISE
          mrateb = (mbefore /  ;
                   cjb_jbss - 1)
          mratea = (mafter /  ;
                   cjb_jbss - 1)
          IF mrateb < mratea
               IF mbefore >=  ;
                  cjb_jbss
                    cjb_ret = mbefore
               ELSE
                    cjb_ret = mbefore +  ;
                              mbefore
               ENDIF
          ELSE
               IF mafter >=  ;
                  cjb_jbss
                    cjb_ret = mafter
               ELSE
                    cjb_ret = mbefore +  ;
                              mbefore
               ENDIF
          ENDIF
ENDCASE
RETURN cjb_ret
ENDFUNC
**

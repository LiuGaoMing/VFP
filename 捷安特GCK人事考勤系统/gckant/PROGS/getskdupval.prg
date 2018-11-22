**
FUNCTION GetSKDupVal
LPARAMETERS cd_sbsk1, cd_xbsk1,  ;
            cd_sbsk2, cd_xbsk2,  ;
            cd_mode
IF cd_sbsk1 = 0 .OR. cd_xbsk1 = 0  ;
   .OR. cd_sbsk2 = 0 .OR.  ;
   cd_xbsk2 = 0
     RETURN 0
ENDIF
mcd_sbsk1 = cd_sbsk1
mcd_xbsk1 = IIF(cd_xbsk1 <  ;
            cd_sbsk1, 1440 +  ;
            cd_xbsk1, cd_xbsk1)
mcd_sbsk2 = cd_sbsk2
mcd_xbsk2 = IIF(cd_xbsk2 <  ;
            cd_sbsk2, 1440 +  ;
            cd_xbsk2, cd_xbsk2)
cd_ret = 9999
IF cd_mode = 0
     DO CASE
          CASE mcd_sbsk1 >=  ;
               mcd_sbsk2 .AND.  ;
               mcd_sbsk1 <=  ;
               mcd_xbsk2 .AND.  ;
               mcd_xbsk1 >=  ;
               mcd_sbsk2 .AND.  ;
               mcd_xbsk1 <=  ;
               mcd_xbsk2
               cd_ret = 0
          CASE mcd_sbsk2 >=  ;
               mcd_sbsk1 .AND.  ;
               mcd_sbsk2 <=  ;
               mcd_xbsk1 .AND.  ;
               mcd_xbsk2 >=  ;
               mcd_sbsk1 .AND.  ;
               mcd_xbsk2 <=  ;
               mcd_xbsk1
               cd_ret = 0
          CASE mcd_sbsk1 >=  ;
               mcd_sbsk2 .AND.  ;
               mcd_sbsk1 <=  ;
               mcd_xbsk2 .AND.  ;
               mcd_xbsk1 >  ;
               mcd_xbsk2
               cd_ret = mcd_xbsk2 -  ;
                        mcd_sbsk1
          CASE mcd_xbsk1 >=  ;
               mcd_sbsk2 .AND.  ;
               mcd_xbsk1 <=  ;
               mcd_xbsk2 .AND.  ;
               mcd_sbsk1 <  ;
               mcd_sbsk2
               cd_ret = mcd_xbsk1 -  ;
                        mcd_sbsk2
          CASE mcd_sbsk1 <  ;
               mcd_sbsk2 .AND.  ;
               mcd_xbsk1 <  ;
               mcd_sbsk2
               cd_ret = mcd_sbsk2 -  ;
                        mcd_xbsk1
          CASE mcd_sbsk1 >  ;
               mcd_sbsk2 .AND.  ;
               mcd_sbsk1 >  ;
               mcd_xbsk2
               cd_ret = mcd_sbsk1 -  ;
                        mcd_xbsk2
     ENDCASE
ELSE
     DO CASE
          CASE mcd_sbsk2 >=  ;
               mcd_sbsk1 .AND.  ;
               mcd_sbsk2 <=  ;
               mcd_xbsk1 .AND.  ;
               mcd_xbsk2 >=  ;
               mcd_sbsk1 .AND.  ;
               mcd_xbsk2 <=  ;
               mcd_xbsk1
               cd_ret = mcd_xbsk2 -  ;
                        mcd_sbsk2
          CASE mcd_sbsk2 >=  ;
               mcd_sbsk1 .AND.  ;
               mcd_sbsk2 <=  ;
               mcd_xbsk1 .AND.  ;
               (mcd_xbsk2 <  ;
               mcd_sbsk1 .OR.  ;
               mcd_xbsk2 >  ;
               mcd_xbsk1)
               cd_ret = mcd_sbsk2 -  ;
                        mcd_sbsk1
          CASE (mcd_sbsk2 <  ;
               mcd_sbsk1 .OR.  ;
               mcd_sbsk2 >  ;
               mcd_xbsk1) .AND.  ;
               mcd_xbsk2 >=  ;
               mcd_sbsk1 .AND.  ;
               mcd_xbsk2 <=  ;
               mcd_xbsk1
               cd_ret = mcd_xbsk1 -  ;
                        mcd_xbsk2
     ENDCASE
ENDIF
RETURN cd_ret
ENDFUNC
**

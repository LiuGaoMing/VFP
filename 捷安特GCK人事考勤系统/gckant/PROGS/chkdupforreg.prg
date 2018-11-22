**
FUNCTION ChkDupForReg
LPARAMETERS cd_st1, cd_et1,  ;
            cd_st2, cd_et2
IF (cd_st1 = 0 .OR. cd_et1 = 0)  ;
   .AND. (cd_st2 = 0 .OR. cd_et2 =  ;
   0)
     RETURN 0
ENDIF
IF cd_st1 > 0 .AND. cd_et1 > 0  ;
   .AND. cd_st2 > 0
     IF cd_st1 < pub_delta0
          cd_st1 = cd_st1 + 1440
     ENDIF
     IF cd_et1 < cd_st1
          cd_et1 = cd_et1 + 1440
     ENDIF
     IF cd_st2 < pub_delta0
          cd_st2 = cd_st2 + 1440
     ENDIF
     IF cd_st2 > cd_st1 .AND.  ;
        cd_st2 < cd_et1
          RETURN 1
     ENDIF
ENDIF
IF cd_st1 > 0 .AND. cd_et1 > 0  ;
   .AND. cd_et2 > 0
     IF cd_st1 < pub_delta0
          cd_st1 = cd_st1 + 1440
     ENDIF
     IF cd_et1 < cd_st1
          cd_et1 = cd_et1 + 1440
     ENDIF
     IF cd_et2 < pub_delta0
          cd_et2 = cd_et2 + 1440
     ENDIF
     IF cd_et2 > cd_st1 .AND.  ;
        cd_et2 < cd_et1
          RETURN 1
     ENDIF
ENDIF
IF cd_st2 > 0 .AND. cd_et2 > 0  ;
   .AND. cd_st1 > 0
     IF cd_st2 < pub_delta0
          cd_st2 = cd_st2 + 1440
     ENDIF
     IF cd_et2 < cd_st2
          cd_et2 = cd_et2 + 1440
     ENDIF
     IF cd_st1 < pub_delta0
          cd_st1 = cd_st1 + 1440
     ENDIF
     IF cd_st1 > cd_st2 .AND.  ;
        cd_st1 < cd_et2
          RETURN 1
     ENDIF
ENDIF
IF cd_st2 > 0 .AND. cd_et2 > 0  ;
   .AND. cd_et1 > 0
     IF cd_st2 < pub_delta0
          cd_st2 = cd_st2 + 1440
     ENDIF
     IF cd_et2 < cd_st2
          cd_et2 = cd_et2 + 1440
     ENDIF
     IF cd_et1 < pub_delta0
          cd_et1 = cd_et1 + 1440
     ENDIF
     IF cd_et1 > cd_st2 .AND.  ;
        cd_et1 < cd_et2
          RETURN 1
     ENDIF
ENDIF
RETURN 0
ENDFUNC
**

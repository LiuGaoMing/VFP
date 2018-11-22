PARAMETER para_tag, para_src
tag_fds = fcount("&para_tag")
src_fds = fcount("&para_src")
mreplace = ""
FOR i = 1 TO tag_fds
     mfd = field(i,"&para_tag")
     FOR j = 1 TO src_fds
          if mfd==field(j,"&para_src")
               IF  .NOT.  ;
                   EMPTY(mreplace)
                    mreplace = mreplace +  ;
                               "," +  ;
                               mfd +  ;
                               " with " +  ;
                               para_src +  ;
                               "." +  ;
                               mfd
               ELSE
                    mreplace = "replace " +  ;
                               mfd +  ;
                               " with " +  ;
                               para_src +  ;
                               "." +  ;
                               mfd
               ENDIF
               EXIT
          ENDIF
     ENDFOR
ENDFOR
IF  .NOT. EMPTY(mreplace)
     select &para_src
     SCAN
          select &para_tag
          APPEND BLANK
          &mreplace
          select &para_src
     ENDSCAN
ENDIF
ENDPROC
**

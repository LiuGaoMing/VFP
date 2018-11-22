PARAMETER para_tag, para_src,  ;
          para_left
tag_fds = fcount("&para_tag")
src_fds = fcount("&para_src")
mreplace = ""
FOR i = 1 TO tag_fds
     mfd = left(field(i,"&para_tag"),para_left)
     FOR j = 1 TO src_fds
          mfd_tag = para_tag+"."+field(i,"&para_tag");
  
          mfd_src = para_src+"."+field(j,"&para_src")
          if mfd==left(field(j,"&para_src"),para_left);
and type("&mfd_tag")=type("&mfd_src")
               IF  .NOT.  ;
                   EMPTY(mreplace)
                    mreplace = mreplace+","+field(i,"&para_tag")+" with "+para_src+"."+field(j,"&para_src")
               ELSE
                    mreplace = "replace "+field(i,"&para_tag")+" with "+para_src+"."+field(j,"&para_src")
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

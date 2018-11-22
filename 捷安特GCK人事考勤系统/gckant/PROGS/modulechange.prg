**
PROCEDURE ModuleChange
LPARAMETERS nmoduleindex
DO CASE
     CASE nmoduleindex = 1
          sselect = "rs"
     CASE nmoduleindex = 2
          sselect = "kq"
     CASE nmoduleindex = 3
          sselect = "gz"
     CASE nmoduleindex = 4
          sselect = "ft"
     CASE nmoduleindex = 5
          sselect = "tl"
     CASE nmoduleindex = 7
          DO sysexit
     CASE nmoduleindex = 8
          sselect = "mj"
          RETURN
ENDCASE
IF LOWER(RIGHT(pub_object(1), 2)) ==  ;
   sselect
     RETURN
ENDIF
IF LOWER(STUFF(pub_object(1), 1,  ;
   4, "")) == "tools" .AND.  ;
   sselect == "tl"
     RETURN
ENDIF
IF  .NOT. EMPTY(pub_object(1))
     obj_form1.cmd_exit.click
ENDIF
refreshmenu(sselect)
IF nmoduleindex = 5
     pub_object(1) = "OBJ_TOOLS"
     sformid = "tools"
ELSE
     pub_object(1) = "OBJ_3A" +  ;
               UPPER(sselect)
     sformid = "3a" + sselect
ENDIF
do form &sFormID NAME obj_form1 LINKED;

ENDPROC
**

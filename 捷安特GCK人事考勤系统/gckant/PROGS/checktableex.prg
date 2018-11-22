**
FUNCTION CheckTableEx
PARAMETER checkedcursor,  ;
          coldefcursor,  ;
          resultcursor
rgb_green = RGB(128, 255, 0)
SET DELETED OFF
select * from &ColDefCursor where Upper(Left(Field_name,2))=='FD';
into cursor tmp_ColumnsDef
SELECT VAL(ALLTRIM(SUBSTR(field_name,  ;
       3, LEN(field_name)))) AS  ;
       fieldnum, * FROM  ;
       tmp_ColumnsDef INTO CURSOR  ;
       tmp_Columns
select * from &CheckedCursor where FieldNum;
not in (select FieldNum from tmp_Columns);
into cursor tmp_CheckTable
SCAN
     DO CASE
          CASE tmp_checktable.modifyflag =  ;
               rgb_delete
               insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此项目已删除但数据表中不存在',1,RGB_Normal)
          CASE tmp_checktable.modifyflag =  ;
               rgb_normal .AND.   ;
               .NOT.  ;
               tmp_checktable.isdeleted
               insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此项目已存在但数据表中不存在',1,RGB_Insert)
          CASE tmp_checktable.modifyflag =  ;
               rgb_modify
               insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此项目已修改但数据表中不存在',1,RGB_Insert)
          CASE tmp_checktable.modifyflag =  ;
               rgb_insert
               insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此新建项目在数据表中不存在',1,RGB_Insert)
     ENDCASE
ENDSCAN
select * from tmp_Columns where FieldNum;
not in (select FieldNum from &CheckedCursor);
into cursor tmp_CheckTable
SCAN
     insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,0,tmp_CheckTable.Field_name,'',0,0,'此项目不存在但数据表中已存在',-1,RGB_Green)
ENDSCAN
select a.*,b.Field_type,b.Field_len,b.Field_dec;
from &CheckedCursor a,tmp_Columns b where;
a.FieldNum=b.FieldNum into cursor tmp_CheckTable
SCAN
     DO CASE
          CASE tmp_checktable.modifyflag =  ;
               rgb_insert
               IF (ALLTRIM(tmp_checktable.fieldtype) ==  ;
                  ALLTRIM(tmp_checktable.field_type))  ;
                  .OR.  ;
                  (ALLTRIM(tmp_checktable.fieldtype) ==  ;
                  "N" .AND.  ;
                  (ALLTRIM(tmp_checktable.field_type) ==  ;
                  "B" .OR.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "I")) .OR.  ;
                  (ALLTRIM(tmp_checktable.fieldtype) ==  ;
                  "D" .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "C")
                    insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此项目新插入但数据表中已存在,且类型、宽度、小数都相同',1,RGB_Normal)
               ELSE
                    insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此项目新插入但数据表中已存在,但类型、宽度或小数不同',1,RGB_Modify)
               ENDIF
          CASE tmp_checktable.modifyflag =  ;
               rgb_normal .AND.   ;
               .NOT.  ;
               tmp_checktable.isdeleted
               IF (ALLTRIM(tmp_checktable.fieldtype) ==  ;
                  ALLTRIM(tmp_checktable.field_type))  ;
                  .OR.  ;
                  (ALLTRIM(tmp_checktable.fieldtype) ==  ;
                  "N" .AND.  ;
                  (ALLTRIM(tmp_checktable.field_type) ==  ;
                  "B" .OR.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "I")) .OR.  ;
                  (ALLTRIM(tmp_checktable.fieldtype) ==  ;
                  "D" .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "C")
                    LOOP
               ELSE
                    insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此项目已存在但与数据表中已存在的类型、宽度或小数不同',1,RGB_Modify)
               ENDIF
          CASE tmp_checktable.modifyflag =  ;
               rgb_normal .AND.  ;
               tmp_checktable.isdeleted
               insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'此项目已删除但数据表中已存在',1,RGB_Green)
          CASE tmp_checktable.modifyflag =  ;
               rgb_modify
               insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'',0,RGB_Modify)
          CASE tmp_checktable.modifyflag =  ;
               rgb_delete
               insert into &resultCursor(RowNum,FieldNum,FieldTitle,FieldType,FieldWidth,FieldPrec,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1,tmp_CheckTable.FieldNum,tmp_CheckTable.FieldTitle,tmp_CheckTable.FieldType,;
tmp_CheckTable.FieldWidth,tmp_CheckTable.FieldPrec,'',0,RGB_Green)
     ENDCASE
ENDSCAN
SET DELETED ON
select &ResultCursor
COUNT ALL FOR flag <> 0 TO  ;
      errcount
IF errcount = 0
     RETURN 0
ELSE
     RETURN 1
ENDIF
ENDFUNC
**

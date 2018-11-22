**
FUNCTION CheckTable
PARAMETER aliasname, resultcursor
rgb_green = RGB(128, 255, 0)
SET DELETED OFF
SELECT * FROM ColDef WHERE  ;
         UPPER(LEFT(field_name,  ;
         2)) == 'FD' INTO CURSOR  ;
         tmp_ColumnsDef
SELECT VAL(ALLTRIM(SUBSTR(field_name,  ;
       3, LEN(field_name)))) AS  ;
       xuhao, * FROM  ;
       tmp_ColumnsDef INTO CURSOR  ;
       tmp_Columns
select *,deleted() as delflag from &AliasName;
where xuhao not in (select xuhao from;
tmp_Columns) and ModifyFlag<>RGB_Insert;
into cursor tmp_CheckTable
SCAN
     DO CASE
          CASE tmp_checktable.modifyflag =  ;
               rgb_delete
               update &AliasName set optFlag=RGB_Normal;
where XuHao=tmp_CheckTable.XuHao
               insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目已删除但数据表中不存在',0,RGB_Normal)
          CASE tmp_checktable.modifyflag =  ;
               rgb_normal .AND.   ;
               .NOT. delflag
               update &AliasName set optFlag=RGB_Insert;
where XuHao=tmp_CheckTable.XuHao
               insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目已存在但数据表中不存在',0,RGB_Insert)
          CASE tmp_checktable.modifyflag =  ;
               rgb_modify
               update &AliasName set optFlag=RGB_Insert;
where XuHao=tmp_CheckTable.XuHao
               insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目已修改但数据表中不存在',0,RGB_Insert)
     ENDCASE
ENDSCAN
select * from tmp_Columns where xuhao;
not in (select xuhao from &AliasName);
into cursor tmp_CheckTable
SCAN
     insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Field_Name,Upper(tmp_CheckTable.Field_Name),'此项目不存在但数据表中已存在',1,RGB_Green)
ENDSCAN
select *,deleted() as delflag from &AliasName;
into cursor tmp_CheckTable
SELECT a.*, b.field_type,  ;
       b.field_len, b.field_dec  ;
       FROM tmp_CheckTable a,  ;
       tmp_Columns b WHERE  ;
       a.xuhao = b.xuhao INTO  ;
       CURSOR tmp_CheckTable
SCAN
     DO CASE
          CASE tmp_checktable.modifyflag =  ;
               rgb_insert
               IF (ALLTRIM(tmp_checktable.typ) ==  ;
                  ALLTRIM(tmp_checktable.field_type)  ;
                  .AND.  ;
                  tmp_checktable.kuandu =  ;
                  tmp_checktable.field_len)  ;
                  .OR.  ;
                  (ALLTRIM(tmp_checktable.typ) ==  ;
                  "N" .AND.  ;
                  tmp_checktable.xiaoshu =  ;
                  0 .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "I") .OR.  ;
                  (ALLTRIM(tmp_checktable.typ) ==  ;
                  "N" .AND.  ;
                  tmp_checktable.xiaoshu <>  ;
                  0 .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "B")
                    update &AliasName;
set optFlag=RGB_Normal where XuHao=tmp_CheckTable.XuHao
                    insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目新插入但数据表中已存在,且类型、宽度、小数都相同',0,RGB_Normal)
               ELSE
                    update &AliasName;
set optFlag=RGB_Modify where XuHao=tmp_CheckTable.XuHao
                    insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目新插入但数据表中已存在,但类型、宽度或小数不同',0,RGB_Modify)
               ENDIF
          CASE tmp_checktable.modifyflag =  ;
               rgb_normal .AND.   ;
               .NOT. delflag
               IF (ALLTRIM(tmp_checktable.typ) ==  ;
                  ALLTRIM(tmp_checktable.field_type)  ;
                  .AND.  ;
                  tmp_checktable.kuandu =  ;
                  tmp_checktable.field_len)  ;
                  .OR.  ;
                  (ALLTRIM(tmp_checktable.typ) ==  ;
                  "N" .AND.  ;
                  tmp_checktable.xiaoshu =  ;
                  0 .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "I") .OR.  ;
                  (ALLTRIM(tmp_checktable.typ) ==  ;
                  "N" .AND.  ;
                  tmp_checktable.xiaoshu <>  ;
                  0 .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "B")
                    LOOP
               ELSE
                    update &AliasName;
set optFlag=RGB_Modify where XuHao=tmp_CheckTable.XuHao
                    insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目已存在但与数据表中已存在的类型、宽度或小数不同',0,RGB_Modify)
               ENDIF
          CASE tmp_checktable.modifyflag =  ;
               rgb_normal .AND.  ;
               delflag
               insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目已删除但数据表中已存在',1,RGB_Green)
          CASE tmp_checktable.modifyflag =  ;
               rgb_modify
               IF (ALLTRIM(tmp_checktable.typ) ==  ;
                  ALLTRIM(tmp_checktable.field_type)  ;
                  .AND.  ;
                  tmp_checktable.kuandu =  ;
                  tmp_checktable.field_len)  ;
                  .OR.  ;
                  (ALLTRIM(tmp_checktable.typ) ==  ;
                  "N" .AND.  ;
                  tmp_checktable.xiaoshu =  ;
                  0 .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "I") .OR.  ;
                  (ALLTRIM(tmp_checktable.typ) ==  ;
                  "N" .AND.  ;
                  tmp_checktable.xiaoshu <>  ;
                  0 .AND.  ;
                  ALLTRIM(tmp_checktable.field_type) ==  ;
                  "B")
                    update &AliasName;
set optFlag=RGB_Normal where XuHao=tmp_CheckTable.XuHao
                    insert into &resultCursor(XuHao,ItemName,FieldName,Detail,Flag,ModifyFlag);
values(Reccount(resultCursor)+1, tmp_CheckTable.Term,'FD'+AllTrim(Str(tmp_CheckTable.XuHao)),'此项目已修改但与数据表中已存在的类型、宽度或小数都相同',0,RGB_Normal)
               ENDIF
     ENDCASE
ENDSCAN
SET DELETED ON
IF RECCOUNT(resultcursor) = 0
     RETURN 0
ELSE
     RETURN 1
ENDIF
ENDFUNC
**

IF MESSAGEBOX("ȷ��ɾ����ǰ�ڵ��Լ������¼��ڵ���",  ;
   049, "���ڷ���ϵͳ") <> 1
     RETURN
ENDIF
curnode = obj_form4.tree.selecteditem
curnodeid = RIGHT(curnode.key,  ;
            LEN(curnode.key) -  ;
            1)
pub_modifyflag = .T.
UPDATE bm SET nodeid = "",  ;
       modifyflag = rgb_modify  ;
       WHERE LEFT(ALLTRIM(nodeid),  ;
       LEN(curnodeid)) ==  ;
       curnodeid
UPDATE org SET modifyflag =  ;
       rgb_delete WHERE  ;
       LEFT(ALLTRIM(nodeid),  ;
       LEN(curnodeid)) ==  ;
       curnodeid
DELETE FROM org WHERE  ;
       LEFT(ALLTRIM(nodeid),  ;
       LEN(curnodeid)) ==  ;
       curnodeid
obj_form4.tree.nodes.remove(curnode.key)
ENDPROC
**

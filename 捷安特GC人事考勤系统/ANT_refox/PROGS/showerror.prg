PARAMETER par_mode
DO CASE
     CASE par_mode == "gz"
          MESSAGEBOX("�������ʽ����" +  ;
                    CHR(13) +  ;
                    MESSAGE(), 64,  ;
                    "���¹���ϵͳ")
     CASE par_mode == "gzrep"  ;
          .OR. par_mode ==  ;
          "kqrep"
          MESSAGEBOX("���� [" +  ;
                    ALLTRIM(replist.name_c) +  ;
                    "] ���㹫ʽ����" +  ;
                    CHR(013) +  ;
                    MESSAGE(), 64,  ;
                    IIF(par_mode =  ;
                    "gzrep",  ;
                    "����",  ;
                    "����") +  ;
                    "����ϵͳ")
ENDCASE
RETURN TO MASTER 
ENDPROC
**

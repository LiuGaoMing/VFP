mfd = "XUHAO INTEGER NOT NULL PRIMARY KEY,"
mfd = mfd +  ;
      "TABLE_NAME VARCHAR(20) DEFAULT '',"
mfd = mfd +  ;
      "COND_KEY VARCHAR(100) DEFAULT '',"
mfd = mfd +  ;
      "DATE_FIELD VARCHAR(20) DEFAULT '',"
mfd = mfd +  ;
      "DEP VARCHAR(4) DEFAULT '',"
mfd = mfd +  ;
      "NOTE VARCHAR(50) DEFAULT '',"
mfd = mfd +  ;
      "SELECTFLAG	INTEGER DEFAULT 1"
SQLEXEC(odbc_ant2000,  ;
       "drop TABLE TABLE_LIST ")
sqlexec(ODBC_ANT2000,"CREATE TABLE  TABLE_LIST (&mfd)")
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (100,'FT_ARDATA',		'ZGBH=?ZGBH AND RIQI=?RIQI AND SHIJIAN=?SHIJIAN',	'RIQI',	'FT','�Ͳ�ˢ����¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (101,'FT_LSKH',			'LSKH=?LSKH',										' ',	'FT','���ŵǼǱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (102,'FT_BM',			'BMBH=?BMBH',										' ',	'FT','���Ŵ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (103,'FT_ZG',			'ZGBH=?ZGBH',										' ',	'FT','Ա�����ϱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (104,'FT_JCFX',			' ',												' ',	'FT','�Ͳͷ�����ϸ��',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (105,'FT_JCJL',			' ',												' ',	'FT','�Ͳͼ�¼��ϸ��',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (106,'FT_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'FT','����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (107,'FT_TIME',			'CC=?CC',											' ',	'FT','�ʹ��趨��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (108,'FT_PLACE',			'CODE=?CODE',										' ',	'FT','���ر����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (200,'RS_BM',			'BMBH=?BMBH',										' ',	'RS','���Ŵ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (201,'RS_CD_GW',			'CODE=?CODE',										' ',	'RS','��λ�����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (202,'RS_CD_HJ',			'CODE=?CODE',										' ',	'RS','���������',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (203,'RS_CD_JYXL',		'CODE=?CODE',										' ',	'RS','����ѵ�������',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (204,'RS_CD_RZFS',		'CODE=?CODE',										' ',	'RS','��ְ��ʽ�����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (205,'RS_CD_ZC',			'CODE=?CODE',										' ',	'RS','ְ�ƴ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (206,'RS_CD_ZW',			'CODE=?CODE',										' ',	'RS','ְ������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (207,'RS_FL',			'ZGBH=?ZGBH',										' ',	'RS','�������ϱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (208,'RS_GR',			'ZGBH=?ZGBH',										' ',	'RS','�������ϱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (209,'RS_GZJL',			'ZGBH=?ZGBH AND FWKS=?FWKS',						' ',	'RS','����������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (210,'RS_HYJL',			'ZGBH=?ZGBH AND KSSJ=?KSSJ',						'KSSJ',	'RS','��Լ��¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (211,'RS_JCJL',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'RS','���ͼ�¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (212,'RS_JTBJ',			'ZGBH=?ZGBH AND XM=?XM',							' ',	'RS','��ͥ������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (215,'RS_LL',			'ZGBH=?ZGBH',										' ',	'RS','�������ϱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (216,'RS_QX_BM',			'BMBH=?BMBH AND NAME=?NAME',						' ',	'RS','����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (217,'RS_QX_GYXZ',		'CODE=?CODE AND NAME=?NAME',						' ',	'RS','��Ӷ����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (218,'RS_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'RS','����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (219,'RS_REPLIST',		'XUHAO=?XUHAO',										' ',	'RS','�������嵥',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (220,'RS_SEARCH_HEAD',	'XUHAO=?XUHAO',										' ',	'RS','�ۺϲ�ѯ��������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (221,'RS_SEARCH_TAIL',	'XUHAO=?XUHAO AND NAME=?NAME AND SDB=?SDB',			' ',	'RS','�ۺϲ�ѯ������ϸ��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (222,'RS_XL',			'ZGBH=?ZGBH AND XW=?XW AND ZY=?ZY',					' ',	'RS','ѧ�����ݱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (223,'RS_YD',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'RS','�춯�����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (224,'RS_YLBXJL',		'ZGBH=?ZGBH AND JNRQ=?JNRQ',						'JNRQ',	'RS','���ϱ��ս��ɼ�¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (225,'RS_ZG',			'ZGBH=?ZGBH',										' ',	'RS','Ա�����ϱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (226,'RS_NZJ',          	' ',												' ',	'RS','���ʽ������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (227,'RS_SCJJ',         	'BMBH=?BMBH AND GW=?GW AND DJ=?DJ',					' ',	'RS','������������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (228,'RS_ZWJT',			'ZW=?ZW AND DJ=?DJ',								' ',	'RS','ְ����������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (229,'RS_HJJT',			'BMBH=?BMBH AND GW=?GW',							' ',	'RS','�������������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (230,'RS_GZYJ',			'ZGBH=?ZGBH AND GZKSRQ=?GZKSRQ',					' ',	'RS','����ҵ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (231,'RS_YLJL',			'ZGBH=?ZGBH AND YLKSRQ=?YLKSRQ',					' ',	'RS','ҽ�Ƽ�¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (232,'RS_JLWP',			'ZGBH=?ZGBH AND WPMC=?WPMC AND XHGG=?XHGG AND LQSJ=?LQSJ','LQSJ','RS','��Ʒ�����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (233,'RS_JYXL_PLAN_H',	'ID=?ID',											' ',	'RS','����ѵ���ƻ���',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (234,'RS_JYXL_PLAN_D',	'ID=?ID AND ZGBH=?ZGBH',							' ',	'RS','����ѵ����ϸ��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (235,'RS_ZF',			'ZGBH=?ZGBH AND RQ=?RQ AND LB=?LB',					'RQ',	'RS','�ӷ�̨�ʱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (236,'RS_YLBX_1',		'ZGBH=?ZGBH AND BXLB=?BXLB AND JND=?JND AND GYXZ=?GYXZ AND NX=?NX',' ','RS','���ϱ��ս��ɼ�¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (237,'RS_TZZJ',			'ZGBH=?ZGBH AND XYHAO=?XUHAO',						' ',	'RS','����֤�������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (300,'KQ_NJ_1',			'ZGBH=?ZGBH AND ND=?ND AND YF=?YF',					' ',	'KQ','��ٹ����1',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (301,'KQ_XJJL_J',		'MM=?MM AND DD=?DD',								' ',	'KQ','�ڼ��ն����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (302,'KQ_ZTWC',			'ZGBH=?ZGBH AND RIQI=?RIQI AND SK1=?SK1',			'RIQI',	'KQ','��;�����¼��',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (303,'KQ_REPDEF',		'XUHAO=?XUHAO AND SEQ=?SEQ',						' ',	'KQ','������Ŀ�����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (304,'KQ_ARDATA',		'ZGBH=?ZGBH AND RIQI=?RIQI AND SHIJIAN=?SHIJIAN',	'RIQI',	'KQ','����ˢ����¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (305,'KQ_LSKH',			'LSKH=?LSKH',										' ',	'KQ','���ŵǼǱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (306,'KQ_XJJL_D',		' ',												' ',	'KQ','���ڵǼǱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (307,'KQ_CLFX',			' ',												' ',	'KQ','���ڴ�������',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (308,'KQ_BCTYPE',		'LB=?LB',											' ',	'KQ','���ඨ���',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (309,'KQ_BM',			'BMBH=?BMBH',										' ',	'KQ','���Ŵ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (310,'KQ_CD_ZTWC',		'CODE=?CODE',										' ',	'KQ','��;������ɴ����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (311,'KQ_KQLB',			'LBBH=?LBBH',										' ',	'KQ','����������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (312,'KQ_NJ_0',			'ZGBH=?ZGBH AND ND=?ND AND YF=?YF',					' ',	'KQ','��ٹ����0',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (313,'KQ_NJ_2',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'KQ','��ٹ����2',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (314,'KQ_PBB',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'KQ','�Ű�ǼǱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (315,'KQ_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'KQ','����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (316,'KQ_QX_BM',			'BMBH=?BMBH AND NAME=?NAME',						' ',	'KQ','����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (317,'KQ_REPLIST',		'XUHAO=?XUHAO',										' ',	'KQ','�������嵥',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (318,'KQ_TIME',			'BC=?BC',											' ',	'KQ','��ζ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (319,'KQ_XJJL_S',		'1=1',												' ',	'KQ','��׼���ն����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (320,'KQ_XJJL_W',		'ZGBH=?ZGBH',										' ',	'KQ','�������յǼǱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (321,'KQ_XJJL_D1',		' ',												' ',	'KQ','���ڲ��ǼǱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (322,'KQ_YGLB',			'LBBH=?LBBH',										' ',	'KQ','Ա������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (323,'KQ_ZG',			'ZGBH=?ZGBH',										' ',	'KQ','Ա�����ϱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (324,'KQ_NJ_SH',	    	'CLASSID=?CLASSID',									' ',	'KQ','����������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (325,'KQ_NJ_ST',	    	'CLASSID=?CLASSID AND YEARS=?YEARS AND MONTHS=?MONTHS',	' ','KQ','��������ϸ��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (326,'KQ_SHIFTTYPE',    	'CODE=?CODE',										' ',	'KQ','�Ű�ƻ�����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (327,'KQ_SHIFTPLAN',    	'CODE=?CODE AND WEEK=?WEEK',						' ',	'KQ','�Ű�ƻ���ϸ��',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (329,'KQ_DTIME',	   		'SEQ=?SEQ',											' ',	'KQ','�Ͳ���Ϣ�۳���',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (400,'GZ_ZG',			'ZGBH=?ZGBH',										' ',	'GZ','Ա�����ϱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (401,'GZ_SL',			'JS=?JS',											' ',	'GZ','˰�ʶ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (402,'GZ_GZDBF',			'YGLB=?YGLB AND XUHAO=?XUHAO',						' ',	'GZ','н����Ŀ�����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (403,'GZ_REPLIST',		'XUHAO=?XUHAO',										' ',	'GZ','�������嵥',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (404,'GZ_BM',			'BMBH=?BMBH',										' ',	'GZ','���Ŵ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (405,'GZ_YGLB',			'LBBH=?LBBH',										' ',	'GZ','Ա������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (406,'GZ_YH',			'BH=?BH',											' ',	'GZ','���д����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (407,'GZ_JBDEF',			'XUHAO=?XUHAO',										' ',	'GZ','н�ʼ�����Ŀ��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (408,'GZ_GZJB',			'DJ=?DJ',											' ',	'GZ','н�ʼ������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (409,'GZ_GZBASE',		'XUHAO=?XUHAO',										' ',	'GZ','н����Ŀ�ܱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (410,'GZ_GZ',			'ZGBH=?ZGBH AND NY=?NY',							' ',	'GZ','н�ʱ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (411,'GZ_TX',			'ZGBH=?ZGBH AND TXRQ=?TXRQ',						'TXRQ',	'GZ','��н��¼��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (412,'GZ_REPDEF',		'XUHAO=?XUHAO AND SEQ=?SEQ',						' ',	'GZ','������Ŀ�����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (413,'GZ_QX_YGLB',		'LBBH=?LBBH AND NAME=?NAME',						' ',	'GZ','Ա�����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (414,'GZ_QX_XZXM',		'XUHAO=?XUHAO AND NAME=?NAME',						' ',	'GZ','н����ĿȨ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (415,'GZ_QX_BM',			'BMBH=?BMBH AND NAME=?NAME',						' ',	'GZ','����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (416,'GZ_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'GZ','����Ȩ�ޱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (417,'GZ_HL',			'RIQI=?RIQI',										'RIQI',	'GZ','���ʵǼǱ�',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (500,'SYS_CD_CW',		'CODE=?CODE',										' ',	'SYS','��ν�����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (501,'SYS_CD_EXPOTYPE',	'TYP=?TYP',											' ',	'SYS','����ļ����ʹ����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (502,'SYS_CD_GYXZ',		'CODE=?CODE',										' ',	'SYS','��Ӷ���ʴ����',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (503,'SYS_CD_HY',		'CODE=?CODE',										' ',	'SYS','���������',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (504,'SYS_CD_READWRITE',	'QXBH=?QXBH',										' ',	'SYS','��дȨ�޴����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (505,'SYS_CD_SCREEN',	'HMBH=?HMBH',										' ',	'SYS','����Ȩ�޴����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (506,'SYS_CD_XL',		'CODE=?CODE',										' ',	'SYS','ѧ�������',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (507,'SYS_CD_ZZMM',		'CODE=?CODE',										' ',	'SYS','������ò�����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (508,'SYS_CHGMSG',		'ID=?ID',											' ',	'SYS','�����춯��Ϣ��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (509,'SYS_CHGTYPE',		'CODE=?CODE',										' ',	'SYS','�춯���ʹ����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (510,'SYS_CD_XB',		'CODE=?CODE',										' ',	'SYS','�Ա�����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (511,'SYS_CD_YESNO',		'CODE=?CODE',										' ',	'SYS','YES/NO��Ǵ����',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (512,'SYS_USER',			'NAME=?NAME',										' ',	'SYS','�û������',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (513,'SYS_LOG',			'ID=?ID',											' ',	'SYS','������־��',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (514,'SYS_KZGS',			'KZLX=?KZLX',										' ',	'SYS','����������Ϣ��',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (515,'SYS_COUNTER',		' ',												' ',	'SYS','�����������',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (516,'SYS_INI',			'SEC=?SEC AND VAR=?VAR',							' ',	'SYS','ϵͳ�������ñ�',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (517,'SYS_COMPANY',		'CODE=?CODE',										' ',	'SYS','��˾��Ϣ��',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (518,'SYS_CD_ITEM',		'HMBH=?HMBH AND XMID=?XMID AND FLAG=?FLAG',			' ',	'SYS','��Ŀȱʡֵ��Χ�����',0)" ;
       )
ENDPROC
**

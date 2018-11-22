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
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (100,'FT_ARDATA',		'ZGBH=?ZGBH AND RIQI=?RIQI AND SHIJIAN=?SHIJIAN',	'RIQI',	'FT','就餐刷卡纪录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (101,'FT_LSKH',			'LSKH=?LSKH',										' ',	'FT','卡号登记表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (102,'FT_BM',			'BMBH=?BMBH',										' ',	'FT','部门代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (103,'FT_ZG',			'ZGBH=?ZGBH',										' ',	'FT','员工资料表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (104,'FT_JCFX',			' ',												' ',	'FT','就餐分析明细表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (105,'FT_JCJL',			' ',												' ',	'FT','就餐纪录明细表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (106,'FT_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'FT','操作权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (107,'FT_TIME',			'CC=?CC',											' ',	'FT','餐次设定表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (108,'FT_PLACE',			'CODE=?CODE',										' ',	'FT','场地编码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (200,'RS_BM',			'BMBH=?BMBH',										' ',	'RS','部门代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (201,'RS_CD_GW',			'CODE=?CODE',										' ',	'RS','岗位代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (202,'RS_CD_HJ',			'CODE=?CODE',										' ',	'RS','户籍代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (203,'RS_CD_JYXL',		'CODE=?CODE',										' ',	'RS','教育训练代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (204,'RS_CD_RZFS',		'CODE=?CODE',										' ',	'RS','入职方式代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (205,'RS_CD_ZC',			'CODE=?CODE',										' ',	'RS','职称代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (206,'RS_CD_ZW',			'CODE=?CODE',										' ',	'RS','职务代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (207,'RS_FL',			'ZGBH=?ZGBH',										' ',	'RS','福利资料表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (208,'RS_GR',			'ZGBH=?ZGBH',										' ',	'RS','个人资料表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (209,'RS_GZJL',			'ZGBH=?ZGBH AND FWKS=?FWKS',						' ',	'RS','工作履历表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (210,'RS_HYJL',			'ZGBH=?ZGBH AND KSSJ=?KSSJ',						'KSSJ',	'RS','合约纪录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (211,'RS_JCJL',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'RS','奖惩纪录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (212,'RS_JTBJ',			'ZGBH=?ZGBH AND XM=?XM',							' ',	'RS','家庭背景表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (215,'RS_LL',			'ZGBH=?ZGBH',										' ',	'RS','联络资料表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (216,'RS_QX_BM',			'BMBH=?BMBH AND NAME=?NAME',						' ',	'RS','部门权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (217,'RS_QX_GYXZ',		'CODE=?CODE AND NAME=?NAME',						' ',	'RS','雇佣性质权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (218,'RS_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'RS','操作权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (219,'RS_REPLIST',		'XUHAO=?XUHAO',										' ',	'RS','报表定义清单',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (220,'RS_SEARCH_HEAD',	'XUHAO=?XUHAO',										' ',	'RS','综合查询定义主表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (221,'RS_SEARCH_TAIL',	'XUHAO=?XUHAO AND NAME=?NAME AND SDB=?SDB',			' ',	'RS','综合查询定义明细表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (222,'RS_XL',			'ZGBH=?ZGBH AND XW=?XW AND ZY=?ZY',					' ',	'RS','学历数据表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (223,'RS_YD',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'RS','异动情况表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (224,'RS_YLBXJL',		'ZGBH=?ZGBH AND JNRQ=?JNRQ',						'JNRQ',	'RS','养老保险缴纳纪录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (225,'RS_ZG',			'ZGBH=?ZGBH',										' ',	'RS','员工资料表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (226,'RS_NZJ',          	' ',												' ',	'RS','年资奖代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (227,'RS_SCJJ',         	'BMBH=?BMBH AND GW=?GW AND DJ=?DJ',					' ',	'RS','生产奖金代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (228,'RS_ZWJT',			'ZW=?ZW AND DJ=?DJ',								' ',	'RS','职务津贴代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (229,'RS_HJJT',			'BMBH=?BMBH AND GW=?GW',							' ',	'RS','环境津贴代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (230,'RS_GZYJ',			'ZGBH=?ZGBH AND GZKSRQ=?GZKSRQ',					' ',	'RS','工作业绩表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (231,'RS_YLJL',			'ZGBH=?ZGBH AND YLKSRQ=?YLKSRQ',					' ',	'RS','医疗纪录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into table_list (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (232,'RS_JLWP',			'ZGBH=?ZGBH AND WPMC=?WPMC AND XHGG=?XHGG AND LQSJ=?LQSJ','LQSJ','RS','物品借领表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (233,'RS_JYXL_PLAN_H',	'ID=?ID',											' ',	'RS','教育训练计划表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (234,'RS_JYXL_PLAN_D',	'ID=?ID AND ZGBH=?ZGBH',							' ',	'RS','教育训练明细表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (235,'RS_ZF',			'ZGBH=?ZGBH AND RQ=?RQ AND LB=?LB',					'RQ',	'RS','杂费台帐表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (236,'RS_YLBX_1',		'ZGBH=?ZGBH AND BXLB=?BXLB AND JND=?JND AND GYXZ=?GYXZ AND NX=?NX',' ','RS','养老保险缴纳记录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (237,'RS_TZZJ',			'ZGBH=?ZGBH AND XYHAO=?XUHAO',						' ',	'RS','特种证件管理表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (300,'KQ_NJ_1',			'ZGBH=?ZGBH AND ND=?ND AND YF=?YF',					' ',	'KQ','年假管理表1',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (301,'KQ_XJJL_J',		'MM=?MM AND DD=?DD',								' ',	'KQ','节假日定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (302,'KQ_ZTWC',			'ZGBH=?ZGBH AND RIQI=?RIQI AND SK1=?SK1',			'RIQI',	'KQ','中途外出纪录表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (303,'KQ_REPDEF',		'XUHAO=?XUHAO AND SEQ=?SEQ',						' ',	'KQ','报表项目定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (304,'KQ_ARDATA',		'ZGBH=?ZGBH AND RIQI=?RIQI AND SHIJIAN=?SHIJIAN',	'RIQI',	'KQ','考勤刷卡纪录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (305,'KQ_LSKH',			'LSKH=?LSKH',										' ',	'KQ','卡号登记表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (306,'KQ_XJJL_D',		' ',												' ',	'KQ','考勤登记表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (307,'KQ_CLFX',			' ',												' ',	'KQ','考勤处理结果表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (308,'KQ_BCTYPE',		'LB=?LB',											' ',	'KQ','班类定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (309,'KQ_BM',			'BMBH=?BMBH',										' ',	'KQ','部门代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (310,'KQ_CD_ZTWC',		'CODE=?CODE',										' ',	'KQ','中途外出事由代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (311,'KQ_KQLB',			'LBBH=?LBBH',										' ',	'KQ','考勤类别定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (312,'KQ_NJ_0',			'ZGBH=?ZGBH AND ND=?ND AND YF=?YF',					' ',	'KQ','年假管理表0',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (313,'KQ_NJ_2',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'KQ','年假管理表2',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (314,'KQ_PBB',			'ZGBH=?ZGBH AND RIQI=?RIQI',						'RIQI',	'KQ','排班登记表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (315,'KQ_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'KQ','操作权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (316,'KQ_QX_BM',			'BMBH=?BMBH AND NAME=?NAME',						' ',	'KQ','部门权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (317,'KQ_REPLIST',		'XUHAO=?XUHAO',										' ',	'KQ','报表定义清单',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (318,'KQ_TIME',			'BC=?BC',											' ',	'KQ','班次定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (319,'KQ_XJJL_S',		'1=1',												' ',	'KQ','标准休日定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (320,'KQ_XJJL_W',		'ZGBH=?ZGBH',										' ',	'KQ','周期休日登记表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (321,'KQ_XJJL_D1',		' ',												' ',	'KQ','考勤补登记表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (322,'KQ_YGLB',			'LBBH=?LBBH',										' ',	'KQ','员工类别表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (323,'KQ_ZG',			'ZGBH=?ZGBH',										' ',	'KQ','员工资料表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (324,'KQ_NJ_SH',	    	'CLASSID=?CLASSID',									' ',	'KQ','年假类别主表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (325,'KQ_NJ_ST',	    	'CLASSID=?CLASSID AND YEARS=?YEARS AND MONTHS=?MONTHS',	' ','KQ','年假类别明细表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (326,'KQ_SHIFTTYPE',    	'CODE=?CODE',										' ',	'KQ','排班计划类别表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (327,'KQ_SHIFTPLAN',    	'CODE=?CODE AND WEEK=?WEEK',						' ',	'KQ','排班计划明细表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (329,'KQ_DTIME',	   		'SEQ=?SEQ',											' ',	'KQ','就餐休息扣除表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (400,'GZ_ZG',			'ZGBH=?ZGBH',										' ',	'GZ','员工资料表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (401,'GZ_SL',			'JS=?JS',											' ',	'GZ','税率定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (402,'GZ_GZDBF',			'YGLB=?YGLB AND XUHAO=?XUHAO',						' ',	'GZ','薪资项目分类表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (403,'GZ_REPLIST',		'XUHAO=?XUHAO',										' ',	'GZ','报表定义清单',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (404,'GZ_BM',			'BMBH=?BMBH',										' ',	'GZ','部门代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (405,'GZ_YGLB',			'LBBH=?LBBH',										' ',	'GZ','员工类别表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (406,'GZ_YH',			'BH=?BH',											' ',	'GZ','银行代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (407,'GZ_JBDEF',			'XUHAO=?XUHAO',										' ',	'GZ','薪资级别项目表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (408,'GZ_GZJB',			'DJ=?DJ',											' ',	'GZ','薪资级别定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (409,'GZ_GZBASE',		'XUHAO=?XUHAO',										' ',	'GZ','薪资项目总表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (410,'GZ_GZ',			'ZGBH=?ZGBH AND NY=?NY',							' ',	'GZ','薪资表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (411,'GZ_TX',			'ZGBH=?ZGBH AND TXRQ=?TXRQ',						'TXRQ',	'GZ','调薪记录表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (412,'GZ_REPDEF',		'XUHAO=?XUHAO AND SEQ=?SEQ',						' ',	'GZ','报表项目定义表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (413,'GZ_QX_YGLB',		'LBBH=?LBBH AND NAME=?NAME',						' ',	'GZ','员工类别权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (414,'GZ_QX_XZXM',		'XUHAO=?XUHAO AND NAME=?NAME',						' ',	'GZ','薪资项目权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (415,'GZ_QX_BM',			'BMBH=?BMBH AND NAME=?NAME',						' ',	'GZ','部门权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (416,'GZ_QX_HM',			'HMBH=?HMBH AND NAME=?NAME',						' ',	'GZ','操作权限表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (417,'GZ_HL',			'RIQI=?RIQI',										'RIQI',	'GZ','汇率登记表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (500,'SYS_CD_CW',		'CODE=?CODE',										' ',	'SYS','称谓代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (501,'SYS_CD_EXPOTYPE',	'TYP=?TYP',											' ',	'SYS','输出文件类型代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (502,'SYS_CD_GYXZ',		'CODE=?CODE',										' ',	'SYS','雇佣性质代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (503,'SYS_CD_HY',		'CODE=?CODE',										' ',	'SYS','婚姻代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (504,'SYS_CD_READWRITE',	'QXBH=?QXBH',										' ',	'SYS','读写权限代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (505,'SYS_CD_SCREEN',	'HMBH=?HMBH',										' ',	'SYS','操作权限代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (506,'SYS_CD_XL',		'CODE=?CODE',										' ',	'SYS','学历代码表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (507,'SYS_CD_ZZMM',		'CODE=?CODE',										' ',	'SYS','政治面貌代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (508,'SYS_CHGMSG',		'ID=?ID',											' ',	'SYS','人事异动信息表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (509,'SYS_CHGTYPE',		'CODE=?CODE',										' ',	'SYS','异动类型代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (510,'SYS_CD_XB',		'CODE=?CODE',										' ',	'SYS','性别代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (511,'SYS_CD_YESNO',		'CODE=?CODE',										' ',	'SYS','YES/NO标记代码表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (512,'SYS_USER',			'NAME=?NAME',										' ',	'SYS','用户管理表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (513,'SYS_LOG',			'ID=?ID',											' ',	'SYS','操作日志表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (514,'SYS_KZGS',			'KZLX=?KZLX',										' ',	'SYS','卡钟类型信息表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (515,'SYS_COUNTER',		' ',												' ',	'SYS','计数器管理表',0)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (516,'SYS_INI',			'SEC=?SEC AND VAR=?VAR',							' ',	'SYS','系统参数配置表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (517,'SYS_COMPANY',		'CODE=?CODE',										' ',	'SYS','公司信息表',1)" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into TABLE_LIST (XUHAO,TABLE_NAME,COND_KEY,DATE_FIELD,DEP,NOTE,SELECTFLAG) values (518,'SYS_CD_ITEM',		'HMBH=?HMBH AND XMID=?XMID AND FLAG=?FLAG',			' ',	'SYS','项目缺省值或范围定义表',0)" ;
       )
ENDPROC
**

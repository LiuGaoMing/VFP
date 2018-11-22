mfd = "XUHAO INTEGER NOT NULL PRIMARY KEY,"
mfd = mfd +  ;
      "NAME VARCHAR(30)  default '',"
mfd = mfd +  ;
      "FD   VARCHAR(10)  default '',"
mfd = mfd +  ;
      "DB   VARCHAR(15)  default '',"
mfd = mfd +  ;
      "SDB  VARCHAR(15)  default '',"
mfd = mfd +  ;
      "COND VARCHAR(56)  default '',"
mfd = mfd +  ;
      "IDX  INTEGER default 0,"
mfd = mfd +  ;
      "DISP INTEGER default 0,"
mfd = mfd +  ;
      "TYP  VARCHAR(1) default ''"
SQLEXEC(odbc_ant2000,  ;
       "DROP TABLE rs_allfield")
SQLEXEC(odbc_ant2000,  ;
       "CREATE TABLE rs_allfield (" +  ;
       mfd + ")")
cnt = 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《基本资料》',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职工编号',   'ZGBH',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职工姓名',   'ZGXM',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        雇佣性质',   'NAME',       'SYS_CD_GYXZ',  'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        英文姓名',   'NAME',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        性别',       'NAME',       'SYS_CD_XB',    'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        部门编号',   'BMBH',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        部门名称',   'BMMC',       'RS_BM',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        部门简称',   'JC',         'RS_BM',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        岗位编码',   'GW',         'RS_ZG',	    'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        岗位名称',   'NAME',       'RS_CD_GW',     'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职务编码',   'ZW',         'RS_ZG',        'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职务名称',   'NAME',       'RS_CD_ZW',     'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职务等级',   'DJ',         'RS_ZG',        'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        录入日期',   'LRRQ',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        就职时间',   'JZSJ',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        入职方式',   'JZJSR',      'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        离职时间',   'LZSJ',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        年资',       'NZ',         'RS_ZG',        'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        搭伙',       'NAME',       'RS_CD_DH',     'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        直接间接区分', 'NAME',     'SYS_CD_ZJ',    'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《个人资料》',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        出生年月',   'BIRTHDAY',   'RS_GR',        'RS_GR',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        年龄',       'AGE',        'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        婚姻',       'NAME',       'SYS_CD_HY',    'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        身高',       'HEIGHT',     'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        体重',       'WEIGHT',     'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        左眼视力',   'EYELEFT',    'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        右眼视力',   'EYERIGHT',   'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        血型',       'XX',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        政治面貌',   'NAME',       'SYS_CD_ZZMM',  'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        加入时间',   'JRSJ',       'RS_GR',        'RS_GR',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        身份证号码', 'SFZH',       'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        籍贯或出生地','JG',        'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        档案所在地', 'DAD',        'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        是否本地',   'BD',         'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        户籍',       'HJ',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        是否农村',   'HK',         'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        擅长语言',   'YY',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        专长',       'ZC',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职称',       'ZHICHENG',   'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        暂住证编号', 'ZZZBH',      'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        有效期',     'ZZZRQ',      'RS_GR',        'RS_GR',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        有无婚育证明','YWSYZ',     'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        婚育证明编号','SYZBH',     'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《福利资料》',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        合约性质',      'NAME',    'RS_CD_HYXZ',   'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        合约期限开始',  'PYHTKS',  'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        合约期限结束',  'PYHTZZ',  'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        档管费交至年月','GLFNY',   'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        工作居住证',    'GZJZZ',   'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        劳动手册号',    'LDSC',    'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        办理日期_劳',      'BZRQ1',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        养老保险手册号','YLBX',    'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        办理日期_养',  'BZRQ2',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        公积金手册号',  'GJJ',     'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        办理日期_公',  'BZRQ3',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        是否办理就业证','JYZ',     'RS_FL',        'RS_FL',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        就业证手册号',  'JYZH',    'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        办理日期_就',  'BZRQ4',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        医疗保险手册号','YILIAO',  'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        办理日期_医',  'BZRQ5',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        应享受医疗期',  'XSYLQ',   'RS_FL',        'RS_FL',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《合约历史记录》',     '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        合约开始日期',  'KSSJ',    'RS_HYJL',      'RS_HYJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        合约结束日期',  'JSSJ',    'RS_HYJL',      'RS_HYJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        合约性质',      'NAME',    'RS_CD_HYXZ',   'RS_HYJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《联络资料》',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        家庭住址',      'ADDR1',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        邮政编码',      'POST1',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        联络电话',      'TEL1',    'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        手机或传呼',    'BP1',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        现联络地址',    'ADDR2',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        现邮政编码',    'POST2',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        现联络电话',    'TEL2',    'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        现手机或传呼',  'BP2',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        紧急联络人',    'LXR',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        紧急联络地址',  'ADDR3',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        联络邮政编码',  'GX',      'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        紧急联络电话',  'TEL',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        居住状态',      'NAME',    'RS_CD_ZS',     'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《工作经历》',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        机构名称',      'MC',      'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        地址',          'DZ',      'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职务或岗位',    'ZW',      'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        工作开始日期',  'FWKS',    'RS_GZJL',      'RS_GZJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        工作结束日期',  'FWJS',    'RS_GZJL',      'RS_GZJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        年薪',          'NX',      'RS_GZJL',      'RS_GZJL','',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        离职原因',      'LZYY',    'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《家庭背景》',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        称谓',          'NAME',    'SYS_CD_CW',    'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        姓名',          'XM',      'RS_JTBJ',      'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        出生年月',      'BIRTHDAY','RS_JTBJ',      'RS_JTBJ',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        年龄',          'AGE',     'RS_JTBJ',      'RS_JTBJ',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        是否亡殪',      'CY',      'RS_JTBJ',      'RS_JTBJ',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        学历或学位',    'NAME',    'SYS_CD_XL',    'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        职业',          'ZY',      'RS_JTBJ',      'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        就职机构或就读学校','DW',  'RS_JTBJ',      'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《教育训练》',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        培训单位',	  'DW',      'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        讲师',          'JS',      'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        训练内容',      'XLLB',    'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        开始日期',      'KSRQ',    'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        结束日期',	  'ZZRQ',    'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        每天培训时间段','SJD',     'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        培训总时数',    'SS',      'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        考试成绩',      'CJ',      'RS_JYXL_PLAN_D','RS_JYXL_PLAN_D',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        评核成绩',      'PHCJ',    'RS_JYXL_PLAN_D','RS_JYXL_PLAN_D',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        备注',          'BZ',      'RS_JYXL_PLAN_D','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《学历背景》',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        学历或学位',    'NAME',    'SYS_CD_XL',  'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        学校名称',      'MC',      'RS_XL',      'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        是否全日制',    'XZ',      'RS_XL',      'RS_XL',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        系科别',        'XKB',     'RS_XL',      'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        专业',          'ZY',      'RS_XL',      'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        是否毕业',      'BIYIE',   'RS_XL',      'RS_XL',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        开始日期',      'KSRQ',    'RS_XL',      'RS_XL',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        结束日期',      'ZZRQ',    'RS_XL',      'RS_XL',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        是否有效学历',  'YX',      'RS_XL',      'RS_XL',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《奖惩记录》',         '',        '',           '',          '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        发布日期',      'RIQI',    'RS_JCJL',    'RS_JCJL',   '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        奖惩原因',      'YY',      'RS_JCJL',    'RS_JCJL',   '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        奖惩状态',      'STS',     'RS_JCJL',    'RS_JCJL',   '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        索引',          'IDX',     'RS_JCJL',    'RS_JCJL',   '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《异动历史》',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        异动日期',      'RIQI',    'RS_YD',      'RS_YD',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        异动前状态',    'YZT',     'RS_YD',      'RS_YD',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        异动原因',      'YY',      'RS_YD',      'RS_YD',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《工作业绩》',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        开始日期',      'GZKSRQ',  'RS_GZYJ',    'RS_GZYJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        终止日期',      'GZJSRQ',  'RS_GZYJ',    'RS_GZYJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        主要业绩',      'ZYYJ',    'RS_GZYJ',    'RS_GZYJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《特种证件》',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        证件名称',      'MC',      'RS_TZZJ',    'RS_TZZJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        证件编号',      'ZJH',     'RS_TZZJ',    'RS_TZZJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        发证单位',      'FZDW',    'RS_TZZJ',    'RS_TZZJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        发证日期',      'FZRQ',    'RS_TZZJ',    'RS_TZZJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        有效期限',      'YXRQ',    'RS_TZZJ',    'RS_TZZJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《医疗记录》',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        开始日期',      'YLKSRQ',  'RS_YLJL',    'RS_YLJL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        结束日期',      'YLJSRQ',  'RS_YLJL',    'RS_YLJL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        医疗补助费',    'YLBZF',   'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        病情摘要',      'BQZY',    'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        医疗期满后趋向','YLHQX',   'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        记录人',        'JLR',     'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《兵役情况》',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        役别',       'BYJB',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        军种',       'BYJZ',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        阶级',       'BYJJ',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        专长',       'BYZC',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        入伍时间',   'BYRW',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        退伍时间',   'BYTW',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        备注',       'BYBZ',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' 《物品借领》',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        借领日期',   'LQSJ',      'RS_JLWP',       'RS_JLWP', '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        物品名称',   'WPMC',      'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        型号规格',   'XHGG',      'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        数量',       'SL',        'RS_JLWP',       'RS_JLWP', '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        借领性质',   'LYXZ',      'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        归还日期',   'GHRQ',      'RS_JLWP',       'RS_JLWP', '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        备注',       'BZ',        'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
ENDPROC
**

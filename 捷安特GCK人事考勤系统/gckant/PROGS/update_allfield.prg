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
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ���������ϡ�',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְ�����',   'ZGBH',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְ������',   'ZGXM',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Ӷ����',   'NAME',       'SYS_CD_GYXZ',  'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        Ӣ������',   'NAME',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ա�',       'NAME',       'SYS_CD_XB',    'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���ű��',   'BMBH',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',   'BMMC',       'RS_BM',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���ż��',   'JC',         'RS_BM',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��λ����',   'GW',         'RS_ZG',	    'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��λ����',   'NAME',       'RS_CD_GW',     'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְ�����',   'ZW',         'RS_ZG',        'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְ������',   'NAME',       'RS_CD_ZW',     'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְ��ȼ�',   'DJ',         'RS_ZG',        'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ¼������',   'LRRQ',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ְʱ��',   'JZSJ',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ְ��ʽ',   'JZJSR',      'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ְʱ��',   'LZSJ',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',       'NZ',         'RS_ZG',        'RS_ZG',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���',       'NAME',       'RS_CD_DH',     'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ֱ�Ӽ������', 'NAME',     'SYS_CD_ZJ',    'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ���������ϡ�',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',   'BIRTHDAY',   'RS_GR',        'RS_GR',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',       'AGE',        'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',       'NAME',       'SYS_CD_HY',    'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���',       'HEIGHT',     'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',       'WEIGHT',     'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',   'EYELEFT',    'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',   'EYERIGHT',   'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        Ѫ��',       'XX',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ������ò',   'NAME',       'SYS_CD_ZZMM',  'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����ʱ��',   'JRSJ',       'RS_GR',        'RS_GR',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���֤����', 'SFZH',       'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����������','JG',        'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �������ڵ�', 'DAD',        'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ƿ񱾵�',   'BD',         'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',       'HJ',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ƿ�ũ��',   'HK',         'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �ó�����',   'YY',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ר��',       'ZC',         'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְ��',       'ZHICHENG',   'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ס֤���', 'ZZZBH',      'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Ч��',     'ZZZRQ',      'RS_GR',        'RS_GR',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���޻���֤��','YWSYZ',     'RS_GR',        'RS_GR',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����֤�����','SYZBH',     'RS_GR',        'RS_GR',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ���������ϡ�',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Լ����',      'NAME',    'RS_CD_HYXZ',   'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Լ���޿�ʼ',  'PYHTKS',  'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Լ���޽���',  'PYHTZZ',  'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���ܷѽ�������','GLFNY',   'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ������ס֤',    'GZJZZ',   'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ͷ��ֲ��',    'LDSC',    'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������_��',      'BZRQ1',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���ϱ����ֲ��','YLBX',    'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������_��',  'BZRQ2',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �������ֲ��',  'GJJ',     'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������_��',  'BZRQ3',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ƿ�����ҵ֤','JYZ',     'RS_FL',        'RS_FL',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ҵ֤�ֲ��',  'JYZH',    'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������_��',  'BZRQ4',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ҽ�Ʊ����ֲ��','YILIAO',  'RS_FL',        'RS_FL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������_ҽ',  'BZRQ5',   'RS_FL',        'RS_FL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        Ӧ����ҽ����',  'XSYLQ',   'RS_FL',        'RS_FL',  '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ����Լ��ʷ��¼��',     '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Լ��ʼ����',  'KSSJ',    'RS_HYJL',      'RS_HYJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Լ��������',  'JSSJ',    'RS_HYJL',      'RS_HYJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Լ����',      'NAME',    'RS_CD_HYXZ',   'RS_HYJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ���������ϡ�',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ͥסַ',      'ADDR1',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',      'POST1',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����绰',      'TEL1',    'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �ֻ��򴫺�',    'BP1',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �������ַ',    'ADDR2',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����������',    'POST2',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ������绰',    'TEL2',    'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���ֻ��򴫺�',  'BP2',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����������',    'LXR',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���������ַ',  'ADDR3',   'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ������������',  'GX',      'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������绰',  'TEL',     'RS_LL',        'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ס״̬',      'NAME',    'RS_CD_ZS',     'RS_LL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ������������',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',      'MC',      'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ַ',          'DZ',      'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְ����λ',    'ZW',      'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ������ʼ����',  'FWKS',    'RS_GZJL',      'RS_GZJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ������������',  'FWJS',    'RS_GZJL',      'RS_GZJL','',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��н',          'NX',      'RS_GZJL',      'RS_GZJL','',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ְԭ��',      'LZYY',    'RS_GZJL',      'RS_GZJL','',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ����ͥ������',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ν',          'NAME',    'SYS_CD_CW',    'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',          'XM',      'RS_JTBJ',      'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',      'BIRTHDAY','RS_JTBJ',      'RS_JTBJ',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',          'AGE',     'RS_JTBJ',      'RS_JTBJ',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ƿ�����',      'CY',      'RS_JTBJ',      'RS_JTBJ',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ѧ����ѧλ',    'NAME',    'SYS_CD_XL',    'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ְҵ',          'ZY',      'RS_JTBJ',      'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ְ������Ͷ�ѧУ','DW',  'RS_JTBJ',      'RS_JTBJ',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ������ѵ����',         '',        '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ѵ��λ',	  'DW',      'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ʦ',          'JS',      'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ѵ������',      'XLLB',    'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ʼ����',      'KSRQ',    'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',	  'ZZRQ',    'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ÿ����ѵʱ���','SJD',     'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ѵ��ʱ��',    'SS',      'RS_JYXL_PLAN_H','RS_JYXL_PLAN_D',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���Գɼ�',      'CJ',      'RS_JYXL_PLAN_D','RS_JYXL_PLAN_D',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ���˳ɼ�',      'PHCJ',    'RS_JYXL_PLAN_D','RS_JYXL_PLAN_D',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ע',          'BZ',      'RS_JYXL_PLAN_D','RS_JYXL_PLAN_D',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ��ѧ��������',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ѧ����ѧλ',    'NAME',    'SYS_CD_XL',  'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ѧУ����',      'MC',      'RS_XL',      'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ƿ�ȫ����',    'XZ',      'RS_XL',      'RS_XL',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ϵ�Ʊ�',        'XKB',     'RS_XL',      'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        רҵ',          'ZY',      'RS_XL',      'RS_XL',     '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ƿ��ҵ',      'BIYIE',   'RS_XL',      'RS_XL',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ʼ����',      'KSRQ',    'RS_XL',      'RS_XL',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',      'ZZRQ',    'RS_XL',      'RS_XL',     '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �Ƿ���Чѧ��',  'YX',      'RS_XL',      'RS_XL',     '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' �����ͼ�¼��',         '',        '',           '',          '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',      'RIQI',    'RS_JCJL',    'RS_JCJL',   '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����ԭ��',      'YY',      'RS_JCJL',    'RS_JCJL',   '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����״̬',      'STS',     'RS_JCJL',    'RS_JCJL',   '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',          'IDX',     'RS_JCJL',    'RS_JCJL',   '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ���춯��ʷ��',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �춯����',      'RIQI',    'RS_YD',      'RS_YD',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �춯ǰ״̬',    'YZT',     'RS_YD',      'RS_YD',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �춯ԭ��',      'YY',      'RS_YD',      'RS_YD',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ������ҵ����',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ʼ����',      'GZKSRQ',  'RS_GZYJ',    'RS_GZYJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ֹ����',      'GZJSRQ',  'RS_GZYJ',    'RS_GZYJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Ҫҵ��',      'ZYYJ',    'RS_GZYJ',    'RS_GZYJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ������֤����',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ֤������',      'MC',      'RS_TZZJ',    'RS_TZZJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ֤�����',      'ZJH',     'RS_TZZJ',    'RS_TZZJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��֤��λ',      'FZDW',    'RS_TZZJ',    'RS_TZZJ',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��֤����',      'FZRQ',    'RS_TZZJ',    'RS_TZZJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Ч����',      'YXRQ',    'RS_TZZJ',    'RS_TZZJ',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ��ҽ�Ƽ�¼��',         '',        '',           '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ʼ����',      'YLKSRQ',  'RS_YLJL',    'RS_YLJL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',      'YLJSRQ',  'RS_YLJL',    'RS_YLJL',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ҽ�Ʋ�����',    'YLBZF',   'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����ժҪ',      'BQZY',    'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ҽ������������','YLHQX',   'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��¼��',        'JLR',     'RS_YLJL',    'RS_YLJL',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' �����������',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �۱�',       'BYJB',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',       'BYJZ',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �׼�',       'BYJJ',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ר��',       'BYZC',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����ʱ��',   'BYRW',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����ʱ��',   'BYTW',       'RS_ZG',        'RS_ZG',  '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ע',       'BYBZ',       'RS_ZG',        'RS_ZG',  '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,' ����Ʒ���졷',      '',           '',             '',       '',0,0,'')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',   'LQSJ',      'RS_JLWP',       'RS_JLWP', '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��Ʒ����',   'WPMC',      'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �ͺŹ��',   'XHGG',      'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ����',       'SL',        'RS_JLWP',       'RS_JLWP', '',0,0,'N')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��������',   'LYXZ',      'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        �黹����',   'GHRQ',      'RS_JLWP',       'RS_JLWP', '',0,0,'R')" ;
       )
cnt = cnt + 1
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO RS_ALLFIELD (XUHAO,NAME,FD,DB,SDB,COND,IDX,DISP,TYP) VALUES (?cnt,'        ��ע',       'BZ',        'RS_JLWP',       'RS_JLWP', '',0,0,'C')" ;
       )
ENDPROC
**

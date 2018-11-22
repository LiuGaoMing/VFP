mfd = "HMBH   VARCHAR(20) NOT NULL PRIMARY KEY,"
mfd = mfd + "HMMC   VARCHAR(20)"
SQLEXEC(odbc_ant2000,  ;
       "drop TABLE sys_cd_screen " ;
       )
sqlexec(ODBC_ANT2000,"CREATE TABLE  sys_cd_screen (&mfd)")
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ11',  '部门设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ12',  '薪资项目设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ121',  '考勤/就餐关联设定')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ13',  '员工基本资料')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ132', '调薪处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ135', '员工资料刷新')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ14',  '员工类别')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ15',  '薪资等级设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ151', '等级项目定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ16',  '所得税税率')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ17',  '转帐银行定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ171',  '格式定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ18',  '汇率录入')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ2',   '薪资处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ22',  '月薪资锁定处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ31',  '数据汇总')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ32',  '报表印刷')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ33',  '报表格式定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ34',  'EXCEL输出')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "insert into sys_cd_Screen (HMBH,HMMC) values ('3AGZ41',  '操作权限管理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AGZ_YD','资料异动处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT11','部门设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT12','员工资料')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT13','餐次价格')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT14','临时卡登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT142','一致性处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT15','场地登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT21','读刷卡钟数据')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT22','数据处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT23','刷卡记录查询')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT24','未刷卡人名单')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT25','就餐综合查询')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT26','签到就餐登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT31','月统计报表')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT32','日统计报表')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT33','个人明细表')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT34','异常就餐汇总')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT41','删除重复刷卡')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT42','刷卡记录格式')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT43','操作权限管理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AFT71','就餐人数预报')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ11','部门设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ12','班次设定')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ121','班类定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ13','员工录入')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ135','员工资料刷新')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ14','员工类别')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ15','考勤规定设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ16','考勤类别定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ17','标准休日定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ18','节假日定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ19','员工临时卡登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ192','临时卡一致性处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ21','读刷卡钟数据')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ22','刷卡记录查询')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ222','文本导出')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ31','考勤情况登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ311','删除全部考勤纪录')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ32','周期休日登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ33','排班表登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ34','年假管理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ341','期初值录入')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ343','年假计算')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ35','考勤补登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ36','年假规定')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ361','年假类别定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ41','考勤数据自动处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ42','考勤补充处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ43','分析结果浏览修改')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ44','中途外出浏览查询')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ45','缺刷卡一览表')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ51','数据汇总')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ52','报表印刷')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ53','定义报表格式')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ54','EXCEL输出')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ61','操作权限管理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ63','删除重复刷卡记录')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ64','刷卡钟数据格式定义')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ_YD','资料异动处理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS11','基本资料')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS12','集体登记')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS13','物品借领')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS14','保险缴纳')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS17','保险比例')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS16','杂费台帐')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS21','教育训练管理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS22','绩效评核')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS31','组合查询')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS41','报表管理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS51','部门设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS52','岗位设置')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS53','职务编码')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS54','技术职称编码')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS55','资料类别')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS61','操作权限管理')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS63','资料刷新')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS71','底薪设定')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS72','环境津贴')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS73','职务津贴')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS74','年资奖')" ;
       )
SQLEXEC(odbc_ant2000,  ;
       "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3ARS75','生产奖金')" ;
       )
ENDPROC
**

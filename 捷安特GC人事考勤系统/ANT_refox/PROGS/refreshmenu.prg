**
PROCEDURE RefreshMenu
LPARAMETERS smodule
noldlevel = pub_level
DO CASE
     CASE smodule == "rs"
          pub_level = 1
          IF noldlevel =  ;
             pub_level
               RETURN
          ENDIF
     CASE smodule == "kq"
          pub_level = 2
          IF noldlevel =  ;
             pub_level
               RETURN
          ENDIF
     CASE smodule == "gz"
          pub_level = 3
          IF noldlevel =  ;
             pub_level
               RETURN
          ENDIF
     CASE smodule == "ft"
          pub_level = 4
          IF noldlevel =  ;
             pub_level
               RETURN
          ENDIF
     CASE smodule == "tl"
          pub_level = 5
          IF noldlevel =  ;
             pub_level
               RETURN
          ENDIF
     CASE smodule == ""
          pub_level = 0
          pub_object(1) = ""
ENDCASE
IF CNTPAD("_MSYSMENU") = 1
     DEFINE PAD cmsystem OF  ;
            _MSYSMENU PROMPT  ;
            "系统功能(\<F)" KEY  ;
            ALT+F, ""
     ON PAD cmsystem OF _MSYSMENU ACTIVATE;
POPUP pmmodule
     DEFINE POPUP pmmodule MARGIN  ;
            RELATIVE
     DEFINE BAR 1 OF pmmodule  ;
            PROMPT  ;
            "人力资源(\<M)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("rs")
     DEFINE BAR 2 OF pmmodule  ;
            PROMPT  ;
            "考勤分析(\<A)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("kq")
     DEFINE BAR 3 OF pmmodule  ;
            PROMPT  ;
            "薪资管理(\<S)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("gz")
     DEFINE BAR 4 OF pmmodule  ;
            PROMPT  ;
            "就餐管理(\<D)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("ft")
     DEFINE BAR 5 OF pmmodule  ;
            PROMPT  ;
            "系统工具(\<T)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1
     DEFINE BAR 6 OF pmmodule  ;
            PROMPT "\-"
     DEFINE BAR 7 OF pmmodule  ;
            PROMPT  ;
            "退出系统(\<E)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1
     ON SELECTION POPUP pmmodule DO MODULECHANGE;
WITH BAR()
ENDIF
FOR i = 1 TO 5
     IF pub_level = i
          SET MARK OF BAR i OF pmmodule;
TO;
.T.
     ELSE
          SET MARK OF BAR i OF pmmodule;
TO;
.F.
     ENDIF
ENDFOR
DO WHILE CNTPAD("_MSYSMENU")>2
     spadname = GETPAD("_MSYSMENU",  ;
                3)
     Release Pad &sPadName of _MSYSMENU
ENDDO
DO CASE
     CASE smodule == "rs"
          DEFINE PAD rsinput OF  ;
                 _MSYSMENU PROMPT  ;
                 "资料录入(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD rseducation  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "教育训练(\<T)"  ;
                 KEY ALT+T, ""
          DEFINE PAD rsquery OF  ;
                 _MSYSMENU PROMPT  ;
                 "组合查询(\<Q)"  ;
                 KEY ALT+Q, ""
          DEFINE PAD rsreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "报表打印(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD rscode OF  ;
                 _MSYSMENU PROMPT  ;
                 "编码设置(\<C)"  ;
                 KEY ALT+C, ""
          DEFINE PAD  ;
                 rscompensation  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "薪资资料(\<B)"  ;
                 KEY ALT+B, ""
          DEFINE PAD rssystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "系统维护(\<S)"  ;
                 KEY ALT+S, ""
          ON PAD rsinput OF _MSYSMENU;
ACTIVATE POPUP pminput
          ON PAD rseducation OF _MSYSMENU;
ACTIVATE POPUP pmeducation
          ON PAD rsquery OF _MSYSMENU;
ACTIVATE POPUP pmquery
          ON PAD rsreport OF _MSYSMENU;
ACTIVATE POPUP pmreport
          ON PAD rscode OF _MSYSMENU ACTIVATE;
POPUP pmcode
          ON PAD rscompensation OF _MSYSMENU;
ACTIVATE POPUP pmcompensation
          ON PAD rssystem OF _MSYSMENU;
ACTIVATE POPUP pmsystem
          DEFINE POPUP pminput  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pminput  ;
                 PROMPT  ;
                 "基本资料" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "集体登记" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "物品借领管理"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "保险缴纳" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "保险比例" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS17")
          DEFINE BAR 6 OF pminput  ;
                 PROMPT  ;
                 "杂费台帐" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS16")
          ON SELECTION POPUP pminput DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP  ;
                 pmeducation  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmeducation  ;
                 PROMPT  ;
                 "计划与实施"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS21")
          DEFINE BAR 2 OF  ;
                 pmeducation  ;
                 PROMPT  ;
                 "绩效评核" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS22")
          ON SELECTION POPUP pmeducation;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmquery  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pmquery  ;
                 PROMPT  ;
                 "组合查询" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS31")
          ON SELECTION POPUP pmquery DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmreport  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmreport PROMPT  ;
                 "报表打印" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS41")
          ON SELECTION POPUP pmreport;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmcode  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pmcode  ;
                 PROMPT  ;
                 "部门设置" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS52")
          DEFINE BAR 2 OF pmcode  ;
                 PROMPT  ;
                 "岗位设置" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS52")
          DEFINE BAR 3 OF pmcode  ;
                 PROMPT  ;
                 "职务设置" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS53")
          DEFINE BAR 4 OF pmcode  ;
                 PROMPT  ;
                 "技术职称设置"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS54")
          DEFINE BAR 5 OF pmcode  ;
                 PROMPT  ;
                 "资料类别设置"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS55")
          ON SELECTION POPUP pmcode DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP  ;
                 pmcompensation  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmcompensation  ;
                 PROMPT  ;
                 "底薪设定" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS71")
          DEFINE BAR 2 OF  ;
                 pmcompensation  ;
                 PROMPT  ;
                 "环境津贴" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS72")
          DEFINE BAR 3 OF  ;
                 pmcompensation  ;
                 PROMPT  ;
                 "职务津贴" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS73")
          DEFINE BAR 4 OF  ;
                 pmcompensation  ;
                 PROMPT "年资奖"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS74")
          DEFINE BAR 5 OF  ;
                 pmcompensation  ;
                 PROMPT  ;
                 "生产奖金" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS75")
          ON SELECTION POPUP pmcompensation;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmsystem  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmsystem PROMPT  ;
                 "操作权限" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. ( .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS61") .AND.  ;
                 pub_role > 0  ;
                 .AND.  .NOT.  ;
                 issubadmin("rs"))
          DEFINE BAR 2 OF  ;
                 pmsystem PROMPT  ;
                 "资料刷新" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS63")
          ON SELECTION POPUP pmsystem;
DO SHOWFORM WITH PAD(), BAR()
     CASE smodule == "kq"
          DEFINE PAD kqinput OF  ;
                 _MSYSMENU PROMPT  ;
                 "资料录入(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD kqdata OF  ;
                 _MSYSMENU PROMPT  ;
                 "刷卡数据(\<D)"  ;
                 KEY ALT+D, ""
          DEFINE PAD kqregister  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "考勤登记(\<K)"  ;
                 KEY ALT+K, ""
          DEFINE PAD kqanalyze OF  ;
                 _MSYSMENU PROMPT  ;
                 "考勤分析(\<A)"  ;
                 KEY ALT+A, ""
          DEFINE PAD kqreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "报表管理(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD kqsystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "系统维护(\<S)"  ;
                 KEY ALT+S, ""
          ON PAD kqinput OF _MSYSMENU;
ACTIVATE POPUP pminput
          ON PAD kqdata OF _MSYSMENU ACTIVATE;
POPUP pmdata
          ON PAD kqregister OF _MSYSMENU;
ACTIVATE POPUP pmregister
          ON PAD kqanalyze OF _MSYSMENU;
ACTIVATE POPUP pmanalyze
          ON PAD kqreport OF _MSYSMENU;
ACTIVATE POPUP pmreport
          ON PAD kqsystem OF _MSYSMENU;
ACTIVATE POPUP pmsystem
          DEFINE POPUP pminput  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pminput  ;
                 PROMPT  ;
                 "部门设置" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "班次设定" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "员工资料" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "员工类别" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "考勤规定" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ15")
          DEFINE BAR 6 OF pminput  ;
                 PROMPT  ;
                 "考勤类别定义"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ16")
          DEFINE BAR 7 OF pminput  ;
                 PROMPT  ;
                 "排班计划分类"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ17")
          DEFINE BAR 8 OF pminput  ;
                 PROMPT  ;
                 "节假日/星期日定义"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ18")
          DEFINE BAR 9 OF pminput  ;
                 PROMPT  ;
                 "员工卡登记"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ19")
          ON SELECTION POPUP pminput DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmdata  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pmdata  ;
                 PROMPT  ;
                 "读刷卡钟数据"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ21")
          DEFINE BAR 2 OF pmdata  ;
                 PROMPT  ;
                 "刷卡记录查询"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ22")
          ON SELECTION POPUP pmdata DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmregister  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "考勤情况登记"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ31")
          DEFINE BAR 2 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "周期休日" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ32")
          DEFINE BAR 3 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "出勤单登记"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ33")
          DEFINE BAR 4 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "年假管理" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ34")
          DEFINE BAR 5 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "考勤补登记"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ35")
          DEFINE BAR 6 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "年假规定" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ36")
          ON SELECTION POPUP pmregister;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmanalyze  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmanalyze PROMPT  ;
                 "考勤自动处理"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ41")
          DEFINE BAR 2 OF  ;
                 pmanalyze PROMPT  ;
                 "考勤附加处理"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ42")
          DEFINE BAR 3 OF  ;
                 pmanalyze PROMPT  ;
                 "分析结果浏览"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ43")
          DEFINE BAR 4 OF  ;
                 pmanalyze PROMPT  ;
                 "中途外出处理"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ44")
          DEFINE BAR 5 OF  ;
                 pmanalyze PROMPT  ;
                 "缺刷卡一览表"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ45")
          ON SELECTION POPUP pmanalyze;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmreport  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmreport PROMPT  ;
                 "数据汇总" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ51")
          DEFINE BAR 2 OF  ;
                 pmreport PROMPT  ;
                 "报表印刷" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ52")
          DEFINE BAR 3 OF  ;
                 pmreport PROMPT  ;
                 "报表定义" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ53")
          DEFINE BAR 4 OF  ;
                 pmreport PROMPT  ;
                 "Excel输出" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ54")
          ON SELECTION POPUP pmreport;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmsystem  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmsystem PROMPT  ;
                 "操作权限" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. ( .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ61") .AND.  ;
                 pub_role > 0  ;
                 .AND.  .NOT.  ;
                 issubadmin("kq"))
          DEFINE BAR 2 OF  ;
                 pmsystem PROMPT  ;
                 "删除重复刷卡"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ63")
          DEFINE BAR 3 OF  ;
                 pmsystem PROMPT  ;
                 "卡钟数据格式"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ64")
          ON SELECTION POPUP pmsystem;
DO SHOWFORM WITH PAD(), BAR()
     CASE smodule == "gz"
          DEFINE PAD gzinput OF  ;
                 _MSYSMENU PROMPT  ;
                 "资料录入(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD gzprocess OF  ;
                 _MSYSMENU PROMPT  ;
                 "薪资处理(\<P)"  ;
                 KEY ALT+P, ""
          DEFINE PAD gzreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "报表管理(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD gzsystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "系统维护(\<S)"  ;
                 KEY ALT+S, ""
          ON PAD gzinput OF _MSYSMENU;
ACTIVATE POPUP pminput
          ON PAD gzprocess OF _MSYSMENU;
ACTIVATE POPUP pmprocess
          ON PAD gzreport OF _MSYSMENU;
ACTIVATE POPUP pmreport
          ON PAD gzsystem OF _MSYSMENU;
ACTIVATE POPUP pmsystem
          DEFINE POPUP pminput  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pminput  ;
                 PROMPT  ;
                 "部门设置" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "员工类别" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "薪资等级" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "转帐银行" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "所得税表" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ15")
          DEFINE BAR 6 OF pminput  ;
                 PROMPT  ;
                 "员工资料" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ16")
          DEFINE BAR 7 OF pminput  ;
                 PROMPT  ;
                 "薪资项目" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ17")
          DEFINE BAR 8 OF pminput  ;
                 PROMPT  ;
                 "汇率录入" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ18")
          ON SELECTION POPUP pminput DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmprocess  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmprocess PROMPT  ;
                 "薪资处理" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ2")
          ON SELECTION POPUP pmprocess;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmreport  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmreport PROMPT  ;
                 "数据汇总" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ31")
          DEFINE BAR 2 OF  ;
                 pmreport PROMPT  ;
                 "报表印刷" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ32")
          DEFINE BAR 3 OF  ;
                 pmreport PROMPT  ;
                 "报表定义" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ33")
          DEFINE BAR 4 OF  ;
                 pmreport PROMPT  ;
                 "Excel输出" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ34")
          ON SELECTION POPUP pmreport;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmsystem  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmsystem PROMPT  ;
                 "操作权限" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. ( .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ41") .AND.  ;
                 pub_role > 0  ;
                 .AND.  .NOT.  ;
                 issubadmin("gz"))
          ON SELECTION POPUP pmsystem;
DO SHOWFORM WITH PAD(), BAR()
     CASE smodule == "ft"
          DEFINE PAD ftinput OF  ;
                 _MSYSMENU PROMPT  ;
                 "资料录入(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD ftprediction  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "就餐预报(\<V)"  ;
                 KEY ALT+V, ""
          DEFINE PAD ftmanager OF  ;
                 _MSYSMENU PROMPT  ;
                 "就餐管理(\<P)"  ;
                 KEY ALT+P, ""
          DEFINE PAD ftreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "报表管理(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD ftsystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "系统维护(\<S)"  ;
                 KEY ALT+S, ""
          ON PAD ftinput OF _MSYSMENU;
ACTIVATE POPUP pminput
          ON PAD ftprediction OF _MSYSMENU;
ACTIVATE POPUP pmprediction
          ON PAD ftmanager OF _MSYSMENU;
ACTIVATE POPUP pmmanager
          ON PAD ftreport OF _MSYSMENU;
ACTIVATE POPUP pmreport
          ON PAD ftsystem OF _MSYSMENU;
ACTIVATE POPUP pmsystem
          DEFINE POPUP pminput  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pminput  ;
                 PROMPT  ;
                 "部门设置" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "员工资料" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "餐次价格" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "员工卡登记"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "场地登记" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT15")
          ON SELECTION POPUP pminput DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP  ;
                 pmprediction  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmprediction  ;
                 PROMPT  ;
                 "就餐预报" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT71")
          ON SELECTION POPUP pmprediction;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmmanager  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmmanager PROMPT  ;
                 "读刷卡钟数据"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT21")
          DEFINE BAR 2 OF  ;
                 pmmanager PROMPT  ;
                 "数据处理" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT22")
          DEFINE BAR 3 OF  ;
                 pmmanager PROMPT  ;
                 "刷卡记录查询"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT23")
          DEFINE BAR 4 OF  ;
                 pmmanager PROMPT  ;
                 "未刷卡人员名单"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT24")
          DEFINE BAR 5 OF  ;
                 pmmanager PROMPT  ;
                 "就餐综合查询"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT25")
          DEFINE BAR 6 OF  ;
                 pmmanager PROMPT  ;
                 "就餐情况登记"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT26")
          ON SELECTION POPUP pmmanager;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmreport  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmreport PROMPT  ;
                 "月统计报表"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT31")
          DEFINE BAR 2 OF  ;
                 pmreport PROMPT  ;
                 "日统计报表"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT32")
          DEFINE BAR 3 OF  ;
                 pmreport PROMPT  ;
                 "个人明细表"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT33")
          DEFINE BAR 4 OF  ;
                 pmreport PROMPT  ;
                 "异常就餐汇总"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT34")
          ON SELECTION POPUP pmreport;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmsystem  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmsystem PROMPT  ;
                 "操作权限" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. ( .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT43") .AND.  ;
                 pub_role > 0  ;
                 .AND.  .NOT.  ;
                 issubadmin("ft"))
          DEFINE BAR 2 OF  ;
                 pmsystem PROMPT  ;
                 "删除重复刷卡"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT41")
          DEFINE BAR 3 OF  ;
                 pmsystem PROMPT  ;
                 "卡钟数据格式"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT42")
          ON SELECTION POPUP pmsystem;
DO SHOWFORM WITH PAD(), BAR()
     CASE smodule == "tl"
          DEFINE PAD tlorganize  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "组织结构(\<D)"  ;
                 KEY ALT+D, ""
          DEFINE PAD tluser OF  ;
                 _MSYSMENU PROMPT  ;
                 "用户管理(\<U)"  ;
                 KEY ALT+U, ""
          DEFINE PAD tllogin OF  ;
                 _MSYSMENU PROMPT  ;
                 "系统登录(\<P)"  ;
                 KEY ALT+P, ""
          DEFINE PAD tlrelation  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "系统关联(\<S)"  ;
                 KEY ALT+S, ""
          DEFINE PAD tlcompress  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "数据压缩(\<C)"  ;
                 KEY ALT+C, ""
          DEFINE PAD tlsyslog OF  ;
                 _MSYSMENU PROMPT  ;
                 "系统日志(\<L)"  ;
                 KEY ALT+L, ""
          ON PAD tlorganize OF _MSYSMENU;
ACTIVATE POPUP pmorganize
          ON PAD tluser OF _MSYSMENU ACTIVATE;
POPUP pmuser
          ON PAD tllogin OF _MSYSMENU;
ACTIVATE POPUP pmlogin
          ON PAD tlrelation OF _MSYSMENU;
ACTIVATE POPUP pmrelation
          ON PAD tlcompress OF _MSYSMENU;
ACTIVATE POPUP pmcompress
          ON PAD tlsyslog OF _MSYSMENU;
ACTIVATE POPUP pmsyslog
          DEFINE POPUP pmorganize  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmorganize  ;
                 PROMPT  ;
                 "组织结构" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1
          ON SELECTION POPUP pmorganize;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmuser  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pmuser  ;
                 PROMPT  ;
                 "用户管理" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 0
          DEFINE BAR 2 OF pmuser  ;
                 PROMPT  ;
                 "口令更改" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 0
          ON SELECTION POPUP pmuser DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmlogin  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pmlogin  ;
                 PROMPT  ;
                 "系统登录" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1
          ON SELECTION POPUP pmlogin DO;
SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmrelation  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmrelation  ;
                 PROMPT  ;
                 "系统关联" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role <>  ;
                 0
          ON SELECTION POPUP pmrelation;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmcompress  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmcompress  ;
                 PROMPT  ;
                 "数据压缩" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 1
          DEFINE BAR 2 OF  ;
                 pmcompress  ;
                 PROMPT  ;
                 "工号变更" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 1
          DEFINE BAR 3 OF  ;
                 pmcompress  ;
                 PROMPT  ;
                 "清除历史数据"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 1
          ON SELECTION POPUP pmcompress;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmsyslog  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF  ;
                 pmsyslog PROMPT  ;
                 "系统日志" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1
          ON SELECTION POPUP pmsyslog;
DO SHOWFORM WITH PAD(), BAR()
ENDCASE
ENDPROC
**

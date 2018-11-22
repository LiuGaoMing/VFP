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
            "ϵͳ����(\<F)" KEY  ;
            ALT+F, ""
     ON PAD cmsystem OF _MSYSMENU ACTIVATE;
POPUP pmmodule
     DEFINE POPUP pmmodule MARGIN  ;
            RELATIVE
     DEFINE BAR 1 OF pmmodule  ;
            PROMPT  ;
            "������Դ(\<M)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("rs")
     DEFINE BAR 2 OF pmmodule  ;
            PROMPT  ;
            "���ڷ���(\<A)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("kq")
     DEFINE BAR 3 OF pmmodule  ;
            PROMPT  ;
            "н�ʹ���(\<S)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("gz")
     DEFINE BAR 4 OF pmmodule  ;
            PROMPT  ;
            "�Ͳ͹���(\<D)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1 .OR.  .NOT.  ;
            isaccessto("ft")
     DEFINE BAR 5 OF pmmodule  ;
            PROMPT  ;
            "ϵͳ����(\<T)" SKIP  ;
            FOR _SCREEN.formcount >  ;
            1
     DEFINE BAR 6 OF pmmodule  ;
            PROMPT "\-"
     DEFINE BAR 7 OF pmmodule  ;
            PROMPT  ;
            "�˳�ϵͳ(\<E)" SKIP  ;
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
                 "����¼��(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD rseducation  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "����ѵ��(\<T)"  ;
                 KEY ALT+T, ""
          DEFINE PAD rsquery OF  ;
                 _MSYSMENU PROMPT  ;
                 "��ϲ�ѯ(\<Q)"  ;
                 KEY ALT+Q, ""
          DEFINE PAD rsreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "�����ӡ(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD rscode OF  ;
                 _MSYSMENU PROMPT  ;
                 "��������(\<C)"  ;
                 KEY ALT+C, ""
          DEFINE PAD  ;
                 rscompensation  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "н������(\<B)"  ;
                 KEY ALT+B, ""
          DEFINE PAD rssystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "ϵͳά��(\<S)"  ;
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
                 "��������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "����Ǽ�" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "��Ʒ�������"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "���ս���" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "���ձ���" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS17")
          DEFINE BAR 6 OF pminput  ;
                 PROMPT  ;
                 "�ӷ�̨��" SKIP  ;
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
                 "�ƻ���ʵʩ"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS21")
          DEFINE BAR 2 OF  ;
                 pmeducation  ;
                 PROMPT  ;
                 "��Ч����" SKIP  ;
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
                 "��ϲ�ѯ" SKIP  ;
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
                 "�����ӡ" SKIP  ;
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
                 "��������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS52")
          DEFINE BAR 2 OF pmcode  ;
                 PROMPT  ;
                 "��λ����" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS52")
          DEFINE BAR 3 OF pmcode  ;
                 PROMPT  ;
                 "ְ������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS53")
          DEFINE BAR 4 OF pmcode  ;
                 PROMPT  ;
                 "����ְ������"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS54")
          DEFINE BAR 5 OF pmcode  ;
                 PROMPT  ;
                 "�����������"  ;
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
                 "��н�趨" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS71")
          DEFINE BAR 2 OF  ;
                 pmcompensation  ;
                 PROMPT  ;
                 "��������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS72")
          DEFINE BAR 3 OF  ;
                 pmcompensation  ;
                 PROMPT  ;
                 "ְ�����" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS73")
          DEFINE BAR 4 OF  ;
                 pmcompensation  ;
                 PROMPT "���ʽ�"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("RS",  ;
                 "3ARS74")
          DEFINE BAR 5 OF  ;
                 pmcompensation  ;
                 PROMPT  ;
                 "��������" SKIP  ;
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
                 "����Ȩ��" SKIP  ;
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
                 "����ˢ��" SKIP  ;
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
                 "����¼��(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD kqdata OF  ;
                 _MSYSMENU PROMPT  ;
                 "ˢ������(\<D)"  ;
                 KEY ALT+D, ""
          DEFINE PAD kqregister  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "���ڵǼ�(\<K)"  ;
                 KEY ALT+K, ""
          DEFINE PAD kqanalyze OF  ;
                 _MSYSMENU PROMPT  ;
                 "���ڷ���(\<A)"  ;
                 KEY ALT+A, ""
          DEFINE PAD kqreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "�������(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD kqsystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "ϵͳά��(\<S)"  ;
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
                 "��������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "����趨" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "Ա������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "Ա�����" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "���ڹ涨" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ15")
          DEFINE BAR 6 OF pminput  ;
                 PROMPT  ;
                 "���������"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ16")
          DEFINE BAR 7 OF pminput  ;
                 PROMPT  ;
                 "�Ű�ƻ�����"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ17")
          DEFINE BAR 8 OF pminput  ;
                 PROMPT  ;
                 "�ڼ���/�����ն���"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ18")
          DEFINE BAR 9 OF pminput  ;
                 PROMPT  ;
                 "Ա�����Ǽ�"  ;
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
                 "��ˢ��������"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ21")
          DEFINE BAR 2 OF pmdata  ;
                 PROMPT  ;
                 "ˢ����¼��ѯ"  ;
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
                 "��������Ǽ�"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ31")
          DEFINE BAR 2 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "��������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ32")
          DEFINE BAR 3 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "���ڵ��Ǽ�"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ33")
          DEFINE BAR 4 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "��ٹ���" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ34")
          DEFINE BAR 5 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "���ڲ��Ǽ�"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ35")
          DEFINE BAR 6 OF  ;
                 pmregister  ;
                 PROMPT  ;
                 "��ٹ涨" SKIP  ;
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
                 "�����Զ�����"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ41")
          DEFINE BAR 2 OF  ;
                 pmanalyze PROMPT  ;
                 "���ڸ��Ӵ���"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ42")
          DEFINE BAR 3 OF  ;
                 pmanalyze PROMPT  ;
                 "����������"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ43")
          DEFINE BAR 4 OF  ;
                 pmanalyze PROMPT  ;
                 "��;�������"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ44")
          DEFINE BAR 5 OF  ;
                 pmanalyze PROMPT  ;
                 "ȱˢ��һ����"  ;
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
                 "���ݻ���" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ51")
          DEFINE BAR 2 OF  ;
                 pmreport PROMPT  ;
                 "����ӡˢ" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ52")
          DEFINE BAR 3 OF  ;
                 pmreport PROMPT  ;
                 "������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ53")
          DEFINE BAR 4 OF  ;
                 pmreport PROMPT  ;
                 "Excel���" SKIP  ;
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
                 "����Ȩ��" SKIP  ;
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
                 "ɾ���ظ�ˢ��"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("KQ",  ;
                 "3AKQ63")
          DEFINE BAR 3 OF  ;
                 pmsystem PROMPT  ;
                 "�������ݸ�ʽ"  ;
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
                 "����¼��(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD gzprocess OF  ;
                 _MSYSMENU PROMPT  ;
                 "н�ʴ���(\<P)"  ;
                 KEY ALT+P, ""
          DEFINE PAD gzreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "�������(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD gzsystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "ϵͳά��(\<S)"  ;
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
                 "��������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "Ա�����" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "н�ʵȼ�" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "ת������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "����˰��" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ15")
          DEFINE BAR 6 OF pminput  ;
                 PROMPT  ;
                 "Ա������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ16")
          DEFINE BAR 7 OF pminput  ;
                 PROMPT  ;
                 "н����Ŀ" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ17")
          DEFINE BAR 8 OF pminput  ;
                 PROMPT  ;
                 "����¼��" SKIP  ;
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
                 "н�ʴ���" SKIP  ;
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
                 "���ݻ���" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ31")
          DEFINE BAR 2 OF  ;
                 pmreport PROMPT  ;
                 "����ӡˢ" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ32")
          DEFINE BAR 3 OF  ;
                 pmreport PROMPT  ;
                 "������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("GZ",  ;
                 "3AGZ33")
          DEFINE BAR 4 OF  ;
                 pmreport PROMPT  ;
                 "Excel���" SKIP  ;
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
                 "����Ȩ��" SKIP  ;
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
                 "����¼��(\<I)"  ;
                 KEY ALT+I, ""
          DEFINE PAD ftprediction  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "�Ͳ�Ԥ��(\<V)"  ;
                 KEY ALT+V, ""
          DEFINE PAD ftmanager OF  ;
                 _MSYSMENU PROMPT  ;
                 "�Ͳ͹���(\<P)"  ;
                 KEY ALT+P, ""
          DEFINE PAD ftreport OF  ;
                 _MSYSMENU PROMPT  ;
                 "�������(\<R)"  ;
                 KEY ALT+R, ""
          DEFINE PAD ftsystem OF  ;
                 _MSYSMENU PROMPT  ;
                 "ϵͳά��(\<S)"  ;
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
                 "��������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT11")
          DEFINE BAR 2 OF pminput  ;
                 PROMPT  ;
                 "Ա������" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT12")
          DEFINE BAR 3 OF pminput  ;
                 PROMPT  ;
                 "�ʹμ۸�" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT13")
          DEFINE BAR 4 OF pminput  ;
                 PROMPT  ;
                 "Ա�����Ǽ�"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT14")
          DEFINE BAR 5 OF pminput  ;
                 PROMPT  ;
                 "���صǼ�" SKIP  ;
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
                 "�Ͳ�Ԥ��" SKIP  ;
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
                 "��ˢ��������"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT21")
          DEFINE BAR 2 OF  ;
                 pmmanager PROMPT  ;
                 "���ݴ���" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT22")
          DEFINE BAR 3 OF  ;
                 pmmanager PROMPT  ;
                 "ˢ����¼��ѯ"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT23")
          DEFINE BAR 4 OF  ;
                 pmmanager PROMPT  ;
                 "δˢ����Ա����"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT24")
          DEFINE BAR 5 OF  ;
                 pmmanager PROMPT  ;
                 "�Ͳ��ۺϲ�ѯ"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT25")
          DEFINE BAR 6 OF  ;
                 pmmanager PROMPT  ;
                 "�Ͳ�����Ǽ�"  ;
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
                 "��ͳ�Ʊ���"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT31")
          DEFINE BAR 2 OF  ;
                 pmreport PROMPT  ;
                 "��ͳ�Ʊ���"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT32")
          DEFINE BAR 3 OF  ;
                 pmreport PROMPT  ;
                 "������ϸ��"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT33")
          DEFINE BAR 4 OF  ;
                 pmreport PROMPT  ;
                 "�쳣�Ͳͻ���"  ;
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
                 "����Ȩ��" SKIP  ;
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
                 "ɾ���ظ�ˢ��"  ;
                 SKIP FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR.  .NOT.  ;
                 isaccessto("FT",  ;
                 "3AFT41")
          DEFINE BAR 3 OF  ;
                 pmsystem PROMPT  ;
                 "�������ݸ�ʽ"  ;
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
                 "��֯�ṹ(\<D)"  ;
                 KEY ALT+D, ""
          DEFINE PAD tluser OF  ;
                 _MSYSMENU PROMPT  ;
                 "�û�����(\<U)"  ;
                 KEY ALT+U, ""
          DEFINE PAD tllogin OF  ;
                 _MSYSMENU PROMPT  ;
                 "ϵͳ��¼(\<P)"  ;
                 KEY ALT+P, ""
          DEFINE PAD tlrelation  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "ϵͳ����(\<S)"  ;
                 KEY ALT+S, ""
          DEFINE PAD tlcompress  ;
                 OF _MSYSMENU  ;
                 PROMPT  ;
                 "����ѹ��(\<C)"  ;
                 KEY ALT+C, ""
          DEFINE PAD tlsyslog OF  ;
                 _MSYSMENU PROMPT  ;
                 "ϵͳ��־(\<L)"  ;
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
                 "��֯�ṹ" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1
          ON SELECTION POPUP pmorganize;
DO SHOWFORM WITH PAD(), BAR()
          DEFINE POPUP pmuser  ;
                 MARGIN RELATIVE
          DEFINE BAR 1 OF pmuser  ;
                 PROMPT  ;
                 "�û�����" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 0
          DEFINE BAR 2 OF pmuser  ;
                 PROMPT  ;
                 "�������" SKIP  ;
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
                 "ϵͳ��¼" SKIP  ;
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
                 "ϵͳ����" SKIP  ;
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
                 "����ѹ��" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 1
          DEFINE BAR 2 OF  ;
                 pmcompress  ;
                 PROMPT  ;
                 "���ű��" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1 .OR. pub_role >  ;
                 1
          DEFINE BAR 3 OF  ;
                 pmcompress  ;
                 PROMPT  ;
                 "�����ʷ����"  ;
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
                 "ϵͳ��־" SKIP  ;
                 FOR  ;
                 _SCREEN.formcount >  ;
                 1
          ON SELECTION POPUP pmsyslog;
DO SHOWFORM WITH PAD(), BAR()
ENDCASE
ENDPROC
**

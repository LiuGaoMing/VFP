**
PROCEDURE CreateScreen
SET SYSMENU TO _MEDIT
_SCREEN.autocenter = .T.
_SCREEN.icon = "icon\tct.ico"
_SCREEN.picture = "picture\sky.bmp"
_SCREEN.closable = .F.
_SCREEN.addobject('img_Tree',  ;
                 'Image')
_SCREEN.img_tree.top = 132
_SCREEN.img_tree.left = 288
_SCREEN.img_tree.height = 424
_SCREEN.img_tree.width = 490
_SCREEN.img_tree.backstyle = 0
_SCREEN.img_tree.picture = 'picture\bkg_main.bmp'
_SCREEN.addobject('lab_Demo',  ;
                 'Label')
_SCREEN.lab_demo.caption = '演示数据：2004年06月'
_SCREEN.lab_demo.autosize = .T.
_SCREEN.lab_demo.top = 38
_SCREEN.lab_demo.left = 204
_SCREEN.lab_demo.backstyle = 0
SET CLASSLIB TO Cmd
_SCREEN.addobject('lab_www',  ;
                 'Lab_WWW', 456,  ;
                 528)
_SCREEN.addobject('img_3ars',  ;
                 'Cmd_MainMenu',  ;
                 48, 36,  ;
                 '人力资源(M)')
_SCREEN.addobject('img_3akq',  ;
                 'Cmd_MainMenu',  ;
                 48, 89,  ;
                 '考勤分析(A)')
_SCREEN.addobject('img_3agz',  ;
                 'Cmd_MainMenu',  ;
                 48, 142,  ;
                 '薪资管理(S)')
_SCREEN.addobject('img_3aft',  ;
                 'Cmd_MainMenu',  ;
                 48, 195,  ;
                 '就餐管理(D)')
_SCREEN.addobject('img_tools',  ;
                 'Cmd_MainMenu',  ;
                 48, 301,  ;
                 '系统工具(T)')
_SCREEN.addobject('img_quit',  ;
                 'Cmd_MainMenu',  ;
                 48, 391,  ;
                 '退出系统(E)')
_SCREEN.img_tree.visible = .T.
_SCREEN.img_3ars.visible = .T.
_SCREEN.img_3akq.visible = .T.
_SCREEN.img_3agz.visible = .T.
_SCREEN.img_3aft.visible = .T.
_SCREEN.img_tools.visible = .T.
_SCREEN.img_quit.visible = .T.
IF pub_language
     _SCREEN.caption = getlanguage("t_RenShiKaoQin")
     _SCREEN.img_3ars.title.fontname =  ;
      "Comic Sans MS"
     _SCREEN.img_3ars.title.caption =  ;
      UPPER(getlanguage("m_RenLiZiYuan"))
     _SCREEN.img_3akq.title.fontname =  ;
      "Comic Sans MS"
     _SCREEN.img_3akq.title.caption =  ;
      UPPER(getlanguage("m_KaoQinFenXi"))
     _SCREEN.img_3agz.title.fontname =  ;
      "Comic Sans MS"
     _SCREEN.img_3agz.title.caption =  ;
      UPPER(getlanguage("m_XinZiGuanLi"))
     _SCREEN.img_3aft.title.fontname =  ;
      "Comic Sans MS"
     _SCREEN.img_3aft.title.caption =  ;
      UPPER(getlanguage("m_JiuCanGuanLi"))
     _SCREEN.img_tools.title.fontname =  ;
      "Comic Sans MS"
     _SCREEN.img_tools.title.caption =  ;
      UPPER(getlanguage("m_XiTongWeiHu"))
     _SCREEN.img_quit.title.fontname =  ;
      "Comic Sans MS"
     _SCREEN.img_quit.title.caption =  ;
      UPPER(getlanguage("m_ZhongZhi"))
ELSE
     _SCREEN.caption = "ANT2000人事考勤系统"
ENDIF
_SCREEN.windowstate = 2
ENDPROC
**

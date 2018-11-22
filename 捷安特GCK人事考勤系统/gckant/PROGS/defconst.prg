**
PROCEDURE DEFCONST
PUBLIC rgb_normal, rgb_insert,  ;
       rgb_modify, rgb_delete,  ;
       rgb_select
PUBLIC rgb_holiday, rgb_line1,  ;
       rgb_line2
PUBLIC sysloglevel
PUBLIC str_week(7)
str_week(1) = '日'
str_week(2) = '一'
str_week(3) = '二'
str_week(4) = '三'
str_week(5) = '四'
str_week(6) = '五'
str_week(7) = '六'
rgb_normal = RGB(255, 255, 255)
rgb_insert = RGB(180, 213, 252)
rgb_modify = RGB(255, 193, 193)
rgb_delete = RGB(0, 0, 0)
rgb_select = RGB(98, 98, 255)
rgb_holiday = RGB(225, 255, 225)
rgb_line1 = RGB(238, 255, 238)
rgb_line2 = RGB(255, 255, 176)
sysloglevel = 99
RETURN
ENDPROC
**

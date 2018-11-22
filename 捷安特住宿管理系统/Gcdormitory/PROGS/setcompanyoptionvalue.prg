**
FUNCTION SetCompanyOptionValue
PARAMETER GCOVCOMPANY, OPTIONID, VALTYPE, VALVALUE
SRET = 0
SSQL1 = ""
DO CASE
CASE UPPER(VALTYPE)=UPPER('Boolean')
SSQL1 = "UPDATE CompanyOptions SET BooleanValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
CASE UPPER(VALTYPE)=UPPER('Int')
SSQL1 = "UPDATE CompanyOptions SET IntValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
CASE UPPER(VALTYPE)=UPPER('DateTime')
SSQL1 = "UPDATE CompanyOptions SET DateTimeValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
CASE UPPER(VALTYPE)=UPPER('String')
SSQL1 = "UPDATE CompanyOptions SET StringValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
CASE UPPER(VALTYPE)=UPPER('Text')
SSQL1 = "UPDATE CompanyOptions SET TextValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
CASE UPPER(VALTYPE)=UPPER('Float')
SSQL1 = "UPDATE CompanyOptions SET FloatValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
CASE UPPER(VALTYPE)=UPPER('Guid')
SSQL1 = "UPDATE CompanyOptions SET GuidValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
CASE UPPER(VALTYPE)=UPPER('Money')
SSQL1 = "UPDATE CompanyOptions SET MoneyValue=?ValValue  where Company=?gcovCompany AND OptionId=?OptionId"
OTHERWISE
ENDCASE
IF SQLEXE_RUN(00000000035, SYS(16), SSQL1, "")=1
SRET = 1
ELSE
SRET = 0
= MESSAGEBOX("SetCompanyOptionº¯ÊýError_1£¡", 64, "CompanyOption")
ENDIF
RETURN SRET
ENDFUNC
**

<!-- #Include File="ConnStatData.asp" -->
<%
Dim Ip,Sip,IpOne,IpTwo,Area,Address,Scope,Referer,WebUrl,Visit
Dim Agent,System,Browser,BcType,Mozilla,Height,Width,Screen,Ver
Dim DbName
Dim StrYear,StrMonth,StrDay,StrHour,Strweek,StrHourLong,StrDayLong,StrMonthLong,OldDay
Dim Num,I,Image,ExTime


Image="Images/icon.gif"
ExTime=15

Ip=Request.ServerVariables("REMOTE_ADDR")
If (Ip=Application("OldIp")) And (DateDiff("N",Application("OldTime"),Time)<ExTime) Then
   Response.Redirect Image
End If
Application("OldIp")=Ip
Application("OldTime")=Time
Num=Split(Ip,".")
IpOne=Num(0)
IpTwo=Num(0)&"."&Num(1)
For I=0 to 3
   Sip=Sip&String(3-Len(Num(I)),"0")&Num(I)
Next
Sql="Select Top 1 Area,Address From IpInfo Where StartIp<='"&SIp&"' and EndIp>='"&SIp&"' Order By StartIp"
Rs.Open Sql,Conn,1,3
If Rs.Eof Or Rs.Bof Then
   Area="其它地区"
   Address="其它地区"
Else
   Area=Rs("Area")
   Address=Rs("Area")&Rs("Address")
End If
Rs.Close
Sql="Select Top 1 Scope From IpScope Where StartIp<='"&SIp&"' and EndIp>='"&SIp&"' Order By Scope DESC"
Rs.Open Sql,Conn,1,3
If Rs.Eof Or Rs.Bof Then
   Scope="OtherNum"
Else
   Scope=Rs("Scope")
End If
Rs.Close


Referer=Request.QueryString("Referer")
If Referer="" Then Referer="直接输入或书签导入"
WebUrl=Request.QueryString("weburl")
If WebUrl="" Then WebUrl="直接输入或书签导入"
Width=Request.QueryString("Width")
Height=Request.QueryString("Height")
If Height="" Or isnumeric(Height)=0 Or Width="" Or isnumeric(Width)=0 Then
   Screen="其它"
Else
   Screen=Cstr(Width)&"x"&Cstr(Height)
End If


Visit=Request.Cookies("VisitNum")
If Visit<>"" Then
   Visit=Visit+1
Else
   Visit=1
End If
Response.Cookies("VisitNum")=Visit
Response.Cookies("VisitNum").Expires=DateAdd("n",30,now)
Sql="Select * From FVisit"
Rs.Open Sql,Conn,1,3
If Rs.Eof Or Rs.Bof Then
   Rs.AddNew
   If Visit<=10 Then
      Rs(Visit)=1
   Else
      Rs("10")=1
   End If
Else
   If Visit<=10 Then
      If Isnumeric(Rs(Visit))=0 Then
         Rs(Visit)=1
      Else
         Rs(Visit)=Rs(Visit)+1
         If Rs(Visit-1)>0 And Visit-1>0 Then Rs(Visit-1)=Rs(Visit-1)-1
	  End If
   End If
End If
Rs.Update
Rs.Close



Mozilla=Request.ServerVariables("HTTP_USER_AGENT")
Agent=Mozilla
Agent=Split(Agent,";")
BcType=0
If Instr(Agent(1),"U") Or Instr(Agent(1),"I") Then BcType=1
If InStr(Agent(1),"MSIE") Then BcType=2
Select Case BcType
Case 0:
     Browser="其它"
     System="其它"
Case 1:
	 Ver=Mid(Agent(0),InStr(Agent(0),"/")+1)
	 Ver=Mid(Ver,1,InStr(Ver," ")-1)
	 Browser="Netscape"&Ver
     System=Mid(Agent(0),InStr(Agent(0),"(")+1)
	 System=Replace(System,"Windows","Win")
case 2:
     Browser=Agent(1)
     System=Agent(2)
	 System=Replace(System,")","")
	 System=Replace(System,"Windows","Win")
End Select
System=Replace(System," ","")
System=Replace(System,"Win","Windows")
System=Replace(System,"NT5.0","2000")
Browser=Replace(Browser," ","")

Screen=left(Screen,10)
System=Left(System,20)
Browser=Left(Browser,20)
WebUrl=Left(WebUrl,50)
Referer=left(Referer,100)

Sql="Select * From Visitor Order By Id DESC"
Rs.Open Sql,Conn,1,3
If Not (Rs.Eof Or Rs.Bof) Then
Rs.Movelast
If Rs.RecordCount>29 Then Rs.Delete
End If
Rs.Addnew
Rs("Sdate")=Date
Rs("STime")=Time
Rs("IP")=Ip
Rs("Address")=Address
Rs("Browser")=Browser
Rs("System")=System
Rs("Screen")=Screen
Rs("Referer")=Referer
Rs.Update
Rs.Close

StrHour=Cstr(hour(time))
StrDay=Cstr(Day(Date))
StrMonth=Cstr(Month(Date))
StrYear=Cstr(Year(Date))
StrWeek=Cstr(Weekday(Date))
StrDayLong=Cstr(Year(Date)&"-"&Month(Date)&"-"&Day(date))
StrMonthLong=Cstr(Year(Date)&"-"&Month(Date))
StrHourLong=StrDayLong&" "&Cstr(Hour(Time))&":00:00"

ModiMaxNum StrMonthLong,"OldMonth","MonthNum","MonthMaxDate","MonthMaxNum"
ModiMaxNum StrDayLong,"OldDay","DayNum","DayMaxDate","DayMaxNum"
ModiMaxNum StrHourLong,"OldHour","HourNum","HourMaxTime","HourMaxNum"
Sql="Select * From InfoList"
Rs.Open Sql,Conn,1,3
Rs("TotalNum")=Rs("TotalNum")+1
Rs(Scope)=Rs(Scope)+1
If IsNull(Rs("StartDate")) Then Rs("StartDate")=StrDayLong
OldDay=Rs("OldDay")
Rs.Update
Rs.Close

AddNum System,"FSystem","TSystem","TSysNum"
AddNum Browser,"FBrowser","TBrowser","TBrwNum"
AddNum Mozilla,"FMozilla","TMozilla","TMozNum"
AddNum Screen,"FScreen","TScreen","TScrNum"
AddNum Referer,"FRefer","TRefer","TRefNum"
AddNum Weburl,"FWeburl","TWeburl","TWebNum"
AddNum Address,"FAddress","TAddress","TAddNum"
AddNum Area,"FArea","TArea","TAreNum"
AddNum Ipone,"FIpone","TIpone","TOneNum"
AddNum Iptwo,"FIptwo","TIptwo","TTwoNum"
AddNum StrDayLong,"StatDay","TDay",StrHour
AddNum "Total","StatDay","TDay",StrHour
AddNum StrYear,"StatYear","TYear",StrMonth
AddNum "Total","StatMonth","TMonth",StrDay
AddNum StrMonthLong,"StatMonth","TMonth",StrDay
AddNum "Total","StatWeek","TWeek",StrWeek
If DateDiff("Ww",Cdate(OldDay),Date)>0 Then
   Sql="Delete * From StatWeek Where TWeek='Current'"
   Conn.Execute(Sql)
End If
AddNum "Current","StatWeek","TWeek",StrWeek

Conn.Close
Set Rs=Nothing
Set Conn=Nothing
Response.Redirect Image

Sub ModiMaxNum(CurData,OldData,OldNum,MaxData,MaxNum)
    Sql="Select * From InfoList"
    Rs.Open Sql,Conn,1,3
    If Rs(OldData)=CurData Then
       Rs(OldNum)=Rs(OldNum)+1
    Else
       Rs(OldData)=CurData
       Rs(OldNum)=1
    End If
    If Rs(OldNum)>Rs(MaxNum) Then
       Rs(MaxNum)=Rs(OldNum)
       Rs(MaxData)=CurData
    End If
    Rs.Update
    Rs.Close
End Sub

Sub AddNum(Data,TableName,CompareField,AddField)
    Sql="Select * From "&TableName&" Where "&CompareField&"='"&Data&"'"
    Rs.Open Sql,Conn,1,3
    If Rs.Eof Or Rs.Bof Then
       Rs.AddNew
       Rs(CompareField)=Data
       Rs(AddField)=1
    Else
       If Isnumeric(Rs(AddField))=0 Then
          Rs(AddField)=1
       Else
	      Rs(AddField)=Rs(AddField)+1
       End If
    End If
    Rs.Update
    Rs.Close
End Sub
%>
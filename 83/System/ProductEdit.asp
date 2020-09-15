<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'┊　　　　　　　刘小雨儿童艺术画室网站管理系统（ＮＷＥＢ）　　　　　　　┊
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
' 　 版权所有　Nweb.cn
'
'　　程序制作　万博工作室
'　　　　　　　Add:中国四川成都彭州市/611930
'　　　　　　　Tel:0-13348927760 028-88079088
'　　　　　　　Fax:83708850
'　　　　　　　E-m:duolaimi-123@163.com
'　　　　　　　Q Q:59309100
'
'　　官方网址　http://www.Nweb.cn
'┊　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　┊
'└┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘
%>
<% Option Explicit %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<META NAME="copyright" CONTENT="Copyright 2004-2008 - NWEB.CN-STUDIO" />
<META NAME="Author" CONTENT="万博网络技术工作室,www.Nweb.cn" />
<META NAME="Keywords" CONTENT="" />
<META NAME="Description" CONTENT="" />
<TITLE>编辑产品</TITLE>
<link rel="stylesheet" href="Images/CssAdmin.css">
<script language="javascript" src="../Script/Admin.js"></script>
</HEAD>
<!--#include file="../Include/Const.asp" -->
<!--#include file="../Include/ConnSiteData.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
if Instr(session("AdminPurview"),"|33,")=0 then 
  response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
end if
'========判断是否具有管理权限
%>
<BODY>
<% 
dim Result
Result=request.QueryString("Result")
dim ID,ProductName,ViewFlag,SortName,SortID,SortPath,SortName2,SortID2,SortPath2
dim ProductNo,ProductModel,N_Price,P_Price,Stock,Unit,Maker,CommendFlag,NewFlag,GroupID,GroupIdName,Exclusive
dim BigPic,SmallPic,Content
ID=request.QueryString("ID")
call ProductEdit() 
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>产品检索及分类查看：添加，修改，删除产品信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="ProductEdit.asp?Result=Add" onClick='changeAdminFlag("添加产品信息")'>添加产品信息</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="ProductList.asp" onClick='changeAdminFlag("产品列表")'>查看所有产品信息</a></td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="ProductEdit.asp?Action=SaveEdit&Result=<%=Result%>&ID=<%=ID%>">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">
      <tr>
        <td width="120" height="20" align="right">&nbsp;</td>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">产品名称：</td>
        <td colspan="3"><input name="ProductName" type="text" class="textfield" id="ProductName" style="WIDTH: 240;" value="<%=ProductName%>" maxlength="100">&nbsp;发布：<input name="ViewFlag" type="checkbox" style='HEIGHT: 13px;WIDTH: 13px;' value="1" <%if ViewFlag then response.write ("checked")%>></td>
      </tr>
      <tr>
        <td height="20" align="right">主属类别：</td>
        <td><input name="SortName" type="text" class="textfield" id="SortName" value="<%=SortName%>" style="WIDTH: 240;background-color:#EBF2F9;" readonly>&nbsp;<a href="javaScript:OpenScript('SelectSort.asp?Result=Products',500,500,'')"><img src="Images/Select.gif" width="30" height="16" border="0" align="absmiddle"></a></td>
        <td>另属类别：</td>
        <td><input name="SortName2" type="text" class="textfield" id="SortName2" value="<%=SortName2%>" style="WIDTH: 240;background-color:#EBF2F9;" readonly>&nbsp;<a href="NOError.asp"><img src="Images/Select.gif" width="30" height="16" border="0" align="absmiddle"></a></td>
      </tr>
      <tr>
        <td height="20" align="right">类别数字：</td>
        <td><input name="SortID" type="text" class="textfield" id="SortID" style="WIDTH: 40;background-color:#EBF2F9;" value="<%=SortID%>" readonly><input name="SortPath" type="text" class="textfield" id="SortPath" style="WIDTH: 200;background-color:#EBF2F9;" value="<%=SortPath%>" readonly>&nbsp;*</td>
        <td>类别数字：</td>
        <td><input name="SortID2" type="text" class="textfield" id="SortID2" style="WIDTH: 40;background-color:#EBF2F9;" value="<%=SortID2%>" readonly><input name="SortPath2" type="text" class="textfield" id="SortPath2" style="WIDTH: 200;background-color:#EBF2F9;" value="<%=SortPath2%>" readonly></td>
      </tr>
      <tr>
        <td height="20" align="right">编　　号：</td>
        <td colspan="3"><input name="ProductNo" type="text" class="textfield" id="ProductNo" style="WIDTH: 240;" value="<%=ProductNo%>" maxlength="100">&nbsp;*&nbsp;如果不明确请勿修改</td>
      </tr>
      <tr>
        <td height="20" align="right">型　　号：</td>
        <td colspan="3"><input name="ProductModel" type="text" class="textfield" id="ProductModel" style="WIDTH: 240;" value="<%=ProductModel%>" maxlength="100">&nbsp;*&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">标 准 价：</td>
        <td colspan="3"><input name="N_Price" type="text" class="textfield" id="N_Price" style="WIDTH: 240;" value="<%=N_Price%>" maxlength="100">&nbsp;*&nbsp;</td>
      </tr>	  
      <tr>
        <td height="20" align="right">优 惠 价：</td>
        <td colspan="3"><input name="P_Price" type="text" class="textfield" id="P_Price" style="WIDTH: 240;" value="<%=P_Price%>" maxlength="100">&nbsp;*&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="right">库存数量：</td>
        <td colspan="3"><input name="Stock" type="text" class="textfield" id="Stock" style="WIDTH: 240;" value="<%=Stock%>" maxlength="100">&nbsp;*</td>
      </tr>	  
      <tr>
        <td height="20" align="right">计价单位：</td>
        <td colspan="3"><input name="Unit" type="text" class="textfield" id="Unit" style="WIDTH: 240;" value="<%=Unit%>" maxlength="100">&nbsp;*&nbsp;</td>
      </tr>	 
	    <tr>
        <td height="20" align="right">出品公司：</td>
        <td colspan="3"><input name="Maker" type="text" class="textfield" id="Maker" style="WIDTH: 240;" value="<%=Maker%>" maxlength="100"></td>
      </tr>
      <tr>
        <td height="20" align="right">状　　态：</td>
        <td colspan="3"><input name="CommendFlag" type="checkbox" style="HEIGHT: 13px;WIDTH: 13px;" value="1" <%if CommendFlag then response.write ("checked")%>>&nbsp;推荐&nbsp;<input name="NewFlag" type="checkbox" value="1" style="HEIGHT: 13px;WIDTH: 13px;" <%if NewFlag then response.write ("checked")%>>&nbsp;最新</td>
      </tr>
      <tr>
        <td height="20" align="right">查看权限：</td>
        <td colspan="3"><select name="GroupID" class="textfield">
          <% call SelectGroup() %>
          </select>
          <input name="Exclusive" type="radio" value="&gt;="  <%if Exclusive="" or Exclusive=">=" then response.write ("checked")%>> 隶属<input type="radio"  <%if Exclusive="=" then response.write ("checked")%> name="Exclusive" value="=">专属（隶属：权限值≥可查看，专属：权限值＝可查看）</td>
      </tr>
      <tr>
        <td height="20" align="right">产品主图：</td>
        <td colspan="3"><input name="BigPic" type="text" class="textfield" style="WIDTH: 240;" value="<%=BigPic%>" maxlength="100">&nbsp;<a href="javaScript:OpenScript('UpFileForm.asp?Result=BigPic',460,180)"><img src="Images/Upload.gif" width="30" height="16" border="0" align="absmiddle"></a></td>
      </tr>
      <tr>
        <td height="20" align="right">缩 略 图：</td>
        <td colspan="3"><input name="SmallPic" type="text" class="textfield" style="WIDTH: 240;" value="<%=SmallPic%>" maxlength="100">&nbsp;<a href="javaScript:OpenScript('UpFileForm.asp?Result=SmallPic',460,180)"><img src="Images/Upload.gif" width="30" height="16" border="0" align="absmiddle"></a></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">详细介绍：<br>
		  <img title="点击进入可视化查看、编辑环境..." src="Images/Edit.gif" width="51" height="20" style="cursor:hand" onClick="OpenDialog('../Editor/EditorDialog.html?lnk=Content&file=Editor_1.html',800,520);">
        <td colspan="3"><textarea name="Content" rows="12" class="textfield" id="Content" style="WIDTH: 86%;" readonly><%=Content%></textarea></td>
      </tr>

      <tr>
        <td height="30" align="right">&nbsp;</td>
        <td colspan="3" valign="bottom"><input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value="保存" style="WIDTH: 80;" ></td>
      </tr>
      <tr>
        <td height="20" align="right">&nbsp;</td>
        <td colspan="3" valign="bottom">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>
</BODY>
</HTML>
<%
sub ProductEdit()
  dim Action,rsRepeat,rs,sql
  Action=request.QueryString("Action")
  if Action="SaveEdit" then '保存编辑产品信息
    set rs = server.createobject("adodb.recordset")
    if len(trim(request.Form("ProductName")))<1 then
      response.write ("<script language=javascript> alert('产品名称为必填项目！');history.back(-1);</script>")
      response.end
    end if
    if Result="Add" then '创建产品信息
	  sql="select * from NwebCn_Products"
      rs.open sql,conn,1,3
      rs.addnew
      rs("ProductName")=trim(Request.Form("ProductName"))
	    if Request.Form("ViewFlag")=1 then
          rs("ViewFlag")=Request.Form("ViewFlag")
	    else
          rs("ViewFlag")=0
	    end if
	    if Request.Form("SortID")="" and Request.Form("SortPath")="" then
          response.write ("<script language=javascript> alert('请选择主属分类！');history.back(-1);</script>")
          response.end
	    else
	      rs("SortID")=Request.Form("SortID")
		  rs("SortPath")=Request.Form("SortPath")
	    end if
      set rsRepeat = conn.execute("select ProductNo from NwebCn_Products where ProductNo='" & trim(Request.Form("ProductNo")) & "'")
      if not (rsRepeat.bof and rsRepeat.eof) then '判断此产品编号是否存在
        response.write "<script language=javascript> alert('" & trim(Request.Form("ProductNo")) & "此产品编号已经存在，请换一个编号再试试！');history.back(-1);</script>"
        response.end
      else
	      rs("ProductNo")=trim(Request.Form("ProductNo"))
	    end if
	    rs("ProductModel")=trim(Request.Form("ProductModel"))
	    if (not IsNumeric(trim(request.Form("N_Price")))) or (not IsNumeric(trim(request.Form("P_Price"))))then
        response.write ("<script language=javascript> alert('标准价和优惠价数据必填，且为正数！');history.back(-1);</script>")
        response.end
      elseif trim(request.Form("N_Price"))<0 or trim(request.Form("P_Price"))<0then
        response.write ("<script language=javascript> alert('标准价和优惠价数据必填，且为正数！');history.back(-1);</script>")
        response.end
      else
        rs("N_Price")=Round(trim(Request.Form("N_Price")),2)
	      rs("P_Price")=Round(trim(Request.Form("P_Price")),2)
	    end if
			if (not IsNumeric(trim(request.Form("Stock"))))  then
        response.write ("<script language=javascript> alert('库存数量必填且为数值！');history.back(-1);</script>")
        response.end
			else
			  rs("Stock")=Round(trim(Request.Form("Stock")),2)
			end if  	
			if len(trim(Request.Form("Unit")))=0 then
        response.write ("<script language=javascript> alert('计价单位必填！');history.back(-1);</script>")
        response.end
			else
			  rs("Unit")=trim(Request.Form("Unit"))
			end if  
	    rs("Maker")=trim(Request.Form("Maker"))
	    if Request.Form("CommendFlag")=1 then
        rs("CommendFlag")=Request.Form("CommendFlag")
	    else
        rs("CommendFlag")=0
	    end if
	    if Request.Form("NewFlag")=1 then
        rs("NewFlag")=Request.Form("NewFlag")
	    else
        rs("NewFlag")=0
	    end if
      GroupIdName=split(Request.Form("GroupID"),"┎╂┚")
	    rs("GroupID")=GroupIdName(0)
	    rs("Exclusive")=trim(Request.Form("Exclusive"))
	    rs("BigPic")=trim(Request.Form("BigPic"))	  
	    rs("SmallPic")=trim(Request.Form("SmallPic"))
	    rs("Content")=rtrim(Request.Form("Content"))
	    rs("AddTime")=now()
	    rs("UpdateTime")=now()
	  end if  
	  if Result="Modify" then '修改产品信息
      sql="select * from NwebCn_Products where ID="&ID
      rs.open sql,conn,1,3
      rs("ProductName")=trim(Request.Form("ProductName"))
	    if Request.Form("ViewFlag")=1 then
        rs("ViewFlag")=Request.Form("ViewFlag")
	    else
        rs("ViewFlag")=0
	    end if
	    if Request.Form("SortID")<>"" and Request.Form("SortPath")<>"" then
	      rs("SortID")=Request.Form("SortID")
		  rs("SortPath")=Request.Form("SortPath")
	    else
        response.write ("<script language=javascript> alert('请选择主属分类！');history.back(-1);</script>")
        response.end
	    end if
	    rs("ProductNo")=trim(Request.Form("ProductNo"))
	    rs("ProductModel")=trim(Request.Form("ProductModel"))
	    if (not IsNumeric(trim(request.Form("N_Price")))) or (not IsNumeric(trim(request.Form("P_Price"))))then
        response.write ("<script language=javascript> alert('标准价和优惠价数据必填，且为正数！');history.back(-1);</script>")
        response.end
      elseif trim(request.Form("N_Price"))<0 or trim(request.Form("P_Price"))<0then
        response.write ("<script language=javascript> alert('标准价和优惠价数据必填，且为正数！');history.back(-1);</script>")
        response.end
      else
        rs("N_Price")=Round(trim(Request.Form("N_Price")),2)
	      rs("P_Price")=Round(trim(Request.Form("P_Price")),2)
	    end if
			if (not IsNumeric(trim(request.Form("Stock"))))  then
        response.write ("<script language=javascript> alert('库存数量必填且为数值！');history.back(-1);</script>")
        response.end
			else
			  rs("Stock")=Round(trim(Request.Form("Stock")),2)
			end if  	
			if len(trim(Request.Form("Unit")))=0 then
        response.write ("<script language=javascript> alert('计价单位必填！');history.back(-1);</script>")
        response.end
			else
			  rs("Unit")=trim(Request.Form("Unit"))
			end if  
	    rs("Maker")=trim(Request.Form("Maker"))
	    if Request.Form("CommendFlag")=1 then
        rs("CommendFlag")=Request.Form("CommendFlag")
	    else
        rs("CommendFlag")=0
	    end if
	    if Request.Form("NewFlag")=1 then
        rs("NewFlag")=Request.Form("NewFlag")
	    else
        rs("NewFlag")=0
	    end if
      GroupIdName=split(Request.Form("GroupID"),"┎╂┚")
	    rs("GroupID")=GroupIdName(0)
	    rs("Exclusive")=trim(Request.Form("Exclusive"))
	    rs("BigPic")=trim(Request.Form("BigPic"))	  
	    rs("SmallPic")=trim(Request.Form("SmallPic"))
	    rs("Content")=rtrim(Request.Form("Content"))
	    rs("UpdateTime")=now()
	  end if
	  rs.update
  	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑产品信息！');changeAdminFlag('产品列表');location.replace('ProductList.asp');</script>"
  else '提取产品信息
  	if Result="Modify" then
      set rs = server.createobject("adodb.recordset")
      sql="select * from NwebCn_Products where ID="& ID
      rs.open sql,conn,1,1
      if rs.bof and rs.eof then
      response.write ("数据库读取记录出错！")
      response.end
      end if
	    ProductName=rs("ProductName")
	    ViewFlag=rs("ViewFlag")
	    SortName=SortText(rs("SortID"))
	    SortID=rs("SortID")
	    SortPath=rs("SortPath")
		if not(rs("SortID2")="" or isnull(rs("SortID2"))) then SortName2=SortText(rs("SortID2"))
	    SortID2=rs("SortID2")
	    SortPath2=rs("SortPath2")
	    ProductNo=rs("ProductNo")
        ProductModel=rs("ProductModel")
	    N_Price=rs("N_Price")
	    P_Price=rs("P_Price")
		Stock=rs("Stock")
		Unit=rs("Unit")
	    Maker=rs("Maker")
	    CommendFlag=rs("CommendFlag")
	    NewFlag=rs("NewFlag")
	    GroupID=rs("GroupID")
	    Exclusive=rs("Exclusive")
	    BigPic=rs("BigPic")
	    SmallPic=rs("SmallPic")
        Content=rs("Content")
	    rs.close
        set rs=nothing 
	  else
	    randomize timer
		N_Price=0
		P_Price=0
	    ProductNo=Hour(now)&Minute(now)&Second(now)&"-"&int(900*rnd)+100
		ProductModel=ProductNo
		Stock=10000
    end if
  end if
end sub
%>
<% 
sub SelectGroup()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select GroupID,GroupName from NwebCn_MemGroup"
  rs.open sql,conn,1,1
  if rs.bof and rs.eof then
    response.write("未设组别")
  end if
  while not rs.eof
    response.write("<option value='"&rs("GroupID")&"┎╂┚"&rs("GroupName")&"'")
    if GroupID=rs("GroupID") then response.write ("selected")
    response.write(">"&rs("GroupName")&"</option>")
    rs.movenext
  wend
  rs.close
  set rs=nothing
end sub
%>
<%
'生成所属类别--------------------------
Function SortText(ID)
  Dim rs,sql
  Set rs=server.CreateObject("adodb.recordset")
  sql="Select * From NwebCn_ProductSort where ID="&ID
  rs.open sql,conn,1,1
  SortText=rs("SortName")
  rs.close
  set rs=nothing
End Function
%>
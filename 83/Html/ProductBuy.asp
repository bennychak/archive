<!--#include file="Head.asp"-->
<%
dim Products
dim mMemID,mRealName,mSex,mCompany,mAddress,mZipCode,mTelephone,mFax,mMobile,mEmail
if session("MemName")<>"" and session("MemLogin")="Succeed" then 
  call MemInfo()
else
  mSex="先生"
  mMemID=0
end if
%>
  <div id="Bodyer_page">
    <div id="Bodyer_banner_page"><img src="http://dummyimage.com/850x190/fff/000.gif&text=banner" width="850" height="190" alt="<%=SiteTitle %>"/></div>
	<div id="Bodyer_left_page">
      <div class="Bodyer_left_page_title"><h2>产品中心</h2></div>
	  <div class="Bodyer_left_page_menu"><%=WebMenu(0,0,2)%></div>
	</div>
	<div id="Bodyer_right_page">
	  <div class="Bodyer_right_page_location"><%=WebLocation()%></div>
      <div class="Bodyer_right_page_content">
		<% call ProductList() %>
        <table width="100%" cellpadding="2" cellspacing="0" >
          <form action="ProductBuySave.asp?MemberID=<%=mMemID%>" method="post" name="formBuy" id="formBuy">
            <tr>
              <td width="13%" align="right">标题：</td>
              <td width="87%"><input name="OrderName" type="text"  id="OrderName" value="产品订购" size="40" maxlength="100" />
              &nbsp;<font color="#CC0000">*</font>&nbsp;</td>
            </tr>
            <tr>
              <td align="right">其他说明：</td>
              <td><input type="hidden" name="Products" value="<%=Products%>" />
                  <textarea name="Remark" cols="91" rows="8" id="Remark"></textarea></td>
            </tr>
            <tr>
              <td align="right">联系人：</td>
              <td><input name="RealName" type="text" id="RealName" value="<%=mRealName%>" size="20" maxlength="50" />
              &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">性别：</td>
              <td><input name="Sex" type="radio" value="先生" <%if mSex="先生" then response.write ("checked")%> />
                先生
                <input type="radio" name="Sex" value="女士" <%if mSex="女士" then response.write ("checked")%> />
                女士</td>
            </tr>
            <tr>
              <td align="right">单位名称：</td>
              <td><input name="Company" type="text" id="Company" value="<%=mCompany%>" size="40" maxlength="100" />
                &nbsp;<font color="#CC0000">*</font>&nbsp;个人请填&quot;个人购买&quot;</td>
            </tr>
            <tr>
              <td align="right">地址：</td>
              <td><input name="Address" type="text" id="Address" value="<%=mAddress%>" size="40" maxlength="100" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">邮编：</td>
              <td><input name="ZipCode" type="text" id="ZipCode" value="<%=mZipCode%>" size="20" maxlength="20" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">电话：</td>
              <td><input name="Telephone" type="text" id="Telephone" value="<%=mTelephone%>" size="20" maxlength="50" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">传真：</td>
              <td><input name="Fax" type="text" id="Fax" value="<%=mFax%>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">移动电话：</td>
              <td><input name="Mobile" type="text" id="Mobile" value="<%=mMobile%>" size="20" maxlength="50" /></td>
            </tr>
            <tr>
              <td align="right">电子邮箱：</td>
              <td><input name="Email" type="text" id="Email" value="<%=mEmail%>" size="30" maxlength="50" />
                &nbsp;<font color="#CC0000">*</font></td>
            </tr>
            <tr>
              <td align="right">验证码：</td>
              <td valign="bottom"><input name="VerifyCode" type="text" size="4" maxlength="4" />
                  <img src="../Include/VerifyCode.asp" align="absmiddle" /> </td>
            </tr>
            <tr>
              <td height="30" align="right">&nbsp;</td>
              <td valign="bottom"><input name="Submit" type="submit" class="button" value=" 保存 " />
                &nbsp;
                <input name="Reset" type="reset" class="button" value=" 重置 " /></td>
            </tr>
            <tr>
              <td height="30" align="right">&nbsp;</td>
              <td valign="bottom">&nbsp;</td>
            </tr>
          </form>
        </table>
	  </div>
	</div>
  </div>
<%
function WebMenu(ParentID,i,level)
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_ProductSort where ViewFlag and ParentID="&ParentID&" order by ID asc"
  rs.open sql,conn,1,1
  if conn.execute("select ID from NwebCn_ProductSort Where ViewFlag and ParentID=0").eof then
    response.write "暂无相关信息"
  end if
  do while not rs.eof
	if ParentID=0 then
	  response.write "<a href=""ProductList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
	else
	  response.write string(i,"　")&"<a href=""ProductList.asp?SortID="&rs("ID")&""">"&rs("SortName")&"</a><br/>"
		             
	end if
    i=i+1
	if i<level then call WebMenu(rs("ID"),i,level)
	i=i-1
	rs.movenext
  loop 
  rs.close
  set rs=nothing
end function

function WebLocation()
  WebLocation="<img src=""../Images/Arrow_02.gif"" />&nbsp;您的位置：<a href=""../index.asp"" title=""返回首页"">首页</a>" & _
              "<img src=""../Images/Arrow_03.gif"" /><a href=""ProductList.asp"" title=""产品中心"">产品中心</a>"  &_
              "<img src=""../Images/Arrow_03.gif"" />订单提交"
end function

function NoList()
  if request("UpdateOrder")="更新选择" then
    Session("NoList")=""
  end if
  dim ProductNo,NoArray,i
  if trim(request("ProductNo"))<>"" then ProductNo=trim(request("ProductNo"))&"," '当有产品加入订单时，在产品编号串后加上[,]，形成[A-123,]或[A-123,B-123,C-123,]
  if session("NoList")="" and trim(request("ProductNo"))="" then
    NoList=""
    exit function
  end if
  if instr(ProductNo,",")>0 then		
  	NoArray=split(ProductNo, ",")
  	for i = 0 to ubound(NoArray)
      if not instr(session("NoList"),NoArray(i)&",")>0 then session("NoList")=session("NoList")&NoArray(i)&","
  	next
  end if
  for i = 0 to ubound(split(session("NoList"), ","))
    NoList=NoList&"'"&trim(split(session("NoList"),",")(i))&"'," 
  next
  NoList=left(NoList,len(NoList)-4)
end function
function ProductList()
  response.write "<table width=""100%"" cellspacing=""0"">" &_
				 "<form action=""ProductBuy.asp"" method=""POST"" name=""check"">" &_
				 "<tr><td height=""30"" colspan=""2"">您选购的产品如下：</td></tr>"
  if Nolist()="" then
    response.write "<tr><td align=""center"" bgcolor=""#dddddd"">未选择任何产品</td></tr>"
  else
    dim rs,sql
    set rs = server.createobject("adodb.recordset")
    sql="select * from NwebCn_Products where ProductNo in ("&NoList()&") order by id"
    rs.open sql,conn,1,1
    while not rs.eof
      response.write "<tr>" &_
      "<td width=""13%"" bgcolor=""#dddddd""><input type=""CheckBox"" name=""ProductNo"" value="""&rs("ProductNo")&""" Checked></td>" &_
      "<td width=""87%"" bgcolor=""#dddddd""><a href=ProductView.asp?ID="&rs("ID")&" title="""&rs("ProductName")&""">"&rs("ProductName")&"&nbsp;["&rs("ProductNo")&"]</a></td>" &_
      "</tr>"
      Products=Products&rs("ProductName")&"&nbsp;["&rs("ProductNo")&"]<br>"
      rs.movenext
    wend
    response.write "<tr><td height=""40""><input type=""submit"" name=""UpdateOrder"" value=""更新选择""></td><td></td></tr>"
    rs.close
    set rs=nothing
  end if
  response.write "</form></table><br />"
end function

sub MemInfo()
  dim rs,sql
  set rs = server.createobject("adodb.recordset")
  sql="select * from NwebCn_Members where MemName='"&session("MemName")&"'"
  rs.open sql,conn,1,1
  if rs.bof and rs.eof then
    response.write "暂无相关信息"
  else
    mMemID=rs("ID")
	if not rs("RealName")="" then
	  mRealName=rs("RealName")
	else 
	  mRealName=rs("MemName")
	end if
	mSex=rs("Sex")
	mCompany=rs("Company")
	mAddress=rs("Address")
	mZipCode=rs("ZipCode")
	mTelephone=rs("Telephone")
	mFax=rs("Fax")
	mMobile=rs("Mobile")
	mEmail=rs("Email")
  end if
  rs.close
  set rs=nothing
end sub
%>
<!--#include file="Foot.asp"-->
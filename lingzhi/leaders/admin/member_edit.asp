<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日10:27:48　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　        　│EMAIL:chenwenj@gmail.com　　　　　　　　　┃
'┃　联系方式　│MSN  :oking@live.com  　　　　　　　　　　┃
'┃　　　　　　│QQ   :168909　ICQ:45318946　　　　　　　　┃
'┃　　　　　　│http://kingchan.net       　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　记    事　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┣━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┫
'┃南京汉中门大街康怡花园汉佳办事处　2004年12月25日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<%call isLogin%>

<%
dim rs,sql,ID
ID=request.querystring("id")
sql="select * from Members where ID="&ID
set rs=conn_access.Execute (sql)
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
   _editor_url = "./HTMLArea";
   _editor_lang = "en";
</script>


<script type="text/javascript" src="HTMLArea/htmlarea.js"></script>

<script type="text/javascript" defer="1">
	//HTMLArea.replace('basic_content')
</script>

<script type="text/javascript" src="../js/check_form.js"></script>
<script language="javascript">
function show_object(dobject){
	var str="";
	for (var element in dobject)
		str=str+element+"="+dobject[element]+"\n";
	document.getElementById("cwj").innerHTML=str;
	//alert(str);
}

function ResetJobTitleSelect(){
	var jtitle = document.getElementById("basic_JobTitle");
	var sel = document.getElementById("Position");
	if(sel.selectedIndex!=0){
		jtitle.value="";
	}
	sel.selectedIndex=0;
}

function JobTitleInput(){
	var jtitle = document.getElementById("basic_JobTitle");
	var sel = document.getElementById("Position");
	if(sel.selectedIndex!=0){
		jtitle.value=sel.value;
	}
	
}

function ResetIndustrySelect(){
	var industry = document.getElementById("basic_Industry");
	var sel = document.getElementById("CategoryId");
	if(sel.selectedIndex!=0){
		industry.value="";
	}
	sel.selectedIndex=0;
}

function IndustryInput(){
	var industry = document.getElementById("basic_Industry");
	var sel = document.getElementById("CategoryId");
	if(sel.selectedIndex!=0){
		industry.value=sel.value;
	}
	
}
</script>
</head>

<body>
<!--#include file="head.asp"-->
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="157" valign="top">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border="0">
      <TBODY>
        <TR>
          <TD vAlign=top>
		    <!--#include file="menu.asp"--></TD>
        </TR>
      </TBODY>
    </TABLE>
	</td>
    <td width="84%" rowspan="2" valign="top"><table width="100%"  border="0" cellspacing="5" cellpadding="5">
      <tr>
        <td>会员资料</td>
      </tr>
      <tr>
        <td align="center"><form name="form1" action="member_save.asp" method="post" onsubmit="return checkForm(this)">
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr>
              <td width="110" align="center" bgcolor="#003366"><span class="bai">Member ID</span></td>
              <td align="left"><input name="LoginId" type="text" id="LoginId" style="width: 208px" value="<%=rs("LoginId")%>" maxlength="20" disabled></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Password</td>
              <td align="left"><input type="password" name="password">(不需要修改的话请留空)</td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Name</td>
              <td align="left"><table border=0 cellpadding=2 cellspacing=0>
                <tbody>
                  <tr>
                    <td >&nbsp;</td>
                    <td width="100" >First Name</td>
                    <td >Last Name</td>
                  </tr>
                  <tr>
                    <td ><input type="radio" name="basic_Title" value="F" <%if rs("Title") = "F" then%>checked="checked"<%end if%>>
                      Ms.
                      <input type="radio" name="basic_Title" value="M" <%if rs("Title") = "M" then%>checked="checked"<%end if%>>
                      Mr.</td>
                    <td><input name="basic_FirstName" value="<%=rs("FirstName")%>" type="text" id="basic_FirstName" style="width: 79px"  size="8" maxlength="100" Title="Please enter FirstName!~20:noChinese!"></td>
                    <td><input name="basic_LastName" value="<%=rs("LastName")%>" type="text" id="basic_LastName" style="width: 79px"  size="8" maxlength="100" Title="Please enter LastName!~20:noChinese!"></td>
                  </tr>
                </tbody>
              </table></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Job Title </td>
              <td align="left"><table border=0 cellpadding=0 cellspacing=0>
                <tr>
                  <td width="190" height="34"><input name="basic_JobTitle" value="<%=rs("JobTitle")%>" type="text" id="basic_JobTitle" style="width: 162px"  size="8" maxlength="32" onMouseDown="ResetJobTitleSelect()">
                    &lt;-</td>
                  <td><select name="Position" id="Position" style="width: 208px" onChange="JobTitleInput()">
                      <option value="0"></option>
                      <option value="Director/CEO/General Manager">Director/CEO/General Manager</option>
                      <option value="Owner/Entrepreneur">Owner/Entrepreneur</option>
                      <option value="Marketing">Marketing</option>
                      <option value="Sales">Sales</option>
                      <option value="Purchasing">Purchasing</option>
                      <option value="Technical & Engineering">Technical &amp; Engineering</option>
                      <option value="Administrative">Administrative</option>
                  </select></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Business Email </td>
              <td align="left"><input name="basic_Email" value="<%=rs("Email")%>" type="text" id="basic_Email" style="width: 208px"  maxlength="100" Title="Please enter Email!~50:email!"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Business Phone </td>
              <td align="left"><table border=0 cellpadding=0 cellspacing=0>
                <tr>
                  <td class=heading4>Country Code</td>
                  <td class=heading4>Area Code <font class="remark">(if any)</font></td>
                  <td class=heading4>Tel Number</td>
                </tr>
                <tr>
                  <td><input name="basic_PhoneCountry" value="<%=rs("PhoneCountry")%>" type="text" id="basic_PhoneCountry" style="width: 98px" size="8" maxlength="8" Title="Please enter Phone Country!~!">
                    - </td>
                  <td><input name="basic_PhoneArea" value="<%=rs("PhoneArea")%>" type="text" id="basic_PhoneArea" style="width: 98px"  size="8" maxlength="8" Title="Please enter Phone Area!~!">
                    - </td>
                  <td><input name="basic_PhoneNumber" value="<%=rs("PhoneNumber")%>" type="text" id="basic_PhoneNumber"  size="15" maxlength="100" Title="Please enter Tel Phone Number!~!"></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Mobile No.</td>
              <td align="left"><input name="basic_Mobile" type="text" id="basic_Mobile" style="width: 208px" value="<%=rs("Mobile")%>" maxlength="100" Title="Please enter Mobile No!~!"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Fax Number </td>
              <td align="left"><table border=0 cellpadding=0 cellspacing=0>
                <tr>
                  <td><input name="basic_FaxCountry" value="<%=rs("FaxCountry")%>" type="text" id="basic_FaxCountry" style="width: 98px" size="8" maxlength="8" Title="Please enter Fax Country!~!">
                    - </td>
                  <td><input name="basic_FaxArea" value="<%=rs("FaxArea")%>" type="text" id="basic_FaxArea" style="width: 98px"  size="8" maxlength="8" Title="Please enter Fax Area!~!">
                    - </td>
                  <td><input name="basic_FaxNumber" value="<%=rs("FaxNumber")%>" type="text" id="basic_FaxNumber"  size="15" maxlength="100" Title="Please enter Fax Number!~!"></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Company Name </td>
              <td align="left"><input name="basic_Company" value="<%=rs("Company")%>" type="text" id="basic_Company" style="width: 208px"  Title="Please enter Company Name!~!"></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Business Address </td>
              <td align="left"><table border=0 cellpadding=0 cellspacing=0>
                <tr>
                  <td class=heading4>Street</td>
                  <td class=heading4>City</td>
                  <td class=heading4>Province/State<font class="remark">(if any)</font></td>
                  <td class=heading4>Country</td>
                </tr>
                <tr>
                  <td nowrap><input name="basic_Address" value="<%=rs("Address")%>" type="text" id="basic_Address" style="width: 98px"  maxlength="250" Title="Please enter Address!~!">
                    - </td>
                  <td nowrap><input name="basic_City" value="<%=rs("City")%>" type="text" id="basic_City" style="width: 98px"  size="8" maxlength="80" Title="Please enter City!~!">
                    - </td>
                  <td><input name="basic_Province" value="<%=rs("Province")%>" type="text" id="basic_Province" maxlength="80" style="width: 110px">
                    - </td>
                  <td><input name="basic_Country" value="<%=rs("Country")%>" type="text" id="basic_Country" maxlength="80" style="width: 98px"></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Zip/Postal Code </td>
              <td align="left"><input name="basic_ZIP" value="<%=rs("ZIP")%>" type="text" id="basic_ZIP" style="width: 208px"  size="8" maxlength="8" ></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Homepage</td>
              <td align="left"><input name="basic_Homepage" value="<%=rs("Homepage")%>" type="text" id="basic_ZIP" style="width: 208px"  maxlength="200" ></td>
            </tr>
            <tr>
              <td align="center" bgcolor="#003366" class="bai">Industry</td>
              <td align="left"><table border=0 cellpadding=0 cellspacing=0>
                <tr>
                  <td width="190" height="34"><input name="basic_Industry" value="<%=rs("Industry")%>" type="text" id="basic_Industry" style="width: 162px"  size="8" maxlength="32" onMouseDown="ResetIndustrySelect()">
                    &lt;-</td>
                  <td><select name="CategoryId" id="CategoryId" style="width: 208px" onChange="IndustryInput()">
                      <option value="0"></option>
                      <option value="Agriculture">Agriculture</option>
                      <option value="Apparel & Fashion">Apparel &amp; Fashion</option>
                      <option value="Automobile">Automobile</option>
                      <option value="Business Services">Business Services</option>
                      <option value="Chemicals">Chemicals</option>
                      <option value="Computer Hardware & Software">Computer Hardware &amp; Software</option>
                      <option value="Construction & Real Estate">Construction &amp; Real Estate</option>
                      <option value="Electronics & Electrical">Electronics &amp; Electrical</option>
                      <option value="Energy">Energy</option>
                      <option value="Environment">Environment</option>
                      <option value="Excess Inventory">Excess Inventory</option>
                      <option value="Food & Beverage">Food &amp; Beverage</option>
                      <option value="Furniture & Furnishings">Furniture &amp; Furnishings</option>
                      <option value="Gifts & Crafts">Gifts &amp; Crafts</option>
                      <option value="Health & Beauty">Health &amp; Beauty</option>
                      <option value="Home Appliances">Home Appliances</option>
                      <option value="Home Supplies">Home Supplies</option>
                      <option value="Industrial Supplies">Industrial Supplies</option>
                      <option value="Minerals, Metals & Materials">Minerals, Metals &amp; Materials</option>
                      <option value="Office Supplies">Office Supplies</option>
                      <option value="Packaging & Paper">Packaging &amp; Paper</option>
                      <option value="Printing & Publishing">Printing &amp; Publishing</option>
                      <option value="Security & Protection">Security &amp; Protection</option>
                      <option value="Sports & Entertainment">Sports &amp; Entertainment</option>
                      <option value="Telecommunications">Telecommunications</option>
                      <option value="Textiles & Leather Products">Textiles &amp; Leather Products</option>
                      <option value="Timepieces, Jewelry, Eyewear">Timepieces, Jewelry, Eyewear</option>
                      <option value="Toys">Toys</option>
                      <option value="Transportation">Transportation</option>
                  </select></td>
                </tr>
              
              </table></td>
            </tr>
          </table>
              <input name="Submit" type="submit" class="button" value="保存"> 
          <input name="return" type="button" class="button" id="return" onClick="location='member_list.asp'" value="返回">
		  <input type="hidden" name="table" value="Members">
		  <input type="hidden" name="returnPage" value="<%=Request.ServerVariables("URL")%>?id=<%=ID%>">
		  <input type="hidden" name="id" value="<%=ID%>">
        </form></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="bottom"><IMG src="img/left_end.gif" width="157" height="160" border="0"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
<%
set rs=nothing
%>

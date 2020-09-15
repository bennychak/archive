<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月25日21:01:19 　　　　　　　　　　┃
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
'┃广州中山大道上社棠雅苑    		 2005年1月25日21:01:13 ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>
<!--#include file="../admin/includes/config.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="all" name="robots">
<meta name="author" content="amay@amay-jewelry.com,Amay">
<meta name="Copyright" content="AMAY JEWELRY">
<title>AMAY JEWELRY</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
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
<div id="cwj"></div>
<!--#include file="head.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="page_toper">
  <tr>
    <td><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="250"><img src="images/register_title.gif" width="172" height="52"></td>
          <td class="limap"><!--#include file="link_bar.asp"--></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100" style="padding:10px 0 0 0 "><form name="form1" method="post" action="register_save.asp" onSubmit="return checkForm(this)">
                    <table width="650" border="0" cellpadding="4" cellspacing="0" id="form" style="float:left">
                      <tr>
                        <th>* Choose a Member ID:</th>
                        <td><input name="LoginId" type="text" id="LoginId" style="width: 208px" Title="Please enter Member ID!~20:noChinese!" value="" maxlength="20">
                          <br />
                          <font class="remark">4 to 20 characters (A-Z, a-z, 0-9, no space)</font> <br />
                          <font class="limit"> Please click &quot;Check ID&quot; to avoid duplication.</font> </td>
                      </tr>
                      <tr>
                        <th width="30%">* Password: </th>
                        <td><input name="UserPassword" type="password" id="UserPassword" style='width: 208px' Title="Please enter password!~20:noChinese!">
                          <br />
                          <font class="remark">4 to 20 characters (A-Z, a-z, 0-9, no space)</font></td>
                      </tr>
                      <tr>
                        <th>* Confirm Password:</th>
                        <td><input name="re_UserPassword" type="password" id="re_UserPassword" style="width: 208px" Title="Please enter Confirm Password!~20:noChinese!">                        </td>
                      </tr>
                      <tr>
                        <th><br />
                          * Name:</th>
                        <td><table border=0 cellpadding=2 cellspacing=0>
                            <tbody>
                              <tr>
                                <td >&nbsp;</td>
                                <td width="100" >First Name</td>
                                <td >Last Name</td>
                              </tr>
                              <tr>
                                <td ><input type="radio" name="basic_Title" value="F">
                                  Ms.
                                  <input type="radio" name="basic_Title" value="M" checked="checked">
                                  Mr.</td>
                                <td><input name="basic_FirstName" type="text" id="basic_FirstName" style="width: 79px" value="" size="8" maxlength="100" Title="Please enter FirstName!~20:noChinese!"></td>
                                <td><input name="basic_lastName" type="text" id="basic_lastName" style="width: 79px" value="" size="8" maxlength="100" Title="Please enter LastName!~20:noChinese!"></td>
                              </tr>
                            </tbody>
                          </table></td>
                      </tr>
                      <tr>
                        <th>* Job Title:</th>
                        <td><table border=0 cellpadding=0 cellspacing=0>
                            <tr>
                              <td width="190" height="34"><input name="basic_JobTitle" type="text" id="basic_JobTitle" style="width: 162px" value="" size="8" maxlength="32" onMouseDown="ResetJobTitleSelect()">
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
                        <th>* Business Email:</th>
                        <td><input name="basic_Email" type="text" id="basic_Email" style="width: 208px" value="" maxlength="100" Title="Please enter Email!~50:email!">
                          <br>
                          Important: A valid email is required for customers to contact you.</td>
                      </tr>
                      <tr>
                        <th><br />
                          * Business Phone:</th>
                        <td><table border=0 cellpadding=0 cellspacing=0>
                            <tr>
                              <td class=heading4>Country Code</td>
                              <td class=heading4>Area Code <font class="remark">(if any)</font></td>
                              <td class=heading4>Tel Number</td>
                            </tr>
                            <tr>
                              <td><input name="basic_PhoneCountry" type="text" id="basic_PhoneCountry" style="width: 98px" value="1" size="8" maxlength="8" Title="Please enter Phone Country!~!">
                                - </td>
                              <td><input name="basic_PhoneArea" type="text" id="basic_PhoneArea" style="width: 98px" value="" size="8" maxlength="8" Title="Please enter Phone Area!~!">
                                - </td>
                              <td><input name="basic_PhoneNumber" type="text" id="basic_PhoneNumber" value="" size="15" maxlength="100" Title="Please enter Tel Phone Number!~!"></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr>
                        <th>* Mobile No.:</th>
                        <td><input name="basic_Mobile" type="text" id="basic_Mobile" style="width: 208px" value="" maxlength="100" Title="Please enter Mobile No!~!"></td>
                      </tr>
                      <tr>
                        <th>* Fax Number:</th>
                        <td><table border=0 cellpadding=0 cellspacing=0>
                            <tr>
                              <td><input name="basic_FaxCountry" type="text" id="basic_FaxCountry" style="width: 98px" value="1" size="8" maxlength="8" Title="Please enter Fax Country!~!">
                                - </td>
                              <td><input name="basic_FaxArea" type="text" id="basic_FaxArea" style="width: 98px" value="" size="8" maxlength="8" Title="Please enter Fax Area!~!">
                                - </td>
                              <td><input name="basic_FaxNumber" type="text" id="basic_FaxNumber" value="" size="15" maxlength="100" Title="Please enter Fax Number!~!"></td>
                            </tr>
                          </table>
                          <font class="limit">Notice:</font> <font class="remark">If you do not have a fax number, please enter N/A in each field.</font></td>
                      </tr>
                      <tr>
                        <th>* Company Name:</th>
                        <td><input name="basic_Company" type="text" id="basic_Company" style="width: 208px" value="" Title="Please enter Company Name!~!">
                          <br />
                          <font class="remark">The full name of your registered company</font></td>
                      </tr>
                      <tr>
                        <th><br />
                          * Business Address:</th>
                        <td><table border=0 cellpadding=0 cellspacing=0>
                            <tr>
                              <td class=heading4>Street</td>
                              <td class=heading4>City</td>
                              <td class=heading4>Province/State<font class="remark">(if any)</font></td>
                              <td class=heading4>Country</td>
                            </tr>
                            <tr>
                              <td nowrap><input name="basic_Address" type="text" id="basic_Address" style="width: 98px" value="" maxlength="250" Title="Please enter Address!~!">
                                - </td>
                              <td nowrap><input name="basic_City" type="text" id="basic_City" style="width: 98px" value="" size="8" maxlength="80" Title="Please enter City!~!">
                                - </td>
                              <td><input name="basic_Province" type="text" id="basic_Province" maxlength="80" style="width: 110px">
                              - </td>
                              <td><input name="basic_Country" type="text" id="basic_Country" maxlength="80" style="width: 98px"></td>
                            </tr>
                          </table></td>
                      </tr>
                      <th>Zip/Postal Code:</th>
                        <td><input name="basic_ZIP" type="text" id="basic_ZIP" style="width: 208px" value="" size="8" maxlength="8" ></td>
                      <tr>
                        <th>Homeage</th>
                        <td><input name="basic_Homepage" type="text" id="basic_Homepage" style="width: 208px" value="" size="8" maxlength="8" ></td>
                      </tr>
                      <tr>
                        <th>* Industry:</th>
                        <td><table border=0 cellpadding=0 cellspacing=0>
                          <tr>
                            <td width="190" height="34"><input name="basic_Industry" type="text" id="basic_Industry" style="width: 162px" value="" size="8" maxlength="32" onMouseDown="ResetIndustrySelect()">
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
                          <tr>
                            <td height="34" colspan="2"><font class="remark">Select the business' primary industry focus</font></td>
                            </tr>
                        </table>
                                                  <br />                          </td>
                      </tr>
                      <tr>
                        <td colspan="2">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="30" colspan="2" bgcolor="#F5F5F5" style="padding-left:20px">* Required information</td>
                      </tr>
                      <tr>
                        <td height="40" colspan="2" align="center"><span style="padding:5px 0 5px 0">
                          <input type="submit" name="Submit" value="Complete" style="width:100px">
                        </span></td>
                      </tr>
                    </table>
                    <table width="300" height="300" border="0" cellpadding="3" cellspacing="3" style="float:left">
                      <tr>
                        <td valign="top"> <p><strong>If you are AMAY member, you can enjoy that</strong></p>
                        <ul>
						<li>You can find more new designs .</li>
                        <li>You can make order on line.</li>        
                        <li>You can get the detailed quotation of all products.</li>
						</ul>
                        
                        <p>So you must fill in your really individual name、company name、Email address and Tel Numble. And after our validation you can start enjoying the benefits and services we provide. </p>
                        </td>
                      </tr>
                    </table>
                </form></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="footer.asp"-->
</body>
</html>

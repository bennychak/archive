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
<%call memberIsLogin%>
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
          <td width="250" align="center"><img src="images/product_order_title.gif" width="220" height="52"></td>
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
                <td height="100" style="padding:10px 0 0 0 "><form name="form1" method="post" action="product_order_save.asp" onSubmit="return checkForm(this)">
                    <table width="760" border="0" cellpadding="4" cellspacing="0" id="form">
                      <tr>
                        <th>* Name:</th>
                        <td><input name="basic_Name" type="text" id="basic_Name" style="width: 208px" maxlength="50" Title="Please enter Name.~50:!"></td>
                      </tr>
                      <tr>
                        <th width="30%"><table border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td>
                              <input name="has_image" type="checkbox" id="has_image" value="True"></td>
                            <td>Image:</td>
                          </tr>
                        </table></th>
                        <td><input name="purchasingImage" type="file" id="purchasingImage" size="50"></td>
                      </tr>
                      <tr>
                        <th>*Detail:</th>
                        <td><span class="td" style="border-left: 17px solid #FFF; border-right: 17px solid #FFF; ">
                          <textarea name="basic_Request" cols="70" rows="5" id="basic_Request" Title="Please enter Detail.~!"></textarea>
                        </span></td>
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

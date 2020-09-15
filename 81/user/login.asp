<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>会员登陆</title>
<link href="../css/default2.css" rel="stylesheet" type="text/css" />
</head>

<body bgcolor="#eeeeee" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<form id="user_login" name="user_login" method="post" action="">
  <table width="180" height="90" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="30" colspan="2" background="../image/bg2.gif" class="diary_title">会员登陆（开发中...）</td>
    </tr>
    <tr>
      <td height="20" valign="middle">名称</td>
      <td valign="middle"><label>
        <input name="user_name" type="text" id="user_name" size="20" maxlength="20" style="width:140px;height:15px;" />
      </label></td>
    </tr>
    <tr>
      <td height="20" valign="middle">密码
      <label> </label></td>
      <td valign="middle"><label>
        <input name="user_password" type="password" id="user_password" size="20" maxlength="20" style="width:140px;height:15px;" />
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="20"><label>
        <input type="submit" name="Submit" value="登陆" />
        <input name="reg" type="submit" id="reg" value="注册" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>

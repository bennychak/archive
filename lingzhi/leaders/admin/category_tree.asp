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
<!--#include file="includes/md5.asp"--> 

<%call isLogin%>
<%

'If license<>LicenseSN() Then
'	response.Write "序列号错误！"
'	response.end
'End if

dim layer,tree,sql,sqll,rs,rss,rsArray,rows,rowNum
sql="select ID,Name,ParentID from Category where ParentID=0 order by id "
set rs=server.CreateObject("adodb.recordset")
set rss=server.CreateObject("adodb.recordset")

rs.open sql,conn_access,1,1
rowNum=rs.RecordCount
If rowNum>0 Then
	rsArray=rs.GetRows()
	For rows=0 to ubound(rsArray,2)
		sqll="select ID,Name,ParentID from Category where ID="&rsArray(0,rows)&" order by id "
		rss.open sqll,conn_access,1,1
		tree=tree&buildTreeJS(rss.GetRows())
		rss.close
	Next
End if

rs.close
set rs=nothing
set rss=nothing

function buildTreeJS(resultArray)
	dim sql,resultSubArray,rows,output,resultSub,rowNum
	rowNum=ubound(resultArray,2)
	For rows=0 to rowNum
		sql = "select ID,Name,ParentID from Category where ParentID="&resultArray(0,rows)&" order by id"
		set resultSub=server.CreateObject("adodb.recordset")
		resultSub.open sql,conn_access,1,1
		
		If resultSub.RecordCount>0 Then
			output=output&"tree.add(new dNode({id: '"&resultArray(0,rows)&"',caption: '"&resultArray(1,rows)&"',onClick: 'selectNode(this.id)'}),"&resultArray(2,rows)&");"&VbCrlf

			resultSubArray=resultSub.GetRows()
			
			output=output&buildTreeJS(resultSubArray)
		else
			output=output&"tree.add(new dNode({id: '"&resultArray(0,rows)&"',caption: '["&resultArray(0,rows)&"] "&resultArray(1,rows)&"',onClick: 'selectNode(this.id)'}),"&resultArray(2,rows)&");"&VbCrlf
		End if
		
		resultSub.close
		set resultSub=nothing
	Next
	buildTreeJS = output
end function

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" none="noindex,nofollow">
<title><%=manageCenterTitle%></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/dftree.css">
<script type="text/javascript" src="../js/dftree.js"></script>
<script type="text/javascript" src="../js/operationtree.js"></script>
<script language="javascript">
<!--

tree = new dFTree({name: 'tree'});
tree.add(new dNode({id: '0',caption: '产品分类列表',onClick: 'selectNode(this.id)'}),-1); //root node
<%=tree%>

-->
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
        <td><table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr align="left">
              <td width="100" align="right" bgcolor="#CCCCCC" >分类管理</td>
              <td align="right" ><input name="add_class" type="button" class="button" id="add_class" value="添加分类" onClick="location='category_edit.asp'"></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td align="center">
          <br>
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse" >
            <tr align="left">
              <td align="left" >
			  <script language="javascript">
				<!--
				tree.draw();
				-->
			  </script>
			  </td>
              </tr>
          </table>
		  <br>
          <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse">
            <tr align="left">
              <td width="40" align="right" bgcolor="#CCCCCC" >操作</td>
              <td ><input name="edit" type="submit" disabled="true" class="button" id="edit_node" value="编辑" onClick="operationNode(this.name)">
                  <input name="del" type="submit" disabled="true" class="button" id="del_node" value="删除" onClick="operationNode(this.name)"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="bottom"><img src="img/left_end.gif" width="157" height="160" border="0"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>

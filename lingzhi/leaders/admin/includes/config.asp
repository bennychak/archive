<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年8月25日23:32:42 　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　        　│EMAIL:chenwenj@gmail.com　　　　　　　　　┃
'┃　联系方式　│MSN  :oking@live.com  　　　　　　　　　　┃
'┃　　　　　　│QQ   :168909　ICQ:45318946　　　　　　　　┃
'┃　　　　　　│http://kingchan.net       　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　　　　　　│今天旧历生日，有意外的开心，又有持续的悲伤┃
'┃　记    事　│　　　　　　　　　　　　　　　　　　　　　┃
'┃　　　　　　│　　　　　　　　　　　　　　　　　　　　　┃
'┣━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┫
'┃广州天河区上社            2005年8月25日23:33:42         ┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<%'option explicit%>
<%
'on error resume next
Response.Charset="UTF-8"
'开始时间
dim pageStartTime
pageStartTime=timer()
%>
<!--#include file="conn_access.asp"--> 
<!--#include file="function.asp"-->
<%

'后台记录列表笔数
dim managePageSize
managePageSize=15

'前台记录列表笔数
dim pageSize
pageSize=12

'前台产品列表记录行数
dim productsListLine
productsListLine=4

'新闻图片保存位置
dim newsImagePath
newsImagePath="images\news\"

'分类图片保存位置
dim categoryImagePath
categoryImagePath="images\category\"

'产品图片保存位置
dim productImagePath
productImagePath="images\product\"

'产品订做图片保存位置
dim purchasingImagePath
purchasingImagePath="images\purchasing\"

'上传图片最大字节数
dim upLoadImageSize
upLoadImageSize="1024000"

'发送邮件SMTP服务器
dim smtpServer
smtpServer="mail.domain.com"
'身份验证的用户名
mailUserName="admin@domain.com" 
'身份验证的密码
mailPassword="password" 

'通知邮箱
mailNoteFromName="admin"
mailNoteRecipient="admin@domain.com"
mailNoteRecipientMan = "admin"




dim manageCenterTitle,manageFootText
manageCenterTitle="管理中心"

manageFootText="Copy Right King. &copy; 2004-2006 http://kingchan.net"

'---------------------系统状态---------------------
'订单状态
dim orderStatusCN(3)
orderStatusCN(0)="待审"
orderStatusCN(1)="处理中"
orderStatusCN(2)="报价"
orderStatusCN(3)="结束"


dim newsCategory(4)
newsCategory(1)="消息公告"
newsCategory(2)="一般新闻"

dim license
license="23843063228a193d"

%>
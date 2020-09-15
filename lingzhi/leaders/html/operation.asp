<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月2日21:22:42  　　　　　　　　　　┃
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
'┃广州中山大道棠雅苑      　          2005年1月1日16:02:03┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="../admin/includes/config.asp"-->
<!--#include file="../admin/includes/systemsg.asp"--> 
<!--#include file="../admin/includes/md5.asp"--> 
<!--#include file="../admin/includes/cart.asp"-->

<%
dim action,sql,rs
dim cartKit
dim itemNumberArray,itemIDArray,itemNumberList,itemIDList
dim i,itemCount
dim onlyForMember
dim returnPage

returnPage=request("returnPage")

onlyForMember=false

set cartKit=new Cart
action=request("action")

set rs=server.CreateObject("adodb.recordset")

Select Case (action) 
	'取回密码
	Case "getPassword"
		dim userName,userEmail,newPassword,mailContent
		userCode=request("UserCode")
		userCode = Replace(userCode,"'","''")
		userEmail=request("Email")
		userEmail = Replace(userEmail,"'","''")
		sql="select [Email],ID from Members where LoginId='"&userCode&"' and Email='"&userEmail&"'"
		set rs=conn_access.Execute (sql)
		
		If NOT (rs.eof and rs.bof) Then
			newPassword=createID(rs("ID"))
			sql="update Members set UserPassword='"&md5(newPassword)&"' where ID="&rs("ID")
			conn_access.Execute (sql) 
			set jMail=Server.CreateOBject( "JMail.Message")
			
			JMail.Logging = true
			JMail.silent = true
			JMail.From = ""
			JMail.FromName = ""
			JMail.AddRecipient rs("Email")
			
			JMail.Subject = "Amay Jewelry"
			mailContent="Your password of member in Amay jewelry has been reseted.your new password is:"&newPassword
			JMail.Body = mailContent

			if not JMail.Send(smtpServer) then
				mailError = "<pre>" & JMail.log & "</pre>"
				response.Write mailError
			end if

			set JMail=nothing

			call msgPage(11,"gourl","default.asp",5)
		Else
			call msgPage(12,"gourl","forget_password.asp",2)
		End if
		
		set rs=nothing
		

	'下单
	Case "inquireNow"
		dim dictObject,item,orderID,orderPara,norderID,orderCount
		call checkLogin
		orderCount = cartKit.getNumberCount()
		' response.End()
		sql="insert into Orders (UserID,[Count]) values("&session("userID")&","&orderCount&")"
		'response.write sql&"<br>"
		conn_access.Execute (sql)
		sql="select top 1 ID from Orders where userID="&session("userID")&" order by InDate Desc"
		orderID=cint(conn_access.Execute (sql)(0))
		norderID = createID(orderID)
		
		sql="update Orders set [Code]='"&norderID&"' where ID="&orderID
		conn_access.Execute (sql)
		set dictObject=cartKit.getDictionary
		For each Item in dictObject
			orderPara=split(server.HTMLEncode(Item),"|")
			'产品ID|有没有磁性|有没有电镀|大小
			sql="insert into OrderProducts (OrderID,ProductID,Magnetics,Platings,[Sizes],[Quantity]) values("&orderID&","&orderPara(0)&",'"&orderPara(1)&"','"&orderPara(2)&"','"&orderPara(3)&"',"&dictObject.Item(Item)&")"
			'response.write sql&"<br>"
			conn_access.Execute (sql)
		Next
		'response.end
		set dictObject=nothing
		cartKit.delAllItem()

		
		'发送邮件通知
		fromName = "Amay Jewelry"
		subject = "新订单通知"
		mailBody = "收到订单号为: "&norderID&" 的订单，数量是："&orderCount&"<br>"
		mailBody = mailBody&"请点击<a href='http://www.amay-jewelry.com/admin/' target='_blank'>这里</a>登录后台查看"
		recipient = "ellis_lee82@msn.com"
		'recipient = "chenwenj@gmail.com"
		recipientMan = "Ellis"
		
		call sendMail(fromName, subject, mailBody, recipient, recipientMan, "html")
				
		call msgPage(9,"gourl","myorders.asp",5)
		
	'修改订购数量
	Case "modifyOrderNumber"

		call checkLogin

		itemIDList=request("itemIDList")
		itemIDList = Replace(itemIDList,"'","''")
		itemNumberList=request("itemNumberList")
		itemNumberList = Replace(itemNumberList,"'","''")
		
		itemNumberArray=split(itemNumberList,", ")
		itemIDArray=split(itemIDList,", ")
		
		itemCount=ubound(itemNumberArray)
		
		For i=0 to itemCount
			cartKit.modifyItem itemIDArray(i),itemNumberArray(i)
		Next
		
		Response.Redirect "mycart.asp"	

	'选购
	Case "orderProduct"
	
		call checkLogin
		
		dim orderProductID,magnetic,plating,size,quantity
		dim array_index
		magnetic=request("magnetic")
		plating=request("plating")
		size=request("size")
		quantity=request("quantity")
		
		orderProductID=request("orderProductID")
		
		If NOT isNE(orderProductID) Then
			'产品ID|有没有磁性|有没有电镀|大小
			array_index = orderProductID&"|"&magnetic&"|"&plating&"|"&size
			cartKit.addItem array_index,quantity
		End if
		
		'Response.Redirect returnPage
		Response.Redirect "mycart.asp"
		
	Case "delOrderProduct"
		
		call checkLogin

		dim delOrderProductID
		delOrderProductID=request("delOrderProductID")
		cartKit.delItem delOrderProductID
		Response.Redirect "mycart.asp"		

	'会员登录
	Case "memberLogin"
	
		dim userCode,userPassword
		userCode=request("LoginId")
		userCode = Replace(userCode,"'","''")
		userCode=Lcase(userCode)

		userPassword=request("UserPassword")
		userPassword = Replace(userPassword,"'","''")
		userPassword=md5(userPassword)

		sql="select ID,LoginId,FirstName,LastName,WhatsNew from Members where LoginId='"&userCode&"' and UserPassword='"&userPassword&"'"
		rs.open sql,conn_access,1,1
		
		If not isNE(request("hreferer")) Then
			backURL = request("hreferer")
		Else 
			backURL = "default.asp"
		End If
		
		If cint(rs.RecordCount)>0 Then
			session("userCode")=rs("LoginId")
			session("lastName")=rs("LastName")
			session("firstName")=rs("FirstName")
			session("whatsNew")=rs("WhatsNew")&""

			session("userID")=rs("ID")
			session("memberlogined")=true
			sql="update Members set LastLogin='"&now&"' where LoginId='"&session("userCode")&"'"
			conn_access.Execute (sql) 
			
			call msgPage(3,"gourl",backURL,2)
		else
			call msgPage(4,"gourl",backURL,5)
		End if
		
	'退出登录
	Case "memberLogout"
		Session.Abandon
		call msgPage(5,"gourl","default.asp",2)
	Case Else
End Select


call freeObject

Sub freeObject
	set rs=nothing
	set cartKit=nothing
End Sub

Sub checkLogin
	If NOT session("memberlogined") Then
		call freeObject
		call msgPage(7,"back","",-1)
	End if
End Sub



%>
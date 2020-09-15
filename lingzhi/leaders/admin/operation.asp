<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2004年12月25日20:40:38　　　　　　　　　　┃
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
'┃南京江东北路联通新时空大厦      　2004年12月25日10:24:11┃
'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
%>

<!--#include file="includes/config.asp"--> 
<%call isLogin%>
<%
dim action,ID,table,sql,rs
dim fileName
dim productID
dim urlPara

action=request.querystring("action")
ID=request.querystring("ID")

If ID="" or (not IsNumeric(ID)) Then response.end

urlPara=request.querystring("urlPara")

set rs=server.CreateObject("adodb.recordset")

Select Case (action)
	'报价单设置是否有效
	Case "setQuotationLevelStatus"
		status=request.querystring("status")
		sql="update QuotationLevel Set [Status]="&status&" where ID="&ID
		'response.write sql
		set rs=conn_access.Execute (sql)
		call msgPage(7,"gourl",Request.ServerVariables("HTTP_REFERER"),1)
		
	'根据订单生成
	Case "createQuto"
		orderID = request.querystring("id")
		
		now_str = FormatDateTime(now,0)
		dateString = Replace(now_str,"-","")
		dateString = Replace(dateString," ","")
		dateString = Replace(dateString,":","")
		dateString = Replace(dateString,"上午","")
		dateString = Replace(dateString,"下午","")
		hash = md5(dateString)
		
		sql="insert into Quotation (InDate) values(now())"
		
		
		sql="insert into QuotationProducts(QuotationID,ProductID,NewPrice,QDescription) "
		sql=sql&"select "&ID&" as QuotationID,ID as ProductID,Price as NewPrice,QDescription from Products "
		sql=sql&"where ID in(select ProductID from OrderProducts where OrderID="&orderID&")"
	
	
	'设置whatsnew权限
	Case "setWhatsnewLevel"
		whatsnew=request.querystring("whatsnew")
		urlPara=request.querystring("urlPara")
		sql="update Members Set WhatsNew="&whatsnew&" where ID="&ID
		set rs=conn_access.Execute (sql)
		call msgPage(7,"gourl",Server.URLEncode("member_list.asp?"&urlPara),1)	
	
	'删除报价单权限
	Case "delQuotationLevel"
		sql="delete from QuotationLevel where ID="&ID
		conn_access.Execute (sql)
		call msgPage(1,"gourl",Request.ServerVariables("HTTP_REFERER"),1)	
	
	'报价单添加权限
	Case "addQuotationLevel"
		
		sql="insert into QuotationLevel(MemberID,QuotationID) "
		sql=sql&"select ID as MemberID, "&ID&" as QuotationID from Members where 1=1 "
			
		levelString=request.form("levelString")
		
		idArray=split(levelString,",")
		
		num=UBound(idArray,1)
		
		'如果是所有分类
		If UCase(levelString)="ALL" Then 
			num = -1
		End If
		
		Set reg=new RegExp
		'不区分大小写的
		reg.IgnoreCase=true
		'搜索整个字符串
		reg.Global=True
		reg.Pattern="\[(.+?)\]"
						
		'response.write num
		For i=0 to num
			tmp=trim(idArray(i))
			'处理最后的逗号
			splitString = ","
			
			If IsNumeric(tmp) Then
				str=str&tmp&splitString
			Else
				strNO=strNO&"'"&tmp&"'"&splitString
			End If
		Next
		set reg=nothing
		
		If not isNE(str) Then
			str=mid(str,1,len(str)-1)
			sql=sql&"and ID in("&str&") "
		End If
		
		If not isNE(strNO) Then
			strNO=mid(strNO,1,len(strNO)-1)
			sql=sql&"and [LoginID] in("&strNO&") "
		End If
		
		
		conn_access.Execute (sql)
		
		call msgPage(7,"gourl",Request.ServerVariables("HTTP_REFERER"),1)

	
	'复制产品
	case "copyProduct"
		sql="insert into Products([CategoryID],[Name],[Description],[NO],[Simage],[Bimage],[InDate],[Plating],[Size],[Stone],[Magnetic],[Qqmini],[Material],[QqminiNumber],[PlatingSelect],[Price],[QDescription]) "
		sql=sql&"select [CategoryID],[Name],[Description],[NO],[Simage],[Bimage],now(),[Plating],[Size],[Stone],[Magnetic],[Qqmini],[Material],[QqminiNumber],[PlatingSelect],[Price],[QDescription] from Products where ID="&ID
		'response.write sql
		'response.end
		conn_access.Execute(sql)
		
		sql="select top 1 ID from Products order by ID Desc"
		NID=cint(conn_access.Execute (sql)(0))

		sql="insert into Products([CategoryID],[Name],[Description],[NO],[Simage],[Bimage],[InDate],[Plating],[Size],[Stone],[Magnetic],[Qqmini],[Material],[QqminiNumber],[PlatingSelect],[Price],[QDescription],[ProductParentID]) "
		sql=sql&"select [CategoryID],[Name],[Description],[NO],[Simage],[Bimage],now(),[Plating],[Size],[Stone],[Magnetic],[Qqmini],[Material],[QqminiNumber],[PlatingSelect],[Price],[QDescription],"&NID&" from Products where ProductParentID="&ID
		conn_access.Execute (sql)
			
		response.redirect "product_edit.asp?action=edit&id="&NID&"&urlPara="
	'设置产品价钱
	case "setProductPrice"
		price=request.querystring("newPrice")
		sql="update Products Set [Price]='"&price&"' where ID="&ID
		'response.write sql
		'response.end
		set rs=conn_access.Execute (sql)
		'call msgPage(7,"gourl",Request.ServerVariables("HTTP_REFERER"),1)	
		response.end	
	
	'设置报价单价钱
	case "setQuotationProductPrice"
	
		'response.write "1"
		
		price=request.querystring("newPrice")
		sql="update QuotationProducts Set [NewPrice]='"&price&"' where ID="&ID
		'response.write sql
		'response.end
		set rs=conn_access.Execute (sql)
		'call msgPage(7,"gourl",Request.ServerVariables("HTTP_REFERER"),1)	
		response.end
	
	'清空报价单产品
	case "clearQuotationProducts"
		sql="delete from QuotationProducts where QuotationID="&ID
		conn_access.Execute (sql)
		call msgPage(7,"gourl","quotation_products_list.asp?QuotationID="&ID,1)	
	
	'删除报价单产品
	case "delQuotationProducts"
		sql="delete from QuotationProducts where ID="&ID
		conn_access.Execute (sql)
		
		'更新产品个数
		sql="select count(*) as Products from QuotationProducts where QuotationID="&ID
		set rs=conn_access.Execute (sql)
		products=rs("Products")
		set rs=nothing
		sql="update Quotation set [Products]="&products&" where ID="&ID
		conn_access.Execute (sql)
				
		call msgPage(7,"gourl",Request.ServerVariables("HTTP_REFERER"),1)
	'报价单添加产品
	Case "addQuotationProduct"
		Set reg=new RegExp
		'不区分大小写的
		reg.IgnoreCase=true
		'搜索整个字符串
		reg.Global=True
		
		
		sql="insert into QuotationProducts(QuotationID,ProductID,NewPrice,QDescription) "
		sql=sql&"select "&ID&" as QuotationID,ID as ProductID,Price as NewPrice,QDescription from Products where 1=1"
		
		productString=request("productString")
		
		idArray=split(productString,",")
		
		num=UBound(idArray,1)
		
		'如果是所有分类
		If UCase(productString)="ALL" Then 
			num = -1
		End If
		
		reg.Pattern="{(.+?)}"
		If reg.test(productString) Then
			productString=reg.replace(productString,"$1")
			sql=sql&"and [NO] like '%"&productString&"%'"
			num = -1
		End If


		reg.Pattern="\[(.+?)\]"
						
		'response.write num
		For i=0 to num
			tmp=trim(idArray(i))
			'处理最后的逗号
			splitString = ","
			
			'If i < num Then
			'	splitString = ","
			'else
			'	splitString = ""
			'End If			
			
			If IsNumeric(tmp) Then
				str=str&tmp&splitString
			Else
				'判断是否分类
				If reg.test(tmp) Then
					categoryID=reg.replace(tmp,"$1")
					strCategory=strCategory&categoryID&splitString
				Else
					strNO=strNO&"'"&tmp&"'"&splitString
				End If
			End If
		Next
		set reg=nothing
		
		If not isNE(str) Then
			str=mid(str,1,len(str)-1)
			sql=sql&"and ID in("&str&") "
		End If
		
		If not isNE(strNO) Then
			strNO=mid(strNO,1,len(strNO)-1)
			sql=sql&"and [NO] in("&strNO&") "
		End If
		
		If not isNE(strCategory) Then
			strCategory=mid(strCategory,1,len(strCategory)-1)
			sql=sql&"and CategoryID in("&strCategory&") "
		End If

		'response.write sql
		'response.end
			
		conn_access.Execute (sql)
		
		'更新产品个数
		sql="select count(*) as Products from QuotationProducts where QuotationID="&ID
		set rs=conn_access.Execute (sql)
		products=rs("Products")
		set rs=nothing
		sql="update Quotation set [Products]="&products&" where ID="&ID
		conn_access.Execute (sql)
		
		call msgPage(7,"gourl",Request.ServerVariables("HTTP_REFERER"),1)
		'response.write sql
		
		'response.end
	'报价单设置是否有效
	Case "setQuotationStatus"
		status=request.querystring("status")
		sql="update Quotation Set [Status]="&status&" where ID="&ID
		'response.write sql
		set rs=conn_access.Execute (sql)
		call msgPage(7,"gourl",Request.ServerVariables("HTTP_REFERER"),1)
		
	'删除报价单
	Case "delQuotation"
		'sql="delete from QuotationProducts where QuotationID="&ID
		'conn_access.Execute (sql)
		sql="delete from Quotation where ID="&ID
		conn_access.Execute (sql)
		call msgPage(1,"gourl","quotation_list.asp",1)
		
	'设置最新
	Case "setNewProduct"
		dim isNew
		isNew=request.querystring("isNew")
		
		sql="update Products Set IsNew="&isNew&" where ID="&ID
		set rs=conn_access.Execute (sql)
		call msgPage(7,"gourl",Server.URLEncode("product_list.asp?"&urlPara),1)

	'设置推荐
	Case "setRecommendProduct"
		dim recommend
		recommend=request.querystring("recommend")
		urlPara=request.querystring("urlPara")
		sql="update Products Set Recommend="&recommend&" where ID="&ID
		set rs=conn_access.Execute (sql)
		call msgPage(7,"gourl",Server.URLEncode("product_list.asp?"&urlPara),1)

	'删除订做
	Case "delProductorder"
		dim productorderImage
		'删除文件
		sql="select [Image] from Purchasing where ID="&ID
		set rs=conn_access.Execute (sql)
		productorderImage=rs("Image")
		set rs=nothing
		If NOT isNE(productorderImage) Then
			delFile(Server.Mappath("../"&purchasingImagePath&productorderImage))
		End if
		
		'删除记录
		sql="delete from Purchasing where ID="&ID
		conn_access.Execute (sql)
		call msgPage(1,"gourl","productorder_list.asp",1)
	'删除订单
	Case "delOrder"
		sql="delete from Orders where ID="&ID
		conn_access.Execute (sql)
		call msgPage(1,"gourl","order_list.asp",1)
	'结束订单
	Case "completeOrder"
		sql="update Orders set Status=3 where ID="&ID
		conn_access.Execute (sql) 
		call msgPage(5,"gourl","order_list.asp",1)
	'删除会员
	Case "delMember"
		sql="delete from Members where ID="&ID
		conn_access.Execute(sql)
		call msgPage(1,"gourl","member_list.asp",1)
	
	'删除产品小图
	Case "delProductSimage"
		fileName=request.querystring("filename")
		delFile(Server.Mappath("../"&productImagePath&fileName))
		sql="update Products set Simage='' where ID="&ID
		conn_access.Execute (sql)
		call msgPage(4,"gourl","product_edit.asp?ID="&ID,1)

	'删除产品大图
	Case "delProductBimage"
		fileName=request.querystring("filename")
		delFile(Server.Mappath("../"&productImagePath&fileName))
		sql="update Products set Bimage='' where ID="&ID
		conn_access.Execute (sql)
		call msgPage(4,"gourl","product_edit.asp?ID="&ID,1)

	'删除包装图片
	Case "delPackingImage"
		productID=request.querystring("productID")
		fileName=request.querystring("filename")
		delFile(Server.Mappath("../"&productImagePath&fileName))
		sql="update Packing set [image]='' where ID="&ID
		conn_access.Execute (sql)
		call msgPage(4,"gourl",Server.URLEncode("packing_edit.asp?productID="&productID&"&ID="&ID),1)

	'删除分类图片
	Case "delCategoryImage"
		fileName=request.querystring("filename")
		delFile(Server.Mappath("../"&categoryImagePath&fileName))
		sql="update [Category] set [Image]='' where ID="&ID
		conn_access.Execute (sql)
		call msgPage(4,"gourl","category_edit.asp?ID="&ID,1)

	'删除新闻图片
	Case "delNewsImage"
		fileName=request.querystring("filename")
		delFile(Server.Mappath("../"&newsImagePath&fileName))
		sql="update News set [Image]='' where ID="&ID
		conn_access.Execute (sql)
		call msgPage(4,"gourl","news_edit.asp?action=edit&id="&ID,1)
		
	'删除分类
	Case "delcategory"
		sql="select ID,[Image] from Category where ID="&ID
		rs.open sql,conn_access,1,1

		If NOT (rs.eof and rs.bof) Then
			delCategory rs.GetRows()
		End if
		
		rs.close
		call msgPage(1,"gourl","category_tree.asp",1)
	'删除产品
	Case "delproducts"
		Dim dtype
		dtype=request.querystring("type")
		delProduct(ID)
		call msgPage(1,"gourl",Server.URLEncode("product_list.asp?"&urlPara),1)

	'删除新闻
	Case "delnews"
		'删除文件
		dim newsImage
		sql="select [Image] from News where ID="&ID
		set rs=conn_access.Execute (sql)
		newsImage=rs("Image")
		set rs=nothing
		If NOT isNE(newsImage) Then
			delFile(Server.Mappath("../"&newsImagePath&newsImage))
		End if

		sql="delete from news where ID="&ID
		conn_access.execute(sql)
		call msgPage(1,"gourl","news_list.asp",1)
	
	'注销退出
	Case "logout"
		Session.Abandon
		response.redirect "default.asp"
		response.end
	Case Else
End Select

set rs=nothing



%>
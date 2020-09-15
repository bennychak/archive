<%
'┎────────────────────────────┒
'┃　　　　 ※EASY CMS企业网站管理系统V1.0 final   　　　　┃
'┣━━━━━━┯━━━━━━━━━━━━━━━━━━━━━┫
'┃　作    者　│陈文杰　　　　　　　　　　　　　　　　　　┃
'┠──────┼─────────────────────┨
'┃　最后修改　│2005年1月8日23:24:38  　　　　　　　　　　┃
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

<%
dim systemMessage(20)
systemMessage(0)="成功保存!"
systemMessage(1)="删除成功!"
systemMessage(2)="登陆失败，请检查输入是否正确!"
systemMessage(3)="图片上传失败!"
systemMessage(4)="图片删除成功!"
systemMessage(5)="操作成功!"
systemMessage(6)="邮件发送成功!"
systemMessage(7)="设置成功!"
systemMessage(8)="报价单信息已经保存,现在跳转到报价单产品管理页面!"


dim webMessage_CN(20)
webMessage_CN(0)="""{userCode}""用户名，已经存在，请选择其它用户名!"
webMessage_CN(1)="再次输入的密码不一致!"
webMessage_CN(2)="注册成功，请返回首页登录!"
webMessage_CN(3)="登陆成功，请返回首页!"
webMessage_CN(4)="登陆失败，请检查输入的用户名和密码是否正确!"
webMessage_CN(5)="你已经退出登录，请返回!"
webMessage_CN(6)="你的个人资料修改成功，请返回!"
webMessage_CN(7)="对不起，只有会员才可以浏览此页面，如果你是会员请先登陆，如果不是会员请注册!<br>"
webMessage_CN(8)="对不起，只有会员才可以操作，如果你是会员请先登陆，如果不是会员请注册!<br>"
webMessage_CN(9)="订单已经成功提交，我们会尽快回复!<br>"
webMessage_CN(10)="提交成功，我们会尽快回复!<br>"
webMessage_CN(11)="你的新密码已经发到你的邮箱，请查收!"
webMessage_CN(12)="提交失败，你所提供的信息不正确!"

dim webMessage(20)
webMessage(0)="""{userCode}"" has exist please select another!"
webMessage(1)="!"
webMessage(2)="Register successful!"
webMessage(3)="Login successful!!"
webMessage(4)="Login failing,please check you user name and password!"
webMessage(5)="You logouted!"
webMessage(6)="Modify successful!"
webMessage(7)="Sorry this only for member!<br>"
webMessage(8)="Sorry this only for member!<br>"
webMessage(9)="Submit successful!<br>"
webMessage(10)="Submit successful!!<br>"
webMessage(11)="Your new password has areadly send to your mailbox!"
webMessage(12)="Submit error!!"

webMessage(13)="You don't have permission to access this page."
webMessage(14)="Please Email to our company to let us pass your ID."

%>

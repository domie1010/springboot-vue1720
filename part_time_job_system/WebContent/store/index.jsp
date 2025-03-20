<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="UTF-8">
		<title>商城:</title>
            <link rel="stylesheet" href="layui/css/layui.css"  media="all">
            <link href="store/css/style.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="jsp/js/jquery.js"></script></head>
            <script src="layer/layer.js"></script>
            <script src="layui/layui.js" charset="utf-8"></script>
    </head>
	<body>
	
			<div id="header">
	           		<a href="client/toStorePage" id="logo"><img src="store/images/logo.gif" width="310" height="114" alt="" title=""></a>
					<ul class="navigation">
						<li class="active"><a href="client/toStorePage">首页</a></li>
						<li><a href="client/toPetPage">爱犬挑选</a></li>
						<li><a href="news/clientToNewsPage">宠物资讯</a></li>
						<li><a href="client/clientToDogIntroduce">狗狗介绍</a></li>
						<li><a href="client/clientToWelcomDog">热门犬种</a></li>
						<li><a href="client/toClientAppointList">成交记录</a></li>
                        <!-- <li><a href="contact.html">血统查询</a></li>
                        <li class="active"><a href="contact.html">关于我们</a></li>
                        <li class="active"><a href="contact.html">留言板</a></li> -->
					</ul>
			</div>
			
			<div id="body">
			
					<div class="banner">&nbsp;</div>
					
			       <div id="content">
				   
				        <div class="content">
                          <li><label><font color="red" size="5">热门犬种</font></label></li>
								<ul>
                                <c:forEach items="${list}" var="dogType" varStatus="vs">
                <c:set var="index" value="${index+1}" />
									<li>
										<h2>${dogType.dogTypeName}</h2>
										<p>${dogType.dogIntroduce}</p>
									</li>
									</c:forEach>
								</ul>
						</div>
					    <div id="sidebar">
                             
								<div class="search" id="search">
                                <c:choose>
                             <c:when test="${ empty account }">
                                    <form action="client/main" method="POST" id="loginForm">
									<input type="text" name="account" style="height:9px;"id="account" placeholder="请输入用户名" value="">
                                    <input type="text" name="password" style="height:9px;" id="password" placeholder="请输入密码"value="">
                                    <button id="sub"  class="layui-btn layui-btn-small layui-btn-radius layui-btn-danger" >登录</button>   
                                    </form>
                             </c:when> 
                              <c:otherwise>
                             <p>欢迎 您${account}</p>
                              </c:otherwise>    
                               </c:choose>
                                   </div>
                                 
                                <div class="section"> 								
									<ul class="navigation">
										<li class="active"><a href="javascript:void(0);">购物向导</a></li>
									</ul>
									
									<div class="aside">
									 <div>
										<div>
											 <ul>
												<p>1.本网站外提供宠物购买服务</p>
											    <p>2.请在登录后进行宠物购选</p>
                                                <p>3.下单后请等待管理员处理您的订单</p>
                                             </ul>
                                              <a id="reg" href="javascript:void(0);"  class="layui-btn layui-btn-small layui-btn-radius layui-btn-danger" >注册</a>   
										</div>
									 </div>
									</div>
								</div>
								
					    </div>
				   </div>
			</div>
			
			<div id="footer">
					<div id="footnote">
						<div class="section">
						   &copy; 2017 <a href="index.html">宠物商城</a>. All Rights Reserved.
                           <a href="index.html" style="margin-left:20px;">    关于我们</a>
						</div>
					</div>
			</div>
			
	
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
		
	</body>
    <script type="text/javascript">
    $(function(){
    	
        $("#reg").on('click',function(){
            
            layer.open({
                type: 2,
                area: ['700px', '530px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'jsp/client_reg.jsp'
              });
            
            
        });
    	$("#sub").on('click',function(){
    		$("#loginForm").submit();
    	});
    	
    });
    
    
    </script>
</html>
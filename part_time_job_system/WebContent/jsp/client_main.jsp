<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>H5模版:</title>
        <link type="text/css" rel="stylesheet" href="jsp/resource/css/framework.css" />
        <link type="text/css" rel="stylesheet" href="jsp/resource/css/main.css" />
        
	</head>
	<body>
	<div class="page">
<!--header begin-->
<header>
	<div class="bigcontainer">
		<div id="logo">
			<a href="./">大学生兼职管理中心</a>
		</div>
		<div class="user">
            <div class="ui inline labeled icon top right pointing dropdown">
                <img class="ui avatar image" src="jsp/resource/images/avatar-default.gif">
			欢迎，${account}用户名
			<i class="dropdown icon"></i>
				<div class="menu">
					<a class="item" href="jsp/client_main.jsp"><i class="reply mail icon"></i>返回首页</a>
                    <a class="item" href="jsp/bussiness_pas_mod.jsp"><i class="reply mail icon"></i>修改密码</a>
					<a class="item" href="user/loginOut"><i class="sign out icon"></i>注销登录</a>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- the main menu-->
<div class="ui teal inverted menu">
	<div class="bigcontainer">
		<div class="right menu">
			<a class="active item" href="jsp/client_main.jsp"><i class="home icon"></i>首页</a>
			<a class="item" href="client/toClientAppointList"><i class="sitemap icon"></i>兼职信息</a>
            <a class="item" href="client/toClientOwnAppointList"><i class="sitemap icon"></i>我的兼职</a>
			<a class="item" href="client/toModPage?clientIsbn=${account}"><i class="info icon"></i>个人信息设置</a>
		</div>
	</div>
</div>

<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div class="pageHeader">
			<div class="segment">
				<h3 class="ui dividing header">
  					<i class="large home icon"></i>
  					<div class="content">
    					首页
    				<div class="sub header">快速查看和编辑</div>
  					</div>
				</h3>
			</div>
		</div>
       <div class="ui small message" id="showApiKey">
      </div>
	<!--device list-->
	<div class="ui three column grid" id="indexList" style="margin-left:450px;">
		<div class="row">
			<div class="column">
				<div class="ui blue segment">
					<a href="./device.html" class="content">
						<h4 class="deviceName">大学生兼职系统</h4>
						<p class="deviceId">欢迎您,${account}!</p>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!--footer begin-->
<script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/framework.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/alert.js"></script>
<script>
	$(document).ready(function(){
		$('a#copy-apiKey').zclip({
			path:'resource/javascript/ZeroClipboard.swf',
			copy:function(){return $('input#apiKey').val();}
		});

		$('.ui.dropdown')
			.dropdown();
	});
</script>
		
	</body>
</html>
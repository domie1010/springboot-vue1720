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
        <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link href="jsp/Wopop_files/style_log.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="jsp/Wopop_files/style.css">
        <link rel="stylesheet" type="text/css" href="jsp/Wopop_files/userpanel.css">
        <link rel="stylesheet" type="text/css" href="jsp/Wopop_files/jquery.ui.all.css">
        <script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
        <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
    
	</head>
<body class="login" mycollectionplug="bind">
<div class="login_m">
<div class="login_logo"><img src="jsp/Wopop_files/logo.png" width="196" height="46"></div>
<div class="login_boder">

<div class="login_padding" id="login_model">
<form action="user/main" method="post">
  <h2>USERNAME</h2>
  <label>
    <input type="text" id="account" name="account" class="txt_input txt_input2" onfocus="if (value ==&#39;Your name&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;Your name&#39;}" value="admin">
  </label>
  <h2>PASSWORD</h2>
  <label>
    <input type="password" name="password" id="password" name="password" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="admin">
  </label>
  <div class="rem_sub" style="margin-left:10px;">
    <label>
      <a href="javascript:void(0);" id="reg"><font clolor="blue">用户注册</font></a>
      <input type="submit" class="sub_button" name="button" id="button"  value="登录" style="opacity: 0.7;">
    </label>
  </div>
  </form>
</div>

<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>

<div id="forget_model" class="login_padding" style="display:none">
<br>

   <h1>Forgot password</h1>
   <br>
   <div class="forget_model_h2">(Please enter your registered email below and the system will automatically reset users’ password and send it to user’s registered email address.)</div>
    <label>
    <input type="text" id="usrmail" class="txt_input txt_input2">
   </label>

 
  <div class="rem_sub">
  <div class="rem_sub_l">
   </div>
    <label>
     <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now" style="opacity: 0.7;">
     　　　
     <input type="submit" class="sub_button" name="button" id="denglou" value="Return" style="opacity: 0.7;">　　
    
    </label>
  </div>
</div>






<!--login_padding  Sign up end-->
</div><!--login_boder end-->
</div><!--login_m end-->
 <br> <br>


</body>
<script type="text/javascript">
$(function(){
  
    $("#reg").on('click',function(){
        
        layer.open({
            type: 2,
            area: ['800px', '530px'],
            fixed: false, //不固定
            maxmin: true,
            content: 'jsp/user_add.jsp'
          });
        
        
    });
    
});



</script>
</html>
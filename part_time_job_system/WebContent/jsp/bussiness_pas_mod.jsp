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
         <link type="text/css" rel="stylesheet" href="jsp/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="jsp/resource/css/main.css" />
	<script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="jsp/resource/javascript/new_action.js"></script>
    <script type="text/javascript" src="jsp/resource/javascript/framework.js"></script>
    <script src="layer/layer.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
       <link href="jsp/resource/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        function toSub(){
            //经过一切处理之后，在Action或者Servlet中跳转到Message.jsp显示提示信息内容
            //模仿操作！
            window.location.href="message.html";
        }

    </script>
    </head>
	<body>
	<div class="page">
<!--header begin-->
<header>
	<div class="bigcontainer">
		<div id="logo">
		</div>
		<div class="user">
		</div>
	</div>
</header>
<!-- the main menu-->

<div class="ui teal inverted menu fluid">

</div>
<!--the main content begin-->
	<div class="container">
	<!--the content-->
    
		<div class="ui grid">
			<!--the vertical menu-->
			<div class="four wide column">
				<div class="verticalMenu">
					<div class="ui vertical pointing menu fluid">
  						<a class="active teal item" href="javascript:void(0);">
							<i class="terminal icon"></i>密码修改
  						</a>
					</div>
				</div>
			</div>

            <div class="twelve wide column">
                    <div class="two fields" style="margin-bottom:20px;">
                    	<div class="field">
                            <label>账号:</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="account" name=account >
                            </div>
                        </div>
                    </div>
                    <div class="two fields" style="margin-bottom:20px;">
                    	<div class="field" id="email">
                        	<label>密码</label>
                            <div class="ui small left icon input">
                            	<i class="mail icon"></i>
                                <input type="text" id="password" name="password" >
                            </div>
                        </div>
                    </div>
                    
                    <div class="two fields" style="margin-bottom:20px;">
                        <div class="field" id="email">
                            <label>新密码</label>
                            <div class="ui small left icon input">
                                <i class="mail icon"></i>
                                <input type="text" id="new_password" name="new_password" >
                            </div>
                        </div>
                    </div>
                    
                     <div class="two fields" style="margin-bottom:20px;">
                        <div class="field" id="email">
                            <label>确认密码</label>
                            <div class="ui small left icon input">
                                <i class="mail icon"></i>
                                <input type="text" id="confirm_pas" name="confirm_pas">
                            </div>
                        </div>
                    </div>
    
                    </div>

                    <button class="ui small blue button" style="margin-left:400px;" id="save" type="button">保存</button>
                
			</div>
		</div>
	</div>

</div>
<script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/new_action.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/framework.js"></script>
</body>
       <script type="text/javascript">
    $(function(){
 
        $("#save").on("click",function(){
            if($("#account").val()==""||$("#account").val()==null){
    	    	layer.tips('账号不能为空', '#account');
    	    	return false;
    	    }
    		if($("#password").val()==""||$("#password").val()==null){
    			layer.tips('密码不能为空', '#password');
    	    	return false;
    	    }
    		if($("#new_password").val()==""||$("#new_password").val()==null){
    			layer.tips('新密码不能为空', '#new_password');
    			return false;
    		}
    		if($("#confirm_pas").val()==""||$("#confirm_pas").val()==null){
    			layer.tips('确认密码不能为空', '#confirm_pas');
    		return false;
    		}
    		if($("#new_password").val()!=$("#confirm_pas").val()){
    			$("#new_password").val("");
    			$("#confirm_pas").val("");
    			layer.msg('密码不一致，请重新输入');
    		    return false;
    		}
    		
    		$.ajax({
    	 	       type:"POST",
    	 	       ansyc:false,
    	 	       url: "user/modifyUserPass",
    	 	       data:{account:$("#account").val(),
    	 	    	   password:$("#password").val(),
    	 	    	  newPassword:$("#new_password").val()
    	 	       },
    	 	       dataType:"json",
    	 	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
    	 	       success:function(data){
    	 	    	 if(data.flag){
    	 	    		 layer.msg('修改成功！', {icon: 1});
    		    		   setTimeout(function(){
    		    			   window.parent.location.href="user/loginOut";
    		    			 }, 2000);
    	 	    	 }else{
    	 	    		layer.msg('用户名密码不对！', {icon: 1});
    	 	    	 }
    	 	       }
    	 	}); 

       });
        
        
        
    });
    
    
    
    </script>
</html>
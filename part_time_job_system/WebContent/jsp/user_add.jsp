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
    </head>
	<body>
				<form class="ui form fluid vertical segment" action="/user/new_action" id="addForm" name="form" method="post">
	          <div class="twelve wide column"style="margin-left:200px ;">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large add icon"></i>
  							<div class="content">
    							用户注册
  							</div>
						</h3>
					</div>
				</div>
                    <div class="two fields">
                    	<div class="field">
                            <label>密码</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="password" name="password">
                            </div>
                        </div>
                    </div>
                    
                     <div class="two fields">
                        <div class="field">
                            <label>确认密码</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="newPas" name="newPas">
                            </div>
                        </div>
                    </div>
                     <div class="two fields">
                        <div class="field">
                            <label>用户名</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="name" name="name">
                            </div>
                        </div>
                    </div>
                    
                    <div class="field" style="width:200px;">
                        <label>角色</label>
                            <select class="form-control" id="userLimit" name="userLimit"  style="width:200px;">
                                <option value="bussiness">商家</option>
                                <option value="client">学生</option>
                            </select>
                    </div>
                    
                    <button class="ui small blue button" id="save" type="button">保存</button>
                </form>
			</div>
		
	</body>
    <script type="text/javascript">
    $(function(){
    	var pas=$("#password").val();
    	var newPas=$("#newPas").val();
    	
    	
    });
    
    </script>
       <script type="text/javascript">
    $(function(){
        $("#save").on("click",function(){
        	var pas=$("#password").val();
        	var newPas=$("#newPas").val();
        	var userLimit=$("#userLimit").val();
        	var name=$("#name").val();
        	if(pas==null||pas==""){
        		 layer.msg('密码不能为空！');
        		 return false;
        	}
        	if(newPas==null||newPas==""){
       		 layer.msg('确认密码不能为空！');
       		 return false;
        	}
        	if(newPas!=pas){
          		 layer.msg('密码不一致！');
          		return false;
           	}
        	if(name==""||name==null){
         		 layer.msg('名字不能为空！');
         		return false;
          	}
        	
        layer.msg('拼命上传中,请稍后....', {
              icon: 16
              ,shade: 0.45
            });
        setTimeout(function(){
        	 $.ajax({
  		       type:"POST",
  		       ansyc:false,
  		       url: "user/addUser",
  		       data:{password:pas,
  		    	     userLimit:userLimit,
  		    	     name:name
  		       },
  		       dataType:"json",
  		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
  		       success:function(data){
  		    	   var info="注册成功！<br>";
  		    	   info=info+"分配到的账户为:"+data.user.account+"<br>";
  		    	 layer.alert(info, {
  		    		  skin: 'layui-layer-molv' //样式类名
  		    		  ,closeBtn: 0
  		    		}, function(){
  		    		   parent.layer.closeAll();
  		    		});
  		       }
  		});
          layer.closeAll('loading');
        }, 2000);
         

       });
        
        
        
    });
    
    
    
    </script>
</html>
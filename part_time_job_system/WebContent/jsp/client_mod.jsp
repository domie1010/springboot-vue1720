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
<form action="client/modifyClientByIsbn" method="POST" id="modForm">
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
							<i class="terminal icon"></i> 信息修改
  						</a>
					</div>
				</div>
			</div>

            <div class="twelve wide column">
                    <div class="two fields" style="margin-bottom:20px;">
                    	<div class="field">
                            <label>编号:</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="clientIsbn" name="clientIsbn" readonly="readonly" value="${client.clientIsbn}">
                            </div>
                        </div>
                    </div>
                    <div class="field" style="margin-bottom:20px;">
                        <label>性别</label>
                            <select class="form-control" id="clientSex" name="clientSex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                    </div>
                    <div class="two fields" style="margin-bottom:20px;">
                    	<div class="field" id="email">
                        	<label>姓名</label>
                            <div class="ui small left icon input">
                            	<i class="mail icon"></i>
                                <input type="text" id="clientName" name="clientName" value="${client.clientName }">
                            </div>
                        </div>
                    </div>
                    
                         <div class="two fields" style="margin-bottom:20px;">
                        <div class="field" id="email">
                            <label>年龄</label>
                            <div class="ui small left icon input">
                                <i class="mail icon"></i>
                                <input type="text" id="clientAge" name="clientAge" value="${client.clientAge }">
                            </div>
                        </div>
                    </div
    
                    </div>
</form>
                    <button class="ui small blue button" style="margin-left:70px;"type="submit">保存</button>
                
			</div>
		</div>
	</div>
<input type="hidden"id="sex" value="${client.clientSex }">
</div>
<script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/new_action.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/framework.js"></script>
</body>
       <script type="text/javascript">
    $(function(){
    	var  sex=$("#sex").val();
    	$("#clientSex").val(sex);
        $("#save").on("click",function(){
        layer.msg('拼命上传中,请稍后....', {
              icon: 16
              ,shade: 0.45
            });
        setTimeout(function(){
          layer.closeAll('loading');
          $("#modForm").submit();
        }, 2000);
         

       });
        
        
        
    });
    
    
    
    </script>
</html>
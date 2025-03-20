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
	<div class="container" style="margin-left:300px;">
	<!--the content-->
    
		<div class="ui grid" >
			<!--the vertical menu-->
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large edit icon"></i>
  							<div class="content">
    							订单信息修改
  							</div>
						</h3>
					</div>
				</div>
				<!--the user_profile form-->
				<div class="ui form vertical segment" style="margin-left:200px;">
					<form action="appoint/modifyAppointByIsbn"  id="modForm" method="post">
					<div class="two fields">
                    	<div class="field">
                            <label>订单号</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="appointId" name="appointId" value="${appoint.appointId}" readonly="readonly">
                            </div>
                        </div>
                    </div>
                	<div class="two fields">
                    	<div class="field">
                          
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="hidden" id="postAccount" name="postAccount" value="${appoint.postAccount}">
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                        <div class="field">
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="hidden" id="acceptAccount" name="acceptAccount" value="${appoint.acceptAccount}">
                            </div>
                        </div>
                    </div>
						<div class="field">
							<label>兼职信息</label>
							<textarea rows="5" cols="25" style="width:430px;" id="appointContent" name="appointContent">${appoint.appointContent}</textarea>
						</div>
				</div>
			</div>
		</div>
     </form>  
                    <button class="ui small blue button" style="margin-left:300px;"type="button" id="save">保存</button>
                
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
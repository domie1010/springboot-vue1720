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
					<form action="bussiness/addAssment"  id="modForm" method="post">
					<div class="two fields">
                    	<div class="field">
                            <label>订单号</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="appointId" name="appointId" readonly="readonly" value="${appoint.appointId}">
                            </div>
                        </div>
                    </div>
                	<div class="two fields">
                    	<div class="field">
                            <label>商家账号</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                   <select id="businessAssment" name="businessAssment" class="form-control">
                                <option value="暂无评价">暂无评价</option>
                                <option value="一星">一星</option>
                                <option value="二星">二星</option>
                                <option value="三星">三星</option>
                                <option value="四星">四星</option>
                                <option value="五星">五星</option>
                                </select>
                            </div>
                        </div>
                    </div>
					
				</div>
			</div>
		</div>
     </form>  
                    <button class="ui small blue button" style="margin-left:300px;"type="button" id="save">保存</button>
                
			</div>
		</div>
	</div>
    <input type="hidden" id="ba" value="${appoint.businessAssment }">
</div>
<script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/new_action.js"></script>
<script type="text/javascript" src="jsp/resource/javascript/framework.js"></script>
</body>
       <script type="text/javascript">
    $(function(){
    	var assment=$("#ba").val();
    	$("#businessAssment").val(assment);
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
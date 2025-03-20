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
		<title>H5模版:</title>
         <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link type="text/css" rel="stylesheet" href="jsp/resource/css/framework.css" />
        <link type="text/css" rel="stylesheet" href="jsp/resource/css/main.css" />
        <script type="text/javascript" src="jsp/resource/javascript/jquery.min.js"></script>
        <script type="text/javascript" src="jsp/resource/javascript/framework.js"></script>
        <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
	</head>
	<body>
<div class="page">
<!--header begin-->
<header>
	<div class="bigcontainer">
		<div id="logo">
			<a href="./">大学生兼职中心</a>
		</div>
		<div class="user">
			<div class="ui inline labeled icon top right pointing dropdown">
			<img class="ui avatar image" src="jsp/resource/images/avatar-default.gif">
			欢迎，${account}!
			<i class="dropdown icon"></i>
				<div class="menu">
					<a class="item" href="jsp/main.jsp"><i class="reply mail icon"></i>返回首页</a>
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
			<a class="active item" href="user/main"><i class="home icon"></i>首页</a>
			<a class="item" href="bussiness/toBussinessList"><i class="sitemap icon"></i>商家管理</a>
            <a class="item" href="client/toClientList"><i class="cloud icon"></i>学生信息管理</a>
			<a class="item" href="appoint/toAppointList"><i class="info icon"></i>兼职信息</a>
		</div>
	</div>
</div>
<!--the main content begin-->
	<div class="container" style="margin:0px auto;">
	<!--the content-->
		<div class="ui grid" style="margin-left:200px ;">
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large settings icon"></i>
  							<div class="content">
    							学生信息管理模块
    							<div class="sub header">大学生兼职系统</div>
  							</div>
						</h3>
					</div>
				</div>
                <div class="ui vertical segment" >
						<div  style="margin-left:10px;">
  							<a class="ui small red button" title="删除" href="javascript:void(0);" id="del"><i class="archive icon"></i>删除</a>
							<a class="ui small teal button" href="javascript:void(0);" id="add" title="+提加用户"><i class="cloud download icon"></i>添加操作</a>
  					        <a class="ui small teal button" href="javascript:void(0);" id="mod" title="+提加用户"><i class="cloud download icon"></i>修改操作</a>
                            <a class="ui small teal button" href="javascript:void(0);" id="sel" title="+提加用户"><i class="cloud download icon"></i>查询操作</a>
                             
                             <div class="ui small icon input right">
                             <form action="client/toModPage" id="modForm">
                              <input type="text" name="clientIsbn" id="clientIsbn" placeholder="请输入学生编号">
                             </form>
                              <i class="search icon"></i>
                             </div>
                    </div>
				</div>
                <div id="body">
                
                            <table class="ui basic table">
                                <thead>
                                    <tr style="text-align:center;">
                                    <th style="text-align:center;">编号</th>
                                    <th style="text-align:center;">姓名</th>
                                    <th style="text-align:center;">性别</th>
                                    <th style="text-align:center;">年龄</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">
                                    <c:forEach items="${list}" var="client" varStatus="vs">
                <c:set var="index" value="${index+1}" />
                  <td>${client.clientIsbn }</td>
                  <td>${client.clientName }</td>
                  <td>${client.clientAge }</td>
                  <td>${client.clientSex}</td>
                </c:forEach>
                                </tbody>
                            </table>
            	</div>
                
                
                
                <div class="ui pagination menu" id="demo7">
                   
                </div>

            </div>
		</div>
	</div>
</div>
<!--footer begin-->
<footer>
	<div id="copyrights">
		<div class="inset">
			<div class="bigcontainer">
				<div class="fl">
					<div class="logo"></div>
					<p>&copy;大学生兼职系统</p>
				</div>
			</div>
		</div>
	</div>
</footer>
<script>
    $(document).ready(function(){
		$('.ui.dropdown')
			.dropdown()
        ;

        $('.ok.label')
        .popup({
            content:'这个传感器正常工作。'
        })
        ;

        $('.error.label')
        .popup({
            content:'哎呀，这个传感器异常。'
        })
        ;
	});
</script>
    <script type="text/javascript">
    $(function(){
        $("#mod").on('click',function(){
        	$("#modForm").submit();
        });
        $("#add").on('click',function(){
            
            layer.open({
                type: 2,
                area: ['800px', '530px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'jsp/client_add.jsp'
              });
            
            
        });
        
    });
    
    </script>
<script type="text/javascript">
$(function(){
  	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;
		  
		
	  laypage({
		    cont: 'demo7'
		    ,pages:2
		    ,skip: true
		    ,jump: function(obj, first){
		    	layer.msg('数据加载中', {
		    		  icon: 16
		    		  ,shade: 0.01
		    		});
		    	setTimeout(function(){
		    		  layer.closeAll('loading');
		    			 layer.msg('第 '+ obj.curr +' 页');
		    			 toLimitit(obj.curr);
		    		}, 2000);
		    	 
		    
		    	 
		    }
		  });
	  
	  
	});
  	
    function toLimitit(tag){
        $.ajax({
              type:"POST",
              url: "client/toTargetClientPage",
              ansyc:false,
              data:{Page:tag,
              },
              dataType:"json",
              contentType:"application/x-www-form-urlencoded;charset=utf-8",
              success:function(data){
                  $("#tbody").html("");//清空原来的表格，重新生成表格
                  //alert(data.list.length);
                  for(var i=0;i<data.list.length;i++)
                  {  
                     $("#tbody").append('<tr style=text-align:center; id='+i+'>'); 
                     $("#"+i).append('<td >'+data.list[i].clientIsbn+'</td>');
                     $("#"+i).append('<td>'+data.list[i].clientName +'</td>');
                     $("#"+i).append('<td>'+data.list[i].clientSex +'</td>');
                     $("#"+i).append('<td>'+data.list[i].clientAge +'岁</td></tr>');
                  }
              }
       }); 
   } 
    $("#del").on('click',function(){
		var clientIsbn=$("#clientIsbn").val();
		layer.confirm('是否删除该条信息？', {
			  btn: ['是','否'] //按钮
			}, function(){
				 $.ajax({
				       type:"POST",
				       url: "client/delClientByIsbn",
				       data:{clientIsbn:clientIsbn
				       },
				       dataType:"json",
				       contentType:"application/x-www-form-urlencoded;charset=utf-8",
				       success:function(data){
				    	   if(data.flag){
				    		   layer.msg('删除成功！', {icon: 1});
				    		   setTimeout(function(){
				    			   toLimitit(1);
				    			 }, 2000);
				    		   
				    	   }
				    	   else{
				    		   layer.msg('删除失败!');
				    	   }
				       }
				}); 
			
			});
	});
    $("#sel").on('click',function(){
  		var clientIsbn=$("#clientIsbn").val();
  	//alert("客户信息"+clientIsbn);
 		 $.ajax({
		       type:"POST",
		       ansyc:false,
		       url: "client/getSignalClientByIsbn",
		       data:{clientIsbn:clientIsbn
		       },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   var info="编号:"+data.client.clientIsbn+"<br>";
		    	   info=info+"姓名:"+data.client.clientName+"<br>";
		    	info=info+"年龄:"+data.client.clientAge+"<br>";
		    	info=info+"性别:"+data.client.clientSex+"<br>";
		    	   layer.open({
		    		   type: 0,
		    		   shade: false,
		    		   title: false, //不显示标题
		    		   content: info //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		    		 });
		       }
		});
  	});
	
});

</script>
</body>
	</body>
</html>
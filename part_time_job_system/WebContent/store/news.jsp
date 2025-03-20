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
        <link href="store/css/style.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript" src="jsp/js/jquery.js"></script></head>
            <script src="layer/layer.js"></script>
            <script src="layui/layui.js" charset="utf-8"></script>
	</head>
	<body>
	<div id="header">
<a href="client/toStorePage" id="logo"><img src="store/images/logo.gif" width="310" height="114" alt="" title=""></a>					<ul class="navigation">
					<li class="active"><a href="client/toStorePage">首页</a></li>
						<li><a href="client/toPetPage">爱犬挑选</a></li>
						<li><a href="news/clientToNewsPage">宠物资讯</a></li>
						<li><a href="client/clientToDogIntroduce">狗狗介绍</a></li>
						<li><a href="client/clientToWelcomDog">热门犬种</a></li>
						<li><a href="client/toClientAppointList">成交记录</a></li>
                       </ul>
			</div>
			
			<div id="body" style="margin-left:220px;width:100%;">
			
			       <div id="content" style="width:80%;">
				   
				        <div class="content" >
							<div class="about" >
							     <h2>宠物资讯</h2>
                                 <ul id="ulBody" >
                               <c:forEach items="${list}" var="news" varStatus="vs">
                                      <c:set var="index" value="${index+1}" />
									<li>
										<h2>
                                        <a href="javascript:void(0);"><img src="news/${news.newsImg  }" width="140" height="250" alt="sc.chinaz.com"/> </a>
                                        <a href="javascript:void(0);">标题:${news.newsTitle}</a>
                                        <p style="width:100%;">${news.newsContent}</p>
                                        </h2>
                                        <h3><a href="javascript:void(0);">上传时间:${news.postTime}</a></h3>
                                    </li>
							
                            </c:forEach>
								 </ul>	
                                     <ul class="paginList" style="margin-left:260px;" id="demo7"></ul>
                                						
							</div>
						</div>
				   </div>
			</div>
            <input type="hidden" id="count" value="${count }">
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
	</body>
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
                  url: "news/toTargetNewsPage",
                  data:{Page:tag,
                  },
                  dataType:"json",
                  contentType:"application/x-www-form-urlencoded;charset=utf-8",
                  success:function(data){
                      $("#ulBody").html("");//清空原来的表格，重新生成表格
                      document.getElementById("count").value=data.count;
                      for(var i=0;i<data.list.length;i++)
                        {  
                           $("#ulBody").append('<li><h2 id='+i+'> <a href=javascript:void(0);><img src=news/'+data.list[i].newsImg+' width=140 height=250/></a>'); 
                           $("#"+i).append('<a href=javascript:void(0);>标题:'+data.list[i].newsTitle+'</a>');
                           $("#"+i).append('<p style=width:100%;>'+data.list[i].newsContent+'</p></h2>');
                           $("#ulBody").append('<h3 style=margin-left:420px;><a href=javascript:void(0);>上传时间:'+data.list[i].postTime+'</a></h3></li>');


                        }
                  }
           }); 
       } 
	});
    </script>
</html>
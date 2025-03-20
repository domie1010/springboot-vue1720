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
			
			<div id="body">
			
			       <div id="content">
				         
						 
						 <div class="search" style="text-align:center;">
                         <label for="articles" style="margin-top:20px;"><font size="5">欢迎来到宠物商城</font> </label>
						<!-- 			<input type="text" name="s" value="Find"><button>&nbsp;搜索</button>
									<label for="articles"><input type="radio" id="articles"> Articles</label>
									<label for="products"><input type="radio" id="products" checked> PetMart Products</label>
								 --></div>
								
				        <div class="content">
						        
								<ul id="tbody">
                                                 <c:forEach items="${list}" var="dogType" varStatus="vs">
                                      <c:set var="index" value="${index+1}" />
									<li>
										<a href="javascript:void(0);"><img src="upload/${dogType.dogTypeImg  }" width="140" height="250" alt="sc.chinaz.com" </a>
										<h2>${dogType.dogTypeName}</h2>
											<span><textarea rows="10" cols="20" readonly="readonly">${dogType.dogIntroduce}</textarea></span>
									</li>
                                    </c:forEach>
								</ul>
                                 <ul class="paginList" style="margin-left:70px;" id="demo7">
                             <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
                                </ul>
						</div>
                                <div id="sidebar">
                                <input type="hidden" id="count" value="${count }">
                                                            
                                   <a href="petmart.html"><img src="store/images/discount.jpg" width="300" height="790" alt="sc.chinaz.com" title="sc.chinaz.com"></a>    
                                
                                
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
					<div id="footnote">
						<div class="section">
						   &copy; 2011 <a href="index.html">Petshop</a>. All Rights Reserved.
						</div>
					</div>
			</div>
			
	
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
		
	</body>
    <script type="text/javascript">
    $(function(){
    	
    	layui.use(['laypage', 'layer'], function(){
  		  var laypage = layui.laypage
  		  ,layer = layui.layer;
  	  laypage({
  		    cont: 'demo7'
  		    ,pages:$("#count").val()
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
                  url: "client/toTargetDogTypePage",
                  data:{Page:tag,
                  },
                  dataType:"json",
                  contentType:"application/x-www-form-urlencoded;charset=utf-8",
                  success:function(data){
                      $("#tbody").html("");//清空原来的表格，重新生成表格
                      document.getElementById("count").value=data.count;
                      for(var i=0;i<data.list.length;i++)
                        {  
                           $("#tbody").append('<li id='+i+'> <a href=client/toBuDogPage?dogTypeIsbn='+data.list[i].dogTypeIsbn+';><img src=upload/'+data.list[i].dogTypeImg+' width=140 height=250  </a>'); 
                           $("#"+i).append('<h2>类型名:'+data.list[i].dogTypeName+'</h2>');
                           $("#"+i).append('<span>介绍:<textarea rows=10 cols=16 readonly=readonly>'+data.list[i].dogIntroduce+'</textarea></span></li>');
                        }
                  }
           }); 
       } 
     });
    
    </script>
</html>
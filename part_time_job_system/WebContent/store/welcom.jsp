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
							     <h2><font color="red" size="5">热门犬种</font></h2>
                                 <ul id="ulBody" >
                               <c:forEach items="${list}" var="dog" varStatus="vs">
                                      <c:set var="index" value="${index+1}" />
									<li>
										<h2>
                                        <a href="javascript:void(0);"><img src="upload/${dog.dogType.dogTypeImg  }" width="140" height="250" alt="sc.chinaz.com"/> </a>
                                        <a href="javascript:void(0);">宠物名:${dog.dogType.dogTypeName}</a>
                                        <p style="width:100%;">${dog.dogType.dogIntroduce}</p>
                                        </h2>
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
	});
    </script>
</html>
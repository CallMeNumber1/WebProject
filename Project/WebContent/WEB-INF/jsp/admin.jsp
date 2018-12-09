<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<c:url value="/" var="b" />
	<base href="${b }">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/newslist.css">
    <link rel="stylesheet" href="resources/css/admin.css">
    <title>东北林业大学软件工程专业</title>
</head>
<body>
<div class="content">
    <header class="container-fluid">
        <div class="row">
            <div class="col-md-5 ">
                <img src="resources/images/header-logo.png" alt="">
            </div>
            <div class="col-md-4">
                <div class="input-group search">
                    <input type="text" class="form-control" placeholder="请输入您想了解的信息">
                    <span class="input-group-btn">
                        <button class="btn btn-default">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </div>
            <div class="col-md-3">
                <div class="login">
                	<c:if test="${empty user}">
                		<button class="btn btn-default"  data-toggle="modal" data-target="#login_content">
                        <span class="glyphicon glyphicon-user"></span>
                        登录
                    	</button>
                	</c:if>
                	<c:if test="${!empty user}">
	                	<button class="btn btn-default">
	                        <span class="glyphicon glyphicon-user"></span>
	                        你好，Admin。
	                    </button>
                	</c:if>             
                </div>
            </div>
        </div>
    </header>
<!-- 导航条 -->
<div class="main">
    <nav class="navbar navbar-default">
            <div class="container-fluid">          
              <div class="collapse navbar-collapse" style="padding:0 25px;">
                <ul class="nav navbar-nav">
                  <li><a href="IndexServlet">首页</a></li>
                  <li><a href="html/introduction.html">专业介绍</a></li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >
                        师资队伍 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                      <li><a href="html/teacher-pro.html">教授</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="html/teacher-subpro.html">副教授</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="html/teacher-tutor.html">讲师</a></li>
                    </ul>
                  </li>
                  <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >
                            实验室 <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                          <li><a href="html/lab-925.html">925移动开发实验室</a></li>
                          <li role="separator" class="divider"></li>
                          <li><a href="html/lab-923.html">923互联网实验室</a></li>
                          <li role="separator" class="divider"></li>
                          <li><a href="html/lab-901.html">901教学实验室</a></li>
                        </ul>
                    </li>
                    <li><a href="html/jobguide.html">就业指南</a></li>
                    <li><a href="html/course.html">课程设置</a></li>
                    <li><a href="html/research.html">科学研究</a></li> 
                    <li class="active"><a href="/Project/NewsListServlet">新闻公告</a></li> 
                </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
          </nav>
<!---->
<!-- 二维码 -->
    <div class="share">
        <ul class="nav nav-stacked">
            <li><a id="weixin" data-toggle="popover" data-placement="left"><span class="glyphicon glyphicon-home"></span></a></li>
            <li><a id="email" data-toggle="popover" data-placement="left"><span class="glyphicon glyphicon-envelope"></span></a></li>
        </ul>        
    </div>
    <div class="news-banner">
        <div class="ban">
        </div>
        <div class="m-cur">
            <div class="wp">
                <div class="tit">
                    <span>新闻公告</span>
                </div>
                <div class="cur-l">
                    当前位置:
                    <a href="#">新闻公告</a>
                </div>
            </div>
        </div>
    </div>
    <div class="add-news">
        <div class="wp">
            <button class="btn btn-primary" data-toggle="modal" data-target="#add-content">发布新闻</button>
        </div>
    </div>
<!--add-modal-->
    <div id="add-content" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">
                        <span>&times</span>
                    </button>
                    <h4 class="modal-title">发布新闻</h4>
                </div>
                <div class="modal-body">
                    <form action="AddServlet" class="form-group" method="POST">
                        <div class="form-group">
                            <label for="">新闻标题</label>
                            <input class="form-control" type="text" name="ntitle">
                        </div>  
                        <div class="form-group">
                            <label for="">新闻内容</label>
                            <textarea class="form-control" name="ncontent" cols="30" rows="10"></textarea>
                        </div>
                        <br>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit">发布</button>
                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!---->
<!--update-modal-->
    <div id="update-content" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">
                        <span>&times</span>
                    </button>
                    <h4 class="modal-title">编辑新闻</h4>
                </div>
                <div class="modal-body">
                    <form action="UpdateServlet" class="form-group" method="POST">
                        <div class="form-group">
                            <label for="">新闻标题</label>
                            <input class="form-control" type="text" name="ntitle" id="newTitle">
                        </div>  
                        <div class="form-group">
                            <label for="">新闻内容</label>
                            <textarea class="form-control" name="ncontent" id="newContent" cols="30" rows="10"></textarea>
                        </div>
                        <input id="newId"  name="nid"  type="hidden">
                        <br>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit">修改</button>
                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!---->
    <div class="news-main">
        <div class="m-news">
            <ul class="ul-news">
				<c:forEach items="${newsList}" var="n"><li>
				    <div class="wp">
				        <div class="inner">
				            <div class="time">
				                <strong><fmt:formatDate pattern="dd" value="${n.insertTime}"/></strong>
				                <span><fmt:formatDate pattern="yyyy-MM" value="${n.insertTime}" /></span>
				            </div>
				            <div class="txt">
				                <h4><a href="NewsDetailServlet?id=${n.id}" target="_blank" title="${n.title}">${n.title}</a></h4>
				                <div class="edit">
				                    <a class="btn btn-primary" href="javascript:void(0)" onclick="query(${n.id})" >编辑</a>
				                    <a class="btn btn-danger" href="DeleteServlet?nid=${n.id}">删除</a>
				                </div>
				                <p>${n.content}</p>
				            </div>
				        </div>
				    </div></li>
				</c:forEach>
            </ul>
        </div>
    </div>
</div> <!--main-->
</div> <!--content-->
    <footer class="container-fluid">
        <div class="col-md-1 logo">
            <br><br>
            <img src="resources/images/footer-logo.png" alt="">
        </div>
        <div class="col-md-8 left">
            <p>
				地址：黑龙江省哈尔滨市香坊区和兴路26号    邮编： 150040     电话：0451-82190397
            <br>
            Copyright © 2018 版权所有：东北林业大学软件工程专业
            <br>技术支持：HC</p>
        </div>
        <div class="col-md-3 right">
            <div class="links">

            </div>
        </div>
    </footer>
	
	<script src="resources/js/jquery-3.3.1.min.js"></script>
  <!-- <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
        $("#weixin").popover({
            trigger: 'hover',
            html: true,
            content: "<img src='resources/images/weixin.png'>"
        });
        function query(id) {
            //alert('ajax请求之前'+ id);
            $.ajax({
                url : "GetNewsServlet",
                async : true,
                type : "POST",
                data : {
                    "type" : "query",
                    "id" : id
                },
                // 成功后开启模态框
                success : function(data) {
                	//alert("请求成功");
                	showQuery(data);
                },
                error : function() {
                    alert("请求失败");
                },
                complete: function(data) {
                	
                }, 
                dataType : "json"
            });
        }
     // 查询成功后向模态框插入数据并开启模态框。data是返回的JSON对象
        function showQuery(data) {
    	 	//alert(data.title);
            $("#newId").val(data.id);
            $("#newTitle").val(data.title);
            $("#newContent").val(data.content);
            // 显示模态框
            $('#update-content').modal('show');
        }
    
    </script>
</body>
</html>
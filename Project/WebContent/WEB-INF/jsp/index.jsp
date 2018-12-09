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
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <link rel="stylesheet" href="resources/css/common.css">
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
                    <button class="btn btn-default" data-toggle="modal" data-target="#login_content">
                        <span class="glyphicon glyphicon-user"></span>
                        登录
                    </button>
                </div>
            </div>
<!--modal-->
            <div id="login_content" class="modal fade" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal">
                                <span>&times</span>
                            </button>
                            <h4 class="modal-title">登录</h4>
                        </div>
                        <div class="modal-body">
                            <form action="LoginServlet" class="form-group" method="POST">
                                <div class="form-group">
                                    <label for="">用户名</label>
                                    <input class="form-control" type="text" name="username">
                                </div>  
                                <div class="form-group">
                                    <label for="">密码</label>
                                    <input class="form-control" type="password" name="password">
                                </div>
                                <!-- <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon2">
                                </div> -->
                                <br>
                                <div class="text-right">
                                    <button class="btn btn-primary" type="submit">登录</button>
                                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
<!---->
        </div>
    </header>
<!-- 导航条 -->
<div class="main">
    <nav class="navbar navbar-default">
            <div class="container-fluid">          
              <div class="collapse navbar-collapse" style="padding:0 25px;">
                <ul class="nav navbar-nav">
                  <li class="active"><a href="IndexServlet">首页</a></li>
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
                    <li><a href="/Project/NewsListServlet">新闻公告</a></li> 
                </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
          </nav>
<!---->
<!-- 二维码 -->
    <div class="share">
        <ul class="nav nav-stacked">
            <li><a id="weixin" data-toggle="popover" data-placement="left"><span class="glyphicon glyphicon-home"></span></a></li>
            <!-- <li><a id="topback" href="#"></a></li> -->
            
        </ul>        
    </div>
<!--轮播图(放在container外面，不然会留白)-->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
      
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div style='background-image: url(resources/images/nefu3.jpg);' class="item active banner">
            <div class="carousel-caption">
                <h3>专业风采</h3>
                <p>东北林业大学主楼</p>
            </div>
          </div>
          <div style="background-image: url(resources/images/nefu3.jpg)" class="item banner">
            <div class="carousel-caption">
              <h3>专业风采</h3>
              <p>东北林业大学主楼</p>
            </div>
          </div>
          <div style="background-image: url(resources/images/nefu3.jpg)" class="item banner">
            <div class="carousel-caption">
              <h3>专业风采</h3>
              <p>东北林业大学主楼</p>
            </div>
          </div>
        </div>
    </div>
<!-- 精彩推荐 -->
    <div class="news-events">
        <div class="container-fluid">
            <div class="col-md-6 news-section">
                <div class="news-hd">
                    <div class="row">
                        <div class="col-md-10">
                            <h2><strong><a >精彩推荐</a></strong>
                                <span style="transform: translate(0px, 1.84px); opacity: 0.408;">/ <a >Events</a></span>
                            </h2>
                        </div>
                        <div class="col-md-2 more">
                            <a >更多+</a>
                        </div>
                    </div>
                </div>
                <div class="news-bd">
                    <div class="news-list">
                        <ul>
                        <li class="news-item">
                        <div class="media">
                            <div class="media-left news-img">
                                <a href="#">
                                    <img class="media-object " src="resources/images/nefu.jpg" alt="">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">东北林业大学软件专业与谷歌合建人工智能实验室</h4>
                                <h6>2018.12.04</h6>
                                <p>人总是要有梦想的，万一实现了呢。人总是要有梦想的，万一实现了呢。人总是要有梦想的，万一实现了呢。</p>
                            </div>
                        </div>
                        </li>
                        <li class="news-item">
                            <div class="media">
                                <div class="media-left news-img">
                                    <a href="#">
                                        <img class="media-object " src="resources/images/nefu.jpg" alt="">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">东北林业大学软件专业与谷歌合建人工智能实验室</h4>
                                    <h6>2018.12.04</h6>
                                    <p>人总是要有梦想的，万一实现了呢。人总是要有梦想的，万一实现了呢。人总是要有梦想的，万一实现了呢。</p>
                                </div>
                            </div>
                        </li>
                        <li class="news-item">
                            <div class="media">
                                <div class="media-left news-img">
                                    <a href="#">
                                        <img class="media-object " src="resources/images/nefu.jpg" alt="">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">东北林业大学软件专业与谷歌合建人工智能实验室</h4>
                                    <h6>2018.12.04</h6>
                                    <p>人总是要有梦想的，万一实现了呢。人总是要有梦想的，万一实现了呢。人总是要有梦想的，万一实现了呢。</p>
                                </div>
                            </div>
                        </li>
                        </ul>
                    </div>
                </div>
            </div>
<!-- 公告 -->
            <div class="col-md-6 events-section">
                <div class="news-hd">
                    <div class="row">
                        <div class="col-md-10">
                            <h2><strong><a href="NewsListServlet">新闻公告</a></strong>
                                <span style="transform: translate(0px, 1.84px); opacity: 0.408;">/ <a href="NewsListServlet">News</a></span>
                            </h2>
                        </div>
                        <div class="col-md-2 more">
                                <a href="/Project/NewsListServlet">更多+</a>
                        </div>
                    </div>
                </div>
                <div class="events-bd">
                    <div class="events-list">
                        <ul>
                            <!-- <li><a href="#">
                                <p><span class="glyphicon glyphicon-triangle-bottom"></span> 中共中央印发《中国共产党支部工作条例（试行）》</p>
                                <span>2018.12.04</span>
                            </a></li> -->
                            <c:forEach items="${newsList }" var="n">
                            	<li><a href="NewsDetailServlet?id=${n.id}" target="_blank" title="${n.title }">
                            	<p><span class="glyphicon glyphicon-minus"></span>${n.title }</p>
                            	<span><fmt:formatDate pattern="yyyy-MM-dd" value="${n.insertTime}" /></span>
                            	</a></li>
                            </c:forEach>
                            
                        </ul>
                    </div>
                </div>
            <!--招生信息-->
                <div class="news-hd">
                    <div class="row">
                        <div class="col-md-10">
                            <h2><strong><a href="#">招生信息</a></strong>
                                <span style="transform: translate(0px, 1.84px); opacity: 0.408;">/ <a href="#">News</a></span>
                            </h2>
                        </div>
                        <div class="col-md-2 more">
                                <a href="#">更多+</a>
                        </div>
                    </div>
                </div>
                <div class="events-bd">
                    <div class="events-list">
                        <ul>
                            <li><a href="#">
                                <p><span class="glyphicon glyphicon-triangle-bottom"></span> 中共中央印发《中国共产党支部工作条例（试行）》</p>
                                <span>2018.12.04</span>
                            </a></li>
                            <li><a href="#">
                                    <p><span class="glyphicon glyphicon-minus"></span> 中共中央印发《中国共产党支部工作条例（试行）》</p>
                                    <span>2018.12.04</span>
                            </a></li>
                            <li><a href="#">
                                    <p><span class="glyphicon glyphicon-minus"></span> 中共中央印发《中国共产党支部工作条例（试行）》</p>
                                    <span>2018.12.04</span>
                            </a></li>
                            <li><a href="#">
                                    <p><span class="glyphicon glyphicon-minus"></span> 中共中央印发《中国共产党支部工作条例（试行）》</p>
                                    <span>2018.12.04</span>
                            </a></li>
                            <li><a href="#">
                                    <p><span class="glyphicon glyphicon-minus"></span> 中共中央印发《中国共产党支部工作条例（试行）》</p>
                                    <span>2018.12.04</span>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div> <!--events section-->
<!--其他栏目-->

        </div>
    </div>
    <div class="grid-3">
        <div class="container">
            <h3 class="title-eng">DISPLAY</h3>
            <h3 class="title">
                <span class="line"></span>
                <span class="title-text">学子风采</span>
                <span class="line"></span>
            </h3>
            <div class="img-list">
                <div class="col-md-3">
                    <img src="resources/images/bianjilong.jpg" alt="">
                </div>
                <div class="col-md-3">
                    <img src="resources/images/bianjilong.jpg" alt="">                    
                </div>
                <div class="col-md-3">
                    <img src="resources/images/bianjilong.jpg" alt="">
                </div>
                <div class="col-md-3">
                    <img src="resources/images/bianjilong.jpg" alt="">
                </div>
            </div>
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
                <!-- <span class="link-title">友情链接</span>
                <div class="select-box">
                    <span>&nbsp;东北林业大学</span>
                    <br>
                    <span>哈尔滨工业大学</span>
                    <br>
                    <span>哈尔滨工程大学</span>
                </div> -->
            </div>
        </div>
    </footer>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
        $("#weixin").popover({
            trigger: 'hover',
            html: true,
            content: "<p style='text-align:center;'>扫我了解更多</p><img src='resources/images/weixin.png'>"
        });
        $(".dropdown").mouseover(function () {
            $(".dropdown-menu").addClass("animated fadeIn");
            /* 动画的使用，先引入animate.css*/
        });
        $(".dropdown").mouseleave(function(){
            $(".dropdown-menu").removeClass("animated fadeIn");
        })
    </script>
</body>
</html>
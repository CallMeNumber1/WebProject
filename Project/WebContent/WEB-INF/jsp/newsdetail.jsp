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
                            <form action="" class="form-group">
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
    <div class="news-main">
        <div class="wp">
            <div class="con-row2">
                <div class="col-l">
                    <div class="m-text m-text-b">
                        <h1>${news.title }</h1>
                        <div class="info">
                            <div class="l">
                                <span>日期:<fmt:formatDate pattern="yyyy-MM-dd" value="${news.insertTime}" /></span>
                                <!--<span>文字:王波</span>-->
                            </div>
                            <div class="r"></div>
                        </div>
                        <div class="txt">
                            <div class="new-content">
                                <p>${news.content}</p>
                            </div>
                        </div>
                    </div>    
                </div>
                <div class="col-r">
                
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

            </div>
        </div>
    </footer>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
        $("#weixin").popover({
            trigger: 'hover',
            html: true,
            content: "<img src='resources/images/weixin.png'>"
        });
    </script>
</body>
</html>
</html>
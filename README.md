# Web开发技术项目设计

`2018.12.9`完成

#### 项目要求

- 基于 HTML、CSS、JS、Servlet、JDBC等技术完成以下设计内容。允许并鼓励使用 Bootstrap， easy-ui， flat-ui 等 UI 框架，及轮播，动画，图表，全屏滚动等插件
- 允许并鼓励单人完成

#### 设计内容

- 软件工程专业网站
- 主要考核内容：网站整体设计，用户互交体验
  - HTML 布局， HTML 标签的使用， 应用 CSS 样式增强网站显示效果， 使用 JS 动态改变页面， Servlet 对数据的处理， JDBC 数据库访问等

#### 主要功能

- 网站
  - 主要板块：专业介绍，实验室，教师队伍，就业指南，新闻，公告
  - 要求板块必须包含 2 级内容。例如，专业介绍：专业简介，方向简介等；实验室： 923 创新实验室， 925 移动开发实验室， 923 实验室等 
  - 教师队伍：教授，副教授，讲师等，当点击副教授时，跳转至副教授列表，再次点击某教师时， 跳转至教师详细介绍，内容应尽可能包含文字及图片
  - 新闻公告：主页列出最近 5 个新闻与公告， 显示标题时间等， 要求从数据库中获取，点击标题跳转至信息的详细描述
- 发布信息
  - 管理员登录后，可在后台对新闻公告信息进行增删改查
  - 过滤器，非管理员无法使用管理功能
  - 发布的信息无需包含图片等附件

```c
信息无需分页
除新闻公告外， 教师实验室介绍等可使用静态数据
所有介绍类内容应尽可能包含文字与图片所有文字、图片不必使用真实信息
```

------

#### 整体设计

- 采用MVC的设计模式
- View(前端页面)：
  - 动态jsp页面放在`/WebContent/WEB-INF/jsp/`下
    - WEB-INF为项目安全目录，只能通过`request.getRequestDispathcer`转发进行访问
  - 静态html页面放在`/WebContent/html/`下
  - html（静态）+ jsp（动态）
- Mode(业务逻辑处理)：
  - 用服务提供的方法进行对数据库的增删改查操作
  - `com.service.NewsService包, com.service.impl包`
- Controller(控制器)：
  - 采用Servlet处理对jsp页面的请求，组织所需数据给前端显示
  - `com.controller包`
- 其它
  - 实体类：`com.entity包`
  - 过滤器：`com.filter包`
  - 数据库连接：`com.util包`
  - 静态资源：`WebContent/resources/`
    - 图片、js文件、css文件（包括bootstrap的dist目录）
  - 第三方库：`WebContent/WEB-INF/lib`
    - MySQL数据库驱动、JSTL标签库

#### 前端页面

- 动态页面使用jsp
  - 涉及到使用EL+JSTL动态渲染得到的数据
- 静态页面使用html

- 以bootstrap3为基础，使用了以下组件
  - 栅格式布局
    - `container->row->col-md-*`
    - `container-fluid->row->col-md-*`
  - 导航栏
  - 模态框
    - 实现登录以及管理界面的新闻发布和编辑
  - popover结合js
    - 右下角的社交分享
- 使用了`animate.css`实现动画效果
  - 结合jQuery实现二级下拉菜单fadeIn的动画
- 使用了jQuery的ajax
  - 点击管理界面的新闻编辑按钮上，异步请求获得对应的新闻信息（页面无刷新）

```c
总结
页面的布局排版可以使用bootstrap的栅格或使用flex布局
多个页面公用的如header、nav、footer的代码放到一个公共的css文件如common.css
善用css3的伪类选择器可以增强页面的显示效果，如导航栏和newslist.jsp页面的新闻列表
#f2f2f2和#f3f3f3浅灰色，适合作页面的背景色，以突出主体
	可以应用到主体需要一块一块的显示的场景
显示新闻的标题或内容时为了防止过长，可以加overflow:hidden防止超出范围导致样式变乱
以下代码可以增强图片的显示效果（鼠标悬浮时图片变大）
	img {transition:all 0.6s} img:hover {transform:scale(1.1)}
```

```c
参考页面：
NYU shanghai：index.html的精彩推荐和新闻公告栏目
哈工大深圳计算机学院：index.html的风采展示栏目、以及师资力量板块.
东北林业大学新闻网：newslist.jsp页面新闻列表显示、newsdetail.html页面新闻详情展示
东北林业大学机电工程学院：底部footer设计
北京航空航天大学计算机：lab.html以及图片支持
```

#### 业务逻辑

- 首页：`IndexServlet`
  - 向`IndexServlet`发送请求时，`IndexServlet`调用`ListFiveNews()`方法获得五个新闻，并提交给`index.jsp`来显示，`IndexServlet`转发到`index.jsp`页面

- `ListServlet`为管理员增删改查的页面（需要登录权限）

  - 其中`AddServlet`, `DeleteServlet`, `GetNewsServlet`, `UpdateServlet`用于实现增删改查对应功能
  - **增：**点击管理页面`admin.jsp`的发布新闻按钮，弹出`add-modal`模态框，填写新的新闻信息后，点击发布按钮，向`AddServlet`发出POST请求进行增加
  - **改：**点击管理页面某个新闻对应的编辑按钮，利用`Ajax`异步向`GetNewsServlet`发出请求（`POST`）
    - 请求成功后将获得的新闻标题、内容填充到`update-modal`模态框
    - 管理员在模态框中修改新闻信息后，点击修改按钮，发送`POST`请求到`UpdateServlet`对新闻信息进行修改
  - **删：**点击管理页面某个新闻对应的删除按钮（删除按钮本质上是`<a>`元素），向`DeleteServlet`发出`GET`请求，进行删除。
    - **问题：如何通过`POST`请求删除呢？**

- `LoginServlet`

  - 处理来自登录模态框`login-modal`中表单的POST请求
    - 成功后重定向到`ListServlet`进行新闻的管理
    - 失败后重定向到`NewsListServlet`页面
      - **问题：如何在前端页面alert提示登录失败？？**

- `NewsListServlet`

  - 转发到`newslist.jsp`页面
    - 普通用户用来查看新闻的页面

- `NewsDetailServlet`

  - 用于展示新闻详情，转发到`newsdetail.jsp`

- - 点击新闻列表中的新闻标题来查看详情，向`NewsDetailServlet`发出GET请求

- `UserFilter`用来过滤对`ListServlet`发出的请求，若属于未登录状态（即Session为空）则发出重定向到`NewsListServlet`页面
  - 直接对`ListServlet`发出的请求将被过滤
  - 因为登录通过模态框实现，没有专门的登录页面，因此这样处理

- 右上方登录/欢迎按钮
  - 在jsp页面中根据session是否为空决定如何显示
  - html页面中无法实现

#### 数据库

- 本项目的数据库使用MySQL WorkBench 8.0 CE
  - web数据库下的news表用来存储新闻信息
  - 字段：`id,title,content,inserttime`
    - 其中id为自增长字段，无需手动插入
    - inserttime为`timestamp`类型，在插入数据时自动插入，无需手动插入
  - 在Web工程的META-INF下要有一个context.xml配置文件

#### 遗留问题

- html页面应该放在Web工程的哪个目录？

- 搜索框的搜索如何实现？

- 如何使页面的footer位于页面最底部？

  - 本项目的footer下面有空白

- 如何多个html5页面公用一段html5代码

- - 如公用footer、header将大幅提高效率

- 当静态html代码，如果作为jsp页面放在WEB-INF/jsp下，是否每个文件的访问都要单独写一个Servlet

- VSCode开发前端页面，移植到eclipse上时

- - 要修改html文件跳转、图片访问、css文件等各种路径
  - 且要增加对Servlet的发送请求的语句
  - 可否有简化措施？？


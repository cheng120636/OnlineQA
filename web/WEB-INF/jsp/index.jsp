<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/13
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录</title>
    <%@include file="basic.jsp"%>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/statics/gentelella-master/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/statics/gentelella-master/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/statics/gentelella-master/documentation/css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/statics/gentelella-master/build/css/custom.min.css" rel="stylesheet">
  </head>
  <body class="login">
  <div class="container">
    <div class="row">
      <div class="col-md-2 col-md-offset-6">
        <h1>登录</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/user/login" method="post">
          <div class="form-group">
            <label  class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
              <input  class="form-control"  name="userName" placeholder="用户名">
            </div>
          </div>
          <div class="form-group">
            <label  class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
              <input type="password" class="form-control"  name="password" placeholder="密码">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-6 col-sm-6">
              <button type="submit" id="buttonId"  class="btn btn-default">登录</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="row">
      <div class="col-md-2 col-md-offset-6">${message}</div>
    </div>
  </div>
  </body>
</html>
<script type="text/javascript">
  $(function () {
      $("#buttonId").click(function () {
          var username = $("input[name=userName]").val();
          var password = $("input[name=password]").val();
          if (username==""){
              alert("请输入用户名！");
              return false;
          }else
          if (password==""){
              alert("请输入密码！");
              return false;

          }
          $("#buttonId").submit();

      })
  })
</script>

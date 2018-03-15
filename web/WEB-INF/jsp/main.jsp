<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/13
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="basic.jsp"%>
</head>
<body>
<div class="container">

    <div class="row">
        <%@include file="top.jsp"%>

        <a href="${pageContext.request.contextPath}/question/queryAll?pageNum=1&pageSize=5"><h3>在线问答:</h3></a>
    </div>
    <div class="row">
        <a href="${pageContext.request.contextPath}/question/queryQuestion?pageNum=1&pageSize=5&userId=${loginUser.id}"><h3>我的问题:</h3></a>
    </div>
    <%--<div class="row">--%>
        <%--<div class="col-md-7 col-md-offset-5" style="padding: 30px">--%>
            <%--<img id="img" src="/src/timg.jpg" class="img-rounded">--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div style="padding: 20px;">--%>
    <%--<div class = "container">--%>
        <%--<img src = "/img/timg.jpg" class="img-circle" >--%>
    <%--</div>--%>
    <%--</div>--%>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#img").addClass("carousel-inner img-responsive img-rounded");
    })

</script>

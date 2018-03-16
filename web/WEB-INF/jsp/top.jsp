
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div align="center">
    <h2>
        <a href="${pageContext.request.contextPath}/answers/toMain">
        众说纷纭论坛首页
        </a>
    </h2>
    <div class="row">
        <div class="col-md-3 col-md-offset-9">
            <div>
            </div>
            <h3>欢迎您:${loginUser.nickName}</h3>
            <a href="${pageContext.request.contextPath}/user/logout" onclick="return confirm('确认退出系统吗?')">退出系统</a>
        </div>
    </div>
</div>


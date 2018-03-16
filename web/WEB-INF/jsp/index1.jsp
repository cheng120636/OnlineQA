
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>众说纷纭论坛</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/supersized.css">
    <link rel='stylesheet'  href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/style.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <!--<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
    <![endif]-->

</head>

<body>


<div class="page-container">
    <h1>众说纷纭论坛</h1>
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <input type="text" name="userName" class="username" placeholder="用户名">
        <input type="password" name="password" class="password" placeholder="密码">
        <button type="submit" id="buttonId">登录</button>
        <div class="error"><span>+</span></div>
    </form>
    <div class="connect">
        <p>Or connect with:</p>
        <p>
            <a class="facebook" href=""></a>
            <a class="twitter" href=""></a>
        </p>
    </div>
    <div class="col-md-2 col-md-offset-6">${message}</div>

</div>



</body>

<!-- Javascript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/supersized-init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/assets/js/scripts.js"></script>

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


        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, '#');
                window.history.forward(1);
            });
        }
        window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
        window.history.forward(1);
    })
</script>

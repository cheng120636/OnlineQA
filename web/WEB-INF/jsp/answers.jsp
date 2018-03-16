
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/14
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%@include file="basic.jsp"%>
</head>
<body  style="background: url(http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png)">
<div class="container">
    <div class="container">
        <%@include file="top.jsp"%>
        <div class="row">
            <a href="${pageContext.request.contextPath}/question/queryAll?pageNum=1&pageSize=5"><h3>返回上一层 问题:</h3></a>
            <div class="row">
                <div class="col-md-9 col-md-offset-3">
                <td>
                    <button name="answer" class="btn btn-success">我要回答</button>
                </td>
                </div>
            </div>
            <div class="row">
                <div><h4></h4></div>
            </div>
            <div class="row">

                <div class="col-md-6 col-md-offset-3">
                    <table class="table table-striped">
                        <tr>
                            <th>问题:</th>
                            <th>问题描述</th>
                            <th>回答时间</th>
                            <th>网友回答</th>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="list">
                        <tr>
                            <td>${list.questions.title}</td>
                            <td>${list.questions.detailDesc}</td>
                            <td><fmt:formatDate value="${list.ansDate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate> </td>
                            <td>${list.ansContent}</td>

                        </tr>
                        </c:forEach>

                    </table>
                        </div>
                    </div>
                </div>
        </div>
    <%@include file="page.jsp"%>

    <div class="modal fade" tabindex="-1" role="dialog" id="addQuestionsModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">在线回答</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontzal" id="addQuestionForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" id="addDetailQuestions" placeholder="请输入回答内容">我要回答:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="ansContentId" name="ansContent" rows="3"></textarea>
                                <input type="hidden" name="questions.id" value="${questionId}" id="quesId">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveAddQuestion">保存问题</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
    $(function () {

        $("#saveAddQuestion").click(function () {
            var ans=$("textarea[name=ansContent]").val();
            if (ans==""){
                alert("回答不能为空！");
                return false;
            }
                var answers = $("#addQuestionForm").serialize();
                $.post("${pageContext.request.contextPath}/answers/addAnswer",
                    answers,function (data) {
                        alert(data.msg);
                        $("#addQuestionsModel").modal("hide");
                        location.href=location.href;
                    })
        })


        $("button[name=answer]").click(function () {
            $("#addQuestionsModel").modal("show");
        })


    })
</script>
</html>

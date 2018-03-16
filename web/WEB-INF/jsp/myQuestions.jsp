<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/13
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>论坛</title>
    <%@include file="basic.jsp"%>
</head>
<body  style="background: url(http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png)">
<div class="container">
    <%@include file="top.jsp"%>
    <div class="row">
        <a href="${pageContext.request.contextPath}/answers/toMain"><h3>返回上一层 我的问题:</h3></a>
        <div class="row">
            <div class="col-md-10 col-md-offset-2">
                <table class="table table-striped">
                    <tr>
                        <td>序号</td>
                        <td>问题</td>
                        <td>回答次数</td>
                        <td>最后修改</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="list">
                    <tr>
                        <td>${list.id}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/answers/queryAnswers?pageNum=1&pageSize=5&questionId=${list.id}"  name="questionButton1">${list.title}</a>
                        </td>
                        <td>${list.answerCount}</td>
                        <td><fmt:formatDate value="${list.lastModified}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                        <td>
                            <button no="${list.id}" class="btn btn-success" name="detailQuestionButton">详情</button>
                            <%--<button no="${list.id}" class="btn btn-success" name="updateQuestionButton">修改</button>--%>
                            <button no="${list.id}" class="btn btn-danger" name="deleteQuestionButton">撤销</button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
<%--/详情模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="queryQuestionsModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">在线提问</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">问题:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="title"  id="queryQuestion" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">问题描述:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="detailDescId" readonly name="detailDesc" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">回答次数:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="answerCount" readonly id="wangAnswers">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">最后修改时间:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="lastModified" readonly id="updateLastTime">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <%--修改模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="updateQuestionsModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改问题</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="updateQuestionsForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">问题:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="title"  id="updateQuestion">
                                <input type="hidden" name="id" id="updateHiddenId">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">问题描述:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="updateDescId" value="detailDesc" name="detailDesc" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">回答次数:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="answerCount"  id="updateAnswers" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">最后修改时间:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="lastModified" readonly  id="updateLastTime1">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveUpdateQuestions">修改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


   <%@include file="page1.jsp"%>

</div>
</body>
</html>
<script type="text/javascript">
    $(function () {



        //详情
        $("button[name=detailQuestionButton]").click(function () {
            var id = $(this).attr("no");
            $.get("${pageContext.request.contextPath}/question/queryQuestionById",
                {"id":id},function (data) {
                    $("#queryQuestion").val(data.title);
                    $("#detailDescId").val(data.detailDesc);
                    $("#wangAnswers").val(data.answerCount);
                    $("#updateLastTime").val(data.lastModified);
                })
            $("#queryQuestionsModel").modal("show");

        })


        //修改
        $("button[name=updateQuestionButton]").click(function () {
            var id = $(this).attr("no");
            $.get("${pageContext.request.contextPath}/question/queryQuestionById",
                {"id":id},function (data) {
                    $("#updateHiddenId").val(id);
                    $("#updateQuestion").val(data.title);
                    $("#updateDescId").val(data.detailDesc);
                    $("#updateAnswers").val(data.answerCount);
                    $("#updateLastTime1").val(data.lastModified);
                })
            $("#updateQuestionsModel").modal("show");
        })
        $("#saveUpdateQuestions").click(function () {
            var questions = $("#updateQuestionsForm").serialize();
             //alert(questions);
            $.post("${pageContext.request.contextPath}/question/updateQuestionByTitle",
                questions,function (data) {
                alert("dd");
                    alert(data.msg);
                    $("#updateQuestionsModel").modal("hide");
                    location.href=location.href;
                })

        })
        $("button[name=deleteQuestionButton]").click(function () {
            var id = $(this).attr("no");
            if(confirm('确认撤销这条信息吗?')){
                $.get("${pageContext.request.contextPath}/question/deleteQuestion",
                    {"id":id},function (data) {
                        alert(data.msg);
                        location.href=location.href;
                    })
            }
        })
    })
</script>

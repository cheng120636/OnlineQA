<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/13
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>在线问题</title>
    <%@include file="basic.jsp"%>
</head>
<body>
 <div class="container">
     <%@include file="top.jsp"%>
     <div class="row">
         <a href="${pageContext.request.contextPath}/answers/toMain"><h3>返回上一层 在线问答:</h3></a>
         <div class="row">
             <div class="col-md-6 col-md-offset-3">
                 <div class="row">
                     <div class=" col-md-6">
                         <button class="btn btn-success" id="questionButton">我要提问</button>
                     </div>
                 </div>

                 <div class="row">
                     <div><h2></h2></div>
                 </div>

                 <table class="table table-striped">
                     <tr>
                         <td>序号</td>
                         <td>问题</td>
                         <td>回答次数</td>
                         <td>最后修改</td>
                     </tr>

                     <c:forEach items="${pageInfo.list}" var="questions">
                     <tr>
                         <td>${questions.id}</td>
                         <td>
                                 <a href="${pageContext.request.contextPath}/answers/queryAnswers?pageNum=1&pageSize=5&questionId=${questions.id}" no="${questions.id}" name="questionButton1">${questions.title}</a>
                             <%--<button no="${questions.id}" id="button">${questions.title}</button>--%>
                         </td>
                         <td>${questions.answerCount}</td>
                         <td><fmt:formatDate value="${questions.lastModified}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                         <td>
                         </td>
                     </tr>
                     </c:forEach>
                 </table>
             </div>
         </div>
     </div>

     <%@include file="page.jsp"%>

     <%--模态框--%>
     <div class="modal fade" tabindex="-1" role="dialog" id="addQuestionsModel">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                     <h4 class="modal-title">在线提问</h4>
                 </div>
                 <div class="modal-body">
                     <form class="form-horizontal" id="addQuestionForm">
                         <div class="form-group">
                             <label  class="col-sm-2 control-label">问题:</label>
                             <div class="col-sm-10">
                                 <input type="text" class="form-control" name="title" id="addQuestions" placeholder="请输入问题">
                                 <input  type="hidden"  name="user.id" value="${loginUser.id}">

                             </div>
                         </div>
                         <div class="form-group">
                             <label class="col-sm-2 control-label" id="addDetailQuestions" placeholder="问题描述">问题描述:</label>
                             <div class="col-sm-10">
                             <textarea class="form-control" name="detailDesc" rows="3"></textarea>
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
//        验证
        $("#saveAddQuestion").click(function () {
            var name = $("#addQuestions").val();
            var detailDesc = $("textarea[name=detailDesc]").val();
            if (name==""){
                alert("问题不能为空!");
                return false;
            }
            if (detailDesc==""){
                alert("问题描述不能为空!");
                return false;
            }
            var questions = $("#addQuestionForm").serialize();
            $.post("${pageContext.request.contextPath}/question/addQuestions",
                questions,function (data) {
                    alert(data.msg);
                    $("#addQuestionsModel").modal("hide");
                    location.href = location.href;
                })
        })

        //添加问题
        $("#questionButton").click(function () {
            $("#addQuestionsModel").modal("show");
        })

        })
</script>
</html>

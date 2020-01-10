<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jsp" %>




<form role="form" method="post">
	<input type="hidden" name='bno' value="${boardVO.bno }"/>

</form>
<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">Title</label>
		<input type="text" name="title" class="form-control" value="${boardVO.title }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPawword1">Content</label>
		<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputWriter1">Writer</label>
		<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly">
	</div>
</div>
<div class="box-footer">
	<button type="submit" class="btn btn-warning modifyBtn">Modify</button>
	<button type="submit" class="btn btn-danger removeBtn">Remove</button>
	<button type="submit" class="btn btn-primary goListBtn">Go List</button>
	<script>
$(document).ready(function(){
 var formObj = $("form[role='form']");
 console.log(formObj);

 $(".btn-warning").on("click", function(){
	 formObj.attr("action", "/board/modify");
	 formObj.attr("method", "get");
	 formObj.submit();
 });
 
 $(".btn-danger").on("click", function(){
	 formObj.attr("action", "/board/remove");
	 formObj.submit();
	 }); 
 $(".btn-primary").on("click", function(){
	self.location="/board/listAll";
 });
 $(".goListBtn").on("click", function(){
	formObj.attr("method", "get");
	formObj.attr("action", "/board/listPage")
	formObj.submit();
 });
 $(".modifyBtn").on("click", function(){
	formObj.attr("method", "get");
	formObj.attr("action", "/board/modifyPage")
	formObj.submit();
});
});
</script>
</div>

<form role="form" action="modifyPage" method="post">
	<input type="hidden" name="bno" value="${boardVO.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

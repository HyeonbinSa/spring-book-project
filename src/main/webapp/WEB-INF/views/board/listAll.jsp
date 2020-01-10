<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ page session="false" %>        

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<<script type="text/javascript">
 var result = '${msg}';
 if(result == 'SUCCESS'){
	 alert("처리가 완료되었습니다.");
 }
</script>
<table class="table table-bordered">
	<tr>
	<th style="width: 10px">BNO</th>
	<th>Title</th>
	<th>Writer</th>
	<th>RegDate</th>
	<th style="witdh:40px">ViewCnt</th>
	</tr>
	<c:forEach items="${list}" var="boardVO"> 
		<tr>
			<td>${boardVO.bno }</td>
			<td><a href='/board/read?bno=${boardVO.bno }'>${boardVO.title }</a></td>
			<td>${boardVO.content }</td>
			<td>${boardVO.writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate }"/></td>
			<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
	</c:forEach>
</table>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>


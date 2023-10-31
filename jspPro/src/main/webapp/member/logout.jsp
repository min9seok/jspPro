<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String id = (String) session.getAttribute("id");
%>
<%
// 세션 삭제(제거)
// 1) 강제 : 즉시 강제 종료
	session.invalidate();
// 2) 자동 : 설정시간 동안 요청이 없을 경우 세션 종료

%>
<script type="text/javascript">
 alert("<%=id%>님 로그아웃하셨습니다.");
 location.href = "main.jsp";
</script>

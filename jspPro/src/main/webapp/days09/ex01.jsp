<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style type="text/css">
.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
<header class="sticky">
<h1 class="main">
	<a href="#" style="position: absolute;top:30px;">ky Home</a>
</h1>
<ul>
	<li><a href="#">로그인</a></li>
	<li><a href="#">회원가입</a></li>
</ul>
</header>
<h3><span class="material-symbols-outlined">view_list</span> jsp days09</h3>
<div>
 <a href="/jspPro/days09/replyboard/list.do">목록보기</a>
 <xmp class="code">
  답변형(계층형) 게시판
  1. 로직이해
  DB
  번호 제목 ... 작성자
  1   일       길동(새글)
  2   이       동길(새글)
  3   삼       동동(새글)
  4   이-1     동동(답글)
  5   이-1-1   동길(답글)
  6   사       동길(새글)
  7   사-1     길동(답글)
    
  VIEW
  ORDER BY 번호 DESC
  번호 제목 ... 작성자
  6   사       동길(새글)
  7   ㄴ사-1    길동(답글)
  3   삼       동동(새글)
  2   이       동길(새글)
  4   ㄴ이-1    동동(답글)
  5    ㄴ이-1-1 동길(답글)
  1   일       길동(새글)
  
  [해결방안] 컬럼 추가 (3개,2게)
   깊이(depth)      : 새,답 ,답답, 답답답
   그룹(group==ref) : 글번호  
   그룹 내 순번(step) : +1
   
   -- 3개 컬럼 추가
  DB
  번호 제목 ... 작성자       그룹(REF) 순서(STEP) 깊이(DEPTH)
  1   일       길동(새글)      1       1         0
  2   이       동길(새글)      2       1         0
  3   삼       동동(새글)      3       1         0
  4   이-1     동동(답글)      2       4         1
  5   이-2     동동(답글)      2       3         1
  6   이-3     동동(답글)      2       2         1
  
  
  VIEW
  ORDER BY 그룹 DESC, 순서 ASC
  번호 제목 ... 작성자       그룹(REF) 순서(STEP) 깊이(DEPTH)
  3   삼       동동(새글)      3       1         0
  2   이       동길(새글)      2       1         0
  5   ㄴ이-3    동동(답글)      2       2         1
  5   ㄴ이-2    동동(답글)      2       3         1
  4   ㄴ이-1    동동(답글)      2       4         1
  1   일       길동(새글)      1       1         0
  
  설명
  1. 새글이 작성 될 떄
   번호(pk) > 그룹(ref) > 순서(step 1) 깊이(depth 0)
  2. 답글이 작성 될 때
   번호(pk) > 그룹(ref) > 순서(step 그룹내 부모스탭+1(update) 부모스탭+1(insert)) 깊이(depth 부모깊이+1)
  
   [2]  패키지 추가
          days09.replyboard.command       - 핸들러
          days09.replyboard.controller       - 컨트롤러
          days09.replyboard.domain            - DTO
          days09.replyboard.persistence     - DAO  
          days09.replyboard.service             - 서비스  
          
   [3] MVC 패턴 - 컨트롤러 추가
     1) commandHandler.properties
     2) .java
     3) web.xml
   
   [4] ReplyBoardDTO
       IReplyBoard
       ReplyBoardDAO
         ㄴ selectList() 구현
          
   [5] CommandHandler 추가  
       ListHandler.java
       
       
 </xmp>

</div>
<script>
</script>
</body>
</html>


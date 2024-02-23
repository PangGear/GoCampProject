<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jstl/core_rt"  prefix="c" %>     
<c:import url="/include/top.jsp" /> 

<script>
    setTimeout(function() {
        window.location.href = 'index.do';
    }, 2000);
</script>

<section>
<br>
<div align="center">
<br><br><br><br>
  <h1> 로그인 성공 </h1>
  <br><br><br><br><br>
  <h3>환영합니다 ${session.name}님!</h3>
  
  <h3>${session.role}</h3>

</div>
<br/>
</section>

<c:import url="/include/bottom.jsp" /> 
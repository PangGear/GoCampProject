<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jstl/core_rt"  prefix="c" %>     
<c:import url="/include/top.jsp"/>
<style>
.td1 {
 text-align : center; 
}
</style>

<section>
<br>
<div align="center">

<h2> 회원 목록 보기 </h2>

  <table border="1" width="640">
    <tr align="center">
      <td>번호</td>
      <td>회원번호</td>
      <td>이름</td>
      <td>전화번호</td>
      <td>등급</td>
    </tr>         
    <c:forEach items="${li}" var="m" varStatus="status">
      <tr>
        <td>${status.count}</td>
        <td><a href="getLogin.do?username=${m.username}">
        ${m.username}</a>
        </td>
        <td>${m.name}</td>
        <td>${m.tel}</td>
        <td>${m.role}</td>
      </tr>
    </c:forEach>
  </table>

</div>
<br/>
</section>
<script>
  function submitForm() {
    var form = document.getElementById("editForm");
    var username = document.createElement("input");
    username.type = "hidden";
    username.name = "username";
    username.value = "${m.username}"; // 실제 값으로 대체
    form.appendChild(username);
    form.submit();
  }
</script>
<c:import url="/include/bottom.jsp" />
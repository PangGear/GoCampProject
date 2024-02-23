<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jstl/core_rt"  prefix="c" %>     
<c:import url="/include/top.jsp" /> 

<section>
<br>
<div align="center">
<h1>캠핑장 소개</h1>
<form>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>사진</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
			<c:forEach items="${li}" var="m">
				<tr>
					<td>${m.boardidx}</td>
					<td>
					<img src="/board/introduceImg/${m.img}" width=100 height=100/>
					</td>
					<td>
					<a href="getBoard.do?boardidx=${m.boardidx}">
					${m.title}</a>
					</td>
					<td>${m.inst_date}</td>
					<td>${m.cnt}</td>
				</tr>
			</c:forEach>
	</table>
</form>

</div>
<br/>
</section>

<c:import url="/include/bottom.jsp" />

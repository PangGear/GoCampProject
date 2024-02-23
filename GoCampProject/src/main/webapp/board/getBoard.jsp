<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jstl/core_rt"  prefix="c" %>     
<c:import url="/include/top.jsp" />
<link href="/include/table.css" rel="stylesheet" type="text/css" />
<style>
table {
  width:800px ; 
  height:200px;
}
</style>
<section>
<br>
<div align="center">

<h2> 소개글 상세 </h2> 
	<form action="boardInsert.do" method="post" enctype="multipart/form-data">
	    <table border="1">
	        <tr>
	            <td rowspan="6" class="tr1">
	                <img src="/board/introduceImg/${m.img}" width=300 height=300/>
	            </td>
	            <td width="70" class="tr1">제목</td>
	            <td class="td1"><input type="text" id="title" name="title" value="${m.title}"></td>
	        </tr>
	        <tr>
	            <td class="tr1">시설명</td>
	            <td><input type="text" id="facility" name="facility" value="${m.facility}"></td>
	        </tr>
	        <tr>
	            <td class="tr1">캠핑장 주소</td>
	            <td><input type="text" id="roadAddress" name="roadAddress" value="${m.roadAddress}" size="30"></td>
	        </tr>
	        <tr>
	            <td class="tr1">소개글</td>
	            <td><textarea id="content" name="content" rows="6" cols="50">${m.content}</textarea></td>
	        </tr>
	        <tr>
	            <td class="tr1">전화번호</td>
	            <td><input type="tel" id="telephone" name="telephone" value="${m.telephone}" size="10"></td>
	        </tr>
	
	        <tr>
	            <td align="center" colspan="2">
	                <input type="submit" value="수정">&emsp;
	                <input type="submit" value="삭제">
	            </td>
	        </tr>
	    </table> 
	</form>
</div>
<br>
</section>
<c:import url="/include/bottom.jsp" />
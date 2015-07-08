<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
    <!-- Modal Login-->
	<div class="modal fade" id="popupLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">로그인</h4>
		      </div>
		      
		      <div class="modal-body">
		        <div class="row">
				  	<div class="col-sm-12">
				  	
				  	<form action="${root }/teamPage/login.do" method="POST">
					    <div class="row">
					      <div class="col-xs-8 col-sm-3"></div>
					      <div class="col-xs-8 col-sm-6">
					        <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="id">
					      </div>
					    </div>
					    <br/>
					    <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	 <div class="col-xs-4 col-sm-6">
					        <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password">
					      </div>
					    </div>
					    <br/>
					     <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	 <div class="col-xs-4 col-sm-6">
					         <a href="#">아이디 or 비밀번호 찾기</a>
					      </div>
					    </div>
					    <br/>
					    <div class="row">
					    	<div class="col-xs-8 col-sm-4"></div>
					    	<div class="col-xs-4 col-sm-6">
					        <input class="btn btn-default" type="submit" value="로그인"  style="background-color:#B2EBF4;">
					         <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:#FFE08C">닫기</button>
					      </div>
					    </div>
					 </form>
					   
				  	</div>
				</div>
		      </div>
		    </div>
		  </div>
	</div>
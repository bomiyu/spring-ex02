<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<title>ajaxEx3</title>
<script>
	$(document).ready(function() {
		$("#btn-1").click(function() {

			$.ajax("/replies/new", {
				type : "post",
				contentType : "application/json",
				data : '{"bno":230,"reply":"새댓글입니당","replyer":"user01" }',
				complete : function(jqXHR, status) {
					console.log("complete");
					console.log(status);
				}
			});
		});
		$("#btn-2").click(function() {

			$.ajax("/replies/new", {
				type : "post",
				contentType : "application/json",
				data : '{"reply":"새댓글입니당","replyer":"user01" }',
				complete : function(jqXHR, status) {
					console.log("complete");
					console.log(status);
				}
			});
		});

		$("#btn-3").click(function() {

			$.ajax("/replies/new", {
				type : "post",
				contentType : "application/json",
				data : '{"bno":230,"reply":"새댓글입니당","replyer":"user01" }'
			}).done(function(data, status, xhr) {
				console.log("성공공공");
				//console.log(jqXHR.responseText);
				console.log(data);
			}).fail(function(data, status, xhr) {
				console.log("실패패패");
			});
		});
		$("#btn-4").click(function() {
			$.ajax("/replies/pages/231/1", {
				type : "get",
				contentType : "application/json"
			}).done(function(data, status, xhr) {
				console.log(data);
			});
		});
		$("#btn-5").click(function() {
			$.ajax("/replies/35", {
				type : "PUT",
				contentType : "application/json",
				data : '{"reply":"업데이트~~","replyer":"user01" }'
			}).done(function(data, status, xhr) {
				console.log("업데이트 성공공공~~");
				//	console.log(jqXHR.responseText);
				console.log(data);
			}).fail(function(data, status, xhr) {
				console.log("업데이트 실패패패");
			});
		});

		$("#btn-6").click(function() {
			$.ajax("/replies/31", {
				type : "delete",
				contentType : "application/json"
			}).done(function(data, status, xhr) {
				console.log("삭제 성공!!");
				//	console.log(jqXHR.responseText);
				console.log(data);
			}).fail(function(data, status, xhr) {
				console.log("삭제 실패!!");
			});
		});

		$("#btn-7").click(function() {
			$.ajax("/replies/35", {
				type : "GET"
			}).done(function(data) {
				console.log(data);
			});
		});

		$("#btn-8").click(function() {
			$.get("/replies/35", function(data) {
				console.log(data);
			});
		});
		
		$("#btn-9").click(function() {
			$.get("/replies/35", function(data) {
				console.log(data);
				console.log(data.rno);
				console.log(data.bno);
				console.log(data.reply);
				console.log(data.replyer);
			}, "json");
		});
		
		$("#btn-10").click(function() {
			$.get("/replies/35", function(data) {
				console.log(data);
				console.log(data.rno);
				console.log(data.bno);
				console.log(data.reply);
				console.log(data.replyer);
			}, "text");
		});
		$("#btn-11").click(function() {
			$.getJSON("/replies/35", function(data) {
				console.log(data);
				console.log(data.rno);
				console.log(data.bno);
				console.log(data.reply);
				console.log(data.replyer);
			});
		});
	});
</script>


</head>
<body>
	<h1>ajax ex3</h1>

	<div>
		<button id="btn-1">댓글 등록</button>
	</div>
	<div>
		<button id="btn-2">댓글 등록 실패~!!</button>
	</div>
	<div>
		<button id="btn-3">댓글 등록 성공 또는 실패</button>
	</div>
	<div>
		<button id="btn-4">댓글 목록</button>
	</div>
	<div>
		<button id="btn-5">댓글 수정</button>
	</div>

	<div>
		<button id="btn-6">댓글 삭제♡</button>
	</div>
	<div>
		<button id="btn-7">댓글 하나 7</button>
	</div>
	<div>
		<button id="btn-8">댓글 하나 8</button>
	</div>
	
	<div>
<button id="btn-8">댓글 하나 8</button>
</div>

<div>
<button id="btn-9">댓글 하나 9-json</button>
</div>
<div>
<button id="btn-10">댓글 하나 10-text</button>
</div>
<div>
<button id="btn-11">댓글 하나 11-getjson</button>
</div>
</body>
</html>
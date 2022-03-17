<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="/resources/css/perfumeMain.css"> 


<title>당신만의 향기, All U Perfume</title>
<html>
<head>
<meta charset="UTF-8">

</head>

<c:if test="${sessionScope.id == null && sessionScope.kid == null && sessionScope.aid == null }">
	<script>
		alert("로그인 후 사용 가능합니다.");
		window.location="/member/login";
	</script>
</c:if>

<div class="aa">
	<header>
		<div class="wrapper">
			<h1><a href="/member/main" style="color : white ;">All U Perfume</a></h1>
			<nav>
				<ul class="menu">
					<li>
						<c:if test="${sessionScope.id != null}">
							<a href="/member/logout">로그아웃</a>
						</c:if>
						<c:if test="${sessionScope.kid != null}">
							<a href="kakaoLogout();">로그아웃</a>
						</c:if>
						<c:if test="${sessionScope.aid != null}">
							<a href=/admin/logout>로그아웃</a>
						</c:if>
					</li>
					<li><a href="/mypage/main">마이페이지</a></li>
					<li><a href="/q/list?boardnum=1">Q & A</a></li>
					<li><a href="/notice/list?boardnum=3">공지사항</a></li>
					<li><a href="/best/list?boardnum=2">향수 추천</a></li>
					<li><a href="/main/list">메인</a></li>
					<li><a href="/survey/surveyStart">설문</a></li>
				</ul>
			</nav>
		</div>
	</header>
</div> <hr color = "white" size = "2px"/>

<script>	
	Kakao.init('b39601cdde217504460c15ddd71b1b47');
	//카카오로그아웃  
	  function kakaoLogout() {
	    if (!Kakao.Auth.getAccessToken()) {
	      alert('Not logged in.')
	      return
	    }
	    Kakao.Auth.logout(function() {
	      $.ajax({
	    	  url: "/member/kLogout",
	          type: "POST",
	          contentType : "application/json; charset=UTF-8",
	          async: false,
	          success: function(data){
	              alert("로그아웃 되었습니다.");
	              window.location="/member/login";
	          } 
	      });
	    })
	  }
	
</script>

<table   style="width: 100%; height :100%;">
	<tr >
		<td style="text-align : center;">
			<h3>카테고리 검색</h3> <br/> 
				<form action = "/main/search" method ="get">
			 
				 <select name="choose" style="width: 100px; height : 30px; font-size : 15px;">
				 <option value="name">향수 이름</option>
				 <option value="note">노트 이름</option>
				 </select>
		 		<input id="key" type = "text" name="keyword" style="width: 250px; height : 30px; font-size : 15px;"/>
		 		<input type="submit" id="search" value="검색" style ="width: 90px; height : 30px; border :none; background-color:#76448A; color : white; border-radius: 10px; font-size : 15px;"/>
		 		<br/><br/><br/>
			<dl>
				<dt><h3>성별 검색</h3></dt>
					<dd>
						<input type = "checkbox" id ="gender1" name="c_gender" value="0">여성<br/>
						<input type = "checkbox" id ="gender2" name="c_gender" value="1">남성<br/>
						<input type = "checkbox" id ="gender3" name="c_gender" value="2">중성<br/>
					</dd>
					<dd>
					</dd>

				<dt><h3>계절 검색</h3></dt>
					<dd>
						<input type = "checkbox" id="season1" name="c_season" value="1">봄<br/>
						<input type = "checkbox" id="season2" name="c_season" value="2">여름<br/>
						<input type = "checkbox" id="season3" name="c_season" value="3">가을<br/>
						<input type = "checkbox" id="season4" name="c_season" value="4">겨울<br/>
					</dd>
			
			</dl>
			</form>
		</td>
		<td rowspan="2">
			<table   style = "width: 800px; height : 500px; text-align : center; margin : auto; OR  ( margin-rigth : auto; margin-left : auto; )">
				<tr>
					<th>게시글 번호</th>
					<th>향수 이름</th>
					<th>미리보기</th>
				</tr>
			
				<c:forEach items="${list}" var="PerfumeDTO">
				<tr>
					<td >
						<a href="/main/detail?p_number=${PerfumeDTO.p_number}&f_name=${PerfumeDTO.f_name}&page=${pa.page}&perPageNum=${pa.perPageNum}">
							${PerfumeDTO.p_number}
						</a>
					</td>
					<td>
						<a href="/main/detail?f_name=${PerfumeDTO.f_name}&p_number=${PerfumeDTO.p_number}&page=${pa.page}&perPageNum=${pa.perPageNum}">
						${PerfumeDTO.f_namee}
						</a>
					</td>
					<td >
						<img src="${PerfumeDTO.f_pic}" style="width: 70px; height : 70px;">
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan = "3" >
						<ul>
							<c:if test="${pageMaker.prev}">
								<a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
							</c:if>
								
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<a href="${pageMaker.makeQuery(idx)}">${idx}</a>	
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<a href="list${pageMaker.makeQuery(pageMaker.endPage+1)}">다음</a>
							</c:if>
						</ul>
					</td>
				</tr>
			</table>
		</td>
		<td>
			<div id = "reviewrank">
				<table  style="width: 800px; height:500px;">
					<tr>
						<td colspan="5" style = "text-align : center;">
							<h3>리뷰 좋아요 랭킹</h3>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<th>게시글 번호</th>
						<th>향수 이름</th>
						<th>리뷰 내용</th>
						<th>좋아요</th>
					</tr>
					
			
				<c:forEach items ="${rerank}" var="re">
					<tr>
						<td style = "text-align : center;">${re.writer}님</td>
						<td style = "text-align : center;"><a href="/main/detail?p_number=${re.p_number}&f_name=${re.f_name}">
						${re.p_number}</a></td>
						<td><a href="/main/detail?p_number=${re.p_number}&f_name=${re.f_name}">
						${re.f_name}</a></td>
						<td><div  style="text-overflow: ellipsis; white-space:nowrap; overflow:hidden; dispaly: block; max-width : 300px;">${re.like_re}</div></td>
						<td style = "text-align : center;">${re.like_re_heart}</td>
					</tr>
				</c:forEach>
					</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div id="likerank" >
				<table style="width: 500px; height:500px;" >
					<tr>
						<td colspan="4" style = "text-align : center;">
							<h3>향수 좋아요 랭킹</h3>
						</td>
					</tr>
					<tr>
						<th>게시글 번호</th>
						<th>향수 이름</th>
						<th>좋아요</th>
						<th>미리보기</th>
					</tr>
				<c:forEach items ="${prank}" var="p">
					<tr>
						<td style = "text-align : center;"><a href="/main/detail?p_number=${p.p_number}&f_name=${p.f_name}">
						${p.p_number}</a></td>
						<td><a href="/main/detail?p_number=${p.p_number}&f_name=${p.f_name}">
						${p.f_namee}</a></td>
						<td style = "text-align : center;">${p.f_like_heart}</td>
						<td style = "text-align : center;" >
							<img src="${p.f_pic}" style="width: 50px; height : 50px;">
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		
		</td>
		<td>
			<div id="reviewunlike">
				<table  style="width: 800px; height:500px;">
					<tr>
						<td colspan="5" style = "text-align : center;">
							<h3>리뷰 싫어요 랭킹</h3>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<th>게시글 번호</th>
						<th>향수 이름</th>
						<th>리뷰 내용</th>
						<th>싫어요</th>
					</tr>
						<c:forEach items ="${unrerank}" var="unre">
							<tr>
								<td style = "text-align : center;" >${unre.writer}님</td>
								<td style = "text-align : center;" ><a href="/main/detail?p_number=${unre.p_number}&f_name=${unre.f_name}">
								${unre.p_number}</a></td>
								<td><a href="/main/detail?p_number=${unre.p_number}&f_name=${unre.f_name}">
								${unre.f_name}</a></td>
								<td style="text-overflow: ellipsis; white-space:nowrap; overflow:hidden; dispaly: block; max-width : 300px;">${unre.unlike_re}</td>
								<td style = "text-align : center;" >${unre.unlike_re_heart}</td>
							</tr>
						</c:forEach>
					</table>
			</div>
		</td>
	</tr>
</table>
<script>

$('dt').on('click', function() {

	  function slideDown(target) {
	    slideUp();
	    $(target).addClass('on').next().slideDown();
	  }

	  function slideUp() {
	    $('dt').removeClass('on').next().slideUp();
	    $("input").prop("checked", false);
	  }

	  $(this).hasClass('on') ? slideUp() : slideDown(this);

	});
	
	
	var key = document.querySelector("#key");
	
	key.onfocus = function (e) {
		    $('dt').removeClass('on').next().slideUp();
		    $("input[name=c_gender]").prop("checked", false);
		    $("input[name=c_season]").prop("checked", false);
		    $("input[name=c_note]").prop("checked", false);
		    
	};

</script>


</body>
</html>


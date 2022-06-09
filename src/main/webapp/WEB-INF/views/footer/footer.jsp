<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* BASIC css start */
.eapps-instagram-feed-posts-slider-inner { width: 1300px !important; }

.wrap_inner_left { float: left; padding-top:80px; }
.wrap_inner_right { float: right; width: 580px; padding-top:80px; text-align:right; }
.pg_txt { width:100%; overflow:hidden; color:#999; line-height: 36px; }
.pg_txt a { color:#999; }
.isms_con { position: absolute; bottom: 0; right: 4%; }
.isms_con .con {  float: left; width: 40px; height: 36px; font-size: 14px; cursor: default; background: url(http://xexymix.jpg3.kr/xexymix/2020/main/isms_img_c.png) no-repeat center; background-size: cover; }
.isms_con .con:hover p { display:block; transform-origin: 100% 0%; -webkit-animation: fadeIn 0.3s ease-in-out; animation: fadeIn 0.3s ease-in-out; }
.isms_con .con p { display: none; text-align: left; background-color: #fff; width: 190px; height: 38px; padding: 4px 5px; border: 1px solid #dfdfdf; position: absolute; right: 180px; top: -40px; color: #888; font-size: 11px; }
.isms_con .txt {  float: left; padding-left: 10px; font-size: 12px; color: #999; line-height: 36px; }
@-webkit-keyframes fadeIn {
	0% { 
		opacity:0; 
		transform: scale(0.6);
	}
	100% {
		opacity:100%;
		transform: scale(1);
	}
}
@keyframes fadeIn {
	0% { opacity:0; }
	100% { opacity:100%; }
}

#ftWrap { clear:both; width:100%; padding-bottom:80px; border-top: 1px solid #999; background-color: #fff; }
#footer { max-width:1920px; min-width:1400px; position:relative; overflow:hidden; padding:0 4%; }
#footer .footerLogo { text-align:left; }
#footer .footerLogo > a { display:block; width:107px; text-align:center; }

#footer .topArea { margin-bottom:40px; }
#footer .topArea > div {display:inline-block; *display:inline; vertical-align:top; padding-left:50px; text-align:left; }
#footer .topArea > div dt {font-size:14px; font-weight:bold; margin-bottom:10px; }
#footer .topArea > div dd {margin-bottom:7px; color:#999; font-size:12px; }
#footer .topArea > div dd a {color:#999; font-size:12px; display:inline-block; }
#footer .topArea > div dd.tel {font-size:22px; margin-bottom:15px; font-weight:500; color:#111; }
#footer .topArea > div p.msg {color:#999; font-size:12px; margin-top:20px; line-height:1.6; }
#footer .topArea > div.lang dd,
#footer .topArea > div.sns dd {display:inline-block; *display:inline; vertical-align:top; margin-right:7px; }
#footer .topArea > div.lang { width:271px; }
#footer .topArea .cs .cs_btn { display: block; width:105px; height:29px; line-height:29px; background: #000; color:#fff; padding:0 10px; margin-top:25px; }
#footer .topArea .cs .cs_btn span { font-size:9px; margin-left:4px; }

#footer .footerBottom .topArea {margin-bottom:0; }
#footer .footerBottom address span { color:#999; font-size:12px; *display: inline; *zoom: 1; position: relative; padding-right: 19px; vertical-align: top; line-height:2; }
#footer .footerBottom address span a { color:#999; }
#footer .footerBottom address span:after {display: block; content: ''; position: absolute; top: 50%; right: 9px; width: 1px; height: 9px; background: #a5a5a5; -webkit-transform: translate(0,-50%); -ms-transform: translate(0,-50%); transform: translate(0,-50%); }
#footer .footerBottom address span.last:after {width:0; }
#footer .footerBottom address .copyright {margin-top:20px; font-size:12px; color:#999; line-height:2; }
#footer .footerBottom address .copyright img {vertical-align:middle; }
#footer .footerBottom address .copyright a {color:#999; text-decoration:underline; line-height:2; }
#footer .footerBottom .menu {margin:20px 0; }
#footer .footerBottom .menu li {display: inline-block; *display: inline; *zoom: 1; }
#footer .footerBottom .menu li a { color:#999; font-size:12px; display: inline-block; *display: inline; *zoom: 1; position: relative; padding-right: 19px; vertical-align: top; line-height:2; }
#footer .footerBottom .menu li a:after {display: block; content: ''; position: absolute; top: 50%; right: 9px; width: 1px; height: 9px; background: #a5a5a5; -webkit-transform: translate(0,-50%); -ms-transform: translate(0,-50%); transform: translate(0,-50%); }
#footer .footerBottom .menu li.last a:after {width:0; }


#right_q {position:fixed; top:50%; right:0; z-index:30; -webkit-transform:translate(0,-50%); -ms-transform:translate(0,-50%); transform:translate(0,-50%); display:none; }
#right_q ul {overflow:hidden;  border-bottom:0; background:#fff; border-top:1px solid #c6c6c6;}
#right_q ul li { border-bottom:1px solid #c6c6c6; border-left:1px solid #c6c6c6;}
#right_q ul li a {display:block; width:58px; height:48px; background:#fff no-repeat center; color:transparent; text-indent:-9999px; cursor:pointer;}
#right_q ul li.up a {background-image:url('/design/xexymix/image/q_up.png');}
#right_q ul li.down a {background-image:url('/design/xexymix/image/q_down.png');}
#right_q ul li.recent a {background-image:url('/design/xexymix/image/q_recent.png');}
#right_q ul li.kakao a {background-image:url('/design/xexymix/image/q_kakao.png');}


/* BASIC css end */


/* BASIC css end */

</style>
</head>
<body>
	<div id="ftWrap">
		<div id="footer">

			<div class="wrap_inner_left">
				<div class="footerLogo">
					<a href="/"><img
						src="https://xexymix.jpg3.kr/xexymix/2020/main/header_logo_bk.png"></a>
				</div>
				<div class="footerBottom">
					<ul class="menu">
						<li><a href="/shop/page.html?id=2">브랜드 스토리</a></li>
						<li><a href="http://www.brandxcorp.com" target="_blank">회사소개</a></li>
						<li><a href="javascript:view_join_terms();">이용약관</a></li>
						<li class="privacy"><a href="javascript:bottom_privacy();"><b>개인정보처리방침</b></a></li>
						<li class="last"><a
							href="/board/board.html?code=xexymix_board3">고객센터</a></li>
					</ul>
					<address class="info">
						<span>사업자명 : (주)브랜드엑스코퍼레이션</span> <span>대표자명 : 이수연,강민준</span> <span
							class="last">팩스 : 02-2179-9410</span> <br> <span>주소 :
							서울시 성동구 뚝섬로1길 63 영창디지탈타워 B2F,4F,6F,12F,16F </span> <span class="last">대표전화
							: 1661-2811</span><br> <span class="last">반품주소지 : 경기도 의정부시
							산단로98번길 65 3층 젝시믹스</span> <br> <span>사업자등록번호 : 550-86-00867
							<a
							href="http://www.ftc.go.kr/www/bizCommView.do?key=232&apv_perm_no=2019303010330201148"
							target="_blank">[사업자정보확인]</a>
						</span> <span class="last">통신판매업신고번호 : 2019-서울성동-01148</span> <br> <span
							class="last">제안/제휴문의 : 온라인 <a
							href="mailto:brxmkt@brandxcorp.com">brxmkt@brandxcorp.com</a> /
							오프라인 <a href="mailto:brxoffline@brandxcorp.com">brxoffline@brandxcorp.com</a>
							/ 해외 <a href="mailto:xexybiz@brandxcorp.com">xexybiz@brandxcorp.com</a>
						</span> <br> <span class="last">개인정보보호책임자 : 강교혁 <a
							href="mailto:asitakak@brandxcorp.com">(asitakak@brandxcorp.com)</a></span>
						<p class="copyright">
							<span>젝시믹스 마케팅은 <a href="http://www.e-ruda.co.kr"
								target="_blank">이루다마케팅</A>이 함께합니다.
							</span><span class="last">호스팅사 : (주)코리아센터</span><br> <span
								class="last">Copyright 2015 Xexymix All Rights Reserved.</span>
						</p>
					</address>
				</div>
			</div>

			<div class="wrap_inner_right">
				<div class="topArea">
					<div class="cs">
						<dl>
							<dd class="tel">1661-2811</dd>
							<dd>평일 &nbsp; 10:00 - 17:00</dd>
							<dd>점심 &nbsp; 12:30 - 14:00</dd>
							<dd>휴일 &nbsp; 토/일/공휴일</dd>
						</dl>
						<a href="/board/board.html?code=xexymix_board1" class="cs_btn">고객만족센터
							<span>></span>
						</a>
					</div>
					<div class="bank">
						<dl>
							<dt>BANK INFO</dt>
							<dd>우리은행 &nbsp; 1005-703-294024</dd>
							<dd>국민은행 &nbsp; 431801-01-213327</dd>
							<dd>농 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 협 &nbsp;
								301-0259-9190-41</dd>
							<dd>(주)브랜드엑스코퍼레이션</dd>
						</dl>
						<dl style="margin-top: 15px;">
							<dd>입금자명 불일치시 자동연동이 되지않습니다.</dd>
							<dd>고객센터 또는 Q&amp;A 문의주세요.</dd>
						</dl>
					</div>
					<div class="community">
						<dl>
							<dt>SHOP MENU</dt>
							<dd>
								<a href="/board/board.html?code=xexymix_board3">공지사항</a>
							</dd>
							<dd>
								<a
									href="/board/board.html?code=xexymix_board3&page=1&type=v&board_cate=&num1=999801&num2=00000&number=-1&lock=N&flag=notice">회원정책</a>
							</dd>
							<dd>
								<a href="/shop/page.html?id=17">전국매장안내</a>
							</dd>
							<dd>
								<a href="/board/board.html?code=xexymix_board6">강사회원</a>
							</dd>
							<dd>
								<a href="/board/board.html?code=xexymix_board11">기업회원</a>
							</dd>
						</dl>
					</div>
				</div>
				<div class="topArea">
					<div class="cs">
						<dl>
							<dt>복지카드 사용처</dt>
							<dd>
								<img
									src="https://xexymix.jpg3.kr/xexymix/2020/main/footer_wfc_bk.png"
									height="23" alt="웰페이클럽">
							</dd>
						</dl>
					</div>
					<div class="lang">
						<dl>
							<dt>LANGUAGE</dt>
							<dd>
								<a href="https://www.xexymix.com/">한국어</a>
							</dd>
							<dd>
								<a href="https://en.xexymix.com/" target="_blank">English</a>
							</dd>
							<dd>
								<a href="https://www.xexymix.jp/" target="_blank"><img
									src="http://xexymix.jpg3.kr/xexymix/2020/main/txt_jpn.png"
									alt="일본"></a>
							</dd>
							<dd>
								<a href="https://www.xexymix.com.tw/" target="_blank"><img
									src="//xexymix.jpg3.kr/xexymix/2020/main/txt_twn.png" alt="대만"></a>
							</dd>
						</dl>
					</div>
					<div class="sns">
						<dl>
							<dt>SNS</dt>
							<dd>
								<a href="https://www.facebook.com/xexymix/" target="_blank"><img
									src="http://xexymix.jpg3.kr/xexymix/2020/main/footer_fb.png"
									alt="제시믹스 페이스북"></a>
							</dd>
							<dd>
								<a href="https://www.instagram.com/xexymix/" target="_blank"><img
									src="http://xexymix.jpg3.kr/xexymix/2020/main/footer_insta.png"
									alt="제시믹스 인스타그램"></a>
							</dd>
							<dd>
								<a
									href="https://www.youtube.com/channel/UC1oWjNJHLCJn8UXWaIbqYjg"
									target="_blank"><img
									src="http://xexymix.jpg3.kr/xexymix/2020/main/footer_youtube.png"
									alt="유튜브"></a>
							</dd>
						</dl>
					</div>
				</div>
			</div>

			<div class="pg_txt">
				고객님은 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수 있습니다. <a
					href="http://www.xexymix.com"
					onclick="window.open('https://pgweb.uplus.co.kr/pg/wmp/mertadmin/jsp/mertservice/s_escrowYn.jsp?mertid=mk_xexymix', 'check', 'width=339, height=263, scrollbars=no, left = 200, top = 50'); return false;">[서비스가입사실확인]</a>
			</div>
			<div class="isms_con">
				<div class="con">
					<p>
						* 인증범위 : 젝시믹스 서비스 운영<br>* 유효기간 : 2021.08.18 ~ 2024.08.17
					</p>
				</div>
				<div class="txt">젝시믹스는 정보보호 관리체계 인증을 받은 안전한 쇼핑몰입니다.</div>
			</div>
		</div>
	</div>
	<!-- #ftWrap -->
</body>
</html>
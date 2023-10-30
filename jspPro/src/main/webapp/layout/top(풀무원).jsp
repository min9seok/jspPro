<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<title>풀무원</title>
</head>
<body>
    <header id="header">
        <div class="container">
            <div class="logo-gnb-area">
                <!-- logo -->
                <h1 class="brand">
                    <a href="/" title="메인으로 가기">
                        <img src="/resources/images/contents/account_logo.png" alt="풀무원녹즙">
                    </a>
                </h1>
                <!-- // logo -->

                <!-- gnb -->
                <nav id="gnb">
                    <ul>
                        <li>
                            <button type="button" class="btn-menu" onclick="javascript:toggleMenu()">
                                <i class="ico ico-menu">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </i>
                                <span>메뉴보기</span>
                            </button>
                        </li>
                        <li>
                            <a href="/product/daily">매일배송</a>
                        </li>
                        <li>
                            <a href="/product/box">택배배송</a>
                        </li>
                        <li>
                            <a href="/customer/product">맞춤큐레이션</a>
                        </li>
                        <li>
                            <a href="/taste/taste">시음선물</a>
                        </li>
                        <li>
                            <a href="/event/event">이벤트</a>
                        </li>
                        <li>
                            <a href="/forum/faq?category=top10">고객기쁨센터</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="member-search-area">

                
                    <div class="head-util-area">
                        <a href="/mypage" data-require-login="true">
                            <i class="ico ico-myIcon"></i>
                            <span class="hide">로그인 페이지 / 마이 페이지로 가기</span>
                        </a>
                        <a href="/cart/daily">
                            <div class="counter hide" data-cart-size></div>
                            <i class="ico ico-cart1"></i>
                            <span class="hide">장바구니로 가기</span>
                        </a>
                    </div>
                

                


                <form class="search-area" action="/product/search">
                    <input type="text" id="" name="searchKeyword" value="" title="검색어 입력">
                    <button>
                        <i class="ico ico-srh1"></i>
                        <span class="hide">검색하기</span>
                    </button>
                </form>
            </div>
        </div>

        <div class="gnb-menu" id="gnb-item">
            <div class="container">
                <ol>
                    
                    <li>
                        <strong>매일배송</strong>
                        <ul>
                            
                            <li>
                                <a href="/product/daily" title="해당 페이지로 가기">전체</a>
                            </li>
                            
                            <li>
                                <a href="/product/daily?category=GOOD_001" title="해당 페이지로 가기">녹즙</a>
                            </li>
                            
                            <li>
                                <a href="/product/daily?category=GOOD_004" title="해당 페이지로 가기">엑스투</a>
                            </li>
                            
                            <li>
                                <a href="/product/daily?category=GOOD_031" title="해당 페이지로 가기">유산균</a>
                            </li>
                            
                            <li>
                                <a href="/product/daily?category=GOOD_060" title="해당 페이지로 가기">유제품</a>
                            </li>
                            
                            <li>
                                <a href="/product/daily?category=GOOD_062" title="해당 페이지로 가기">건강즙</a>
                            </li>
                            
                            <li>
                                <a href="/product/daily?category=GOOD_064" title="해당 페이지로 가기">영양&간식</a>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <li>
                        <strong>택배배송</strong>
                        <ul>
                            
                            <li>
                                <a href="/product/box" title="해당 페이지로 가기">전체</a>
                            </li>
                            
                            <li>
                                <a href="/product/box?category=GOOD_038" title="해당 페이지로 가기">녹즙</a>
                            </li>
                            
                            <li>
                                <a href="/product/box?category=GOOD_015" title="해당 페이지로 가기">스무디</a>
                            </li>
                            
                            <li>
                                <a href="/product/box?category=GOOD_008" title="해당 페이지로 가기">클렌즈랩</a>
                            </li>
                            
                            <li>
                                <a href="/product/box?category=GOOD_005" title="해당 페이지로 가기">건강즙</a>
                            </li>
                            
                            <li>
                                <a href="/product/box?category=GOOD_056" title="해당 페이지로 가기">키즈</a>
                            </li>
                            
                            <li>
                                <a href="/product/box?category=GOOD_063" title="해당 페이지로 가기">영양&amp;간식</a>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <li>
                        <strong>이벤트</strong>
                        <ul>
                            
                            <li>
                                <a href="/event/event" title="해당 페이지로 가기">진행중인 이벤트</a>
                            </li>
                            
                            <li>
                                <a href="/event/event/end" title="해당 페이지로 가기">종료된 이벤트</a>
                            </li>
                            
                            <li>
                                <a href="/event/event/winner" title="해당 페이지로 가기">당첨자 발표</a>
                            </li>
                            
                            <li>
                                <a href="/event/event/view/2394" title="해당 페이지로 가기">친구초대</a>
                            </li>
                            
                            <li>
                                <a href="/event/event/view/2757" title="해당 페이지로 가기">회원혜택</a>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <li>
                        <strong>창업안내</strong>
                        <ul>
                            
                            <li>
                                <a href="/info/foundation" title="해당 페이지로 가기">가맹점 개설안내</a>
                            </li>
                            
                            <li>
                                <a href="/info/business" title="해당 페이지로 가기">모닝스탭 안내</a>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <li>
                        <strong>고객기쁨센터</strong>
                        <ul>
                            
                            <li>
                                <a href="/forum/faq?category=top10" title="해당 페이지로 가기">FAQ</a>
                            </li>
                            
                            <li>
                                <a href="/forum/action/counsel/write" title="해당 페이지로 가기">1:1 문의</a>
                            </li>
                            
                            <li>
                                <a href="/forum/notice" title="해당 페이지로 가기">공지사항</a>
                            </li>
                            
                            <li>
                                <a href="/search/branch" title="해당 페이지로 가기">배송가능지역 검색</a>
                            </li>
                            
                        </ul>
                    </li>
                    
                </ol>
                <div class="sub-link">
                    <div>
                        <b>맞춤큐레이션</b>
                        <a href="/customer/product" title="해당 페이지로 가기">간단한 질문에 답하면 고객 맞춤 상품을 추천드려요
                            <i class="ico ico-arr-right6"></i>
                        </a>
                    </div>
                    <div>
                        <b class="fc-green">시음선물</b>
                        <a href="/taste/taste" title="해당 페이지로 가기" class="fc-green">친구 또는 나에게 녹즙 시음을 선물해 보세요
                            <i class="ico ico-arr-right5"></i>
                        </a>
                    </div>
                </div>
                <button type="button" class="gnb-close" onclick="javascript:toggleMenu()">
                    <i class="ico ico-close"></i>
                    <span class="hide">메뉴닫기</span>
                </button>
            </div>
        </div>
    </header>
</body>
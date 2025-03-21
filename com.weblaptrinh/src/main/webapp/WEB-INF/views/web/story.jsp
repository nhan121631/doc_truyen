<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.laptrinhjavaweb.util.SecurityUtils"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

					<c:if test="${not empty message}">
						<div class="alert alert-${alert}" role="alert">
  							${message}
						</div>
					</c:if>
      <main>
        <input type="hidden" id="story_slug" value="nang-khong-muon-lam-hoang-hau">
        <div class="container">
            <div class="row align-items-start">
                <div class="col-12 col-md-7 col-lg-8">
                    <div class="head-title-global d-flex justify-content-between mb-4">
                        <div class="col-12 col-md-12 col-lg-4 head-title-global__left d-flex">
                            <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                <span class="d-block text-decoration-none text-dark fs-4 title-head-name"
                                    title="Thông tin truyện">Thông
                                    tin truyện</span>
                            </h2>
                        </div>
                    </div>

                    <div class="story-detail">
                    
					<c:if test="${news != null}">
                        <div class="story-detail__top d-flex align-items-start">
                            <div class="row align-items-start">
                                <div class="col-12 col-md-12 col-lg-3 story-detail__top--image">
                                    <div class="book-3d">
                                        <img src="${pageContext.request.contextPath}/image/${news.thumbnail }"
                                            alt="${news.title }" class="img-fluid w-100" width="200"
                                            height="300" loading="lazy">
                                    </div>
                                </div>
                                <div class="col-12 col-md-12 col-lg-9">
                                    <h3 class="text-center story-name">${news.title}</h3>
                                    <div class="rate-story mb-2">
                                     
                                        <em class="rate-story__text"></em>
                                        <div class="rate-story__value" itemprop="aggregateRating" itemscope=""
                                            itemtype="https://schema.org/AggregateRating">
                                            <em>Lượt Xem:
                                                
                                                <strong>
                                                    <span itemprop="ratingCount">${news.view }</span>
                                                    lượt
                                                </strong>
                                            </em>
                                        </div>
                                    </div>

                                    <div class="story-detail__top--desc px-3" style="max-height: 285px;">
                                    ${news.shortDescription }
                                    </div>

                                    <div class="info-more">
                                        <div class="info-more--more active" id="info_more">
                                            <span class="me-1 text-dark">Xem thêm</span>
                                            <svg width="14" height="8" viewBox="0 0 14 8" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.70749 7.70718L13.7059 1.71002C14.336 1.08008 13.8899 0.00283241 12.9989 0.00283241L1.002 0.00283241C0.111048 0.00283241 -0.335095 1.08008 0.294974 1.71002L6.29343 7.70718C6.68394 8.09761 7.31699 8.09761 7.70749 7.70718Z"
                                                    fill="#2C2C37"></path>
                                            </svg>
                                        </div>

                                        <a class="info-more--collapse text-decoration-none"
                                            href="">
                                            <span class="me-1 text-dark">Thu gọn</span>
                                            <svg width="14" height="8" viewBox="0 0 14 8" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.70749 0.292817L13.7059 6.28998C14.336 6.91992 13.8899 7.99717 12.9989 7.99717L1.002 7.99717C0.111048 7.99717 -0.335095 6.91992 0.294974 6.28998L6.29343 0.292817C6.68394 -0.097606 7.31699 -0.0976055 7.70749 0.292817Z"
                                                    fill="#2C2C37"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="story-detail__bottom mb-3">
                            <div class="row">
                                <div class="col-12 col-md-12 col-lg-3 story-detail__bottom--info">
                                    <p class="mb-1">
                                        <strong>Tác giả:</strong>
                                        <a href="#"
                                            class="text-decoration-none text-dark hover-title">${news.author }</a>
                                    </p>
                                    <div class="d-flex align-items-center mb-1 flex-wrap">
                                        <strong class="me-1">Thể loại:</strong>
                                        <div class="d-flex align-items-center flex-warp">
                                            <a href=''
                                                class="text-decoration-none text-dark hover-title  me-1 "
                                                style="width: max-content;"> ${tl.name }
                                            </a>
                                        </div>
                                    </div>

                                    <p class="mb-1">
                                        <strong>Trạng thái:</strong>
                                        <span class="text-info">Full</span>
                                    </p>
                                    
                                    <!-- ==== -->
		                          <div class="product-ratings"><c:if test="${star != null}">
							        <h5>Số sao ${star} (${luot} lượt)</h5> </c:if>
							        <div class="star-chart">
							        <% 
							                Double starValue = (Double) request.getAttribute("star");
							     		   if (starValue == null) {
							                    starValue = 0.0;
							                }
							                int fullStars = (int) Math.floor(starValue);
							                boolean hasHalfStar = (starValue - fullStars > 0);
							                int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
							            %>
							
							            <!-- Hiển thị sao đầy đủ -->
							            <% for (int i = 0; i < fullStars; i++) { %>
							                <span class="star1 filled">&#9733;</span>
							            <% } %>
							
							            <!-- Hiển thị sao nửa nếu có -->
							            <% if (hasHalfStar) { %>
							                <span class="star1 half-filled">&#9733;</span>
							            <% } %>
							
							            <!-- Hiển thị sao trống -->
							            <% for (int i = 0; i < emptyStars; i++) { %>
							                <span class="star1">&#9733;</span>
							            <% } %>
							        </div>
							    </div>
                                    
                                   <!--  === -->
                                </div>

                            </div>
                        </div>
			</c:if>
                        <div class="story-detail__list-chapter">
                            <div class="head-title-global d-flex justify-content-between mb-4">
                                <div class="col-6 col-md-12 col-lg-4 head-title-global__left d-flex">
                                    <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                        <span href="#"
                                            class="d-block text-decoration-none text-dark fs-4 title-head-name"
                                            title="Truyện hot">Danh sách chương</span>
                                    </h2>
                                </div>
                            </div>
						<c:if test="${not empty chapters }">
						<c:forEach items="${chapters}" var="item">
                            <div class="story-detail__list-chapter--list">
                                <div class="row">
                                    <div class="col-12 col-sm-8 col-lg-8 story-detail__list-chapter--list__item">
                                        <ul>
                                            <li>
                                                <a href='<c:url value="/chapter?id=${item.id }"/>'
                                                    class="text-decoration-none text-dark hover-title">${item.nameChapter }</a>
                                            </li>                            
                                        </ul>
                                    </div>
                              
                                </div>
                            </div>
                            </c:forEach>
						</c:if>
                            
                        </div>

                        <div class="pagination" style="justify-content: center;">
                            <ul>
                                <li class="pagination__item  page-current">
                                    <a class="page-link story-ajax-paginate"
                                        data-url="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau?page=1"
                                        style="cursor: pointer;">1</a>
                                </li>
                                <li class="pagination__item ">
                                    <a class="page-link story-ajax-paginate"
                                        data-url="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau?page=2"
                                        style="cursor: pointer;">2</a>
                                </li>

                                <div class="dropup-center dropup choose-paginate me-1">
                                    <button class="btn btn-success dropdown-toggle" type="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        Chọn trang
                                    </button>
                                    <div class="dropdown-menu">
                                        <input type="number" class="form-control input-paginate me-1" value="">
                                        <button class="btn btn-success btn-go-paginate">
                                            Đi
                                        </button>
                                    </div>
                                </div>

                                <li class="pagination__arrow pagination__item">
                                    <a data-url="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau?page=2"
                                        style="cursor: pointer;"
                                        class="text-decoration-none w-100 h-100 d-flex justify-content-center align-items-center story-ajax-paginate">
                                        &gt;&gt;
                                    </a>
                                </li>
                            </ul>

                        </div>
                        <!-- ===== -->
                        <c:if test="${comments != null}">
                        	<div class="comments-list-wrap">
								<h4 class="comment-count-title">${luot} Đánh giá</h3>
									<div class="comment-list">
										<c:forEach items="${comments}" var="comment">
									    <div class="single-comment-body">
									        <div class="comment-user-avater">
									            <img src="<c:url value='/template/web/assets/images/avt.jpg' />" alt="">
									        </div>
									        <div class="comment-text-body">
									            <h6>${comment.firstName} ${comment.lastName}
									            <span class="comment-date"></span></h4>
									            <div class="star-chart">
									                <c:choose>
									                    <c:when test="${comment.star != null}">
									                        <c:set var="starValue" value="${comment.star}" />
									                        <c:set var="fullStars" value="${starValue}" />
									                        <c:set var="emptyStars" value="${5 - fullStars}" />
																<c:if test="${fullStars > 0}">
															    <c:forEach var="i" begin="0" end="${fullStars - 1}">
															        <span class="star1 filled">&#9733;</span>
															    </c:forEach>
															</c:if>
															<c:if test="${emptyStars > 0}">
															    <c:forEach var="i" begin="0" end="${emptyStars - 1}">
															        <span class="star1">&#9733;</span>
															    </c:forEach>
															</c:if>

									                    </c:when>
									                    <c:otherwise>
									                        <!-- Hiển thị sao trống nếu star là null -->
									                        <c:forEach var="i" begin="0" end="4">
									                            <span class="star1">&#9733;</span>
									                        </c:forEach>
									                    </c:otherwise>
									                </c:choose>
									            </div>
									            <p>${comment.comment }</p>
									        </div>
									    </div>
									</c:forEach>
									</div>
							</div>		
						</c:if>								
							
		
                       <!--  ===== -->
                       		<div class="comment-template">
								<h4>Leave a comment</h4>
								<p>If you have a comment dont feel hesitate to send us your opinion.</p>
									<h3>Rating</h3>
									<!-- @if(empty($lastdg)) -->
									<c:if test="${usercmt == null}">
									<form action="addcomment" method="post">
									 <input type="hidden" name="newId" value="${news.id }">
									<div class="rating">
											<input type="radio" name="rating" value="1" id="1-star"/>
											<label for="1-star" class="star">&#9733;</label>
											<input type="radio" name="rating" value="2" id="2-stars"/>
											<label for="2-stars" class="star">&#9733;</label>
											<input type="radio" name="rating" value="3" id="3-stars"/>
											<label for="3-stars" class="star">&#9733;</label>
											<input type="radio" name="rating" value="4" id="4-stars"/>
											<label for="4-stars" class="star">&#9733;</label>
											<input type="radio" name="rating" value="5" id="5-stars"/>
											<label for="5-stars" class="star">&#9733;</label>
										</div>                                        
										<p>
											<input type="text" placeholder="First Name" name="firstname" id="firstname">
											<input type="text" placeholder="Last Name" name="lastname" id="lastname">
										</p>
										<p><textarea name="comment" id="comment" cols="30" rows="10" placeholder="Your Message"></textarea></p>
										<p><input type="submit" value="Submit"></p>
									</form>
									</c:if>			
										<c:if test="${usercmt != null}">
									    <form action="updatecomment" method="put">
									     <input type="hidden" name="newId" value="${news.id }">
									     <input type="hidden" name="id" value="${usercmt.id }">
									        <div class="rating">
									            <input type="radio" name="rating" value="1" id="1-star" <c:if test="${usercmt.star == 1}">checked</c:if> />
									            <label for="1-star" class="star">&#9733;</label>
									            <input type="radio" name="rating" value="2" id="2-stars" <c:if test="${usercmt.star == 2}">checked</c:if> />
									            <label for="2-stars" class="star">&#9733;</label>
									            <input type="radio" name="rating" value="3" id="3-stars" <c:if test="${usercmt.star == 3}">checked</c:if> />
									            <label for="3-stars" class="star">&#9733;</label>
									            <input type="radio" name="rating" value="4" id="4-stars" <c:if test="${usercmt.star == 4}">checked</c:if> />
									            <label for="4-stars" class="star">&#9733;</label>
									            <input type="radio" name="rating" value="5" id="5-stars" <c:if test="${usercmt.star == 5}">checked</c:if> />
									            <label for="5-stars" class="star">&#9733;</label>
									        </div>
									        <p>
									            <input type="text" placeholder="First Name" name="firstname" id="firstname" value="${usercmt.firstName}">
									            <input type="text" placeholder="Last Name" name="lastname" id="lastname" value="${usercmt.lastName}">
									        </p>
									        <p><textarea name="comment" id="comment" cols="30" rows="10" placeholder="Your Message">${usercmt.comment}</textarea></p>
									        <p><input type="submit" value="Update"></p>
									    </form>
									</c:if>

							</div>
                      <!--  ==== -->
                    </div>
                </div>

                <div class="col-12 col-md-5 col-lg-4 sticky-md-top">

                    <div class="row top-ratings">
                        <div class="col-12 top-ratings__tab mb-2">
                            <div class="list-group d-flex flex-row" id="list-tab" role="tablist">
                                <a class="list-group-item list-group-item-action active" id="top-day-list"
                                    data-bs-toggle="list"
                                    href="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau#top-day" role="tab"
                                    aria-controls="top-day" aria-selected="true">Ngày</a>
                                <a class="list-group-item list-group-item-action" id="top-month-list"
                                    data-bs-toggle="list"
                                    href="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau#top-month"
                                    role="tab" aria-controls="top-month" aria-selected="false" tabindex="-1">Tháng</a>
                                <a class="list-group-item list-group-item-action" id="top-all-time-list"
                                    data-bs-toggle="list"
                                    href="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau#top-all-time"
                                    role="tab" aria-controls="top-all-time" aria-selected="false" tabindex="-1">All
                                    time</a>
                            </div>
                        </div>
                                  <div class="col-12 top-ratings__content">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="top-day" role="tabpanel"
                                    aria-labelledby="top-day-list">
                                    <ul>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-danger rounded-circle">
                                                    <span class="text-light">1</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/linh-vu-thien-ha"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Linh
                                                        Vũ Thiên Hạ</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/di-gioi"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Dị
                                                            Giới
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Huyền
                                                            Huyễn
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/xuyen-khong"
                                                            class="text-decoration-none text-dark hover-title ">Xuyên
                                                            Không
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-success rounded-circle">
                                                    <span class="text-light">2</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/than-dao-dan-ton"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Thần
                                                        Đạo Đan Tôn</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-info rounded-circle">
                                                    <span class="text-light">3</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/me-vo-khong-loi-ve"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Mê
                                                        Vợ Không Lối Về</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/ngon-tinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngôn
                                                            Tình
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/nguoc"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngược
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/sung"
                                                            class="text-decoration-none text-dark hover-title ">Sủng
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">4</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/dau-pha-thuong-khung"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Đấu
                                                        Phá Thương Khung</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/di-gioi"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Dị
                                                            Giới
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">5</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/the-gioi-hoan-my"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Thế
                                                        Giới Hoàn Mỹ</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/kiem-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Kiếm
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">6</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/co-vo-ngot-ngao-co-chut-bat-luong-vo-moi-bat-luong-co-chut-ngot"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Cô
                                                        Vợ Ngọt Ngào Có Chút Bất Lương (Vợ Mới Bất Lương Có Chút
                                                        Ngọt)</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/ngon-tinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngôn
                                                            Tình
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/trong-sinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Trọng
                                                            Sinh
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/sung"
                                                            class="text-decoration-none text-dark hover-title ">Sủng
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">7</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/pham-nhan-tu-tien"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Phàm
                                                        Nhân Tu Tiên</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/kiem-hiep"
                                                            class="text-decoration-none text-dark hover-title ">Kiếm
                                                            Hiệp
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">8</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/nhat-niem-vinh-hang"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Nhất
                                                        Niệm Vĩnh Hằng</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">9</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/de-ba"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Đế
                                                        Bá</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">10</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/re-quy-troi-cho"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Rể
                                                        Quý Trời Cho</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/ngon-tinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngôn
                                                            Tình
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/do-thi"
                                                            class="text-decoration-none text-dark hover-title ">Đô Thị
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div class="tab-pane fade" id="top-month" role="tabpanel"
                                    aria-labelledby="top-month-list">
                                    <ul>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-danger rounded-circle">
                                                    <span class="text-light">1</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/linh-vu-thien-ha"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Linh
                                                        Vũ Thiên Hạ</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/di-gioi"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Dị
                                                            Giới
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Huyền
                                                            Huyễn
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/xuyen-khong"
                                                            class="text-decoration-none text-dark hover-title ">Xuyên
                                                            Không
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-success rounded-circle">
                                                    <span class="text-light">2</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/than-dao-dan-ton"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Thần
                                                        Đạo Đan Tôn</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-info rounded-circle">
                                                    <span class="text-light">3</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/me-vo-khong-loi-ve"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Mê
                                                        Vợ Không Lối Về</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/ngon-tinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngôn
                                                            Tình
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/nguoc"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngược
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/sung"
                                                            class="text-decoration-none text-dark hover-title ">Sủng
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">4</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/dau-pha-thuong-khung"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Đấu
                                                        Phá Thương Khung</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/di-gioi"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Dị
                                                            Giới
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">5</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/the-gioi-hoan-my"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Thế
                                                        Giới Hoàn Mỹ</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/kiem-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Kiếm
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">6</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/co-vo-ngot-ngao-co-chut-bat-luong-vo-moi-bat-luong-co-chut-ngot"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Cô
                                                        Vợ Ngọt Ngào Có Chút Bất Lương (Vợ Mới Bất Lương Có Chút
                                                        Ngọt)</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/ngon-tinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngôn
                                                            Tình
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/trong-sinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Trọng
                                                            Sinh
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/sung"
                                                            class="text-decoration-none text-dark hover-title ">Sủng
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">7</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/pham-nhan-tu-tien"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Phàm
                                                        Nhân Tu Tiên</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/kiem-hiep"
                                                            class="text-decoration-none text-dark hover-title ">Kiếm
                                                            Hiệp
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">8</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/nhat-niem-vinh-hang"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Nhất
                                                        Niệm Vĩnh Hằng</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">9</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/de-ba"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Đế
                                                        Bá</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">10</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/re-quy-troi-cho"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Rể
                                                        Quý Trời Cho</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/ngon-tinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngôn
                                                            Tình
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/do-thi"
                                                            class="text-decoration-none text-dark hover-title ">Đô Thị
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div class="tab-pane fade" id="top-all-time" role="tabpanel"
                                    aria-labelledby="top-all-time-list">
                                    <ul>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-danger rounded-circle">
                                                    <span class="text-light">1</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/linh-vu-thien-ha"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Linh
                                                        Vũ Thiên Hạ</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/di-gioi"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Dị
                                                            Giới
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Huyền
                                                            Huyễn
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/xuyen-khong"
                                                            class="text-decoration-none text-dark hover-title ">Xuyên
                                                            Không
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-success rounded-circle">
                                                    <span class="text-light">2</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/than-dao-dan-ton"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Thần
                                                        Đạo Đan Tôn</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-info rounded-circle">
                                                    <span class="text-light">3</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/dau-pha-thuong-khung"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Đấu
                                                        Phá Thương Khung</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/di-gioi"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Dị
                                                            Giới
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">4</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/co-vo-ngot-ngao-co-chut-bat-luong-vo-moi-bat-luong-co-chut-ngot"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Cô
                                                        Vợ Ngọt Ngào Có Chút Bất Lương (Vợ Mới Bất Lương Có Chút
                                                        Ngọt)</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/ngon-tinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Ngôn
                                                            Tình
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/trong-sinh"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Trọng
                                                            Sinh
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/sung"
                                                            class="text-decoration-none text-dark hover-title ">Sủng
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">5</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/pham-nhan-tu-tien"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Phàm
                                                        Nhân Tu Tiên</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/kiem-hiep"
                                                            class="text-decoration-none text-dark hover-title ">Kiếm
                                                            Hiệp
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">6</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/nhat-niem-vinh-hang"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Nhất
                                                        Niệm Vĩnh Hằng</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">7</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href="https://suustore.com/truyen/de-ba"
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Đế
                                                        Bá</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">8</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href=""
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Vũ
                                                        Động Càn Khôn</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href=""
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href=""
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="rating-item d-flex align-items-center">
                                                <div class="rating-item__number bg-light border rounded-circle">
                                                    <span class="text-dark">9</span>
                                                </div>
                                                <div class="rating-item__story">
                                                    <a href=""
                                                        class="text-decoration-none hover-title rating-item__story--name text-one-row">Độc
                                                        Tôn Tam Giới</a>
                                                    <div class="d-flex flex-wrap rating-item__story--categories">
                                                        <a href="https://suustore.com/the-loai/tien-hiep"
                                                            class="text-decoration-none text-dark hover-title  me-1 ">Tiên
                                                            Hiệp
                                                            ,
                                                        </a>
                                                        <a href="https://suustore.com/the-loai/huyen-huyen"
                                                            class="text-decoration-none text-dark hover-title ">Huyền
                                                            Huyễn
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section-list-category bg-light p-2 rounded card-custom">
                        <div class="head-title-global mb-2">
                            <div class="col-12 col-md-12 head-title-global__left">
                                <h2 class="mb-0 border-bottom border-secondary pb-1">
                                    <span href="#" class="d-block text-decoration-none text-dark fs-4"
                                        title="Truyện đang đọc">Thể loại truyện</span>
                                </h2>
                            </div>
                        </div>
                        <div class="row">
                            <!-- Horizontal under breakpoint -->
                            <ul class="list-category">
                            <c:if test="${not empty categories}">
                            <c:forEach items="${categories }" var="item">
                                <li class="">
                                    <a href='<c:url value="/category?id=${item.id }"/>'
                                        class="text-decoration-none text-dark hover-title">${item.name }</a>
                                </li>
                                </c:forEach>
                            </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </main>   
    <script>
    
    var jsStars = [[${usercmt != null ? usercmt.star : 0}]];

    // Bắt sự kiện khi tải trang và hiển thị số sao từ jsStars
    document.addEventListener('DOMContentLoaded', function() {
        const stars = document.querySelectorAll('.star');
        stars.forEach((s, i) => {
            s.style.color = '#ccc';
        });
        for (let i = 0; i < jsStars; i++) {
            stars[i].style.color = 'gold';
        }
    });
// Bắt sự kiện khi click vào bất kỳ ngôi sao nào
			const stars = document.querySelectorAll('.star');
			stars.forEach((star, index) => {
				star.addEventListener('click', function() {
					// Đặt tất cả các ngôi sao thành màu xám
					stars.forEach((s, i) => {
						s.style.color = '#ccc';
					});
		
					// Đặt màu vàng cho ngôi sao được chọn và các ngôi sao trước và sau đó
					for (let i = 0; i <= index; i++) {
						stars[i].style.color = 'gold';
					}
				});
			});
		
		</script>
</body>
</html>

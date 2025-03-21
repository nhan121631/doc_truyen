<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="erURL" value="/trang-chu"/>
<c:url var="scURL" value="/story"/>
<c:url var="storyAPI" value="/api/update"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web đọc truyện</title>
</head>
<body>
    <main>
        <div class="section-stories-hot mb-3">
            <div class="container">
                <div class="row">
                    <div class="head-title-global d-flex justify-content-between mb-2">
                        <div class="col-12 col-md-8 col-lg-8 head-title-global__left d-flex align-items-center">
                            <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                <a href="#" class="d-block text-decoration-none text-dark fs-4 story-name"
                                    title="Truyện Hot">Truyện Hot</a>
                            </h2>
                            <i class="fa-solid fa-fire-flame-curved"></i>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                 
                        <div class="section-stories-hot__list">
                           <c:if test="${news != null }">
                   			 <c:forEach items="${news }" var="item">
                            <div class="story-item">
                            <input type="hidden" value="${item.id }" name="id"/>
                                <a href="updateview?id=${item.id }" type="submit" class="d-block text-decoration-none">
                                    <div class="story-item__image">
                                        <img src="${pageContext.request.contextPath}/image/${item.thumbnail }" alt="Tự Cẩm" class="img-fluid" width="150"
                                            height="230" loading="lazy">
                                    </div>
                                    <h3 class="story-item__name text-one-row story-name">${item.title}</h3>
                                    <div class="list-badge">
                                        <span class="story-item__badge badge text-bg-success">Full</span>

                                        <span
                                            class="story-item__badge story-item__badge-hot badge text-bg-danger">Hot</span>

                                        <span
                                            class="story-item__badge story-item__badge-new badge text-bg-info text-light">New</span>

                                    </div>
                                </a>
                            </div>
                            </c:forEach>
                            </c:if>
                           
                        </div>

                        <div class="section-stories-hot__list wrapper-skeleton d-none">
                            <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row align-items-start">
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="section-stories-new mb-3">
                        <div class="row">
                            <div class="head-title-global d-flex justify-content-between mb-2">
                                <div class="col-6 col-md-4 col-lg-4 head-title-global__left d-flex align-items-center">
                                    <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                        <a href="https://suustore.com/#"
                                            class="d-block text-decoration-none text-dark fs-4 story-name"
                                            title="Truyện Mới">Truyện Mới</a>
                                    </h2>
                                </div>

                            </div>
                        </div>
 			 <c:if test="${news != null }">
                    <c:forEach items="${news }" var="item">
                        <div class="row">
                            <div class="col-12">
                                <div class="section-stories-new__list">
                                    <div class="story-item-no-image">
                                        <div class="story-item-no-image__name d-flex align-items-center">
                                            <h3 class="me-1 mb-0 d-flex align-items-center">

                                                <svg style="width: 10px; margin-right: 5px;"
                                                    xmlns="http://www.w3.org/2000/svg" height="1em"
                                                    viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                    <path
                                                        d="M278.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-160 160c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L210.7 256 73.4 118.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l160 160z">
                                                    </path>
                                                </svg>
                                                <a href="updateview?id=${item.id }"
                                                    class="text-decoration-none text-dark fs-6 hover-title text-one-row story-name">${item.title}</a>
                                            </h3>
                                            <span class="badge text-bg-info text-light me-1">New</span>

                                            <span class="badge text-bg-success text-light me-1">Full</span>

                                            <span class="badge text-bg-danger text-light">Hot</span>
                                        </div>


                                    </div>  
                                </div>
                            </div>
                        </div>
                         </c:forEach></c:if>
                        
                    </div>
                </div>

                <div class="col-12 col-md-4 col-lg-3 sticky-md-top">
                    <div class="row">

                        <div class="col-12">
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
                                    <c:if test="${categories != null }">
                                <c:forEach items="${categories}" var="item">
                                        <li class="">
                                            <a href='<c:url value="/category?id=${item.id }"/>' class="text-decoration-none text-dark hover-title">${item.name}</a>
                                        </li> 
                                        </c:forEach>
                                        </c:if>                                 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>   
</body>
</html>
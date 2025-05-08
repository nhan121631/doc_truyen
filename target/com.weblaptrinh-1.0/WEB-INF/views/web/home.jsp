<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <main>
        <div class="section-stories-hot mb-3">
            <div class="container">
                <div class="row">
                    <div class="head-title-global d-flex justify-content-between mb-2">
                        <div class="col-6 col-md-4 col-lg-4 head-title-global__left d-flex align-items-center">
                            <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                <a href="#" class="d-block text-decoration-none text-dark fs-4 story-name"
                                    title="Truyện Hot">Truyện Hot</a>
                            </h2>
                            <i class="fa-solid fa-fire-flame-curved"></i>
                        </div>

                        <div class="col-4 col-md-3 col-lg-2">
                            <select class="form-select select-stories-hot" aria-label="Truyen hot">
                                <option selected="">Tất cả</option>
                                <option value="1">Ngôn Tình</option>
                                <option value="2">Trọng Sinh</option>
                                <option value="3">Cổ Đại</option>
                                <option value="4">Tiên Hiệp</option>
                                <option value="5">Ngược</option>
                                <option value="6">Khác</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                    <c:if test="${news != null }">
                    <c:forEach items="${news }" var="item">
                        <div class="section-stories-hot__list">
                            <div class="story-item">
                                <a href="story.html" class="d-block text-decoration-none">
                                    <div class="story-item__image">
                                        <img src="${pageContext.request.contextPath}/image/${item.thumnail }" alt="Tự Cẩm" class="img-fluid" width="150"
                                            height="230" loading="lazy">
                                    </div>
                                    <h3 class="story-item__name text-one-row story-name">Tự Cẩm</h3>

                                    <div class="list-badge">
                                        <span class="story-item__badge badge text-bg-success">Full</span>

                                        <span
                                            class="story-item__badge story-item__badge-hot badge text-bg-danger">Hot</span>

                                        <span
                                            class="story-item__badge story-item__badge-new badge text-bg-info text-light">New</span>

                                    </div>
                                </a>
                            </div>
                            
                        </div>
</c:forEach></c:if>
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
                                                <a href="#"
                                                    class="text-decoration-none text-dark fs-6 hover-title text-one-row story-name">Kiếm
                                                    Động Cửu Thiên</a>
                                            </h3>
                                            <span class="badge text-bg-info text-light me-1">New</span>

                                            <span class="badge text-bg-success text-light me-1">Full</span>

                                            <span class="badge text-bg-danger text-light">Hot</span>
                                        </div>

                                        <div class="story-item-no-image__categories ms-2 d-none d-lg-block">
                                            <p class="mb-0">
                                                <a href="#"
                                                    class="hover-title text-decoration-none text-dark category-name">Tiên
                                                    Hiệp, </a>
                                                <a href="#"
                                                    class="hover-title text-decoration-none text-dark category-name">Kiếm
                                                    Hiệp, </a>
                                                <a href="#"
                                                    class="hover-title text-decoration-none text-dark category-name">Dị
                                                    Giới, </a>
                                            </p>
                                        </div>

                                        <div class="story-item-no-image__chapters ms-2">
                                            <a href="#" class="hover-title text-decoration-none text-info">Chương
                                                1149</a>
                                        </div>


                                    </div>  
                                </div>
                            </div>
                        </div>
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
                                        <li class="">
                                            <a href="#" class="text-decoration-none text-dark hover-title">Ngôn Tình</a>
                                        </li>                                  
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-stories-full mb-3 mt-3">
            <div class="container">
                <div class="row">
                    <div class="head-title-global d-flex justify-content-between mb-2">
                        <div class="col-12 col-md-4 head-title-global__left d-flex">
                            <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                <span class="d-block text-decoration-none text-dark fs-4 title-head-name"
                                    title="Truyện đã hoàn thành">Truyện đã hoàn thành</span>
                            </h2>
                            <!-- <i class="fa-solid fa-fire-flame-curved"></i> -->
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="section-stories-full__list">
                            <div class="story-item-full text-center">
                                <a href="#" class="d-block story-item-full__image">
                                    <img src="./assets/images/tu_cam.jpg" alt="Tự Cẩm" class="img-fluid w-100"
                                        width="150" height="230" loading="lazy">
                                </a>
                                <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                    <a href="#"
                                        class="text-decoration-none text-one-row story-name">
                                        Tự Cẩm
                                    </a>
                                </h3>
                                <span class="story-item-full__badge badge text-bg-success">Full - 836 chương</span>
                            </div>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
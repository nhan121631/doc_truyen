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
        <div class="chapter-wrapper container my-5">
            <a href="#" class="text-decoration-none">
                <h1 class="text-center text-success">${news.title }</h1>
            </a>
            <a href="#" class="text-decoration-none">
                <p class="text-center text-dark">${model.nameChapter }</p>
            </a>
            <hr class="chapter-start container-fluid">
            <div class="chapter-nav text-center">
                <div class="chapter-actions chapter-actions-origin d-flex align-items-center justify-content-center">
                    <a class="btn btn-success me-1 chapter-prev"
                        href="#" title=""> <span>Chương
                        </span>trước</a>
                    <button class="btn btn-success chapter_jump me-1" data-story-id="3" data-slug-chapter="chuong-1"
                        data-slug-story="nang-khong-muon-lam-hoang-hau">
                        <span>
                            <svg style="fill: #fff;" xmlns="http://www.w3.org/2000/svg" height="1em"
                                viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path
                                    d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z">
                                </path>
                            </svg>

                        </span>
                    </button>

                    <div class="dropdown select-chapter me-1 d-none">
                        <a class="btn btn-secondary dropdown-toggle" role="button"
                            id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            Chọn chương
                        </a>

                        <ul class="dropdown-menu select-chapter__list" aria-labelledby="dropdownMenuLink">

                        </ul>
                    </div>
                    <a class="btn btn-success chapter-next"
                        href="" title=""><span>Chương
                        </span>tiếp</a>
                </div>
            </div>
            <hr class="chapter-end container-fluid">


            <div class="chapter-content mb-3">
                <div class="visible-md visible-lg ads-responsive incontent-ad" id="ads-chapter-pc-top" align="center"
                    style="height:90px">
                    </div>     ${model.content}      

            <div class="text-center px-2 py-2 alert alert-success d-none d-lg-block" role="alert">Bạn có thể dùng phím
                mũi tên hoặc WASD để
                lùi/sang chương</div>
        </div>

        <div class="chapter-actions chapter-actions-mobile d-flex align-items-center justify-content-center">
            <a class="btn btn-success me-2 chapter-prev"
                href="#" title=""> <span>Chương
                </span>trước</a>
            <button class="btn btn-success chapter_jump me-2" data-story-id="3" data-slug-chapter="chuong-1"
                data-slug-story="nang-khong-muon-lam-hoang-hau"><span>

                    <svg style="fill: #fff;" xmlns="http://www.w3.org/2000/svg" height="1em"
                        viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                        <path
                            d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z">
                        </path>
                    </svg>
                </span></button>

            <div class="dropup select-chapter me-2 d-none">
                <a class="btn btn-secondary dropdown-toggle" role="button"
                    id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                    Chọn chương
                </a>

                <ul class="dropdown-menu select-chapter__list" aria-labelledby="dropdownMenuLink">

                </ul>
            </div>
            <a class="btn btn-success chapter-next" href="#"
                title=""><span>Chương </span>tiếp</a>
        </div>
    </main>
</body>
</html>
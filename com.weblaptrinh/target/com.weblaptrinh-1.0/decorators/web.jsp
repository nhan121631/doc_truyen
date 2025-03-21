<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!-- saved from url=(0021)https://suustore.com/ -->
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">


    <!-- Bootstrap CSS v5.2.1 -->

    <link href="<c:url value='/template/web/assets/bootstrap.min.css' />" rel="stylesheet">

    <link rel="shortcut icon" href="https://suustore.com/assets/frontend/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="<c:url value='/template/web/assets/app.css' />">



    <script>
        window.SuuTruyen = {
            baseUrl: 'https://suustore.com',
            urlCurrent: 'https://suustore.com',
            csrfToken: '4EebYu2rWivdRk1ET12dyuY0CJjpRERhJynPtvUy'
        }
    </script>

    <title>Demo Truyện</title>
    <meta name="description"
        content="Đọc truyện online, truyện hay. Demo Truyện luôn tổng hợp và cập nhật các chương truyện một cách nhanh nhất.">
</head>
<body>
<!-- header -->
    	<%@ include file="/common/web/header.jsp" %>
    	<!-- header -->
		
		<dec:body/>
		
		<!-- footer -->
    	<%@ include file="/common/web/footer.jsp" %>
 	<script src= "<c:url value='/template/web/assets/jquery.min.js' />">
    </script>
    <script src= "<c:url value='/template/web/assets/popper.min.js' />">
    </script>
    <script src= "<c:url value='/template/web/assets/bootstrap.min.js' />">
    </script>
    <script src= "<c:url value='/template/web/assets/app.js' />">
    </script>
    <script src=  "<c:url value='/template/web/assets/common.js' />" ></script>
    <script src=  "<c:url value='/template/web/assets/story.js' />"></script>

</body>
</html>

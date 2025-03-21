<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newURL" value="/quan-tri/category/list"/>
<c:url var="editNewURL" value="/quan-tri/category/edit"/>
<c:url var="newAPI" value="/api/category"/>
<c:url var="checkCodeAPI" value="/api/checkcode"/>

<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>

				<li><a href="#">Forms</a></li>
				<li class="active">Form Elements</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
  							${message}
						</div>
					</c:if>
					<form:form class="form-horizontal" role="form" id="formSubmit"  modelAttribute="model">
					<c:set var="code" value="${model.code }" />
					
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Category Code </label>
								<div class="col-sm-9">
									<form:input path="code" cssClass="col-xs-10 col-sm-5" />
								</div>
						</div>
						<div class="form-group">
						  	<label for="shortDescription" class="col-sm-3 control-label no-padding-right">Category Name</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="name" rows="5" cols="10" cssClass="form-control" id="name"/>
						  	</div>
						</div>
						<form:hidden path="id" id="newId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
											<c:if test="${not empty model.id}">
												<button class="btn btn-info" type="submit" id="btnAddOrUpdateNew">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật danh mục
												</button>
											</c:if>
											<c:if test="${empty model.id}">
												<button class="btn btn-info" type="submit" id="btnAddOrUpdateNew">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm danh mục
												</button>
											</c:if>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Hủy
											</button>
							</div>		
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>	

<script>
	$('#btnAddOrUpdateNew').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
	    	
            data[""+v.name+""] = v.value;
        });
	    var id = $('#newId').val();
	    if (id == "") {
	    	addNew(data);
	    } else {
	    	updateNew(data);
	    }
	});
	
	
	function addNew(data) {
		// Kiểm tra nhập đầy đủ thông tin và định dạng mã hàng hợp lệ
		if (!data.code || !data.name) {
		    alert("Vui lòng nhập đầy đủ thông tin!");
		    return;
		}

		// Kiểm tra độ dài tối thiểu của mã hàng
		if (data.code.length < 2) {
		    alert("Category Code phải có ít nhất 2 ký tự");
		    return;
		}

  	// Kiểm tra ký tự hợp lệ trong mã hàng (ít nhất một chữ cái hoặc số, và cho phép '-', '_', '.')
		if (!/^(?=.*[a-zA-Z0-9])[a-zA-Z0-9._-]+$/.test(data.code)) {
		    alert("Category Code phải có ít nhất một chữ cái hoặc số và có thể chứa các ký tự '-', '_', '.'");
		    return;
		}
		
	/* 	// Kiểm tra độ dài tối thiểu của tên danh mục
		if (data.name.length < 3) {
		    alert("Category Name phải có ít nhất 3 ký tự");
		    return;
		} */
		// Kiểm tra độ dài tối thiểu của tên danh mục
		if (data.name.replace(/\s/g, "").length < 3) {
		    alert("Category Name phải có ít nhất 3 ký tự không bao gồm khoảng trắng");
		    return;
		}
		// Kiểm tra ký tự hợp lệ trong tên danh mục (chỉ cho phép chữ cái và khoảng trắng)
		if (!/^[A-Za-zÀ-ỹà-ỹ\s]+$/.test(data.name)) {
		    alert("Category Name chỉ được chứa chữ cái và khoảng trắng");
		    return;
		}


	    $.ajax({
	        url: '${checkCodeAPI}',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ code: data.code }),
	        dataType: 'json',
	        success: function (result) {
	            if (result.exists) {
	                alert("Mã code đã tồn tại!");
	                return;
	            } else {	             
	                $.ajax({
	                    url: '${newAPI}',
	                    type: 'POST',
	                    contentType: 'application/json',
	                    data: JSON.stringify(data),
	                    dataType: 'json',
	                    success: function (result) {
	                        window.location.href = "${editNewURL}?id=" + result.id + "&message=insert_success";
	                    },
	                    error: function (error) {
	                        window.location.href = "${newURL}?page=1&limit=2&message=error_system";
	                    }
	                });
	            }
	        },
	        error: function (error) {
	            alert("Có lỗi xảy ra trong quá trình kiểm tra mã code.");
	        }
	    });
	}

	function updateNew(data) {
		// Kiểm tra nhập đầy đủ thông tin và định dạng mã hàng hợp lệ
		if (!data.code || !data.name) {
		    alert("Vui lòng nhập đầy đủ thông tin!");
		    return;
		}

		// Kiểm tra độ dài tối thiểu của mã hàng
		if (data.code.length < 2) {
		    alert("Category Code phải có ít nhất 2 ký tự");
		    return;
		}

  	// Kiểm tra ký tự hợp lệ trong mã hàng (ít nhất một chữ cái hoặc số, và cho phép '-', '_', '.')
		if (!/^(?=.*[a-zA-Z0-9])[a-zA-Z0-9._-]+$/.test(data.code)) {
		    alert("Category Code phải có ít nhất một chữ cái hoặc số và có thể chứa các ký tự '-', '_', '.'");
		    return;
		}
		
	/* 	// Kiểm tra độ dài tối thiểu của tên danh mục
		if (data.name.length < 3) {
		    alert("Category Name phải có ít nhất 3 ký tự");
		    return;
		} */
		// Kiểm tra độ dài tối thiểu của tên danh mục
		/* if (data.name.trim().length < 3) {
		    alert("Category Name phải có ít nhất 3 ký tự không bao gồm khoảng trắng");
		    return;
		} */
		
		if (data.name.replace(/\s/g, "").length < 3) {
		    alert("Category Name phải có ít nhất 3 ký tự không bao gồm khoảng trắng");
		    return;
		}
		
		// Kiểm tra ký tự hợp lệ trong tên danh mục (chỉ cho phép chữ cái và khoảng trắng)
		if (!/^[A-Za-zÀ-ỹà-ỹ\s]+$/.test(data.name)) {
		    alert("Category Name chỉ được chứa chữ cái và khoảng trắng");
		    return;
		}

		
	    $.ajax({
	        url: '${checkCodeAPI}', 
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ code: data.code}),
	        dataType: 'json',
	        success: function (result) {
	        	 var c = "${code}";
	        	console.log("Result code:", c); 
	            console.log("Data code:", data.code); 
	            if (result.exists && c !== data.code) {
	                alert("Mã code đã tồn tại!");
	                return;
	            } else {

	                $.ajax({
	                    url: '${newAPI}', 
	                    type: 'PUT',
	                    contentType: 'application/json',
	                    data: JSON.stringify(data),
	                    dataType: 'json',
	                    success: function (result) {
	                      
	                        window.location.href = "${editNewURL}?id=" + result.id + "&message=update_success";
	                    },
	                    error: function (error) {
	                        let message = "error_system"; 
	                        if (error.responseJSON && error.responseJSON.message) {
	                            message = error.responseJSON.message;
	                        }
	                        window.location.href = "${editNewURL}?id=" + data.id + "&message=" + message;
	                    }
	                });
	            }
	        },
	        error: function (error) {
	            alert("Lỗi trong việc kiểm tra mã code. Vui lòng thử lại!");
	        }
	    });
	}


</script>
</body>
</html>
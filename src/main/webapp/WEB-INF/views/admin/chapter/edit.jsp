<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newURL" value="/quan-tri/chapter/list"/>
<c:url var="editNewURL" value="/quan-tri/chapter/edit"/>
<c:url var="newAPI" value="/api/chapter"/>
<html>
<head>
<title>Chỉnh sửa chương</title>
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
					<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
					
						 <%-- role="form" id="formSubmit" --%>
						<div class="form-group">
							  <label for="new_id" class="col-sm-3 control-label no-padding-right">Tên Truyện:</label>
							  <div class="col-sm-9">
							  	 <form:select path="new_id" id="new_id" name="new_id">
							  	 	<form:option value="" label="-- Chọn Tên Truyện --"/>
							  	 	<form:options items="${news}"/>
							  	 </form:select>
							  </div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Chapter Name</label>
								<div class="col-sm-9">
									<form:input path="nameChapter" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
			<%-- 	<div class="form-group">
						  	<label for="shortDescription" class="col-sm-3 control-label no-padding-right">Chapter Content</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="content" rows="5" cols="10" cssClass="form-control" id="content"/>
						  	</div>
						</div>  --%>
						
					 	<div class="form-group">
		                  	<label for="shortDescription" class="col-sm-3 control-label no-padding-right"> Chapter Content</label>
		                   	<div class="col-sm-9">
		                   		<form:textarea path="content" rows="5" cols="10" cssClass="form-control summernote" id="content"/>
		                   </div>
		                </div> 
						
						<form:hidden path="id" id="newId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
											<c:if test="${not empty model.id}">
												<button class="btn btn-info" type="submit" id="btnAddOrUpdateNew">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật bài viết
												</button>
											</c:if>
											<c:if test="${empty model.id}">
												<button class="btn btn-info" type="submit" id="btnAddOrUpdateNew">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm bài viết
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

	$(document).ready(function() {
	    //Thiết lập Editor Summernote
	    $('.summernote').summernote({
	        height: 240,                 
	        minHeight: null,             
	        maxHeight: null,             
	        focus: false                 
	    }); 
	});
	//CKEDITOR.replace('mota');
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
		if (!data.new_id|| !data.nameChapter || !data.content) {
		    alert("Vui lòng nhập đầy đủ thông tin!");
		    return;
		}
		// Kiểm tra độ dài tối thiểu của tên truyện
		if (data.nameChapter.replace(/\s/g, "").length < 5) {
		    alert("Chapter Name phải có ít nhất 5 ký tự và không bao gồm khoảng trắng!");
		    return;
		}

		// Kiểm tra tên chương chỉ chứa chữ cái, chữ có dấu, khoảng trắng và chữ số
		if (!/^[A-Za-zÀ-ỹà-ỹ0-9\s]+$/.test(data.nameChapter)) {
		    alert("Chapter Name chỉ được chứa chữ cái, chữ số và khoảng trắng!");
		    return;
		}

		if (data.content.replace(/\s/g, "").length <150) {
		    alert("Chapter content phải có ít nhất 150 ký tự và không bao gồm khoảng trắng!");
		    return;
		}
		$.ajax({
            url: '${newAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${newURL}?page=1&limit=2&message=error_system";
            }
        });
	}
	
	function updateNew(data) {
		if (!data.new_id|| !data.nameChapter || !data.content) {
		    alert("Vui lòng nhập đầy đủ thông tin!");
		    return;
		}
		// Kiểm tra độ dài tối thiểu của tên truyện
		if (data.nameChapter.replace(/\s/g, "").length < 5) {
		    alert("Chapter Name phải có ít nhất 5 ký tự và không bao gồm khoảng trắng!");
		    return;
		}

		// Kiểm tra tên chương chỉ chứa chữ cái, chữ có dấu, khoảng trắng và chữ số
		if (!/^[A-Za-zÀ-ỹà-ỹ0-9\s]+$/.test(data.nameChapter)) {
		    alert("Chapter Name chỉ được chứa chữ cái, chữ số và khoảng trắng!");
		    return;
		}

		if (data.content.replace(/\s/g, "").length <150) {
		    alert("Chapter content phải có ít nhất 150 ký tự và không bao gồm khoảng trắng!");
		    return;
		}
		$.ajax({
            url: '${newAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=error_system";
            }
        });
	}  
</script>
</body>
</html>
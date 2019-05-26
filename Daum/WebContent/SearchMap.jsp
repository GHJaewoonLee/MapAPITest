<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script>
			$(function() {
				$("#search").keydown(function(key) {
					if (key.keyCode == 13) {
						var places = new daum.maps.services.Places();
						
						var callback = function(result, status) {
							if (status == daum.maps.services.Status.OK) {
								console.log(result);
							}
						}
						
						places.keywordSearch($("#search").val(), callback, {size : 15, page : 2});
					}
				});
			});
		</script>
	</head>
	<body>
		<div id="map" style="width:500px; height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830&libraries=services"></script>
		<input id="search" type="text" name="search" class="location"/>
	</body>
</html>
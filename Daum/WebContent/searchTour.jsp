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
				$("#place").keydown(function(key) {
					if (key.keyCode == 13) {
						$.ajax({
							url: 'searchtour',
							data: 'location=' + $("#location").val() + '&place=' + $("#place").val(),
							method: 'post',
							success: function(xml) {
								parser = new DOMParser();
								xmlDoc = parser.parseFromString(xml.trim(), "text/xml");
								console.log(xmlDoc);
							},
							error: function(error) {
								console.log(error);
							}
						});
						return false;
					}
				});
			});
		</script>
	</head>
	<body>
		<table class="table table-sm" style="align: center;">
			<tbody align="center">
				<tr>
					<td width="100">
						<select id="location" size="1" name="location">
							<option value="서울">서울
							<option value="경기">경기
							<option value="강원">강원
							<option value="충북">충북
							<option value="충남">충남
							<option value="전북">전북
							<option value="전남">전남
							<option value="경북">경북
							<option value="경남">경남
							<option value="세종">세종
							<option value="부산">부산
							<option value="대구">대구
							<option value="인천">인천
							<option value="광주">광주
							<option value="대전">대전
							<option value="울산">울산
							<option value="제주">제주
						</select>
					</td>
					<td><input type="text" class="form-control" id="place" name="place" value="" placeholder=""/></td>
				</tr>
			</tbody>
		</table>
		<table class="table table-sm" style="align: center;">
			<tbody>
				
			</tbody>
		</table>
	</body>
</html>
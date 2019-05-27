<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			table {
				border-collapse: separate;
				border-spacing: 0px;
			}		
		</style>
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

								var html;
								
								$(xml).find("item").each(function() {
									var image = $(this).find("firstimage2").text();
									var title = $(this).find("title").text();
									
									html += "<tr><td><img src='" + image + "' onError=\"this.src='img/noImage.png'\" width='60' height='40'/></td><td>" + title + "</td></tr>";
								});
								
								$("#xmlResult>tbody").html(html);
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
							<option value="1">서울
							<option value="2">인천
							<option value="3">대전
							<option value="4">대구
							<option value="5">광주
							<option value="6">부산
							<option value="7">울산
							<option value="8">세종
							<option value="31">경기
							<option value="32">강원
							<option value="33">충북
							<option value="34">충남
							<option value="35">경북
							<option value="36">경남
							<option value="37">전북
							<option value="38">전남
							<option value="39">제주
						</select>
					</td>
					<td><input type="text" class="form-control" id="place" name="place" value="" placeholder=""/></td>
				</tr>
			</tbody>
		</table>
		<table class="table table-sm" style="align: center;" id="xmlResult" border="1">
			<tbody>
				
			</tbody>
		</table>
	</body>
</html>
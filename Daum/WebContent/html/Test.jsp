<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				
				$("#daylist").sortable({axis: "y", revert: false, revertDuration: 0, cancel: "#controlday"});
			 	$(".list-group").sortable({axis: "y", revert: false, revertDuration: 0, cancel: ".list-group-item-1"});
			 	
				$(".placeclass").draggable({
					connectToSortable: $(".list-group"),
					helper: "clone",
					revert: "invalid"
				});
				
				
				
				var buttons = $("#controlday>button");
				$(buttons[0]).click(function() {
					var length = $(".list-group").length;
					$("#daylist").append("<ul class='list-group ui-sortable-handle ui-sortable'><li class='list-group-item-1 ui-sortable-handle' style='background-color:steelblue; color: white; padding: 0.3rem;'>" + (length + 1) + "일차</li></ul>");
				});
				$(buttons[1]).click(function() {
					var length = $(".list-group").length;
					if (length != 1) {
						$("#daylist>ul:last").remove();
					} else {
						$("#daylist>ul:first").remove();
						$("#daylist").append("<ul class='list-group ui-sortable-handle ui-sortable'><li class='list-group-item-1 ui-sortable-handle' style='background-color:steelblue; color: white; padding: 0.3rem;'>1일차</li></ul>");
					}
				});
			});
			
		</script>
		<style>
			.list-group {
				margin-bottom: 0.5rem;
			}
		</style>
	</head>
	<body>
		<div style="margin: 2rem;" align="center">
			<div class="container">
				<div class="row">
					<div id="daylist" class="col-sm-2">
						<div id="controlday">
							
							<button type="button" class="btn mr-4 btn-outline-primary">+</button>
							<button type="button" class="btn btn-outline-primary">-</button>
							<pre><br></pre>
						</div>

						<ul class="list-group">
							<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">1일차</li>
							<li class="list-group-item" style="padding: 0.3rem;">명동</li>
							<li class="list-group-item" style="padding: 0.3rem;">인사동</li>
						</ul>
						<ul class="list-group">
							<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">2일차</li>
							<li class="list-group-item" style="padding: 0.3rem;">호수공원</li>
							<li class="list-group-item" style="padding: 0.3rem;">종로</li>
						</ul>
						<ul class="list-group">
							<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">3일차</li>
							<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
							<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
						</ul>
						
					</div>
					
					<div class="col-sm-4">
						<div>
							<div>
								<table class="table table-sm" style="align: center;">
									<tbody align="center">
										<tr>
											<td width="100">
												<select id="location" size="1" name="location">
													<option value="서울" selected="selected">서울
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
											<td><input type="text" class="form-control" id="place" name="place" value="" placeholder=""></input></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="placelist">
								<table class="table table-bordered table-sm">
									<tbody id="tablebody" align="center">
										<tr>
											<td>
												<ul class="placeclass">
<!-- 													<button type="button" class="btn" value="명동" style="display: inline; margin: 0;">+</button> -->
													<li class="list-group-item" style="padding: 0.3rem;">명동</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">인사동</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">N 남산 타워</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">호수공원</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">종로</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
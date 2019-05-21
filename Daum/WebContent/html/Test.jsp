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
				
				
				var place = "";
				var placebtn = $("[name='placebtn']");
				$(placebtn).on('click', function(){
					$("#daylist>ul>li.list-group-item-1").append("<button class='btn btn-sm btn-primary' name='addplacebtn'>+</button>");
					place = $(this).parent().attr("value");
					$(placebtn).remove();
				});
				
				var planbtn = $("[name='planbtn']");
				$(planbtn).on('click', function(){
					$(this).parent().remove();
				});
				

				var addplacebtn = $("#daylist>ul>li.list-group-item-1");
				$(addplacebtn).on('click', $("[name='addplacebtn']"), function(event){
					event.stopPropagation();
					$(this).parent().append("<li class='list-group-item ui-sortable-handle' style='padding: 0.3rem;' value='" + place + "'>" + place + "<button class='btn btn-sm btn-primary' name='planbtn'>-</button></li>");
					$(addplacebtn).off();
					$("[name='addplacebtn']").off();
					$("[name='addplacebtn']").remove();
					$(".placeclass>li.list-group-item").append("<button class='btn btn-sm btn-primary' name='placebtn'>+</button>");
				});
				
				// 도중에 새로 만들어진 X일차 에서도 add가 되도록
				// 도중에 새로 추가된 항목에 대해서 delete가 되도록
				// 관광지 추가 후에도 다시 추가가 가능하도록
				
				// X일차 항목이 sort 되었을 때 일차를 다시 재조정 하는 기능 추가 필요
			});
		</script>

		<style>
			.list-group {
				margin-bottom: 0.5rem;
			}
			
			button[name="placebtn"], button[name="planbtn"], button[name="addplacebtn"] {
				float: right;
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
							<li class="list-group-item" style="padding: 0.3rem;" value="명동">명동<button class="btn btn-sm btn-primary" name="planbtn">-</button></li>
							<li class="list-group-item" style="padding: 0.3rem;" value="인사동">인사동<button class="btn btn-sm btn-primary" name="planbtn">-</button></li>
						</ul>
						<ul class="list-group">
							<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">2일차</li>
							<li class="list-group-item" style="padding: 0.3rem;" value="호수공원">호수공원<button class="btn btn-sm btn-primary" name="planbtn">-</button></li>
							<li class="list-group-item" style="padding: 0.3rem;" value="종로">종로<button class="btn btn-sm btn-primary" name="planbtn">-</button></li>
						</ul>
						<ul class="list-group">
							<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">3일차</li>
							<li class="list-group-item" style="padding: 0.3rem;" value="광장시장">광장시장<button class="btn btn-sm btn-primary" name="planbtn">-</button></li>
							<li class="list-group-item" style="padding: 0.3rem;" value="청계천">청계천<button class="btn btn-sm btn-primary" name="planbtn">-</button></li>
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
													<li class="list-group-item" style="padding: 0.3rem;" value="명동">명동<button class="btn btn-primary" name="placebtn">+</button></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;" value="인사동">인사동<button class="btn btn-primary" name="placebtn">+</button></li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="placeclass">
													<li class="list-group-item" style="padding: 0.3rem;" value="N 남산 타워">N 남산 타워<button class="btn btn-primary" name="placebtn">+</button></li>
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
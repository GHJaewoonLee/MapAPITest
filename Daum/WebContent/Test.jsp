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
				
				function sortlist() {
					var lists = $(".list-group");
					var length = lists.length;
					
					for (var i = 0; i < length; i++) {
						$(lists[i]).find(".list-group-item-1").text((i+1) + '일차');
					}
				}
				
				$("#daylist").sortable({
					axis: "y",
					revert: false,
					revertDuration: 0,
					cancel: "#controlday",
					update: function(event, ui) {
						sortlist();
					}
				});
			 	$(".list-group").sortable({
			 		axis: "y",
			 		revert: false,
			 		revertDuration: 0,
			 		cancel: ".list-group-item-1"
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
				
				
// 				$("#daylist").on('click', "ul>li.list-group-item-1", function() {
// 					alert("sdfsdfsdf");
// 				});
				
				var place = "";
				$("#tablebody").on('click', "tr>td>ul>li>button[name='placebtn']", function(){
					$("#daylist>ul>li.list-group-item-1").append("<button class='btn btn-sm btn-primary' name='addplacebtn'>+</button>");
					place = $(this).parent().attr("value");
					$("#tablebody>tr>td>ul>li>button[name='placebtn']").remove();
					return false;
				});
				
				$("#daylist").on('click', "ul>li>button[name='planbtn']", function(){
					$(this).parent().remove();
					return false;
				});
				
				$("#daylist").on('click', "ul>li.list-group-item-1>button[name='addplacebtn']", function() {
					$(this).parent().parent().append("<li class='list-group-item ui-sortable-handle' style='padding: 0.3rem;' value='" + place + "'>" + place + "<button class='btn btn-sm btn-primary' name='planbtn'>-</button></li>");
					$("[name='addplacebtn']").remove();
					$(".placeclass>li.list-group-item").append("<button class='btn btn-sm btn-primary' name='placebtn'>+</button>");
					return false;
				});
			});
		</script>

		<style>
			.list-group {
				margin-bottom: 0.5rem;
			}
			
			button[name="placebtn"], button[name="planbtn"], button[name="addplacebtn"] {
				float: right;
				width: 2rem;
				height : 2rem;
				text-align: center;
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
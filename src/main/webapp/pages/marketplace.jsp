<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="/js/marketplace/marketplace.css">

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="/js/marketplace/db.js"></script>
<script src="/js/marketplace/marketplace.js"></script>
<title>RCG Marketplace</title>
<style>
body {
	padding-left: 20px
}

.bordertable {
	border-collapse: collapse;
	padding: 3px;
	width: 293px;
}

.bordercell {
	border: 1px solid #ccc;
	padding: 3px;
	font-size: 12px !important;
}
</style>
</head>
<body style="">
	<table>
		<tr>
			<td valign="top"><span id="item1-owl-empty"
				style="position: relative; left: 10px" class="no-items"> </span> <span
				style="border: 0px; color: #ccc; z-index: 2000; position: absolute; left: 640px; top: 377px">
					<input type="text" class="form-control" id="search-div-1"
					style="font-size: 12px; color: #666; border: 1px solid #ccc; max-height: 25px; min-width: 177px">
			</span> <i
				style="color: #ccc; z-index: 2000; position: absolute; left: 795px; top: 382px"
				class="fa fa-search" onclick="jumpTo(this)" id="item1-search"></i> <span
				style="border: 0px; color: #ccc; z-index: 2000; position: absolute; left: 1480px; top: 377px">
					<input type="text" class="form-control" id="search-div-2"
					style="font-size: 12px; color: #666; border: 1px solid #ccc; max-height: 25px; min-width: 177px">
			</span> <i
				style="color: #ccc; z-index: 2000; position: absolute; left: 1635px; top: 382px"
				class="fa fa-search" onclick="jumpTo(this)" id="item2-search"></i>

				<div id="item1-owl" class="owl-carousel owl-theme"
					style="background-color: #fff; width: 820px; border: 1px solid #ccc; padding: 10px; height: 160px">

				</div>
				<div data-internal id="item1-trigger" style="display: none"></div>
				<div data-internal id="item2-trigger" style="display: none"></div> <br>
				<br>
				<div id="" class=""
					style="background-color: #fff; width: 820px; border: 1px solid #ccc; padding: 10px; height: 165px">
					<div class="owl-carousel owl-theme" id="item1-owl-list"
						style="height: 140px;"></div>
				</div>

				<ul class="custom-menu" style="width: 150px; text-align: left">
					<li data-action="first" onclick="configure(this)"><i
						class="fa fa-cog"></i>Properties</li>
					<!-- 				<li data-action="second"><i class="fa fa-info-circle"></i>Properties</li> -->
					<hr style="padding: 0px; margin: 0px;">
					<li data-action="third"><i class="fa fa-trash"></i>Remove</li>
				</ul></td>

			<td width=20></td>
			<td valign="top"><span id="item2-owl-empty" class="no-items"
				style="position: relative; left: 10px;"> </span>
				<div id="item2-owl" class="owl-carousel owl-theme"
					style="background-color: #fff; width: 820px; border: 1px solid #ccc; padding: 10px; height: 160px">
				</div>
				<div id="addCarous" style="display: none"></div> <br> <br>
				<div id="" class=""
					style="background-color: #fff; width: 820px; border: 1px solid #ccc; padding: 10px; height: 165px">
					<div class="owl-carousel owl-theme" id="item2-owl-list"
						style="height: 140px;"></div>
				</div></td>
		</tr>
	</table>

	<script>
		$('.owl-carousel').owlCarousel({
			loop : false,
			margin : 20,
			nav : true,
			items : 5
		});
		$('.owl-carousel1').owlCarousel({
			loop : false,
			margin : 20,
			nav : true,
			items : 5
		});
		$("#item1-owl-empty").html(empty_msg.get("#item1-owl"));
		$("#item2-owl-empty").html(empty_msg.get("#item2-owl"));
		$("#item1-owl").trigger('refresh.owl.carousel');
		$("#item2-owl").trigger('refresh.owl.carousel');
		function makeCarousel(divId) {
			addCarouselItem(divId)
			$(document).on(
					'dblclick',
					'.owl-item',
					function() {
						owlIndex = $(this).index();
						var item = $(this)[0].firstChild.className
						var id = $(this)[0].firstChild.id;
						if (item != 'item') {
							$("#" + item + "-trigger").attr('data-internal',
									'{ "id": "' + id + '" }');
							$("#" + item + "-trigger").click();
						}
					});
		}
		makeCarousel("#item1-trigger, #item2-trigger");
		addCarousel('item1');
		addCarousel('item2');
		$(".item1, .item2").on(
				"dblclick",
				function(e) {
					var interval = setInterval(function() {
						var request_table = $("#requests-table",
								parent.document);
						var ids = [];
						request_table.find('tr').each(
								function(i, el) {
									var $tds = $(this).find('td'), id = $tds
											.eq(1).text();
									ids.push(id)
								});
						console.log("local storage", localStorage
								.getItem("mp_info"))
						var json = JSON.parse(localStorage.getItem("mp_info"));
						if (json && json['id']) {
							if (json) {
								parent.addRow(dbs
										.get(e.currentTarget.className).get(
												e.currentTarget.id), json,
										ids.length);
								if (ids.includes(json['id'].toString())) {
									clearInterval(interval);
									console.log("interval cleared for item ",
											json)
								}
							}
						}
					}, 5000);
				});
		$("#search-div-1, #search-div-2").on('input', function() {
			if ($(this).val().length == 0) {
				window.location.reload();
			}
		});
		$("#search-div-1, #search-div-2").on('blur', function() {
			if ($(this).val().length == 0) {
				window.location.reload();
				console.log("blur")
				/* 			for (var i = 0; i < $('.owl-item, .active').length + 10; i++) {
							$("#item" + "1" + "-owl-list").trigger(
									'remove.owl.carousel', [ i ])
									.trigger('refresh.owl.carousel');
						}
						makeCarousel("#item1-trigger, #item2-trigger");
						addCarousel('item1');
						addCarousel('item2'); */
			}
		});
	</script>
</body>
</html>

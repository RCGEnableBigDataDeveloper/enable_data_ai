<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://www.jquerypost.com/cdn/bs3/bootstrap.min.css">
<link rel="stylesheet"
	href="https://www.jquerypost.com/demo/jquery-typeahead-autocomplete-plugin-with-jquery-795/jquery.typeahead.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://www.jqueryscript.net/demo/Material-Design-Context-Menu-jQuery-3Dot-Context-Menu/includes/context-menu.js"></script>
<script src="/js/marketplace/db.js"></script>
<script src="/js/marketplace/marketplace.js"></script>
<style>
body {
	font-family: Arial;
	font-size: 10pt;
	padding-left: 0px;
	background-color: #F8F8F8;
	/* 	background-image: url("/img/background.gif"); */
}

.container {
	background-color: #333;
	color: #fff;
}

.typeahead__container {
	max-width: 500px;
}

<
style>* {
	z-index: 0;
}

td, th {
	height: 10px;
	margin: 0;
	padding: 0;
	font-size: 12px;
	text-align: left;
}

.container {
	margin-top: 0;
	padding-top: 0;
}

select {
	height: 20px;
	-webkit-border-radius: 0;
	border: 0;
	outline: 1px solid #ccc;
	outline-offset: -1px;
}

.context-menu-container {
	background-color: white;
	z-index: 1000 !important;
	/* 	border-radius: 5px; */
	display: none;
	border: solid thin #ccc;
	padding: 3px;
	-webkit-box-shadow: 4px 4px 8px 0px rgba(0, 0, 0, 0.18);
	-moz-box-shadow: 4px 4px 8px 0px rgba(0, 0, 0, 0.18);
	box-shadow: 4px 4px 8px 0px rgba(0, 0, 0, 0.18);
	min-width: 250px;
	min-height: 100px;
}

.context-menu-container>ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.context-menu-container>ul>li {
	padding: 3px;
	cursor: hand;
	cursor: pointer;
	/* border-radius: 5px; */
}

.context-menu-container>ul>li:hover {
	background-color: #fffccc;
}

.data-container>p.title {
	font-weight: bold;
	text-align: center;
}

.data-container-table>tbody>tr:nth-child(even) {
	background-color: #c4c4c4;
}

.data-container-table>tbody>tr:not(:first-child):hover {
	opacity: 1;
	background-color: #e1e1e1;
	transition: opacity .55s ease-in-out;
	-moz-transition: opacity .55s ease-in-out;
	-webkit-transition: opacity .55s ease-in-out;
}

.context-menu:after {
	content: '\2807';
	font-size: 12px;
	cursor: pointer;
	cursor: hand;
	pointer-events: all;
}

td.context-menu:after {
	float: right;
}

p.contextMenu:after>span {
	margin: 0 !important;
	padding: 0 !important;
}

h1.context-menu:after, h2.context-menu:after, h3.context-menu:after, h4.context-menu:after,
	h5.context-menu:after {
	margin-left: 30px;
}

.container-table {
	display: table;
}

.vertical-center-row {
	display: table-cell;
	vertical-align: middle;
}

.navbar-wrapper {
	margin-bottom: 0 !important;
	padding-bottom: 0 !important;
}

i {
	font-size: 34px;
	padding-right: 5px;
	padding-left: 5px;
}

li {
	text-align: left;
}

.dataTables_info {
	position: relative;
	left: 250px;
	text-align: left;
	padding-left: 0px;
	margin-left: 0px
}

.requests-table {
	padding-right: 10px;
}

.caret {
	display: none;
}
/* .dataTables_filter {
	position: relative;
	top: 189px;
	right:210px;
} */
td {
	color: #999;
}
</style>

<script
	src="https://www.jquerypost.com/demo/jquery-typeahead-autocomplete-plugin-with-jquery-795/jquery.typeahead.js"
	type="2f6eb95db55551d1de03f84f-text/javascript"></script>
<title>RCG Marketplace v2.0&#8482;</title>
</head>
<body>

	<div style="background-image: url('/img/logo_new.png');"></div>
	<script
		src="https://www.jquerypost.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js"
		data-cf-settings="2f6eb95db55551d1de03f84f-|49" defer></script>



	<iframe src="/marketplace" id="market-frame"
		style="position: relative; bottom: 20px; width: 100%; height: 425px; border: 0">Browser
		not compatible.</iframe>

	<div id='requests-div'
		style="text-align: center; padding-left: 0px; padding-right: 147px;">

		<script>
			function loadCatalog(item) {
				$(".form-check-label").each(function(index) {
					$(this).css("font-weight", "normal");
				});

				$("#" + item[0].id + "-label").css("font-weight", "Bold");
				var catalog = localStorage.setItem("data-catalog", item[0].id);
			}
			function addRow(item, status, len) {
				var ids = [];
				$("#requests-table").find('tr').each(function(i, el) {
					var $tds = $(this).find('td'), id = $tds.eq(1).text();
					ids.push(id)
				});

				if (!ids.includes(status['id'].toString())) {
					var table = document.getElementById("requests-table");
					var row = table.insertRow(ids.length);
					row.insertCell(0).innerHTML = "administrator@rcg-marketplace.com";
					row.insertCell(1).innerHTML = status["id"];
					row.insertCell(2).innerHTML = item.label;
					row.insertCell(3).innerHTML = item.desc;
					row.insertCell(4).innerHTML = new Date().toString()
							.replace(' (Central Daylight Time)', '');
					var cell1 = row.insertCell(5);
					cell1.style.color = "#3399ff";
					cell1.innerHTML = "<span class='blink'>Pending...</span>"
					cell1.id = "pending-cell-" + status["id"];
					var cell = row.insertCell(6);
					cell.className = "context-menu";
					cell
							.setAttribute("data-container-id",
									"context-menu-items");
					cell.setAttribute("data-row-id", "4");
					var tableContextMenu = new ContextMenu(
							"context-menu-items", menuItemClickListener);

					$("#requests-table > tbody > tr")
							.each(
									function() {
										var currentRow = $(this);
										if ($(currentRow[0].children[1])[0].innerText == status["id"]) {
											switch (status['status']) {
											case "failed":
												$(
														"#pending-cell-"
																+ status["id"])
														.html(
																"<font color='cf142b'>Failed</font>")
												break;
											case "":
												// code block
												break;
											default:
												// code block
											}
										}
									});
				}
			}

			$(document).ready(
					function() {
						var tableContextMenu = new ContextMenu(
								"context-menu-items", menuItemClickListener);
					});

			function menuItemClickListener(menu_item, parent) {
				var item = menu_item[0].innerText
				console.log("setting catalog to " + item);
				switch (menu_item[0].innerText) {
				case "Approve Request":
					var request_table = $("#requests-table", parent.document);
					request_table
							.find('tr')
							.each(
									function(i, el) {
										var $tds = $(this).find('td'), id = $tds
												.eq(1), status = $tds.eq(5);
										var current_id = JSON
												.parse(localStorage
														.getItem("mp_info"))['id'];
										if ($(current_id)[0] == $(id[0]).text()) {
											$(status)
													.html(
															"<font color='#cf142b'>Failed</font>");
										}
									});
					break;
				case "Reject Request":
					console.log(menu_item[0])
					break;
				case "Restore Defaults":
					console.log(menu_item[0])
					break;
				default:
					console.error("unknown menu selection " + menu_item);
				}
			}
		</script>

		<div class="requests-table"
			style="padding-left: 20px; max-width: 1690px; min-width: 1690px">
			<div class="context-menu-container" id="context-menu-items">
				<ul>
					<li><i class="fa fa-check-circle fa-6"></i>Approve Request</b></li>
					<li><i class="fa fa-exclamation-circle"></i>Reject Request</b></li>
					<hr style="margin: 10px 0 10px 0;">
					<li><i class="fa fa-envelope"></i></i>Contact User</b></li>
					<li><i class="fa fa-history"></i></i>Clear All Requests</b></li>
					<hr style="margin: 10px 0 10px 0;">
					<li><i class="fa fa-window-restore"></i>Restore Defaults</li>
				</ul>
			</div>

			<table id="requests-table" class="table table-striped table-bordered"
				style="width: 100%; background-color: #fff;">
				<thead>

					<tr>
						<th colspan="7" style="font-size: 13px; color: #666">Recent
							Activity<span style="float: right"><i
								class="fa fa-refresh" aria-hidden="true" style="color: #666"></i><i
								class="fa fa-cog" aria-hidden="true" style="color: #666"></i></span>
						</th>

					</tr>
					<tr>
						<th style="color: #777">Requestor</th>
						<th style="color: #777">ID</th>
						<th style="color: #777">Category</th>
						<th style="color: #777">Type</th>
						<th style="color: #777">Request date</th>
						<th style="color: #777">Status</th>
						<th style="color: #777"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>administrator@rcg-marketplace.com</td>
						<td>2348484474523</td>
						<td>APACHE SPARK</td>
						<td>App Developer</td>
						<td>Mon Aug 07 2023 07:56:09 GMT-0`0</td>
						<td><font color='green'>Installed</font></td>
						<td class="context-menu" data-container-id="context-menu-items"
							data-row-id="3"></td>
					</tr>
					<tr>
						<td>administrator@rcg-marketplace.com</td>
						<td>4329884345533</td>
						<td>EXCEL FILE</td>
						<td>Data Analyst</td>
						<td>Mon Aug 07 2023 07:56:09 GMT-0500</td>
						<td><font color='green'>Installed</font></td>
						<td class="context-menu" data-container-id="context-menu-items"
							data-row-id="3"></td>
					</tr>
					<tr>
						<td>administrator@rcg-marketplace.com</td>
						<td>0127676554332</td>
						<td>Azure Open AI</td>
						<td>Document Intelligence</td>
						<td>Mon Aug 07 2023 07:56:09 GMT-0500</td>
						<td><font color='#cf142b'>Failed</font></td>
						<td class="context-menu" data-container-id="context-menu-items"
							data-row-id="3"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<script>
		$("#requests-tab-1").on("click", function() {
			$("#requests-div").hide();
			$("#shared-div").show();
		});

		function showSettings() {
			$("#settingsModal").show();
		}

		$("#token").on("change", function() {
			console.log('token ' + $(this).val());
			var data = localStorage.setItem("api_token", $(this).val());
		});

		function createCluster() {

			var item = localStorage.getItem("mp_info");
			var token = localStorage.getItem("api_token");
			var url = JSON.parse(item)['url'][1];
			$.ajax({
				url : "/deploy/" + url + "/" + token,
				success : function(results) {
					console.log(results);
					if (results) {
						$("#cluster-ok").show();
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					console.log("Status: " + textStatus);
					console.log("Error: " + errorThrown);
				}
			});
		}
	</script>
</html>

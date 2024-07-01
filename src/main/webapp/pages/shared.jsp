

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>


<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="shortcut icon" type="image/png"
	href="/media/images/favicon.png">
<link rel="alternate" type="application/rss+xml" title="RSS 2.0"
	href="http://www.datatables.net/rss.xml">

<link rel="stylesheet"	
	href="https://datatables.net/media/css/site.css?_=555b0977f30679aa22eafe4cb25ba0ee1">
<!--[if lte IE 9]>
        <link rel="stylesheet" type="text/css" href="/media/css/ie.css" />
        <![endif]-->
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap.min.css">

<style>
div.fw-container div.fw-body div.content {
	margin-top: 5em;
}

div.fw-body h1 {
	display: none;
}

div.fw-container {
	z-index: 1;
}

.paginate_button {
	background-color: #fff !important;
	margin: 0px !important;
	font-size: 11px !important;
	border-right: 1px solid #ccc !important;
	border-top: 1px solid #ccc !important;
	border-bottom: 1px solid #ccc !important;
	border-left: 0px solid #ccc !important;
	border-radius: 0px !important;
	font-color: #ffffff !important;
}

.previous {
	border-left: 1px solid #ccc !important;
}

.current {
	background-color: #ccc !important;
	font-color: #ffffff !important;
	margin: 0px !important;
}

.even, .odd, .dataTables_info, label, input {
	font-size: 13px !important;
}

input {
	font-size: 11px !important;
	max-height: 25px !important;
	min-width: 200px;
	padding-left: 10px;
}

.dataTables_filter {
	padding-bottom: 20px;
	position: relative;
	left: -435px;
}

.dataTables_length {
	display: none !important;
}

th {
	font-size: 16px !important;
}

.dtr-control {
	font-size: 13px !important;
}

.dataTables_paginate {
	position: relative;
	left: 900px;
}

pre {
	background-color: ghostwhite;
	border: 1px solid silver;
	padding: 10px 20px;
	margin: 20px;
}

.json-key {
	color: brown;
}

.json-value {
	color: navy;
}

.json-string {
	color: olive;
}
</style>

<script
	src="https://datatables.net/media/js/mode.js?_=60ada68d8b0d3667ba20a0e9bdd69c9c"></script>
<script
	src="https://datatables.net/media/js/site.js?_=60ada68d8b0d3667ba20a0e9bdd69c9c"
	data-domain="datatables.net"
	data-api="https://plausible.sprymedia.co.uk/api/event"></script>
<script src="/media/js/dynamic.php"></script>

<script
	src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>

<script src="hhttps://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="hhttps://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="hhttps://cdn.datatables.net/1.13.6/js/dataTables.bootstrap.min.js"></script>
<script
	src="hhttps://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script
	src="hhttps://cdn.datatables.net/buttons/2.4.1/js/buttons.bootstrap.min.js"></script>
<script
	src="hhttps://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script
	src="hhttps://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script
	src="hhttps://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script
	src="hhttps://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
<script
	src="hhttps://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
<script
	src="hhttps://cdn.datatables.net/buttons/2.4.1/js/buttons.colVis.min.js"></script>

<script src="/js/marketplace/db.js"></script>
<script src="/js/marketplace/marketplace.js"></script>


<script class="init">
	dt_demo.init();

	$(document)
			.ready(
					function() {
						var shared_table = $('#resource-table')
								.addClass('nowrap')
								.dataTable(
										{
											responsive : true,
											pageLength : 20,
											order : [ [ 3, 'desc' ] ],
											columnDefs : [
													{
														target : 4,
														/*  render : DataTable.render.date(),*/
														render : function(data,
																type, row) {
															data = data
																	.toString()
																	.replace(
																			'(Central Daylight Time)',
																			'');
															return data;
														}
													},
													{
														target : 5,
														render : function(data,
																type, row) {
															data = "<pre><code id=account> "
																	+ data
																			.trim()
																	+ "</code></pre>";
															return data;
														}
													},
													{
														targets : [ 3, 4, 5 ],
														className : 'dt-body-right'
													} ]
										});

						var shared_table1 = $('#shared-table')
								.addClass('nowrap')
								.dataTable(
										{
											responsive : true,
											pageLength : 20,
											order : [ [ 3, 'desc' ] ],
											columnDefs : [
													{
														target : 4,
														/*  render : DataTable.render.date(),*/
														render : function(data,
																type, row) {
															data = data
																	.toString()
																	.replace(
																			'(Central Daylight Time)',
																			'');
															return data;
														}
													},
													{
														target : 5,
														render : function(data,
																type, row) {
															data = "<pre><code id=account> "
																	+ syntaxHighlight(data
																			.trim())
																	+ "</code></pre>";
															return data;
														}
													},
													{
														targets : [ 3, 4, 5 ],
														className : 'dt-body-right'
													} ]
										});

						$
								.ajax({

									url : "/purview/" + "/" + "name",
									type : 'GET',
									dataType : 'json',
									success : function(data) {
										
										console.log(data);
										
										var data = jQuery.parseJSON(data)['value'];
										$
												.each(
														data,
														function(key, item) {
															addRow(
																	"<a href='" + item.qualifiedName + "'>"
																			+ item.displayText
																			+ "</a>",
																	new Date()
																			.getTime(),
																	item);
															
															$("#s-loading").hide();

														});
									},
									error : function(request, error) {
										console.log("Request: "
												+ JSON.stringify(request));
									}
								});

						$("#addrow").on("click", function() {
							addRow('AAAAA', new Date().getTime(), "");
						});

						function addRow(str, dt, row) {
							// console.log(str)
							$('#resource-table').dataTable().fnAddData(
									[
											str,
											getRandom(tags, 5).join(", ")
													.substring(0, 80)
													+ "...",
											getRandom(types, 1)[0], dt,
											new Date(), JSON.stringify(row) ]);
						}

					});
</script>
</head>
<body class="wide hero" style="border: 1px solid #ccc">
	<div class="fw-container">
		<div class="fw-hero">
			<div class="grid">
				<div class="unit w-2-3" style="position: relative; right: 400px;">
					<div class="hero-callout" id="resources-div"
						style="position: relative; left: 110px; border-left: 1px solid #ccc; -webkit-box-shadow: none !important; -moz-box-shadow: none !important; box-shadow: none !important; border: 0px !important;">

						<table id="resource-table" class="display"
							class="table table-striped table-bordered" style="width: 1600px">
							<thead>
								<tr>
									<th style="width: 150px; font-size: 12px; font-weight: normal;">Name</th>
									<th style="font-size: 12px; font-weight: normal;">Tags</th>
									<th style="font-size: 12px; font-weight: normal;">Type</th>
									<th style="font-size: 12px; font-weight: normal;">ID</th>
									<th style="font-size: 12px; font-weight: normal;">Modified
										date</th>
									<th style="font-size: 12px; font-weight: normal;"></th>
								</tr>
							</thead>
							<tbody>

								<tr id="s-loading">
									<td>LOADING.. PLEASE WAIT..</td>
									<td style="color: #F9F9F9">Chief Executive Officer (CEO)</td>
									<td style="color: #F9F9F9">London</td>
									<td styl e="color: #F9F9F9"></td>
									<td style="color: #F9F9F9">2009-10-09</td>
									<td style="color: #F9F9F9"></td>
								</tr>

							</tbody>

							<!--tfoot><tr><th>Name</th><th>Position</th><th>Office</th><th>Age</th><th>Start date</th><th>Salary</th></tr></tfoot-->

						</table>

					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- <button id='addrow'>ADD</button> -->


	<script>
		
	</script>

	</div>
</body>
</html>

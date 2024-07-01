<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap.min.js"></script>
<script src="/js/marketplace/db.js"></script>
<script src="/js/marketplace/marketplace.js"></script>
<style>
* {
	z-index: 0;
}

td, th {
	height: 10px;
	margin: 0;
	padding: 0;
	font-size: 11px;
}

.container {
	margin-top: 0;
	padding-top: 0;
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
}
</style>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://www.jqueryscript.net/demo/Material-Design-Context-Menu-jQuery-3Dot-Context-Menu/includes/context-menu.js"></script>
<script>
	$(document).ready(
			function() {
				var tableContextMenu = new ContextMenu("context-menu-items",
						menuItemClickListener);
			});

	function menuItemClickListener(menu_item, parent) {
		alert("Menu Item Clicked: " + menu_item.text() + "\nRecord ID: "
				+ parent.attr("data-row-id"));
	}
</script>



<div class="context-menu-container" id="context-menu-items">
	<ul>
		<li><i class="fa fa-check-circle fa-6"></i>Approve Request</b></li>
		<li><i class="fa fa-exclamation-circle"></i>Reject Request</b></li>
		<hr style="margin: 10px 0 10px 0;">
		<li><i class="fa fa-history"></i></i>Clear All Requests</b></li>
		<hr style="margin: 10px 0 10px 0;">
		<li><i class="fa fa-cog"></i>Settings</li>
	</ul>
</div>




<table id="example" class="table table-striped table-bordered"
	style="width: 100%">
	<thead>
		<tr>
			<th>Name</th>
			<th>Position</th>
			<th>Office</th>
			<th>Age</th>
			<th>Start date</th>
			<th>Salary</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Tiger Nixon</td>
			<td>System Architect</td>
			<td>Edinburgh</td>
			<td>61</td>
			<td>2011-04-25</td>
			<td class="context-menu" data-container-id="context-menu-items"
				data-row-id="3"></td>
		</tr>
		<tr>
			<td>Garrett Winters</td>
			<td>Accountant</td>
			<td>Tokyo</td>
			<td>63</td>
			<td>2011-07-25</td>
			<td class="context-menu" data-container-id="context-menu-items"
				data-row-id="3"></td>
		</tr>
	</tbody>
</table>

<script>var table = new DataTable('#example', {});

$(".dataTables_length").hide();
$(".dataTables_info").css({
	position: "relative",
	left: "10px"
});
$(".dataTables_paginate").css({
	position: "relative",
	right: "10px"
});

table.row.add([ '.1', '.2', '.3', 1, '.5', 'e' ]).draw(false);</script>
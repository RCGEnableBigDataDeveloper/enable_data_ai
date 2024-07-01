<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>RCG Marketplace&#8482;</title>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet"
	href="https://bootstrapious.com/tutorial/sidebar/style.css">
<link rel="stylesheet"
	href="https://www.jquerypost.com/demo/jquery-typeahead-autocomplete-plugin-with-jquery-795/jquery.typeahead.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<script
	src="https://www.jquerypost.com/demo/jquery-typeahead-autocomplete-plugin-with-jquery-795/jquery.typeahead.js"
	type="2f6eb95db55551d1de03f84f-text/javascript"></script>
<script
	src="https://www.jquerypost.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js"
	data-cf-settings="2f6eb95db55551d1de03f84f-|49" defer></script>
<script src="/js/marketplace/db.js"></script>
<script src="/js/marketplace/marketplace.js"></script>

<style>

/*
    DEMO STYLE
		*/
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

p {
	font-family: 'Poppins', sans-serif;
	font-size: .9em;
	font-weight: 300;
	line-height: 1.7em;
	color: #999;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

.navbar {
	padding: 15px 10px;
	background: #fff;
	border: none;
	border-radius: 0;
	margin-bottom: 40px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
	box-shadow: none;
	outline: none !important;
	border: none;
}

.line {
	width: 100%;
	height: 1px;
	border-bottom: 1px dashed #ddd;
	margin: 40px 0;
}

/* ---------------------------------------------------
		    SIDEBAR STYLE
		----------------------------------------------------- */
.wrapper {
	display: flex;
	width: 100%;
	align-items: stretch;
}

#sidebar {
	min-width: 250px;
	max-width: 250px;
	background: #7386D5;
	color: #fff;
	transition: all 0.3s;
}

#sidebar.active {
	margin-left: -250px;
}

#sidebar .sidebar-header {
	padding: 20px;
	background: #6d7fcc;
}

#sidebar ul.components {
	padding: 20px 0;
	border-bottom: 1px solid #47748b;
}

#sidebar ul p {
	color: #fff;
	padding: 10px;
}

#sidebar ul li a {
	padding: 10px;
	font-size: .9em;
	display: block;
}

#sidebar ul li a:hover {
	color: #7386D5;
	background: #fff;
}

#sidebar ul li.active>a, a[aria-expanded="true"] {
	color: #fff;
	background: #6d7fcc;
}

a[data-toggle="collapse"] {
	position: relative;
}

.dropdown-toggle::after {
	display: block;
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}

ul ul a {
	font-size: 0.9em !important;
	padding-left: 30px !important;
	background: #6d7fcc;
}

ul.CTAs {
	padding: 20px;
}

ul.CTAs a {
	text-align: center;
	font-size: 0.6em !important;
	display: block;
	border-radius: 5px;
	margin-bottom: 5px;
}

a.download {
	background: #fff;
	color: #7386D5;
}

a.article, a.article:hover {
	background: #6d7fcc !important;
	color: #fff !important;
}

/* ---------------------------------------------------
		    CONTENT STYLE
		----------------------------------------------------- */
#content {
	width: 100%;
	padding: 20px;
	min-height: 100vh;
	transition: all 0.3s;
}

/* ---------------------------------------------------
		    MEDIAQUERIES
		----------------------------------------------------- */
@media ( max-width : 768px) {
	#sidebar {
		margin-left: -250px;
	}
	#sidebar.active {
		margin-left: 0;
	}
	#sidebarCollapse span {
		display: none;
	}
}

.list-unstyled {
	padding-bottom: left !important;
}

.nav-item {
	color: #666;
}
</style>

</head>

<body>


	<!-- HTML to write -->


	<!-- Button trigger modal -->
	<button style="display: none" type="button" class="btn btn-primary"
		data-toggle="modal" data-target="#exampleModal" id="modal-button">
	</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		style="" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Configuration</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="">
					<table class="bordertable" style="width: 450px">
						<tr>
							<td class="bordercell"><b>Description</b><br>Balanced
								CPU-to-memory ratio. Ideal for testing and development, small to
								medium databases, and low to medium traffic web servers.</td>
						</tr>
					</table>
					<hr style="margin: 10px 0 10px 0;">
					<b>Details</b><br>
					<table class="bordertable" style="width: 450px">
						<tr>
							<td class="bordercell">Cluster</td>
							<td class="bordercell">Single node</td>
						</tr>
						<tr>
							<td class="bordercell">Databricks Runtime</td>
							<td class="bordercell" valign="top">12.2 LTS (includes
								Apache Spark 3.3.2, Scala 2.12)</td>
						</tr>
						<tr>
							<td class="bordercell">Node type</td>
							<td class="bordercell">Standard_DS3_v2 (14 GB Memory, 4
								Cores)</td>
						</tr>
						<tr>
							<td class="bordercell">Terminate after</td>
							<td class="bordercell">120 minutes</td>
						</tr>
						<tr>
							<td class="bordercell">Tags</td>
							<td class="bordercell">No custom tags</td>
						</tr>
						<tr>
							<td class="bordercell" va>Architecture</td>
							<td class="bordercell">1 Driver 14 GB Memory, 4 Cores
								Runtime 12.2.x-scala2.12 Standard_DS3_v2 0.75 DBU/h</td>
						</tr>
					</table>
					<hr style="margin: 10px 0 10px 0;">
					<div class="form-group">
						<input type="password" class="form-control" id="token"
							aria-describedby="emailHelp" placeholder="Add token"> <br>
						<button class="btn btn-primary btn-sm" id="create-cluster">Add
							Token</button>
						<button class="btn btn-primary btn-sm" id="create-cluster"
							onclick="createCluster()">Create Cluster</button>
						<img id="cluster-ok" style="display: none" src="/img/ok.png"
							style="height: 50px; width: 50px;">
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button> -->
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal" onclick="infoModalCancel()">Cancel</button>
					<button type="button" class="btn btn-primary btn-sm"
						data-dismiss="modal" onclick="infoModalClose()">OK</button>
				</div>
			</div>

		</div>
	</div>


	<div class="modal fade" id="settings-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Settings</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form>
						<div class="form-group">
							<label for="exampleInputEmail1">Password</label> <input
								type="password" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter password">
							<small id="emailHelp" class="form-text text-muted">Please
								confirm your adminstrator password.</small>
						</div>
						<hr style="margin: 10px 0 10px 0;">
						<div class="form-group">
							<label class="control-label" for="company">Data Catalog</label>
							<table>
								<tr>
									<td>
										<div class="form-check">
											<input class="form-check-input" type="radio" checked
												onclick="loadCatalog($(this))" name="flexRadioDefault"
												id="healthcare"> <label class="form-check-label"
												style='' for="flexRadioDefault1" id='healthcare-label'>Healthcare
											</label>
										</div>
									</td>
									<td width=30></td>
									<td><small style="font-weight: normal; font-size: 12px"
										id="emailHelp" class="form-text text-muted"> </small></label></td>
								</tr>

								<tr>
									<td>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												onclick="loadCatalog($(this))" name="flexRadioDefault"
												id="insurance"> <label class="form-check-label"
												style="font-weight: normal;" for="flexRadioDefault2"
												id='insurance-label'>Insurance </label>
										</div>
									</td>
									<td width=30></td>
									<td><small style="font-weight: normal; font-size: 12px"
										id="emailHelp" class="form-text text-muted"> </small></td>
								</tr>

								<tr>
									<td>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												onclick="loadCatalog($(this))" name="flexRadioDefault"
												id="financial"> <label class="form-check-label"
												style='font-weight: normal;' for="flexRadioDefault2"
												id='financial-label'>Financial </label>
										</div>
									</td>
									<td width=30></td>
									<td><small style="font-weight: normal;; font-size: 12px"
										id="emailHelp" class="form-text text-muted"></small>
								</tr>

								<tr>
									<td style="width: 100px">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												onclick="loadCatalog($(this))" name="flexRadioDefault"
												id="consumer"> <label class="form-check-label"
												style='font-weight: normal' for="flexRadioDefault2"
												id='hospitality-label'>Consumer </label>
										</div>
									</td>
									<td width=30></td>
									<td><small style="font-weight: normal; font-size: 12px"
										id="emailHelp" class="form-text text-muted"> </small></td>
								</tr>
							</table>
							<br>
							<!-- <small
					style="font-weight: normal; padding-bottom: 5px; padding-top: 5px; font-size: 12px"
					id="emailHelp" class="form-text text-muted">Changes will
					apply after browser refresh</small> -->
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="settingsModalCancel()">Cancel</button>
					<button type="button" onclick="settingsModalClose()"
						class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>

	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<!-- <img src='/img/rcg_logo_horz_full-color_wo-tag-3.webp' -->
				<!--  <h5>RCG Global Services</h5> -->
				<!-- <img src='/img/https___be.tricentis.com_media-assets_2023_04_rcg_logo_horz_full-color_wo-tag1.png'
					style="height: 50px; width: 225px; top: 1px; position: relative; left: -13px"> -->
				<img
					src="https://rcgglobalservices.com/hubfs/logo-rcg-horizontal.svg"
					class="hs-image-widget " height="132"
					style="height: auto; width: 172px; border-width: 0px; border: 0px;"
					width="172" alt="RCG Main Logo" title="RCG Main Logo"> <br>
			</div>
			<br>
			<ul class="list-unstyled components"
				style="position: relative; bottom: 25px;">

				<li><a href="#" id="home"
					onclick="$('#shared-frame').hide(); $('#market-frame').hide(); $('#requests-frame').show();document.getElementById('requests-frame').contentDocument.location.reload(true)">My
						Resources</a></li>
				<!--<li class="active">-->
				<li><a href="#"
					onclick="$('#shared-frame').show(); $('#market-frame').hide();$('#requests-frame').hide();document.getElementById('shared-frame').contentDocument.location.reload(true)">Shared
						With Me </a></li>



				<li><a href="#"
					onclick="$('#shared-frame').hide(); $('#market-frame').show();$('#requests-frame').hide();">RCG
						Marketplace &#8482;</a></li>
				<!-- <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">Datasets</a>
                        </li>
                        <li>
                            <a href="#">Environemnts</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Portfolio</a>
                </li> -->
				<li><a href="#" data-toggle="modal"
					data-target="#settings-modal">Settings</a></li>

				<li class=""><a href="#homeSubmenu" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle">External</a>
					<ul class="collapse list-unstyled" id="homeSubmenu">

						<li class="nav-item active"><a
							href="https://web.purview.azure.com/resource/rcg-purview/main/catalog/home?feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a"
							target="_blank">Data Catalog</a></li>
						<li class="nav-item active"><a
							href="https://github.com/rcgtechrepo/rcgtechrepo" target="_blank">Repository</a></li>
						<li class="nav-item active"><a
							href="https://rcgmail.sharepoint.com/sites/SharepointDemo/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FSharepointDemo%2FShared%20Documents%2FLearning%20Materials&viewid=09f462b1%2D9405%2D47f2%2Dbdfe%2D28105816cf6f"
							target="_blank">Learning Materials</a></li>
					</ul></li>

				<li><a href="#">Help</a></li>
			</ul>

			<ul class="list-unstyled CTAs">
				<li><a
					href="https://bootstrapious.com/tutorial/files/sidebar.zip"
					class="download">Download source</a></li>
				<li><a href="https://bootstrapious.com/p/bootstrap-sidebar"
					class="article">View Source</a></li>
			</ul>
		</nav>

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info"
						style="background-color: #7386D5">
						<i class="fas fa-align-left"></i> <span></span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-align-justify"></i>
					</button>


					<span style="padding-left: 350px"></span>
					<!-- type ahead search -->
					<form class="">
						<div class="typeahead__container">
							<div class="typeahead__field">
								<span class="typeahead__query"> <input id='search'
									class="js-typeahead" name="q" type="search" autofocus
									autocomplete="off" placeholder="Search the Data Catalog"
									size=70>
								</span> <span class="typeahead__button">
									
							<!-- 		<button class="btn btn-default" type="submit"
										onclick="window.open('https://web.purview.azure.com/resource/rcg-purview/main/catalog/search?searchQueryActionType=&searchQueryApprovalStatus=&searchQueryAssetType=&searchQueryAttribute=&searchQueryClassificationCategory=&searchQueryCollection=&searchQueryContact=&searchQueryContactType=&searchQueryContentType=&searchQueryEnableRankingFunction=false&searchQueryEndorsement=&searchQueryEntityType=&searchQueryFileExtension=&searchQueryGlossary=&searchQueryKeyword=REPLACE&searchQueryLabel=&searchQueryLimit=25&searchQueryObjectType=&searchQueryOffset=0&searchQueryOrderByDesc=false&searchQueryRatingScore=&searchQueryRunStatus=&searchQuerySensitivityLabelId=&searchQueryTags=&searchQueryTaskStatus=&searchQueryTerm=&searchQueryTermStatus=&searchQueryTermTemplate=&searchQueryWorkflowDefinitionName=&searchQueryWorkflowType=&feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a&'.replace('REPLACE',$('#search').val()))">
										<span class="typeahead__search-icon"></span>
									</button>
									 -->
									
									<button class="btn btn-default" type="submit"
										onclick="window.open("https://dzd_cxsa9xjjq7cdux.datazone.us-east-2.on.aws/search?searchText=mkt">
										<span class="typeahead__search-icon"></span>
									</button>
									
							</div>
						</div>
					</form>



					<input type="hidden" id="data_catalog" value="">

					<script type="2f6eb95db55551d1de03f84f-text/javascript">

      var data_catalog = localStorage.getItem("data-catalog");
      console.log("loading data catalog  " + data_catalog);

			$(".form-check-label").each(function(index) {
				$(this).css("font-weight", "normal");
			});

			$(".form-check-label").each(function(index) {
				if($(this).text().toLowerCase().trim() == data_catalog.trim()){
					$(this).css("font-weight", "bold");
					$("#" + data_catalog).prop("checked", true);
				}
			});

		catalog = data_catalog == "financial" ? data_catalog + "-services" : data_catalog
		//$("#demos", window.parent.document).html("<a class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' style='font-family:arial;text-decoration:none;-size:16px;color:#777' target='_blank' href='https://rcgglobalservices.com/" + catalog + "'>RCG &#8226; " + capitalize(data_catalog) + "</a>");
	   var source;
      if(data_catalog == "healthcare"){
		source = healthcare_db;
		source_data = {
                medical: {
                    data: source.ale
                },
                research: {
                    data: source.lager
                },
                patient: {
                    data: source.stout
                },
                laboratory: {
                    data: source.malt
                }
            }
		$("#healthcare-label").css("font-weight", "bold");
		$("#financial-label").css("font-weight", "normal");	
      }else if( data_catalog == "financial"){
		source = financial_db;
              source_data = {
                banks: {
                    data: source.ale
                },
                research: {
                    data: source.lager
                },
                investment: {
                    data: source.stout
                },
                markets: {
                    data: source.malt
                }
            }
		$("#financial-label").css("font-weight", "bold");
		$("#healthcare-label").css("font-weight", "normal");
      }else{
		console.log("	unrecognized db [" + data_catalog + "] .. reverting to healthcare");
		source = healthcare_db;
source_data = {
                medical: {
                    data: source.ale
                },
                research: {
                    data: source.lager
                },
                patient: {
                    data: source.stout
                },
                laboratory: {
                    data: source.malt
                }
            }
      }

        typeof $.typeahead === 'function' && $.typeahead({
            input: ".js-typeahead",
            minLength: 1,
            maxItem: 15,
            order: "asc",
            hint: true,
            group: {
                template: "{{group}} beers!"
            },
            maxItemPerGroup: 5,
            backdrop: {
                "background-color": "#fff"
            },
            dropdownFilter: "all categories",
            emptyTemplate: 'No result for "{{query}}"',
            source: source_data,
            callback: {
                onClickAfter: function (node, a, item, event) {

                    // href key gets added inside item from options.href configuration
                    console.log(item.href);

                }
            },
            debug: true
        });

    </script>


					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">



							<li class="nav-item active"><span id='demos'></span></li>

						</ul>
					</div>
				</div>
			</nav>

			<iframe src="/requests" id="requests-frame"
				style="display: none; position: relative; bottom: 20px; width: 100%; height: 9005px; border: 0">Browser
				not compatible.</iframe>


			<iframe src="/main" id="market-frame"
				style="display: none; position: relative; bottom: 20px; width: 100%; height: 9005px; border: 0">Browser
				not compatible.</iframe>


			<iframe src="/shared" id="shared-frame"
				style="display: block; position: relative; bottom: 20px; width: 100%; height: 9005px; border: 0">Browser
				not compatible.</iframe>

		</div>
	</div>


	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		var data_catalog = localStorage.getItem("data-catalog");
		catalog = data_catalog == "financial" ? data_catalog + "-services"
				: data_catalog
		$("#demos")
				.html(
						"<a style='font-family:arial;text-decoration:none;-size:16px;color:#777' target='_blank' href='https://rcgglobalservices.com/" + catalog + "'>RCG &#8226; "
								+ capitalize(data_catalog) + "</a>");

		$("#vertical").text(capitalize(data_catalog));
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
	</script>

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
			
			console.log(item);
			
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

		function loadCatalog(item) {
			console.log(item);
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
				row.insertCell(4).innerHTML = new Date().toString().replace(
						' (Central Daylight Time)', '');
				var cell1 = row.insertCell(5);
				cell1.style.color = "#3399ff";
				cell1.innerHTML = "<span class='blink'>Pending...</span>"
				cell1.id = "pending-cell-" + status["id"];
				var cell = row.insertCell(6);
				cell.className = "context-menu";
				cell.setAttribute("data-container-id", "context-menu-items");
				cell.setAttribute("data-row-id", "4");
				var tableContextMenu = new ContextMenu("context-menu-items",
						menuItemClickListener);

				$("#requests-table > tbody > tr")
						.each(
								function() {
									var currentRow = $(this);
									if ($(currentRow[0].children[1])[0].innerText == status["id"]) {
										switch (status['status']) {
										case "failed":
											$("#pending-cell-" + status["id"])
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
									var current_id = JSON.parse(localStorage
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
</body>

</html>
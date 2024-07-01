
<!DOCTYPE html>
<html lang="en">
<head>
<title>Marketplace</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/css/smartadmin-production.min.6b284d659818.css">
<link rel="stylesheet" href="/css/gray.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">


<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	if (!window.jQuery) {
		document.write('<script src="/js/jquery/jquery-2.1.1.min.e40ec2161fe7.js"><\/script>');
	}
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script>
	if (!window.jQuery.ui) {
		document.write('<script src="/js/jquery/jquery-ui-1.10.3.min.fd2554158395.js"><\/script>');
	}
</script>
<script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
<script src="/js/controller/storeLocationController.js"></script>
<script src="/js/jquery/app.config.19e23cc440c5.js"></script>
<script src="/js/jquery/bootstrap.min.b621c698a1d9.js"></script>
<script src="/js/jquery/SmartNotification.min.30bc74b00a04.js"></script>
<script src="/js/jquery/rcg.jarvis.widget.a2bf3cf239a6.js"></script>
<script src="/js/jquery/jquery.mb.browser.min.f311ebf0f7d6.js"></script>
<script src="/js/jquery/app.min.b9c01545259f.js"></script>
<script src="/js/jquery/map.9b7fa063b457.js"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyBUbhj2hMOk2eLsV8NFh7CBzifi_IOn78w"></script>
<script src="http://www.daftlogic.com/script/sandbox-google-maps-marker-lasso-search-tool.js"></script>


<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/gauge.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif;
	font-size: 12px !important;
}

input.js-typeahead, button {
	font-size: 17px !important;
}

li {
	font-size: 17px !important;
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}

a {
	color: white;
}

a:link {
	color: white;
}

a:visited {
	color: white;
}

a:visited:hover {
	color: white;
}

a:hover {
	color: white;
}

a:active {
	color: white;
}

textarea {
    border: none;
    outline: none;
}

</style>
</head>
<body>

	<script>
		var level;
		
		
		
		function shareModal() {
			$("#shareModal").show();
		}
		
		function shareModalHide() {
			$("#shareModal").hide();
			$("#sharedDiv").show();
			$("#sharedDiv").html("<font color='7D5683'>" + new Date() + "</font><br>" + "<font color='8B8CA0'>@eric.perler shared a version of</font><br><font color='63709C'>RG_7380_ADVANCED_020323 Report</font>");
			
		}
		
		function salesModalancel() {
			$("#salesModal").hide();
		}

		function responseModalClose() {
			$("#responseModal").hide();
		}

		function showConnectionModal() {
			$("#connectionModal").show();
		}

		function connectionModalClose() {
			$("#connectionModal").hide();
			this.level = "Database"
			//$("#profile").val("Database")
			salesModalClose();
		}

		var createLevel = 0;
		function createPurview(id) {
			console.log("purview")
			createLevel = id;
			$("#purviewModal").show()
		}
		
		function purviewModalCancel() {
			$("#purviewModal").hide()

		}

		function purviewModalClose() {
			$("#purviewModal").hide()

			var src = $(".js-typeahead").val()

			if (this.createLevel == 1) {
				$("#dp1").show()
				$("#dp1").html("Please Wait...")
				
				
			
				$
						.ajax({
							url : "/sqlserver/" + "RCG",
							success : function(result) {

								$("#responseModal").show();

								$("#proc").hide()

								$("#dp1").show()
								$("#dp1")
										.html(
												"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_ADVANCED_121822/providers/Microsoft.Sql/servers/rcgmssqlserver/databases/RG_7380_DATABASE/overview'>RG_7380_SQLSERVER</a><br><font size=-1><font color=red>access granted</font></font>")

								$("#db1id").html("Accessible")

							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								console.log("Status: " + textStatus);
								console.log("Error: " + errorThrown);
							}
						});
			} else if (this.createLevel == 2) {
				$("#dp2").show()
				$("#dp2").html("Please Wait...")

				$
						.ajax({
							url : "/sqlserver1/" + "name",
							success : function(result) {

								$("#responseModal").show();

								$("#proc").hide()

								$("#dp2").show()
								$("#dp2")
										.html(
												"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_SQLSERVER/providers/Microsoft.Sql/servers/rcgmssqlserver/databases/RG_7380_DATABASE/overview'>RG_7380_POWERBI</a><br><font size=-1><font color=red>access granted</font></font>")

								$("#powerbi1").html('<font color=darkgreen>Available</font>')
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								console.log("Status: " + textStatus);
								console.log("Error: " + errorThrown);
							}
						});

				/* 			setTimeout(
									function() {
										$("#dp2").show()
										$("#dp2")
												.html(
														"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_SQLSERVER/providers/Microsoft.Sql/servers/rcgmssqlserver/databases/RG_7380_DATABASE/overview'>RG_7380_POWERBI</a><br><font size=-1><font color=red>access granted</font></font>")

									}, 3000); */
			} else if (this.createLevel == 3) {
				$("#dp3").show()
				$("#dp3").html("Please Wait...")
				/* 				setTimeout(
				 function() {
				 $("#dp3").show()
				 $("#dp3")
				 .html(
				 "<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_SQLSERVER/providers/Microsoft.Sql/servers/rcgmssqlserver/databases/RG_7380_DATABASE/overview'>RG_7380_PURVIEW</a><br><font size=-1><font color=red>access granted</font></font>")

				 }, 3000); */

				console.log("Storge")

				$
						.ajax({
							url : "/createVm/" + "storage" + "/" + "name",
							success : function(result) {

								var ip = result.substring(result.indexOf("public_ip_address"), result.indexOf("public_ip_address") + 35)
								var resource = result.substring(result.indexOf("resource_group_name"), result.indexOf("resource_group_name") + 38)

								console.log("storage ip -> " + ip)
								console.log("storage -> " + resource)

								$("#responseDiv").html(ip + "<br>" + resource)

								console.log("storage name-> " + this.level)
								$("#dp3").show()
								$("#dp3")
										.html(
												"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_SQLSERVER/providers/Microsoft.Sql/servers/rcgmssqlserver/databases/RG_7380_DATABASE/overview'>RG_7380_PURVIEW</a><br><font size=-1><font color=red>access granted</font></font>")

								$("#responseModal").show();

								$("#proc").hide()
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								console.log("Status: " + textStatus);
								console.log("Error: " + errorThrown);
							}
						});

			}

		}

		function salesModalClose() {
			$("#salesModal").hide();
			var name = $("#tierform option:selected").text()

			var profile = $("#profile").val();

			console.log("/createVm/" + this.level + "/" + profile)

			if (this.level == 'DataScience') {

				console.log("Pending Approval")

				$.ajax({
					url : "/createVm/" + this.level + "/" + profile,
					success : function(result) {

						var ip = result.substring(result.indexOf("public_ip_address"), result.indexOf("public_ip_address") + 35)
						var resource = result.substring(result.indexOf("resource_group_name"), result.indexOf("resource_group_name") + 38)

						console.log("ip -> " + ip)
						console.log("resource -> " + resource)

						$("#responseDiv").html(ip + "<br>" + resource)

						var env1 = $("#env1").text();
						var env2 = $("#env2").text();
						var env3 = $("#env3").text();

						var resourceName = resource.substring(23, result.indexOf("resource_group_name") + 47)

						console.log("resource name-> " + resourceName)
						console.log("level name-> " + this.level)

						$("#responseModal").show();

						$("#proc").hide()
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						console.log("Status: " + textStatus);
						console.log("Error: " + errorThrown);
					}
				});

				$("#env3").show()
				$("#env3").html(profile + "<br><font color=#FFCCCB>Pending Approval</font>");

			} else if (this.level == 'Database') {

				$.ajax({
					url : "/sqlserver2/" + this.level,
					success : function(result) {

						console.log("CALLED AMUNDSEN")

					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						console.log("Status: " + textStatus);
						console.log("Error: " + errorThrown);
					}

				});

				$
						.ajax({
							url : "/createVm/" + this.level + "/" + profile,
							success : function(result) {
								console.log(result)

								var ip = result.substring(result.indexOf("public_ip_address"), result.indexOf("public_ip_address") + 35)
								var resource = result.substring(result.indexOf("resource_group_name"), result.indexOf("resource_group_name") + 38)

								console.log("ip -> " + ip)
								console.log("resource -> " + resource)

								$("#responseDiv").html(ip + "<br>" + resource)

								var env1 = $("#env1").text();
								var env2 = $("#env2").text();
								var env3 = $("#env3").text();

								var resourceName = resource.substring(23, result.indexOf("resource_group_name") + 47)

								console.log("resource name-> " + resourceName)
								console.log("level name-> " + this.level)

								$("#env3").show()
								$("#env3")
										.html(
												"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_ADVANCED_122222/providers/Microsoft.Sql/servers/rcgmssqlserver/databases/RG_7380_DATABASE/overview'>RG_7380_SQLSERVER</a><br><font size=-1><font color=red>available</font></font>")

								$("#responseModal").show();

								$("#proc").hide()

								// Find a <table> element with id="myTable":
								var table = document.getElementById("sharedtable");

								// Create an empty <tr> element and add it to the 1st position of the table:
								var row = table.insertRow(3);
								row.style.backgroundColor = '#F2F2F2'

								// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
								var cell1 = row.insertCell(0);
								cell1.style.width = '50px';
								//	cell1.style.borderRight = '1px solid blue'
								cell1.style.textAlign = 'center'
								cell1.style.height = '30px'
								cell1.style.paddingBottom = '3px'

								var cell2 = row.insertCell(1);

								cell2.style.width = '200px';
								//cell2.style.borderRight = '1px solid blue'
								cell2.style.paddingLeft = '5px'
								cell2.style.height = '30px'

								var cell3 = row.insertCell(2);
								cell3.style.width = '500px';
								//cell3.style.borderRight = '1px solid blue'
								cell3.style.paddingLeft = '5px'
								cell3.style.height = '30px'
								cell3.id = 'db1id'

								var cell4 = row.insertCell(3);
								cell4.style.width = '500px';
								//cell3.style.borderRight = '1px solid blue'
								cell4.style.paddingLeft = '5px'
								cell4.style.height = '30px'

								// Add some text to the new cells:
								cell1.innerHTML = "<img src='img/table_small.jpg'>";
								cell2.innerHTML = 'RG_7380_SQLSERVER';
								cell3.innerHTML = 'Provisioned'
								cell4.innerHTML = new Date()

							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								console.log("Status: " + textStatus);
								console.log("Error: " + errorThrown);
							}
						});

			} else {

				console.log("ip -> " + this.level)
				console.log("resource -> " + profile)

				$
						.ajax({
							url : "/createVm/" + this.level + "/" + profile,
							success : function(result) {
								console.log(result)

								var ip = result.substring(result.indexOf("public_ip_address"), result.indexOf("public_ip_address") + 35)
								var resource = result.substring(result.indexOf("resource_group_name"), result.indexOf("resource_group_name") + 38)

								console.log("ip -> " + ip)
								console.log("resource -> " + resource)

								$("#responseDiv").html(ip + "<br>" + resource)

								var env1 = $("#env1").text();
								var env2 = $("#env2").text();
								var env3 = $("#env3").text();

								var resourceName = resource.substring(23, result.indexOf("resource_group_name") + 47)

								console.log("resource name-> " + resourceName)
								console.log("level name-> " + this.level)

								if (env3 != '') {
									$("#env3").show()
									$("#env3")
											.html(
													"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_SQLSERVER/providers/Microsoft.Sql/servers/rcgmssqlserver/databases/RG_7380_DATABASE/overview'>RG_7380_SQLSERVER</a>")
								} else {
									if (env1 == '') {

										$("#env1").show();
										$("#env1").html(
												"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_DEVELOP/overview'>"
														+ resourceName + "</a><br><font size=-1><font color=red>available</font></font>");

										// Find a <table> element with id="myTable":
										var table = document.getElementById("sharedtable");

										// Create an empty <tr> element and add it to the 1st position of the table:
										var row = table.insertRow(1);
										row.style.backgroundColor = '#F2F2F2'

										// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
										var cell1 = row.insertCell(0);
										cell1.style.width = '50px';
										//	cell1.style.borderRight = '1px solid blue'
										cell1.style.textAlign = 'center'
										cell1.style.height = '30px'
										cell1.style.paddingBottom = '3px'

										var cell2 = row.insertCell(1);

										cell2.style.width = '200px';
										//cell2.style.borderRight = '1px solid blue'
										cell2.style.paddingLeft = '5px'
										cell2.style.height = '30px'

										var cell3 = row.insertCell(2);
										cell3.style.width = '500px';
										//cell3.style.borderRight = '1px solid blue'
										cell3.style.paddingLeft = '5px'
										cell3.style.height = '30px'

										var cell4 = row.insertCell(3);
										cell4.style.width = '500px';
										//cell3.style.borderRight = '1px solid blue'
										cell4.style.paddingLeft = '5px'
										cell4.style.height = '30px'

										// Add some text to the new cells:
										cell1.innerHTML = "<img src='img/app_small.jpg'>";
										cell2.innerHTML = 'RG_7380_DEVELOP';
										cell3.innerHTML = 'Provisioned'
										cell4.innerHTML = new Date()

									} else {
										if (env2 == '') {

											$("#env2").show();
											$("#env2").html(
													"<a target='_blank' href='https://portal.azure.com/#@rcgmail.onmicrosoft.com/resource/subscriptions/6f783307-f8cd-4eb8-8cb5-8611ff4bc05f/resourceGroups/RG_7380_ANALYST/overview'>"
															+ resourceName + "</a><br><font size=-1><font color=red>available</font></font>");

											// Find a <table> element with id="myTable":
											var table = document.getElementById("sharedtable");

											// Create an empty <tr> element and add it to the 1st position of the table:
											var row = table.insertRow(2);

											// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
											var cell1 = row.insertCell(0);
											cell1.style.width = '50px';
											//	cell1.style.borderRight = '1px solid blue'
											cell1.style.textAlign = 'center'
											cell1.style.height = '30px'
											cell1.style.paddingBottom = '3px'

											var cell2 = row.insertCell(1);

											cell2.style.width = '200px';
											//cell2.style.borderRight = '1px solid blue'
											cell2.style.paddingLeft = '5px'
											cell2.style.height = '30px'

											var cell3 = row.insertCell(2);
											cell3.style.width = '500px';
											//cell3.style.borderRight = '1px solid blue'
											cell3.style.paddingLeft = '5px'
											cell3.style.height = '30px'

											var cell4 = row.insertCell(3);
											cell4.style.width = '500px';
											//cell3.style.borderRight = '1px solid blue'
											cell4.style.paddingLeft = '5px'
											cell4.style.height = '30px'

											// Add some text to the new cells:
											cell1.innerHTML = "<img src='img/chart_small.jpg'>";
											cell2.innerHTML = 'RG_7380_ANALYST';
											cell3.innerHTML = 'Provisioned'
											cell4.innerHTML = new Date()

										}

										/* 						else {
																	
																	$("#env3").show();
																	$("#env3").html("<a target='_blank' href='https://portal.azure.com/#view/HubsExtension/BrowseResourceGroups'>" + resourceName + "</a>");
																} */
									}
								}

								$("#responseModal").show();

								$("#proc").hide()
							},
							error : function(XMLHttpRequest, textSdochatatus, errorThrown) {
								console.log("Status: " + textStatus);
								console.log("Error: " + errorThrown);
							}
						});

			}
		}

		function setPurviewApproval() {
			$("#dp2").show()
			$("#dp2").html("<div>Purview Request<br><font size=-1><font color=#FFCCCB>Pending Approval</font></font></div>");
		}

		function createVm() {

			this.level = event.target.id
			console.log(level)

			if (level == 'Developer') {
				$("#resources1").hide()
				$("#resources2").hide()
				$("#resources").show()
				$("#resources3").hide();
				$("#note").html("The following resources will be installed in this profile");
			} else if (level == 'DataScience') {
				$("#resources").hide()
				$("#resources2").show()
				$("#resources1").hide()
				$("#resources3").hide();
				$("#note").html("The following resources will be installed in this profile");
			} else if (level == 'Analyst') {
				$("#resources").hide()
				$("#resources2").hide()
				$("#resources1").show()
				$("#resources3").hide();
				$("#note").html("The following resources will be installed in this profile");
			} else if (level == 'Database') {
				/* 				$("#resources").hide()
				 $("#resources2").hide()
				 $("#resources1").hide()
				 $("#resources3").show();
				 $("#note").html("Select a source template (optional)"); */

				$("#resources").hide()
				$("#resources2").show()
				$("#resources1").hide()
				$("#resources3").hide();
				$("#note").html("The following resources will be installed in this profile");
			}

			//$("#proc").show()
			$("#salesModal").show()

		}
		
		
		function submitform(){
			 window.open("http://20.118.204.114:5000/search?term=" + $("#searchterm").val() + "&resource=table&index=0", "_blank");
		}
		
		function dochat(){
			
			setTimeout(function() {
			
				$("#chatresponse").show();
			
			}, 500);
			
			
			
			setTimeout(function() {
				//if  $("#chatrequest").val().indexOf("sales") != -1  ){
					
				//}
			
				$("#chatresponse").html("<font color='darkgreen'><b>Agent: </b>	</font>Try clicking this <a href='http://20.118.204.114:5000/search?term=rg&resource=table&index=0' target='_blank'><font color=blue>link</font></a> and <br>searching the Data Catalog")
			}, 2500);
		}
	</script>


	<div class="modal-content" id='shareModal' style="z-index: 1000000; width: 330px; height: 600px; display: none; position: absolute; top: 25%; right: 50%">
		<div class="modal-header">
			<h4 class="modal-title">
				<table style="background-color: #7030A2; height: 80px; width: 100%; margin: 0px; padding: 0px">
					<tr>
						<td><img src="img/subheader.jpg"></td>
					</tr>
				</table>
			</h4>
		</div>
		<div class="modal-body">

			
			
			
		
<style>
.dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 5px;
  font-size: 10px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  width: 400px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>

<h2><font size=+1>Share Content</h2></font>
<p>Share a resource with another user</p>

<div class="dropdown">
  
  
  
  <table><tr><td>User:</td><td><input type=text id="shareid"></td><td>&nbsp;<button class="dropbtn">Select User</button>
  
  
  
  	<div class="dropdown-content">
    <table><tr><td><a href="#"><img height=50 width=50 src='img/eperler.png' onclick='selectuser()'></td><td><b>Eric Perler</b><br><font size=-1>eric.perler@rcggs.com</font></a></td></tr></table>
    <hr style="height:1px;border:none;color:#ccc;background-color:#ccc;padding: 0px;margin: 0px" />
    <table><tr><td><a href="#"><img height=50 width=50 src='img/demouser.png' onclick='selectuser()'></td><td><b>Demo User</b><br><font size=-1>demouser@rcggs.com</font></a></td></tr></table>

  </div>
  </td></tr>
  		<tr><td>URL:</td><td colspan="2" style='padding-top: 5px'>
			 <input type=text value="" size=35><br><br>
			
			</td></tr></table>
</div>


			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="shareModalHide()">OK</button>
		</div>
	</div>





	<div class="modal-content" id='connectionModal' style="z-index: 1000000; width: 1200px; height: 1050px; display: none; position: absolute; top: 5%; right: 25%">
		<div class="modal-header">
			<h4 class="modal-title">
				<table style="background-color: #7030A2; height: 80px; width: 100%; margin: 0px; padding: 0px">
					<tr>
						<td><img src="img/subheader.jpg"></td>
					</tr>
				</table>
			</h4>
		</div>
		<div class="modal-body">
			<iframe scrolling="no" width="300" height="400" style="border: 1px solid #ccc; padding: 5px" src="http://192.168.56.10:9290/canvas1"></iframe>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="connectionModalClose()">OK</button>
		</div>
	</div>

	<div class="modal-content" id='responseModal' style="z-index: 1000000; width: 330px; height: 300px; display: none; position: absolute; top: 25%; right: 50%">
		<div class="modal-header">
			<h4 class="modal-title">
				<img src="img/subheader.jpg">
			</h4>
		</div>
		<div class="modal-body">
			<b>Request Successful</b>
			<div id='responseDiv'></div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="responseModalClose()">OK</button>
		</div>
	</div>


	<div class="modal-content" id='salesModal' style="z-index: 1000000; width: 330px; height: 600px; display: none; position: absolute; top: 25%; right: 50%">
		<div class="modal-header">
			<h4 class="modal-title">
				<img src="img/subheader.jpg">
			</h4>
		</div>
		<div class="modal-body">
			Please enter a name for this environment (no spaces)<br>
			<div style="padding-top: 10px">
				<form>
					<!-- 					<select id='tierform'>
						<option>Developer</option>
						<option>DataScience</option>
						<option>Analyst</option>
					</select>  -->
					<input type="text" id="profile" size=38 />
				</form>
				<hr style="border: 1px solid #ccc" />

				<span id='note'>The following resources will be installed in this profile</span>
				<p>
				<ul id='resources' x style="display: none">
					<li>Storage account</li>
					<li>Disk</li>
					<li>Network security group</li>
					<li>Network Interface</li>
					<li>Public IP address</li>
					<li>Virtual machine</li>
					<li>Virtual network</li>
				</ul>



				<ul id='resources1' style="display: none">
					<li>Storage account</li>
					<li>Disk</li>
					<li>Network security group</li>
					<li>Network Interface</li>
					<li>Public IP address</li>
					<li>Virtual machine</li>
					<li>Virtual network</li>
					<li>Power BI Embedded</li>


				</ul>

				<ul id='resources2' style="display: none">
					<li>Storage account</li>
					<li>Disk</li>
					<li>Network security group</li>
					<li>Network Interface</li>
					<li>Public IP address</li>
					<li>Virtual machine</li>
					<li>Virtual network</li>
					<li>Power BI Embedded</li>
					<li>SQL Server</li>
					<br>
					<font size=-1><font color=red>This resource requires approval</font></font>
				</ul>


				<ul id='resources3' style="display: none">
					<iframe scrolling="yes" width="300" height="225" style="position: relative; right: 45px; border: 1px solid #ccc; padding: 5px" src="http://192.168.56.10:9290/canvas1"></iframe>
				</ul>



				<!-- 				<table border=1 style="padding-top: 10px">
					<tr>
						<td><img src="img/1.png"></td>
						<td width=5></td>
						<td>Netowrk Interface</td>
					</tr>
					<tr>
						<td><img src="img/2.png"></td>
						<td width=5></td>
						<td>Netowrk Interface</td>
					</tr>
					<tr>
						<td><img src="img/3.png"></td>
						<td width=5></td>
						<td>Netowrk Interface</td>
					</tr>
					<tr>
						<td><img src="img/4.png"></td>
						<td width=5></td>
						<td>Netowrk Interface</td>
					</tr>
					<tr>
						<td><img src="img/5.png"></td>
						<td width=5></td>
						<td>Netowrk Interface</td>
					</tr>
					<tr>
						<td><img src="img/6.png"></td>
						<td width=5></td>
						<td>Netowrk Interface</td>
					</tr>
					<tr>
						<td><img src="img/7.png"></td>
						<td width=5></td>
						<td>Netowrk Interface</td>
					</tr>

				</table> -->
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="salesModalClose()">Cancel</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="salesModalClose()">Submit</button>
		</div>
	</div>


<table style="padding-top: 20px; margin: 0px; background-color: #7030A0; width: 100%";><tr><td heigth=10px>&nbsp;</table>


	<table style=" margin: 0px; background-color: #7030A0; width: 100%";>
		<tr style="">
			<td style="background-repeat:no-repeat; background-image: url('/img/header.jpg');background-color: #7030A0; padding-top: 0px; margin: 0px; height: 0px">
			

			<div style='padding-left:430px'>
					<form id='searchform' autocomplete="off">>
					
					
					
					
					
					
								
					<div class="typeahead__container" style="width:900px">
						<div class="typeahead__field">
							<div class="typeahead__query">
								<!-- <input class="js-typeahead" name="q" autofocus autocomplete="off"> -->
								<input class="js-typeahead" type='text' id='searchterm' size=35 style='width:400px; font-size:24px;padding: 12px 20px;margin: 8px 0;box-sizing: border-box;border-radius: 25px; height: 40px'>
								

	<input type="submit" value=" SEARCH " style='width:200px; 
								background-color: #DBD5E1; color: #7030A0; position: relative; top: -48px; left:410px; border-radius: 25px; height: 40px' onclick="submitform()">
					
							</div>
							<div class="typeahead__button">
								<button type="submit">
									<span class="typeahead__search-icon"></span>
								</button>
							</div>
						</div>
					</div>
			
					

					
					</form>
				</div>
			
			
			<span id='proc' style="padding-right: 20px; padding-top: 18px; display: none; float: right; color: #fff"><img src="img/loading.gif" height="40" width="40">Processing...</span></td>
		</tr>
	</table>
	
	
	<br>
	<br>
	<!-- Second Grid -->
	
	
	<table border=0><tr><td>
	
	<div class="" style="padding-left: 300px">
		<div class="">

			<div class="">
				<!-- 	<h1>Lorem Ipsum</h1>
				<h5 class="w3-padding-32">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h5>
 -->

				<table>
					<tr>
						<td style="background-image: url('img/quad1.jpg'); height: 192px; width: 663px"><span style="padding-left: 75px">

								<div id="dp1" style="padding: 2px; color: white; display: none; background-color: darkgreen; border: 1px solid #ccc; width: 128px; height: 93px; position: absolute; top: 225px; left: 384px"></div>

								<div id="dp2" style="padding: 2px; color: white; display: none; background-color: darkgreen; border: 1px solid #ccc; width: 128px; height: 93px; position: absolute; top: 225px; left: 550px"></div>


								<div id="dp3" style="padding: 2px; color: white; display: none; background-color: darkgreen; border: 1px solid #ccc; width: 128px; height: 93px; position: absolute; top: 225px; left: 717px"></div> <!-- 	<span id="dp1">
								
								
								 <!-- 	<span id="dp1"> 
						</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="dp2"></span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="dp3"></span>
						</span>
						 --></td>


						<td style="background-image: url('img/quad2.jpg'); height: 192px; width: 663px">


							<div id="env1" style="padding: 2px; color: white; display: none; background-color: darkgreen; border: 1px solid #ccc; width: 128px; height: 93px; position: absolute; top: 225px; left: 1048px"></div>

							<div id="env2" style="padding: 2px; color: white; display: none; background-color: darkgreen; border: 1px solid #ccc; width: 128px; height: 93px; position: absolute; top: 225px; left: 1200px"></div>

							<div id="env3" style="padding: 2px; color: white; display: none; background-color: darkgreen; border: 1px solid #ccc; width: 128px; height: 93px; position: absolute; top: 225px; left: 1380px"></div>


						</td>

					</tr>
					<tr>
						<td height=20></td>
					</tr>
					<tr>


						<td style="background-image: url('img/quad3.jpg'); height: 192px; width: 663px"><span style="padding-left: 90px"><a href="#""><a href="#" onclick="createPurview(1)"> <span id="Database" style="color: white">Request Data Access <span style="position: relative; top: 20px; right: 90px">SQL DIRECT</span>
									</span></a> <a target="_blank" href="https://web.purview.azure.com/resource/rcgpurview/main/catalog/browseassettypes?section=Collection&feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a"> <a target='_blank' href="https://web.purview.azure.com/resource/rcgpurview/main/datasource/registeredSources?feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a" onclick="setPurviewApproval()"
										style="color: white"></a></a></span> <span style="position: relative; right: 15px"><a href="#""><a href="#" onclick="createPurview(2)"> <span id="Database" style="color: white">Request Data Access <span style="position: relative; top: 20px; right: 90px">POWER BI</span> <a target="_blank"
											href="https://web.purview.azure.com/resource/rcgpurview/main/catalog/browseassettypes?section=Collection&feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a"> <a target='_blank' href="https://web.purview.azure.com/resource/rcgpurview/main/datasource/registeredSources?feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a" onclick="setPurviewApproval()" style="color: white"></a></a></span> <span
										style="position: relative; right: 20px"><a href="#""><a href="#" onclick="createPurview(3)"> <span id="Database" style="color: white">Request Data Access </span></a><a target="_blank" href="https://web.purview.azure.com/resource/rcgpurview/main/catalog/browseassettypes?section=Collection&feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a"> <a target='_blank'
													href="https://web.purview.azure.com/resource/rcgpurview/main/datasource/registeredSources?feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a" onclick="setPurviewApproval()" style="color: white"></a></a> <span style="color: white; position: relative; top: 20px; right: 90px">PURVIEW</span></span></td>



						<td style="background-image: url('img/quad4.jpg'); height: 192px; width: 663px"><span style="padding-left: 85px"><a href="#" onclick="createVm()">


									<table>
										<tr>
											<td><span id='Developer' style="width: 120px; height: 90px; background-color: #1A3E98; color: #fff; padding: 25px; position: relative; top: 2px; left: 84px; display: flex;">Basic Data Engineering</span></td>
											<td style="padding-left: 50px"><span id='Analyst' style="width: 120px; height: 90px; background-color: #1A3E98; color: #fff; padding: 25px; position: relative; top: 2px; left: 84px; display: flex;">Reporting & Analytics</span></td>
											<td style="padding-left: 50px"><span id='Database' style="width: 150px; height: 90px; background-color: #1A3E98; color: #fff; padding: 25px; position: relative; top: 2px; left: 66px; display: flex;">Advanced Analytics AI/ML</span></td>

										</tr>
									</table>


							</a></span></td>

					</tr>
				</table>

				<br>


				<!-- 	<p class="w3-text-grey">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing
					elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			 -->
			</div>



			<div style='width: 1320px; padding-left: 50px; height: 220px; background-image: url("img/sharedbak.jpg"); background-repeat: no-repeat; padding-top: 60px'>

				<div style='overflow-y: scroll; width: 1250px; height: 110px'>
					<table border=1 style='border: 1px solid #71AAD1; width: 1200px;' id='sharedtable'>
						<tr>
							<td>&nbsp;&nbsp;Type</td>
							<td>&nbsp;&nbsp;Name</td>
							<td>&nbsp;&nbsp;Status</td>
							<td>&nbsp;&nbsp;Updated</td>
						</tr>
					</table>
				</div>

			</div>


		</div>
		<!-- <img src="img/shared.jpg"><br/> -->
		<img src="img/footer.jpg" usemap="#workmap">
		<map name="workmap">
			<!-- <area shape="rect" coords="0,0,120,120" alt="Computer" href="https://web.purview.azure.com/resource/rcgpurview?feature.tenant=7aa4356e-1227-4975-bb58-165bff68ff0a" target="_blank"> -->
			<area shape="rect" coords="0,0,120,120" alt="Computer" href="http://20.118.204.114:5000/search?term=rg&resource=table&index=0" target="_blank">
			<area shape="rect" coords="530,10,615,127" alt="Computer" href="https://rcgmail.sharepoint.com/sites/SharepointDemo/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FSharepointDemo%2FShared%20Documents%2FLearning%20Materials&viewid=09f462b1%2D9405%2D47f2%2Dbdfe%2D28105816cf6f" target="_blank">
			<area shape="rect" coords="1211,26,1286,90" onclick="shareModal()" alt="Computer" href="#">
		</map>
	</div>


</td>

<td width='20px'>&nbsp;</td><td style='padding-top:20px; border: 1px solid #ccc; width:315px; background-image: url("/img/side.jpg"); background-repeat: no-repeat; background-color: #DBD5E1'>


<div id='sharedDiv' style='padding:5px; position: relative; bottom:270px; left:20px; heigth:100px; width:270px; background-color: #fff; display:none'>



</div>


<div>
<div style='padding-top:0px; position: relative; left:57px; top:110px; font-size: 12px'><font color='darkgreen'><b>Agent: </b>	
</font>Hello, how can I help you today?



<!-- <textarea" rows=50 cols=50  style=' padding:0px' onchange="alert()"/> --><textarea style='padding-top: 10px' id="chatrequest" rows="2" cols="28" onchange="dochat()"></textarea>

<div id='chatresponse' style="display:none; width: 200px;">Agent is typing...</div>

</div>

</div>



</td></tr></table>


<html lang="en">
<head>
<meta charset="utf-8">

<title></title>
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="/js/jquery.typeahead.css">

<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="/js/jquery.typeahead.js"></script>

</head>
<body>

	<div style="width: 100%; max-width: 800px; margin: 0 auto;">













		<div class="modal-content" id='purviewModal' style="z-index: 1000000; width: 1200px; height: 1050px; display: none; position: absolute; top: 5%; right: 25%">
			<div class="modal-header">
				<h4 class="modal-title">
					<table style="background-color: #7030A2; height: 80px; width: 100%; margin: 0px; padding: 0px">
						<tr>
							<td><img src="img/subheader.jpg"></td>
						</tr>
					</table>
				</h4>
			</div>
			<div class="modal-body">























				<form>
					<div class="typeahead__container">
						<div class="typeahead__field">
							<div class="typeahead__query">
								<input class="js-typeahead" name="q" autofocus autocomplete="off">
							</div>
							<div class="typeahead__button">
								<button type="submit">
									<span class="typeahead__search-icon"></span>
								</button>
							</div>
						</div>
					</div>
				</form>


			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="purviewModalCancel()">Cancel</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="purviewModalClose()">OK</button>
			</div>
		</div>

		<script>
			var data = {
				"ale" : [
					"RG_7380_ADVANCED_010923<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",							
					"RG_7380_ADVANCED_121022<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",					
					"RG_7380_ADVANCED_121122<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
					"RG_7380_ADVANCED_121222<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
					"RG_7380_ADVANCED_121322<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",		
						"RG_POWERBI_DATASET_TRACKING<font size=-1><font color='darkgreen'>&nbsp;&nbsp;&nbsp;Available</font></font><br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_POWERBI_DATASET_CUSTOMER<font size=-1><font color='darkgreen'>&nbsp;&nbsp;&nbsp;Available</font></font><br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_POWERBI_DATASET_DELIVERIES<font size=-1><font color='darkgreen'>&nbsp;&nbsp;&nbsp;Available</font></font><br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_POWERBI_DATASET_ORDERS<font size=-1><font color='red'>&nbsp;&nbsp;&nbsp;<span id='powerbi1'>Pending Approval</font></font></span><br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_DATASET_0001<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_7380_PURVIEW<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_7380_POWERBI<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_7380_DEVELOP<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_7380_ANALYST<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_7380_DATABASE<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"RG_7380_SQLSERVER<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Report 2020<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Report 2021<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Report 2022<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"New Hire Sales Training<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Marketing and Sales Impact<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Performance Sales Dataset 19364<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Property Sales Dataset 89235353<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Brand Sales Dataset 092723<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Covid Impact on Sales<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Datsheet 101<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Understandng Sales Data<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Promotion and Sales Correlation<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Forcast 2021 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Forcast 2021 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Forcast 2022 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Forcast 2022 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Product Sales Datasheet<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales (SD-SLS)<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Working With Sales Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"About Sales Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"How Sales Documents are Structured<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Structure and Data in a Sales Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Origin of Data in Sales Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"How Sales Documents are Controlled<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Common Features in Sales Order Processing<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Summary<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Making Fast Changes<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Reference status<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Entering Dunning Data in a Sales Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Displaying Changes Made in a Sales Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Combining Sales Document Items for Delivery<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Processing Billing Plans<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Additional Data<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Deleting Sales Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Deleting Items in a Sales Order<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Rejecting Items in a Sales Order<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Changing Data at Header Level<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Assigning Contracts<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"List of Sales Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Deriving the Sales Area<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Changing the Sold-to Party<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Changing Sales Document Type<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Printing Output Manually for a Sales Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Message Log<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Copying Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Item Proposals in the Sales Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Incompletion Logs<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Enhanced Material Search with Material Creation<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Material View<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Material Determination<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Material Listing and Exclusion<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Dynamic Product Proposal<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Cross Selling<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Status Management<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Customer Inquiry/Quotation<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Sales Order<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Part Load Lift Orders (SD-SLS-PLL)<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Special Sales Orders<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Scheduling Agreements<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Customer Contracts<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Complaints<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Backorder Processing<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Special Business Processes in Sales<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"ERP E-Commerce<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Internet Scenarios<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"Billing Plan (SD-BIL-IV)<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>",
						"List of Sales Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Sales, Forecast]</font>"

				],
				"lager" : [

						"Marketing Report 2020<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Report 2021<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Report 2022<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"New Hire Marketing Training<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing and Marketing Impact<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Performance Marketing Dataset 19364<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Property Marketing Dataset 89235353<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Brand Marketing Dataset 092723<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Covid Impact on Marketing<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Datsheet 101<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Understandng Marketing Data<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Promotion and Marketing Correlation<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Forcast 2021 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Forcast 2021 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Forcast 2022 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Forcast 2022 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Product Marketing Datasheet<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing (SD-SLS)<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Working With Marketing Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"About Marketing Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"How Marketing Documents are Structured<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Structure and Data in a Marketing Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Origin of Data in Marketing Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"How Marketing Documents are Controlled<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Common Features in Marketing Order Processing<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Marketing Summary<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Making Fast Changes<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Reference status<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Entering Dunning Data in a Marketing Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Displaying Changes Made in a Marketing Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Combining Marketing Document Items for Delivery<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Processing Billing Plans<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Additional Data<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Deleting Marketing Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Deleting Items in a Marketing Order<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Rejecting Items in a Marketing Order<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Changing Data at Header Level<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Assigning Contracts<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"List of Marketing Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Deriving the Marketing Area<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Changing the Sold-to Party<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Changing Marketing Document Type<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>",
						"Printing Output Manually for a Marketing Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Marketing, Forecast]</font>"

				],
				"stout" : [

						"Tracking Report 2020<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Report 2021<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Report 2022<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"New Hire Tracking Training<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking and Tracking Impact<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Performance Tracking Dataset 19364<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Property Tracking Dataset 89235353<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Brand Tracking Dataset 092723<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Covid Impact on Tracking<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Datsheet 101<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Understandng Tracking Data<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Promotion and Tracking Correlation<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Forcast 2021 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Forcast 2021 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Forcast 2022 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Forcast 2022 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Product Tracking Datasheet<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking (SD-SLS)<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Working With Tracking Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"About Tracking Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"How Tracking Documents are Structured<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Structure and Data in a Tracking Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Origin of Data in Tracking Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"How Tracking Documents are Controlled<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Common Features in Tracking Order Processing<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Tracking Summary<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Making Fast Changes<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Reference status<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Entering Dunning Data in a Tracking Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Displaying Changes Made in a Tracking Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Combining Tracking Document Items for Delivery<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Processing Billing Plans<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Additional Data<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>",
						"Deleting Tracking Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Tracking, Forecast]</font>"

				],
				"malt" : [

						"Legal Report 2020<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Report 2021<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Report 2022<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"New Hire Legal Training<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal and Legal Impact<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Performance Legal Dataset 19364<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Property Legal Dataset 89235353<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Brand Legal Dataset 092723<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Covid Impact on Legal<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Datsheet 101<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Understandng Legal Data<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Promotion and Legal Correlation<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Forcast 2021 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Forcast 2021 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Forcast 2022 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Forcast 2022 Air<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal Forcast 2019 Ground<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Product Legal Datasheet<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Legal (SD-SLS)<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Working With Legal Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"About Legal Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"How Legal Documents are Structured<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Structure and Data in a Legal Document<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"Origin of Data in Legal Documents<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>",
						"How Legal Documents are Controlled<br><font size=-1>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat<br>Tags: [Legal, Forecast]</font>"

				]
			};

			typeof $.typeahead === 'function' && $.typeahead({
				id : "inpttypeahead",
				input : ".js-typeahead",
				minLength : 1,
				maxItem : 15,
				order : "asc",
				hint : false,
				group : {
					template : "{{group}}"
				},
				maxItemPerGroup : 5,
				backdrop : {
					"background-color" : "#fff"
				},
				//href: "/beers/{{group}}/{{display}}/",
				dropdownFilter : "All Assets",
				emptyTemplate : 'No result for "{{query}}"',
				source : {
					Sales : {
						data : data.ale
					},
					Marketing : {
						data : data.lager
					},
					Tracking : {
						data : data.stout
					},
					Legal : {
						data : data.malt
					}
				},
				callback : {
					onReady : function(node) {
						console.log("ready")
						this.container.find('.' + this.options.selector.dropdownItem + '.group-ale a').trigger('click')
					},

					onClickAfter : function(node, query, result, resultCount) {
						$(".js-typeahead").val($(".js-typeahead").val().substring(0, $(".js-typeahead").val().indexOf('<')))
						//$(".js-typeahead").val("NO YA")

					},

					onDropdownFilter : function(node, query, filter, result) {
						console.log(query)
						console.log(filter)
						console.log(result)
					}
				},
				debug : true
			});

			$(".js-typeahead").change(function() {
				console.log("Handler for .change() called.");
			});
			
			function selectuser(){
				$("#shareid").val('demouser@rcggs.com')
			}
			
			$('.typeahead__filter-button')[0].style.position = 'relative'
			$('.typeahead__filter-button')[0].style.top = '8px'
			$('.typeahead__filter-button')[0].style.right = '100px'
				$('.typeahead__filter-button')[0].style.width = '180px'
					$('.typeahead__filter-button')[0].style.height = '40px'
			
				$('.typeahead__filter-button')[0].style.borderRadius = '25px'
			
				$('.typeahead__button')[0].style.position = 'relative'
					$('.typeahead__button')[0].style.top = '12px'
					$('.typeahead__button')[0].style.right = '415px'
					
						$('.typeahead__button')[0].style.display = 'none'
							//$('.typeahead__query')[0].style.opacity = "0";
			
							$('.typeahead__cancel-button')[0].style.display = 'none'
							
								
						
							
			
				
			
			
				
		</script>

	</div>

</body>
</html>



<script>
	// Used to toggle the menu on small screens when clicking on the menu button
	function myFunction() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
</script>

</body>
</html>
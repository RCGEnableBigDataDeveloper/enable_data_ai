<!doctype html>
<html>
<head>

<!--  META -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">
<link rel="shortcut icon" href="/img/favicon.ico">
<script src="/js/jquery/jquery.js"></script>
<title>RCG | enable DATA</title>

<!-- STYLES -->
<link rel="stylesheet" href="/css/jsPlumbToolkit-defaults.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/jsPlumbToolkit-demo.css">
<link rel="stylesheet" href="/css/gray.css">
<link rel="stylesheet" href="/css/enable.css">
<link rel="stylesheet" href="/css/jquery.contextmenu.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/css/themes/alertify.core.css">
<link rel="stylesheet" href="/css/themes/alertify.default.css">
<link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">

<!-- JQUERY SCRIPTS -->
<script src="/js/jquery/jquery.contextmenu.js"></script>
<script src="/js/jquery/jquery-ui.js"></script>

<script src="/js/jquery/jquery.ztree.all.js"></script>
<script src="/js/jquery/jquery.ztree.all.min.js"></script>
<script src="/js/jquery/jquery.ztree.core.js"></script>
<script src="/js/jquery/jquery.ztree.core.min.js"></script>
<script src="/js/jquery/jquery.ztree.excheck.js"></script>
<script src="/js/jquery/jquery.ztree.excheck.min.js"></script>
<script src="/js/jquery/jquery.ztree.exedit.js"></script>
<script src="/js/jquery/jquery.ztree.exedit.min.js"></script>
<script src="/js/jquery/jquery.ztree.exhide.js"></script>
<script src="/js/jquery/jquery.ztree.exhide.min.js"></script>

<script src="/js/jquery/jsPlumb-2.2.3.js"></script>
<script src="/js/jquery/jsPlumbToolkit-1.1.0.js"></script>
<script src="/js/jquery/jquery.validate.js"></script>
<script src="/js/jquery/additional-methods.js"></script>
<script src="/js/jquery/jquery.dataTables.min.js"></script>
<script src="/js/jquery/prefixfree.min.js"></script>

<script src="/js/vendor/bootstrap.min.js"></script>
<script src="/js/vendor/tabcomplete.min.js"></script>
<script src="/js/vendor/livefilter.min.js"></script>
<script src="/js/vendor/filterlist.min.js"></script>
<script src="/js/plugins.js"></script>


<!-- ENABLE SCRIPTS -->
<script src="/js/controller/configuration.controller.js"></script>
<script src="/js/controller/endpoint.controller.js"></script>
<script src="/js/controller/canvas.controller.js"></script>
<script src="/js/controller/navbar.controller.js"></script>
<script src="/js/controller/savelayout.controller.js"></script>
<script src="/js/controller/toolbox.controller.js"></script>
<script src="/js/controller/alertify.js"></script>
<script src="/js/model/workflow.model.js"></script>
<script src="/js/util/util.js"></script>

</head>

<style>
::selection {
	background-color: #F0F8FF;
	color: #333;
}
/* 
::-webkit-scrollbar {
	width: 10px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	/* 	border-radius: 10px; */
}
::-webkit-scrollbar-thumb {
	/* border-radius: 10px; */
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
}

.ui-accordion .ui-accordion-content {
	padding: 0px;
	padding-top: 5px;
	height: 692px;
	border-radius: 0px;
	border-color: #ccc;
	border-bottom: 0px !important;
}

.ui-accordion-header {
	background-color: rgb(71, 138, 196) !important;
	color: #fff !important;
	border-color: rgb(71, 138, 196) !important;
}

/* #weatherdiv1 {
	height: 2000px;
	overflow: hidden;
	position: relative;
}

#weatherframe1 {
	position: absolute;
	top: -170px;
	left: -340px;
	width: 100%;
} */
</style>

<body>

	<div class="" role="">

		<!-- HEADER -->
		<div class="" style='padding-left: 10px'>
			<table>
				<tr>
					<td valign="top">
						<table>
							<tr>

								<td style="width: 140px" align=center><span
									style="font-size: 18px;"><a href="#" class='ex1'
										id='acquiremenu' style='color: #fff;'>
											<td style="width: 140px" align=center><span
												style="font-size: 18px;"><a href="#" class='ex1'
													id='exploremenu' style='color: #fff;'>
														<td style="width: 140px" align=center><span
															style="font-size: 18px;"><a href="#" class='ex1'
																id='governmenu' style='color: #fff;'>
																	<td style="width: 200px" align=center><span
																		style="font-size: 18px;"><a href="#"
																			class='ex1' id='operationmenu' style='color: #fff;'>
																				<td style="width: 140px" align=center><span
																					style="font-size: 18px;"><a href="#"
																						class='ex1' id='monitormenu' style='color: #fff;'>
																							<td style="width: 140px" align=center><span
																								style="font-size: 18px;"><a href="#"
																									class='ex1' id='aboutmenu' style='color: #fff;'>
							</tr>
						</table> <!-- 	 <a href="#" class='ex1' id='jobmenu' style='color: #fff;'>JOBS</a>&nbsp;&nbsp;<img src='/img/bevel.png'>&nbsp;&nbsp;<a href="#" class='ex1' id='viewmenu' style='color: #fff;'>VIEW</a>&nbsp;&nbsp;<img src='/img/bevel.png'>&nbsp;&nbsp;<a
						href="#" class='ex1' id='toolsmenu' style='color: #fff;'>TOOLS</a>&nbsp;&nbsp;<img src='/img/bevel.png'>&nbsp;&nbsp;<a href="#" class='ex1' id='aboutmenu' style='color: #fff;'>ABOUT</a>&nbsp;&nbsp;<a href="#" id='test'>TEST</a></td>
					<td nowrap id='generalloading' style='display: none'><img src='/img/green-wait.gif'><span id='generalloadingtext' style='padding-right: 20px; color: white; font-size: 11px'>&nbsp;</span>
				  -->
					</td>
				</tr>
			</table>
		</div>




	</div>

	<!-- BREADCRUMB -->
	<div class="breadcrumbs" style="">
		<!-- <a href='#'><span id='workflowname'></span></a>&nbsp; &rarr; &nbsp; <span id='currentdate'></span> -->
	</div>



	<!-- ENDPOINT TREE -->
	<div style='float: left; width: 300px; padding-top: 0px;'>
		<div id="draggable" class="ui-widget-content"
			style='border-right: 0px; height: 622px;'>
			<div
				style='min-height: 650px; overflow-x: hidden; padding-top: 0px; width: 300px'
				id='treedisplay'>

				<!-- 				<div style='border-bottom: 1px solid #ccc'>header</div>
			
				<div style='border-bottom: 1px solid #ccc'>subheader</div> -->




				<div id="accordion">
					<h3 id="treeDemo_title">Sources</h3>
					<div style="height: 100px">
						<div id='treeloading' style='font-size: 11px; padding: 10px'>
							<table>
								<tr>
									<td><img src='/img/wait-small.gif'></td>
									<td>&nbsp;Loading...</td>
								</tr>
							</table>
						</div>
						<ul id="treeDemo" class="ztree"></ul>
					</div>

					<h3 id="treeDemo1_title">Components</h3>

					<div style="height: 100px">
						<div id='treeloading1' style='font-size: 11px; padding: 10px'>
							<table>
								<tr>
									<td><img src='/img/wait-small.gif'></td>
									<td>&nbsp;Loading...</td>
								</tr>
							</table>
						</div>
						<ul id="treeDemo1" class="ztree"></ul>
					</div>

					<!-- 		<h3 id="treeDemo2_title">Components</h3>
					<div>
						<ul id="treeDemo2" class="ztree"></ul>
					</div> -->

					<h3 id="treeDemo3_title" style="display: none">Chains</h3>
					<div>
						<ul id="treeDemo3" class="ztree"></ul>
					</div>
				</div>

			</div>

			<div
				style='display: none; height: 75vh; overflow-x: hidden; padding-top: 3px; width: 300px'
				id='treedisplay1'>

				<!-- 				<div style='border-bottom: 1px solid #ccc'>header</div>
			
				<div style='border-bottom: 1px solid #ccc'>subheader</div> -->




				<div id="accordion1">
					<h3>Available Data Elements</h3>
					<div>
						<div id='treeloading1' style='font-size: 11px; padding: 10px'>
							<table>
								<tr>
									<td><img src='/img/wait-small.gif'></td>
									<td>&nbsp;Loading...</td>
								</tr>
							</table>
						</div>
						<ul id="treeDemo2" class="ztree"></ul>
					</div>
					<h3>Conformed Data Elements</h3>
					<div>
						<div style="padding-top: 0px; padding-right: 5px">
							<input type="button" id="addconformed" value="+"
								style="float: right;" />
						</div>
						<ul id="treeDemo3" class="ztree"></ul>
					</div>
					<h3>Conformed Data Object</h3>
					<div>
						<div style="padding-top: 0px; padding-right: 5px">
							<input type="button" id="addconformed1" value="+"
								style="float: right;" />
						</div>
						<ul id="treeDemo4" class="ztree"></ul>
					</div>
				</div>

			</div>

		</div>
	</div>

	<div class="community-demo">

		<!-- CONFIGURATION DIALOG -->
		<div id="dialog" style='overflow: hidden'>
			<div
				style='border: 1px solid #ccc; width: 600; min-width: 600px; height: 400'>
				<div style='width: 100%;'>
					<div
						style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
						Properties for <span id='dialogitem'></span>
					</div>
				</div>
				<div class='dialogtab'>
					<span id='general'>general</span> &nbsp;|&nbsp; <span id='options'>options</span>
					&nbsp;|&nbsp; <span id='schema'>schema</span> &nbsp;|&nbsp; <span
						id='resources'>resources</span> <span style="display: none"
						id='filter'>&nbsp;|&nbsp; System Template</span>
				</div>
				<div
					style='padding: 10px; min-height: 400px; max-height: 400px; overflow: auto; width: 600px'>
					<table id="generaltable" class="display" style="width: 100%"></table>
					<table id="optionstable" class="display" style="width: 100%"></table>
					<table id="schematable" class="display"
						style="width: 100%; min-height: 500px; max-height: 500px;"></table>
					<table id="resourcestable" class="display" style="width: 100%"></table>
					<table id="filtertable" style="display: none; width: 100%">
						<tr>
							<td><textarea id='filters' rows="15" cols="70"></textarea></td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td>

											<table style="position: relative; top: 5px">
												<tr>
													<td colspan=2 style="color: #999;"><b>Add Shots</b><br>
														<br></td>
												</tr>
												<tr>
													<td style="color: #999; padding: 3px;"><small>question:</small></td>
													<td style="padding-bottom: 3px";><input size=60></td>
												</tr>
												<tr>
													<td style="color: #999; padding: 3px;"><small>answer:</small></td>
													<td style="padding-bottom: 3px";><input size=60></td>
												</tr>
												<tr>
													<td style="color: #999; padding: 3px;"><small>source:</small></td>
													<td style="padding-bottom: 3px";><input size=60></td>
												</tr>
												<tr>
													<td style="padding-top: 10px"><a href="#"
														style="color: #999;"> <br>
															<button>+Add Shot</button></a></td>
												</tr>
											</table>
										</td>

									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- MODEL DIALOG -->
		<div id="modeldialog" style='overflow: hidden; display: none'>
			<div style='border: 1px solid #ccc'>
				<div style='width: 100%;'>
					<div
						style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
						<span id='modeldialogitem'></span>
					</div>

					<div
						style='padding: 10px; width: 100%; height: 460px; overflow: auto'>
						<pre id='modeljson' style='border: 0px'></pre>
					</div>

				</div>
			</div>
		</div>

		<!-- ERROR DIALOG -->
		<div id="errordialog" style='overflow: hidden; display: none'>
			<div style='border: 1px solid #ccc'>
				<div style='width: 100%;'>
					<div
						style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
						<span id='errordialogitem'>Problems/Errors</span>
					</div>

					<div
						style='padding: 10px; width: 100%; height: 350px; overflow: auto'
						id='errormsgs'></div>

				</div>
			</div>
		</div>

		<!-- SCHEMA READER DIALOG -->
		<div id="schemareaderdialog" style='overflow: hidden; display: none'>
			<div style='border: 1px solid #ccc; height: 300px; padding: 3px'>
				<div style='width: 100%;'>
					<div
						style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>Load
						Schema</div>
				</div>

				<table>
					<tr>
						<td height=5px></td>
					</tr>
				</table>

				<div class="row">
					<div class="col-sm-8">
						<div id="bts-ex-4" class="selectpicker" data-live="true">
							<button data-id="prov" type="button"
								class="btn btn-lg btn-block btn-default dropdown-toggle">
								<span class="placeholder">Choose an option</span> <span
									class="caret"></span>
							</button>
							<div class="dropdown-menu">
								<div class="live-filtering" data-clear="true"
									data-autocomplete="true" data-keys="true">
									<label class="sr-only" for="input-bts-ex-4">Search in
										the list</label>
									<div class="search-box">
										<div class="input-group">
											<!-- <span class="input-group-addon" id="search-icon3"> <span class="fa fa-search"></span> <a href="#" class="fa fa-times hide filter-clear"><span
													class="sr-only">Clear filter</span></a>
											</span>  -->
											<input type="text" placeholder="Search in the list"
												id="input-bts-ex-4" class="form-control live-search"
												aria-describedby="search-icon3" tabindex="1" />
										</div>
									</div>
									<div class="list-to-filter">
										<ul class="list-unstyled">

										</ul>

										<div class="no-search-results">
											<div class="alert alert-warning" role="alert">
												<i class="fa fa-warning margin-right-sm"></i>No entry for <strong>'<span></span>'
												</strong> was found.
											</div>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" name="bts-ex-4" value="">
						</div>
					</div>
				</div>

				<table>
					<tr>
						<td height=5px></td>
					</tr>
				</table>

				<input id='schematype' class="placeholder" value='     Schema type'
					onfocus="this.value=''"
					style="font-size: 11px; width: 230px; color: #333; padding-left: 5px">
				<input type="file" id="file-input"
					style="font-size: 11px; color: #333; padding-top: 8px">

			</div>
		</div>
	</div>

	<!-- JOB DIALOG -->
	<div id="jobdialog" style='overflow: hidden; display: none'>
		<div style='border: 1px solid #ccc'>
			<div style='width: 100%;'>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>Job
					Status</div>

				<div
					style='padding: 10px; width: 100%; height: 110px; overflow: auto'>
					<span id='jobmessage'></span>
				</div>

			</div>
		</div>
	</div>

	<!-- NEW DIALOG -->
	<div id="newworkflowdialog" style='overflow: hidden; display: none'>
		<div style='border: 1px solid #ccc'>
			<div style='width: 100%;'>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
					<span id='modeldialogitem'>New Knowledge Base</span>
				</div>

				<div
					style='padding: 10px; width: 100%; height: 80px; overflow: auto'>
					<table>
						<tr>
							<td class='small'>Name:</td>
							<td width=10></td>
							<td class='small'><input id='newworkflowname' size=35
								style='color: #666;' value='UNTITLED KNOWLEDGE BASE'
								onclick=this.value= ''; onfocus=this.select();></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>

	<!-- STATS DIALOG -->
	<div id="statsdialog" style='overflow: hidden; display: none'>
		<div style='border: 1px solid #ccc'>
			<div style='width: 100%;'>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
					<span id='statsdialogitem'>Job Statistics</span>
				</div>

				<div
					style='padding: 10px; width: 100%; height: 460px; overflow: auto'>
					<pre id='statsjson' style='border: 0px'></pre>
				</div>

			</div>
		</div>
	</div>

	<!-- CONNECTION DIALOG -->
	<div id="dialog-connect" style="display: none">
		<div style='border: 1px solid #ccc'>
			<div style='width: 100%;'>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
					Configuration <span id='dialog-item'></span>
				</div>
				<div
					style="width: 100%; background: #fff; padding: 10px; border-top: 1px solid #ddd;">
					<table style='border-collapse: separate; border-spacing: 4px;'>
						<tr>
							<td class='small'>Category&nbsp;&nbsp;</td>
							<td class='small'><input name='max' size=35
								id='connectionid'></td>
						</tr>
						<tr>
							<td class='small'>Tags&nbsp;&nbsp;</td>
							<td class='small'><input name='max' size=35
								id='connectionname'></td>
						</tr>
						<!-- 						<tr>
							<td class='small'>frequency&nbsp;&nbsp;</td>
							<td class='small'><input id='frequency' size=35></td>
						</tr>
						<tr>
							<td class='small'>repeat.count&nbsp;&nbsp;</td>
							<td class='small'><input name='max' size=35></td>
						</tr> -->
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- JOIN DIALOG -->
	<div id="dialog-join" style="display: none;">
		<div style='border: 1px solid #ccc;'>
			<div style=''>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
					JOIN <span id='dialog-join-item'></span>
				</div>
				<div
					style="width: 100%; background: #fff; padding: 10px; border-top: 1px solid #ddd;">
					<table style='border-collapse: separate; border-spacing: 4px;'
						id='jointable'>
						<!-- <tr>
							<td>join.resource</td>
							<td>join.column</td>
							<td>join.index</td>
						</tr> -->

					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- FILE OPEN DIALOG -->
	<div id="dialog-open" style="display: none">
		<div style='border: 1px solid #ccc'>
			<div style='width: 100%;'>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
					Open Workflow <span id='dialog-item'></span>
				</div>
				<div style='height: 245px; overflow-y: scroll; overflow-x: hidden'>
					<ul id="openTree" class="ztree"></ul>
				</div>
				<div
					style="width: 100%; background: #F4F4F4; height: 40px; padding-top: 6px; border-top: 1px solid #ddd;">
					<table>
						<tr>
							<td class='small' nowrap>&nbsp;File name:&nbsp;&nbsp;</td>
							<td><input type='text' size=36 id='openfilename'
								class='small' /></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- FILE SAVE DIALOG -->
	<div id="dialog-save" title="Save Layout" style="display: none">
		<div style='border: 1px solid #ccc'>
			<div style='width: 100%;'>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
					Save Workflow<span id='dialog-item'></span>
				</div>
				<div style='height: 245px; overflow-y: scroll; overflow-x: hidden'>
					<ul id="saveTree" class="ztree"></ul>
				</div>
				<div
					style="width: 100%; background: #F4F4F4; height: 40px; padding-top: 6px; border-top: 1px solid #ddd;">
					<table>
						<tr>
							<td class='small' nowrap>&nbsp;File name:&nbsp;&nbsp;</td>
							<td><input type='text' size=48 id='savefilename'
								class='small' style='font-size: x-small' /></td>
							<td>&nbsp;<input type='button' title='new folder'
								onclick='newFolder()'
								style='background-image: url(img/newfldr.png); background-repeat: no-repeat; background-position: center; width: 30px'></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- FILE SAVE DIALOG -->
	<div id="editschemadialog" title="Save Layout" style="display: none">
		<div style='border: 1px solid #ccc'>
			<div style='width: 100%;'>
				<div
					style='width: 100%; height: 40px; background-color: rgb(71, 138, 196); color: #fff; vertical-align: middle; padding-left: 8px; padding-top: 10px'>
					Edit Schema<span id='dialog-item'></span>
				</div>
				<div id='' style='width: 800px; height: 580px; padding: 10px;'>

					<table id="editschematable"
						class="table table-striped table-bordered">
						<thead>
							<tr>
								<th data-class="expand" style="width: 225px">Name</th>
								<th data-class="expand" style="width: 225px">Type</th>
								<th data-class="expand" style="width: 225px">Function</th>
						</thead>

					</table>

				</div>
			</div>
		</div>
	</div>

<!-- 	<div id="component-tab"
		style="width: 1600px; display: none; background-color: #fff; height: 40px; vertical-align: middle; border-bottom: 1px solid #ccc">


		<table>
			<tr>
				<td onclick="showComponents()" id="components-tab"
					style="cursor: pointer; padding-left: 10px; border-right: 1px solid #ccc; width: 500px;">Components</td>
				<td onclick="showChains()" id="chains-tab"
					style="cursor: pointer; padding-left: 10px; border-right: 1px solid #ccc; width: 700px; background-color: #eee; height: 40px;">Chains
				</td>
			</tr>
		</table>
	</div>
 -->

	<!-- MAIN CANVAS -->
	<div class="jtk-demo-main" style="max-height: 500px">
		<div
			class="jtk-demo-canvas canvas-wide statemachine-demo jtk-surface jtk-surface-nopan"
			id="canvas"
			style='position: relative; bottom: 100px; background-image: url("/img/grid.gif"); height: 830px; width: 1300px; overflow: hidden'>






			<div id='toolbox'
				style='position: absolute; left: 0px; bottom: 100px;'>

				<ul class="drawer">
					<li><a href="#"><span>+</span> </a>
						<ul>
							<li><a href="#"><span title='zoom in'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-zoom-in"></i></span> </a></li>
							<li><a href="#"><span title='zoom out'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-zoom-out"></i></span> </a></li>
							<li><a href="#"><span title='zoom reset'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-retweet" aria-hidden="true"></i></span></a></li>
							<li><a href="#"><span title='refresh'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-refresh"></i></span> </a></li>
							<li><a href="#"><span title='expand all'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-level-down"></i></span> </a></li>
							<li><a href="#"><span title='collapse all'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-level-up"></i></span></a></li>
							<li><a href="#"><span title='new workflow'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-file navbarnew"></i></span></a></li>
							<li><a href="#"><span title='open workflow'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-folder-open navbaropen"></i></span></a></li>
							<li><a href="#"><span title='save workflow'
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-save navbarsave"></i></span></a></li>
							<!-- <li><a href="#"><span
									style="font-size: 8px; line-height: 100%;"><i
										class="icon-calendar schedulejobmenu"></i></span></a></li> -->
						</ul></li>
				</ul>

			</div>
		</div>


		<div
			class="jtk-demo-canvas canvas-wide statemachine-demo jtk-surface jtk-surface-nopan"
			id="canvas1"
			style='position: relative; bottom: 100px; background-image: url("/img/grid.gif"); height: 830px; width: 1300px; overflow: hidden'>

		</div>

		<div
			class="jtk-demo-canvas canvas-wide statemachine-demo jtk-surface jtk-surface-nopan"
			id="canvas2"
			style='position: relative; bottom: 100px; background-image: url("/img/grid.gif"); height: 800px; width: 1300px; overflow: hidden'>

		</div>

		<div class="" id="canvas2"
			style='position: relative; left: -270px; top: 20px; display: none; max-height: 620px; width: 116.25%; overflow: hidden; padding-top: 40px;'>
			<table width=100% style="font-size: 11px;">
				<tr>
					<td style='padding: 15px; border: 1px solid #ccc' width=350
						valign="top">

						<table class="bordertable">
							<tr>
								<td class="bordercell" colspan=2
									style='background-color: #001433; color: #fff; font-size: 14px; padding: 3px;'>Operation
									Settings</td>
							</tr>
							<tr>
								<td class="bordercell" style="height: 30px">Workflow:</td>
								<td class="bordercell"><select style='width: 160px;'><option>Untitled
											Workflow</option></select></td>
							</tr>
							<tr>
								<td class="bordercell" style="height: 30px">Location:</td>
								<td class="bordercell"><select style='width: 160px;'><option>/home/user/root</option></select></td>
							</tr>
							<tr>
								<td class="bordercell">Number Files:</td>
								<td class="bordercell"><input type="text" id="spinner-2"
									value="0" /></td>
							</tr>
							<tr>
								<td class="bordercell">Size Files (kbytes):</td>
								<td class="bordercell"><input type="text" id="spinner-3"
									value="0" /></td>
							</tr>
							<tr>
								<td class="bordercell">Num Processes:</td>
								<td class="bordercell"><input type="text" id="spinner-4"
									value="0" /></td>
							</tr>
							<tr>
								<td class="bordercell">Fail Ratio:</td>
								<td class="bordercell"><input type="text" id="spinner-5"
									value="0" /></td>
							</tr>

							<tr>

								<td colspan=2 class="bordercell"
									style='padding-top: 10px; padding-bottom: 10px; padding-left: 5px'><input
									type="button" value="Save" value="0" />&nbsp;<input
									type="button" value="Reset" value="0" /></td>

							</tr>


						</table>



					</td>
					<td width=15></td>
					<td><iframe
							style="border-left: 1px solid #ccc; border-top: 1px solid #ccc; border-right: 1px solid #ccc;"
							src="/pages/calendar.jsp?id=123" frameBorder="0" height="620px"
							width="100%"></iframe></td>
				</tr>
			</table>
		</div>

		<div class="" id="canvas3"
			style='position: relative; left: -270px; top: 20px; display: none; max-height: 620px; width: 116.25%; overflow: hidden; padding-top: 40px; z-index: -10'>

			<!-- 	<div id="weatherdiv1"
				style="width: 2500px; height: 2000px; overflow: hidden;">

				<iframe src="http://52.86.69.218:7180/cmf/services/1/charts"
					height="1500px" width="100%" id="weatherframe1"></iframe>
			</div> -->

		</div>

	</div>



</body>

<script>

if (globals.mode == "source") {
	
	globals.viewType = "source-view"
	$("#accordion").accordion({ active: 0 });
	$("#canvas").show();
	$("#canvas1").hide();
	$("#canvas2").hide();
	$("#treeDemo1_title").hide();
	$("#treeDemo1").hide();
/* 	jsPlumb.setContainer($("#canvas")); */
	
}else if(globals.mode == "component"){
	globals.viewType = "component-view"
	$("#component-tab").show();
	$("#accordion").accordion({ active: 1	 });
	$("#treeDemo_title").hide();
	$("#treeDemo2_title").hide();
	$("#treeDemo2").hide();
/* 	$("#canvas").hide();
	$("#canvas2").hide();
	$("#canvas1").show(); */
	$("#treeDemo3_title").show();
	$("#treeDemo3").show()
/* 	jsPlumb.setContainer($("#canvas1"));
	$("#chains-tab").css("color", "#aaa");
	$("#components-tab").click() */
	
$('#toolbox').css({ 
    position: "absolute",
    bottom: "100px"
});
}  

function showComponents(){
	$("#components-tab").css("background-color", "#fff");
	$("#chains-tab").css("background-color", "#eee");
	
	$("#components-tab").css("color", "#000");
	$("#chains-tab").css("color", "#aaa");
	
	$("#treeDemo1_title").show();
	$("#treeDemo1").show();
	$("#treeDemo3_title").show();
	$("#treeDemo3").show();
	$("#treeDemo1_title").click();
	globals.viewType = "component-view"

/* 	$("#canvas").hide();
	$("#canvas2").hide();

	
	$("#canvas1").show();
	jsPlumb.setContainer($("#canvas1"));
	
	instance = jsPlumb.getInstance({
		Endpoint: ["Dot", {
			radius: 1
		}],
		Connector: "StateMachine",
		HoverPaintStyle: {
			stroke: "#1e8151",
			strokeWidth: 2
		},
		ConnectionOverlays: [["Arrow", {
			location: 1,
			id: "arrow",
			width: 12,
			length: 8,
			foldback: 0.8
		}], ["Label", {
			label : "pending",
			cssClass: "aLabel"
		}]],
		Container: "canvas1",
		Connector: ["Flowchart"]
	});
	 */
	
}

function showChains(){
	$("#components-tab").css("background-color", "#eee");
	$("#chains-tab").css("background-color", "#fff");
	
	$("#components-tab").css("color", "#aaa");
	$("#chains-tab").css("color", "#000");
	
	$("#treeDemo1_title").hide();
	$("#treeDemo1").hide();
	$("#treeDemo3_title").show();
	$("#treeDemo3").show();
	$("#treeDemo3_title").click();
	globals.viewType = "chain-view";
	/* $("#canvas1").hide();
	$("#canvas2").show();
	jsPlumb.setContainer($("#canvas2"));
	instance = jsPlumb.getInstance({
		Endpoint: ["Dot", {
			radius: 1
		}],
		Connector: "StateMachine",
		HoverPaintStyle: {
			stroke: "#1e8151",
			strokeWidth: 2
		},
		ConnectionOverlays: [["Arrow", {
			location: 1,
			id: "arrow",
			width: 12,
			length: 8,
			foldback: 0.8
		}], ["Label", {
			label : "pending",
			id: "label",
			cssClass: "aLabel"
		}]],
		Container: "canvas2",
		Connector: ["Flowchart"]
	});
	 */

	
	
	
/*     var elements = document.getElementsByClassName("component-view")
    for (var i = 0; i < elements.length; i++){
        elements[i].parentElement.style.display = "none";
    } */
}


//-- GEN 2
    $( "#accordion" ).accordion({	
    	animate: true,
    	icons: false,
    });
    
	setTimeout(function(){ 	
		$("#acquiremenu").trigger("click");
	}, 1000);
	
	
    $(function() {
        $( "#spinner-2" ).spinner({
           min: 0, 
           max: 100000,
           step: 10
        });
        $('#spinner-3').spinner({
           step: 100, 
           min: -1000000, 
           max: 1000000
        });
        $('#spinner-4').spinner({
            step: 100, 
            min: -1000000, 
            max: 1000000
         });
        $('#spinner-5').spinner({
            step: 100, 
            min: -1000000, 
            max: 1000000
         });
     });
	

//-- END GEN 2

	//$("#workflowname").text(globals.workflowname);
	$.ajax({
		url : "/getSchemaReaders/" + "name",
		success : function(result) {
			readers = JSON.parse(result);
			var cnt = 1;
			for ( var key in readers) {
				$(".list-unstyled").append(
						'<li class="filter-item items" data-filter="' + key + '" data-value="' + cnt + '">' + key + '</li>');
				cnt++;
			}
			
			var script = document.createElement( "script" );
			script.type = "text/javascript";
			script.src = "/js/vendor/src/bootstrap-select.js";
			$("head").append(script);
			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			console.log("Status: " + textStatus);
			console.log("Error: " + errorThrown);
		}
	});
	
	/* setInterval(function () {
		$.ajax({
			url: "/update_canvas/" + "name",
			success: function(result) {
				//console.log(result);
				$(".component, .source").each(function(){
					
					//console.log($(this).parent()[0].outerText.split("\n"));
					
					$(this).removeClass('source') ;
					$(this).removeClass('component') ;
					
					$(this).addClass('source1') ;
				
				    });
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				console.log("Status: " + textStatus);
				console.log("Error: " + errorThrown);
			}
		});
}, 6000); */
	
</script>


</html>
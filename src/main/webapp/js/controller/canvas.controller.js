var instance, renderer;

var menu2 = [
	{
		'Join': function(menuItem, menu) {
			var targetconn = globals.conmap[menu.target.id];
			var sources = instance.getConnections({
				target: targetconn.target.id
			})

			// $('#jointable td').remove();
			$.each(sources, function(index, source) {
				var node = getNode(source.sourceId);
				var name = node[0].parent + node[0].name;
				name = name.replace(new RegExp(/\\/g), "/");
				$('#jointable').append(
					'<tr><td class="small" nowrap><input class="joins" name="' + name + '" type="checkbox" /> ' + name
					+ '</td><td class="small"><input class="joincol"/></td><td class="small"><input class="joinindex" size=3/></td></tr>');
			});

			$("#dialog-join").dialog({
				resizable: false,
				autoOpen: false,
				height: 400,
				width: 500,
				modal: true,
				dialogClass: 'ui-dialog-shadow',
				create: function(event, ui) {
					$(".ui-widget-header").hide();
				},
				buttons: [{
					text: "OK",
					click: function() {
						$('#dialog-join').dialog('close');

						var joindata = [];

						$.each($(".joins:checked"), function(index, source) {
							joindata.push({
								name: $(".joins")[index].name,
								column: $(".joincol")[index].value,
								index: $(".joinindex")[index].value
							});
						});

						$.each(sources, function(index, source) {
							var node = getNode(source.sourceId);
							node[0].joins = joindata;
						});
					},
					iconCls: 'icon-save'
				}]
			});

			$('#dialog-join').dialog('open');
		}
	}, $.contextMenu.separator, {
		'Merge': function(menuItem, menu) {
			alertify.alert("not implemented");
		}
	}];

jsPlumb.bind("jsPlumbDemoLoaded", function(instance) {

	renderer = jsPlumbToolkit.Support.ingest({
		jsPlumb: instance
	});

	instance.bind("jsPlumbDemoNodeAdded", function(el) {
		renderer.ingest(el);
	});

	instance.bind("contextmenu", function(component, originalEvent) {
		var label = $("#" + globals.conmap[component.id])
	});

	instance.bind("connection", function(info) {

		var sourceNode = getNode(info.source.id);
		var targetNode = getNode(info.target.id);

		saveModel('123', {

			routeid: globals.routeid,
			userid: 'admin',
			// general : general,
			'source': {
				id: info.source.id,
				nodeid: sourceNode[0].id,
				name: sourceNode[0].text,
				type: sourceNode[0].data.config.type,
				itemtype: sourceNode[0].itemtype,
				parent: sourceNode[0].parent ? sourceNode[0].parent.replace(/\\/g, "/") : '',
				schema: sourceNode[0].schema,
				options: sourceNode[0].options,
				config: sourceNode[0].config
			},
			'target': {
				id: info.target.id,
				nodeid: targetNode[0].id,
				name: targetNode[0].text,
				type: targetNode[0].data.config.type,
				itemtype: targetNode[0].itemtype,
				parent: targetNode[0].parent ? targetNode[0].parent.replace(/\\/g, "/") : '',
				schema: targetNode[0].schema,
				options: targetNode[0].options,
				config: targetNode[0].config
			}
		});

		var connectionlabel = $(".jtk-overlay").last();

		$("#dialog-connect").dialog({
			resizable: false,
			autoOpen: false,
			height: 250,
			width: 400,
			modal: true,
			dialogClass: 'ui-dialog-shadow',
			create: function(event, ui) {
				$(".ui-widget-header").hide();
			},
			buttons: [{
				text: "OK",
				click: function() {
					connectionlabel.html($("#connectionname").val());
					var frequency = $("#frequency").val();
					if (frequency && frequency != '') {
						$.ajax({
							url: "/watch/" + "name",
							success: function(result) {
								console.log(result);
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
								console.log("Status: " + textStatus);
								console.log("Error: " + errorThrown);
							}
						});
					}

					$('#dialog-connect').dialog('close');
				},
				iconCls: 'icon-save'
			}]
		});

		$('#dialog-connect').dialog('open');
		$("#connectionid").val(connectionlabel.text());
	});

	if (parseInt(navigator.appVersion) > 3) {
		document.onmousedown = mouseDown;
		if (navigator.appName == "Netscape")
			document.captureEvents(Event.MOUSEDOWN);
	}
});

function addConnection(relX, relY, selectedNode, id) {

	if (!instance)
		initLayout(relX, relY, selectedNode, id);

	var initNode = function(el) {

		instance.draggable(el);

		instance.makeSource(el, {
			filter: ".ep",
			anchor: "Continuous",
			connectorStyle: {
				stroke: "#aaa",
				strokeWidth: 1,
				outlineStroke: "transparent",
				outlineWidth: 4
			},
			connectionType: "basic",
			extract: {
				"action": "the-action"
			},
			maxConnections: 10,
			onMaxConnections: function(info, e) {
				alert("Maximum connections (" + info.maxConnections + ") reached");
			}
		});

		instance.makeTarget(el, {
			dropOptions: {
				hoverClass: "dragHover"
			},
			anchor: "Continuous",
			allowLoopback: true
		});

		instance.fire("jsPlumbDemoNodeAdded", el);
	};

	var newNode = function(x, y, id) {

		var d = document.createElement("div");
		var id = id; // jsPlumbUtil.uuid();
		d.className = "w";
		d.id = id;
		d.style.height = '80px';
		d.style.width = '225px';
		d.style.padding = '5px';

		var _name_ = selectedNode.name;
		if (_name_.length > 17)
			_name_ = _name_.substring(0, 17) + '...';


		if (selectedNode.data.config.type == undefined || selectedNode.data.config.type == 'undefined') {
			selectedNode.data.config.type = ''
		}

		var ext = selectedNode.name.substring(selectedNode.name.indexOf(".") + 1);
		var ftype = selectedNode.type;
		if (selectedNode.name.indexOf(".") == -1) {
			ext = 'otherpdf'
		}

		if (ftype == "prompt") {
			ext = "prompt";
		} else if (ftype == "retriever") {
			ext = "retriever";
		} else if (ftype == "index") {
			ext = "index";
		} else if (ftype == "storage") {
			ext = "storage";
		} else if (ftype == "loader") {
			ext = "loader";
		} else if (ftype == "model") {
			ext = "model";
		} else if (ftype == "crawler") {
			ext = "inet";
		} else if (ftype == "mysql") {
			ext = "mysql";
		} else if (ftype == "tool") {
			ext = "tools";
		can}

		console.log("extension: ", ext)

		if (selectedNode.data.config.type.toLowerCase() == "knowledgebase") {

			d.id = id;
			d.style.height = '200px';
			d.style.width = '300px';
			d.style.padding = '5px';
			d.style.border = "dotted 1px #000";
			d.style.textAlign = "center";
			d.innerHTML = `<div style="height:280px; border:0px;" id="drop_zone" ondrop="dropHandler(event);">
			  <img style="padding-top:10px;" src="/img/drop.png"><br>
			  <div style="color:red" id="dropzonetitle"></div>
			  <h4>Drag one or more files to this knowledgebase</h4>
			   Or drag items from the sources tree in the left panel
			  <br><br>
			  <button type="button" class="btn btn-primary">Upload</button><br><br>
			</div>`


			setTimeout(function() { $("#dropzonetitle").text(globals.kbasename) }, 3000);


		} else {

			d.innerHTML = "<table border=0 style='width:100%' class='" + globals.viewType + "'><tr><td width=16><img class='statusbox' id='statusbox_"
				+ globals.identifier
				+ id
				+ "' src='/img/job_stop.png'></td><td>"
				+ selectedNode.data.config.type.toLowerCase()
				+ ":"
				+ _name_
				+ "</td><td width=16><img id='endpointlock"
				+ id
				+ "' style='cursor:pointer' src='/img/unlock_small.png'></td></tr></table><div style='height:2px'>&nbsp;</div>"
				+ "<div title='"
				+ selectedNode.data.config.type.toLowerCase()
				+ ":"
				+ ((selectedNode.parent) ? selectedNode.parent.replace(new RegExp(/\\/g), "/") : "")
				+ "/"
				+ selectedNode.name
				+ "' style='border:1px solid #ccc; display:inline-block;height:50px;width:210px;background-color:#fff;'>"
				+ "<div style='padding-top:0px; width:50px; float:left; border-right:1px solid #ccc;' id='item_banner' class='"
				+ ""
				+ "'><img style='padding-left:3px;padding-top:3px;' src='/img/" + ext + ".png'></div><div style='padding-top:1px;"
				+ "color:#666'>"
				+ "&nbsp;name: "
				+ _name_.toLowerCase()
				+ "<div><div style='color:#666'>&nbsp;type: "
				+ selectedNode.data.config.type
				+ "</div><div style='color:#666'>&nbsp;status: <span id='status_"
				+ id
				+ "' class='jobstatus'>stopped<span>"
				+ "</div></div>"
				+ "<div class='ep' style='position: absolute; right: 0; bottom: 0; height:17px; width:16px; background-color: #F0F0F0; background-image:url(/img/drag.png)'></div></div>";
		}
		d.style.left = x + "px";
		d.style.top = y + "px";
		instance.getContainer().appendChild(d);
		initNode(d);

		$("#drop_zone").parent().css("display", "none");

		return d;
	};



	if (selectedNode.type == 'chain') {
		console.log(selectedNode)
		console.log(globals)

		let id1 = globals.identifier + id;
		let id2 = globals.identifier + (id + 1);
		let id3 = globals.identifier + (id + 2);
		let id4 = globals.identifier + (id + 3);

		console.log(selectedNode)

		selectedNode.name = "Simple RAG Prompt";
		selectedNode.type = "simple-rag-prompt"
		newNode(50, 100, id1);

		selectedNode.name = "Simple RAG Retriever";
		selectedNode.type = "simple-rag-rtrvr";
		newNode(50, 300, id2);

		selectedNode.name = "PII/PHI De-identifier";
		selectedNode.type = "simple-rag-deid";
		newNode(500, 300, id3);
		
		selectedNode.name = "Simple RAG Model";
		selectedNode.type = "simple-rag-model";
		newNode(500, 500, id4);


		$("#endpoint1").contextMenu(menu2, {
			theme: 'vista',
			beforeShow: function() {

				$(".context-menu-shadow").hide();
				//globals.currentnode = getNode(targetmenuid);
			},
			afterShow: function() {
				$(".context-menu-shadow").hide();
				//globals.currentnode = getNode(targetmenuid);
			}
		});

		$("#endpoint2").contextMenu(menu2, {
			theme: 'vista',
			beforeShow: function() {

				$(".context-menu-shadow").hide();
				//globals.currentnode = getNode(targetmenuid);
			},
			afterShow: function() {
				$(".context-menu-shadow").hide();
				//globals.currentnode = getNode(targetmenuid);
			}
		});

		$("#endpoint3").contextMenu(menu2, {
			theme: 'vista',
			beforeShow: function() {

				$(".context-menu-shadow").hide();
				//globals.currentnode = getNode(targetmenuid);
			},
			afterShow: function() {
				$(".context-menu-shadow").hide();
				//globals.currentnode = getNode(targetmenuid);
			}
		});



		instance.connect({
			source: id1,
			target: id2,
			type: "basic",
			anchors: ["Right", "Left"]
		});

		instance.connect({
			source: id2,
			target: id3,
			type: "basic",
			anchors: ["Right", "Left"]
		});

		instance.connect({
			source: id3,
			target: id4,
			type: "basic",
			anchors: ["Right", "Left"]
		});

	} else {
		newNode(relX, relY, globals.identifier + id);

	}



	var lockid = "endpointlock" + globals.identifier + id;
	$("#" + lockid).click(function() {
		var lockimg = '/img/lock_small.png';
		if ($("#" + lockid).attr('src') == lockimg) {
			$("#" + lockid).attr('src', '/img/unlock_small.png');
		} else {
			$("#" + lockid).attr('src', '/img/lock_small.png');
		}

		instance.toggleDraggable($("#" + globals.identifier + id));
	});

	$(".w").on('click', function(e) {

		var targetid = e.target.parentNode.id;

		if (targetid == '') {
			targetid = $(e.target.closest('.w'))[0].id;
		}

		$('.w').removeClass('glow');
		$('#' + targetid).addClass('glow');

		globals.currentnode = getNode(targetid)

		var result = mouseDown(e);
		result = jQuery.parseJSON(result);
		if (result.ctrlKey) {
			globals.selectednodes.push(targetid);
			$.each(globals.selectednodes, function(index, selectednode) {
				instance.addToDragSelection($('#' + selectednode));
				$('#' + selectednode).addClass('glow');
			});
		} else if (result.shiftKey) {
		} else if (result.alttKey) {
		} else {
			instance.clearDragSelection();
			globals.selectednodes.splice(0, globals.selectednodes.length);
		}

		e.preventDefault();
	});


	var menu3 = [
		{
			'Configure': {
				onclick: function(menuItem, menu) {

					eventFire(document.getElementById('general'), 'click');

					var currentnode = getNode(menu.target.id)[0];
					globals.current = currentnode;

					var generalconfigs = [];
					for (var key in currentnode.data.config) {
						var generalconfig = [];
						generalconfig.push(key);
						generalconfig.push(currentnode.data.config[key]);
						generalconfigs.push(generalconfig);
					}
					$('#generaltable').DataTable().clear().rows.add(generalconfigs);

					$('#generaltable').DataTable().columns(0).search('^(?:(?!pwd).)*$\r?\n?', true, false).draw();

					var optionconfigs = [];

					var optionconfig1 = [];
					if (currentnode.type == 'data') {

						optionconfig1.push("destination");
						optionconfig1
							.push("<select style='width:300px'>" +
								"" +

								"<option>local-filesystem</option>" +
								"<option>local-mysql (172.16.10.2)</option>" +
								"<option>cdh-hdfs (54.84.48.198)</option>" +
								"<option>cdh-db-json (54.84.48.198)</option>" +
								"<option>cdh-hbase (54.84.48.198)</option>" +
								"<option>cdh-db-binary (54.84.48.198)</option>" +
								"<option>hercules-os390</option>" +
								"<option>remote-filesystem (local1.rcggs.com)</option>" +
								"<option>hl7-mqtt-feed</option>" +
								"<option>prosys opc-ua (172.16.10.2)</option>" +
								"<option>tibco ems</option>" +
								"<option>amazon-s3</option>" +

								"</select>");
						optionconfigs.push(optionconfig1);
					}

					$
						.each(
							currentnode.options,
							function(index, option) {

								var optionconfig = [];
								optionconfig.push(option.name);
								/**if (option.name == 'transform.to') {
									optionconfig
										.push("<select style='width:100px'><option style='width:100px; border:1px'>parquet</option> " +
											"<option style='width:100px; border:1px'>orc</option><option style='width:100px; border:1px'>avro</option>" +
											"<option style='width:100px; border:1px'>json</option><option style='width:100px; border:1px'>xml</option></select>");
								} else {
									optionconfig.push("<input name='" + option.name + "' class='optionclass' value='" + option.value + "' size=50%>");
								}**/



								//optionconfigs.push(optionconfig);
							});


					console.log("-------------------------")
					console.log(currentnode.type)

					if (currentnode.type == "crawler") {

						optionconfigs = [
							[
								"base.url",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"num.docs",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							]
						]

					} else if (currentnode.type == "model") {

						//$("#filtertable").show();
						$("#filter").show();

						optionconfigs = [
							[
								"temperature",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"max.tokens",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							]
						]

					} else if (currentnode.type == "storage") {
						optionconfigs = [
							[
								"path",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"format",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							]
						]
					} else if (currentnode.type == "kbase") {
						$("#filter").show();
						optionconfigs = [[
							"output.path",
							"<input name='parallel.threads' class='optionclass' value='' size=50%>"
						]];

					} else if (currentnode.name == "Knowledge Base") {


					} else if (currentnode.name == "Knowledge Base") {

						optionconfigs = [
							[
								"output.path",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"enable.voice",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.email",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.export",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.googlemaps",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.highcharts",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							]
						]
					} else {

						$("#filtertable").hide();
						$("#filter").hide();

						optionconfigs = [
							[
								"include",
								"<input name='parallel.threads' class='optionclass' value='*' size=50%>"
							],
							[
								"exclude",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"recurse",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"translate.to",
								"<select style='width:100px'>" +
								"<option style='width:100px; border:1px'>none</option><option style='width:100px; border:1px'>text</option>" +
								"<option style='width:100px; border:1px'>pdf</option><option style='width:100px; border:1px'>json</option>" +
								"<option style='width:100px; border:1px'>csv</option><option style='width:100px; border:1px'>xml</option>" +
								"<option style='width:100px; border:1px'>html</option><option style='width:100px; border:1px'>markdown</option>" +
								"</select>"
							]
						]
					}

					console.log(optionconfigs)


					$('#optionstable').DataTable().clear().rows.add(optionconfigs).draw();
					$('#optionstable').hide();

					var schemaconfigs = [];
					$.each(currentnode.schema, function(index, schema) {
						var schemaconfig = [];
						// schemaconfig.push(schema.checked);
						schemaconfig.push(false);
						schemaconfig.push(schema.name);
						schemaconfig.push(schema.udfname);
						schemaconfig.push(schema.value);
						schemaconfig.push(schema.group);
						schemaconfigs.push(schemaconfig);

					});
					$('#schematable').DataTable().clear().rows.add(schemaconfigs).draw();
					$('#schematable').hide();

					$(".context-menu").hide();
					$(".context-menu-shadow").hide();

					var resourcesconfigs = [];
					$.each(currentnode.children, function(index, resource) {
						var resourcesconfig = [];
						resourcesconfig.push(true);
						resourcesconfig.push(resource.name);
						resourcesconfigs.push(resourcesconfig);

					});
					$('#resourcestable').DataTable().clear().rows.add(resourcesconfigs).draw();
					$('#resourcestable').hide();

					$("#dialogitem").html(selectedNode.name);

					$("#loadschemabutton").hide();

					$("#dialog").dialog("open");

					return false;
				},
				icon: '/img/configure_icon.png'
			}
		}, $.contextMenu.separator, {
			'Delete': {
				onclick: function(menuItem, menu) {
					$(this).remove();
					$("#" + menu.target.id).hide();
					removeNode(menu.target.id);
					// globals.id--;
					$.each(instance.getConnections(), function(idx, connection) {

						if (connection.targetId == menu.target.id || connection.sourceId == menu.target.id) {
							instance.detach(connection);
						}
					});
					$(".context-menu").hide();
					$(".context-menu-shadow").hide();

					eventFire(document.getElementById('canvas'), 'click');

					return false;
				},
				icon: '/img/delete_icon.png'
			},
		}, $.contextMenu.separator, {
			'Lock': {
				onclick: function(menuItem, menu) {
					$("#" + menu.target.id).removeClass('jtk-draggable')
					$("#" + menu.target.id).removeClass('jtk-droppable')
					$("#" + menu.target.id).removeClass('jtk-endpoint-anchor')
					$("#" + menu.target.id).removeClass('jtk-connected')
					$("#" + menu.target.id).removeClass('jtk-node')

					eventFire(document.getElementById('endpointlock' + globals.identifier + id), 'click');

					$(".context-menu").hide();
					$(".context-menu-shadow").hide();
					return false;
				},
				icon: '/img/lock_icon.png'
			}
		}, $.contextMenu.separator, {
			'Detach': {
				onclick: function(menuItem, menu) {
					$.each(instance.getConnections(), function(idx, connection) {
						instance.detach(connection);
					});
					$(".context-menu").hide();
					$(".context-menu-shadow").hide();
					return false;
				},
				icon: '/img/detach_icon.png'
			}
		}];

	var menu1 = [
		{
			'Configure': {
				onclick: function(menuItem, menu) {

					eventFire(document.getElementById('general'), 'click');

					var currentnode = getNode(menu.target.id)[0];
					globals.current = currentnode;

					var generalconfigs = [];
					for (var key in currentnode.data.config) {
						var generalconfig = [];
						generalconfig.push(key);
						generalconfig.push(currentnode.data.config[key]);
						generalconfigs.push(generalconfig);
					}
					$('#generaltable').DataTable().clear().rows.add(generalconfigs);

					$('#generaltable').DataTable().columns(0).search('^(?:(?!pwd).)*$\r?\n?', true, false).draw();

					var optionconfigs = [];

					var optionconfig1 = [];
					if (currentnode.type == 'data') {

						optionconfig1.push("destination");
						optionconfig1
							.push("<select style='width:300px'>" +
								"" +

								"<option>local-filesystem</option>" +
								"<option>local-mysql (172.16.10.2)</option>" +
								"<option>cdh-hdfs (54.84.48.198)</option>" +
								"<option>cdh-db-json (54.84.48.198)</option>" +
								"<option>cdh-hbase (54.84.48.198)</option>" +
								"<option>cdh-db-binary (54.84.48.198)</option>" +
								"<option>hercules-os390</option>" +
								"<option>remote-filesystem (local1.rcggs.com)</option>" +
								"<option>hl7-mqtt-feed</option>" +
								"<option>prosys opc-ua (172.16.10.2)</option>" +
								"<option>tibco ems</option>" +
								"<option>amazon-s3</option>" +

								"</select>");
						optionconfigs.push(optionconfig1);
					}

					$
						.each(
							currentnode.options,
							function(index, option) {

								var optionconfig = [];
								optionconfig.push(option.name);
								/**if (option.name == 'transform.to') {
									optionconfig
										.push("<select style='width:100px'><option style='width:100px; border:1px'>parquet</option> " +
											"<option style='width:100px; border:1px'>orc</option><option style='width:100px; border:1px'>avro</option>" +
											"<option style='width:100px; border:1px'>json</option><option style='width:100px; border:1px'>xml</option></select>");
								} else {
									optionconfig.push("<input name='" + option.name + "' class='optionclass' value='" + option.value + "' size=50%>");
								}**/



								//optionconfigs.push(optionconfig);
							});


					console.log("-------------------------")
					console.log(currentnode.type)

					if (currentnode.type == "crawler") {

						optionconfigs = [
							[
								"base.url",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"num.docs",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							]
						]

					} else if (currentnode.type == "model") {

						$("#filtertable").show();
						$("#filter").show();

						optionconfigs = [
							[
								"temperature",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"max.tokens",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							]
						]

					} else if (currentnode.type == "storage") {
						optionconfigs = [
							[
								"outout.path",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							]
						]
					} else if (currentnode.type == "kbase") {
						optionconfigs = [
							[
								"path",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"format",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							]
						]

					} else if (currentnode.text == "KnowledgeBase") {


					} else if (currentnode.text == "KnowledgeBase") {

						optionconfigs = [
							[
								"output.path",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"enable.voice",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.email",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.export",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.googlemaps",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[
								"enable.highcharts",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							]
						]
					} else {
						optionconfigs = [
							[
								"include",
								"<input name='parallel.threads' class='optionclass' value='*' size=50%>"
							],
							[
								"exclude",
								"<input name='parallel.threads' class='optionclass' value='' size=50%>"
							],
							[
								"recurse",
								"<select style='width:100px'><option style='width:100px; border:1px'>false</option><option style='width:100px; border:1px'>true</option></select>"
							],
							[

								"translate.to",
								"<select style='width:100px'>" +
								"<option style='width:100px; border:1px'>none</option><option style='width:100px; border:1px'>text</option>" +
								"<option style='width:100px; border:1px'>pdf</option><option style='width:100px; border:1px'>json</option>" +
								"<option style='width:100px; border:1px'>csv</option><option style='width:100px; border:1px'>xml</option>" +
								"<option style='width:100px; border:1px'>html</option><option style='width:100px; border:1px'>markdown</option>" +
								"</select>"
							]
						]
					}

					console.log(optionconfigs)


					$('#optionstable').DataTable().clear().rows.add(optionconfigs).draw();
					$('#optionstable').hide();

					var schemaconfigs = [];
					$.each(currentnode.schema, function(index, schema) {
						var schemaconfig = [];
						// schemaconfig.push(schema.checked);
						schemaconfig.push(false);
						schemaconfig.push(schema.name);
						schemaconfig.push(schema.udfname);
						schemaconfig.push(schema.value);
						schemaconfig.push(schema.group);
						schemaconfigs.push(schemaconfig);

					});
					$('#schematable').DataTable().clear().rows.add(schemaconfigs).draw();
					$('#schematable').hide();

					$(".context-menu").hide();
					$(".context-menu-shadow").hide();

					var resourcesconfigs = [];
					$.each(currentnode.children, function(index, resource) {
						var resourcesconfig = [];
						resourcesconfig.push(true);
						resourcesconfig.push(resource.name);
						resourcesconfigs.push(resourcesconfig);

					});
					$('#resourcestable').DataTable().clear().rows.add(resourcesconfigs).draw();
					$('#resourcestable').hide();

					$("#dialogitem").html(selectedNode.name);

					$("#loadschemabutton").hide();

					$("#dialog").dialog("open");

					return false;
				},
				icon: '/img/configure_icon.png'
			}
		}, $.contextMenu.separator, {
			'Delete': {
				onclick: function(menuItem, menu) {
					$(this).remove();
					$("#" + menu.target.id).hide();
					removeNode(menu.target.id);
					// globals.id--;
					$.each(instance.getConnections(), function(idx, connection) {

						if (connection.targetId == menu.target.id || connection.sourceId == menu.target.id) {
							instance.detach(connection);
						}
					});
					$(".context-menu").hide();
					$(".context-menu-shadow").hide();

					eventFire(document.getElementById('canvas'), 'click');

					return false;
				},
				icon: '/img/delete_icon.png'
			},
		}, $.contextMenu.separator, {
			'Lock': {
				onclick: function(menuItem, menu) {
					$("#" + menu.target.id).removeClass('jtk-draggable')
					$("#" + menu.target.id).removeClass('jtk-droppable')
					$("#" + menu.target.id).removeClass('jtk-endpoint-anchor')
					$("#" + menu.target.id).removeClass('jtk-connected')
					$("#" + menu.target.id).removeClass('jtk-node')

					eventFire(document.getElementById('endpointlock' + globals.identifier + id), 'click');

					$(".context-menu").hide();
					$(".context-menu-shadow").hide();
					return false;
				},
				icon: '/img/lock_icon.png'
			}
		}, $.contextMenu.separator, {
			'Detach': {
				onclick: function(menuItem, menu) {
					$.each(instance.getConnections(), function(idx, connection) {
						instance.detach(connection);
					});
					$(".context-menu").hide();
					$(".context-menu-shadow").hide();
					return false;
				},
				icon: '/img/detach_icon.png'
			}
		}];



	$(function() {

		var menu;
		if (globals.currentnode && globals.currentnode.itemType == "component") {
			menu = menu3

		} else {
			menu = menu1
		}

		console.log(globals.currentnode)

		$("#" + globals.identifier + id).contextMenu(menu, {
			theme: 'vista',
			beforeShow: function() {
				var targetmenuid = $(this)[0].target.id;
				$(".context-menu-shadow").hide();
				$(".w").removeClass('glow');
				$("#" + targetmenuid).addClass('glow');
				globals.currentnode = getNode(targetmenuid);
			}
		});
	});

	$("#canvas").mouseover(function() {
		$(".context-menu-shadow").hide();
		$(".context-menu").hide();
	});

	instance.repaintEverything();
}

function initLayout(relX, relY, selectedNode, id) {

	var idFunction = function(n) {
		return n.id;
	};

	var typeFunction = function(n) {
		return n.type;
	};

	var toolkit = jsPlumbToolkit.newInstance({
		idFunction: idFunction,
		typeFunction: typeFunction,
	});

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
			/* label : "pending", */
			id: "label",
			cssClass: "aLabel"
		}]],
		Container: "canvas",
		Connector: ["Flowchart"]
	});

	instance.registerConnectionType("basic", {
		anchor: "Continuous",
		connector: "StateMachine"
	});

	window.jsp = instance;

	var canvas = document.getElementById("canvas");
	var windows = jsPlumb.getSelector(".statemachine-demo .w");

	instance.bind("dblclick", function(c) {
		var txt;
		alertify.confirm("Are you sure yu want to detach this connection ?", function(e) {
			if (e) {
				instance.detach(c);
				removeModel('123');
			} else {
				return false;
			}
		});
	});

	instance.bind("click", function(c) {
		console.log('single click');
	});

	instance.bind("connection", function(info) {

		globals.conmap[info.connection.getOverlay("label").canvas.id] = {
			conid: info.connection.id,
			source: info.source,
			target: info.target
		}
		$("#" + info.connection.getOverlay("label").canvas.id).contextMenu(menu2, {
			theme: 'vista',
			beforeShow: function() {
				$(".context-menu-shadow").hide();
			}
		});
		info.connection.getOverlay("label").setLabel(info.connection.id);

		$.ajax({
			url: "/translate/" + "name",
			type: "POST",
			data: JSON.stringify({ uri: JSON.stringify(getNode(info.source.id)) }),
			contentType: 'application/json',
			dataType: "json",
			success: function(result) {
				console.log(result)
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				console.log("Status: " + textStatus);
				console.log("Error: " + errorThrown);
			}
		});
	});

	jsPlumb.on(canvas, "dblclick", function(e) {
		// newNode(e.offsetX, e.offsetY);
	});

	jsPlumb.on(canvas, "click", function(e) {
		if (e.target.id == 'canvas') {
			globals.selectednodes.splice(0, globals.selectednodes.length);
			$('.w').removeClass('glow');
		}
	});

	instance.batch(function() {
		for (var i = 0; i < windows.length; i++) {
			initNode(windows[i], true);
		}
		/*
		 * instance.connect({ source : "opened", target : "phone1", type :
		 * "basic" }); instance.connect({ source : "phone1", target : "phone1",
		 * type : "basic" }); instance.connect({ source : "phone1", target :
		 * "inperson", type : "basic" });
		 * 
		 * instance.connect({ source : "phone2", target : "rejected", type :
		 * "basic" });
		 */
	});

	jsPlumb.fire("jsPlumbDemoLoaded", instance);

};
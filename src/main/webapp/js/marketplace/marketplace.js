function version() {
	var s = 'public_ip_address = "adb-1214805373383780.0.azuredatabricks.net" resource_group_name = "DATABRICKS_EricDATABRICKSPerler" tls_private_key = <sensitive> adb-1214805373383780.0.azuredatabricks.net"'
	console.log(s.match(/"([^"]+)"/)[1]);
}

function configure(item) {
	console.log(item.innerText)
	$(".custom-menu").hide();
	$('#modal-button', window.parent.parent.document).click();
}

var current_id = new Date().getTime();

const info = new Map();

const counts = new Map();

const empty_msg = new Map([
	["#item1-owl", `No data sources yet
			  <br> <span class="no-items-small" style="position: relative; left:1px;">To add a data
			  source make a selection below</span>`],
	["#item2-owl", `No environments yet
			  <br> <span class="no-items-small" style="position: relative; left:1px;">To add an environment
			  make a selection below</span>`]
]);

const dbs = new Map([['item1', dataset_data], ['item2', env_data]]);

function goto(index) {
	$(document).on('click', '.owl-item', function() {
		owlIndex = index
		$('.owl-stage-outer').trigger('to.owl.carousel', owlIndex);
	});
}

function makeItem(key, id, label, desc, img, blink) {
	//console.log("makeitem(", key, id, label, desc, img, blink, ")")
	var w = label.indexOf('SPARK') != -1 || label.indexOf('MYSQL') != -1 || label.indexOf('PARQUET ') != -1 ? 50 : 30;
	w = label.indexOf('SQL SERVER') != -1 ? 90 : w;
	oid = "#" + id + "-owl";
	return `<div data-toggle="tooltip" data-placement="top" title="${desc.trim()}&#013;${getRandom(sizes, 1)}K" key=${key} class="${id}${blink ? ' blink desaturate' : ''}" id="${key}">${blink ?
		'<span class="close-x" id="' + oid +
		'" onclick="removeModal(this);"> x </span>' : ''}
  <div style="padding-top:10px">
     <center>
     <img src="img/${img}.png" style="width:${w}px;height:30px;">
     <div id="owlc-item" class="${blink ? 'owlc-item-lite' : 'owlc-item'}"><b>${label}</b></div>
     <div id="owlc-item-desc-${key}" class="owlc-item-small">${desc.slice(0, 23)}</div>
     <br>  
  </div>
 </div>`

}
function addCarousel(id) {
	dbs.get(id).forEach((values, keys) => {
		var item = makeItem(keys, values['id'], values['label'], values['desc'], values['img'], false);
		$("#" + id + "-owl-list")
			.trigger(
				'add.owl.carousel',
				[item])
			.trigger('refresh.owl.carousel');
	});
}

function reset(div) {
	$("#" + div).removeClass('blink')
	$("#" + div).removeClass('desaturate')
	$("#owlc-item").removeClass('owlc-item-lite')
	$("#owlc-item").addClass('owlc-item')
}

function submitRequest(div, id, label) {

	//console.log("submitRequest(", div, id, label, ")");
	var current_item = current_id;
	localStorage.removeItem("mp_info");
	info.set(div, { "id": current_item });
	info.get(div)["type"] = id;
	localStorage.setItem("mp_info", JSON.stringify(info.get(div)));
	current_id = new Date().getTime();
	if (div.startsWith("item2-")) {

		$("#owlc-item-desc-" + div).html("Installing");

		$
			.ajax({
				url: "/createVm/" + id + "/" + label,
				success: function(results) {
					console.log("----------- RESULTS -------------")
					console.log(results);
					info.get(div)["log"] = results;
					var url = results.match(/"([^"]+)"/);
					if (url && url[1]) {
						console.log("url =>" + url[1].replace("\"", ""));
						info.get(div)["url"] = url;
						var request_table = $("#requests-table",
							parent.document);
					}

					if (results.indexOf("error") != -1 || results.indexOf("non-zero exit status") != -1 || results == "") {
						console.error(`An error occurred : ${results}`);
						info.get(div)["status"] = "failed";
						//info.get(div)["log"] = "results";
						$("#owlc-item-desc-" + div).html("<font color='#cf142b'>Failed</font>");

						var request_table = $("#requests-table",
							parent.document);

						request_table.find('tr').each(
							function(i, el) {
								var $tds = $(this).find('td'), id = $tds
									.eq(1), status = $tds.eq(5);
								if ($(id).text() == current_item) {
									$(status).html("<font color='#cf142b'>Failed</font>");
								}
							});
					} else {
						console.log("success")
						info.get(div)["status"] = "success";
						$("#owlc-item-desc-" + div).html("Installed");
						var request_table = $("#requests-table",
							parent.document);
						request_table.find('tr').each(
							function(i, el) {
								var $tds = $(this).find('td'), id = $tds
									.eq(1), status = $tds.eq(5);
								if ($(id).text() == current_item) {
									$(status).html("<font color='green'>Installed</font>");
								}
							});
					}
					reset(div);
					localStorage.setItem("mp_info", JSON.stringify(info.get(div)));
				},

				error: function(XMLHttpRequest, textStatus, errorThrown) {
					console.log("Status: " + textStatus);
					console.log("Error: " + errorThrown);
				}
			});

	} else {

		$
			.ajax({

				url: "/deltalake/" + id,
				success: function(results) {
					console.log(results);
					//info.get(div)["log"] = results;
					var url = results.match(/"([^"]+)"/);
					if (url && url[1]) {
						console.log("url =>" + url[1].replace("\"", ""));
						info.get(div)["url"] = url;
						var request_table = $("#requests-table",
							parent.document);
					}

					console.log("success")
					info.get(div)["status"] = "success";
					$("#owlc-item-desc-" + div).html("Installed");
					var request_table = $("#requests-table",
						parent.document);
					request_table.find('tr').each(
						function(i, el) {
							var $tds = $(this).find('td'), id = $tds
								.eq(1), status = $tds.eq(5);
							if ($(id).text() == current_item) {
								setTimeout(function() { $(status).html("<font color='green'>Installed</font>"); }, 8000);
							}
						});

					reset(div);
					localStorage.setItem("mp_info", JSON.stringify(info.get(div)));
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					reset(div);
					$("#owlc-item-desc-" + div).html("<font color='#cf142b'>Failed</font>");

					var request_table = $("#requests-table",
						parent.document);

					request_table.find('tr').each(
						function(i, el) {
							var $tds = $(this).find('td'), id = $tds
								.eq(1), status = $tds.eq(5);
							if ($(id).text() == current_item) {
								$(status).html("<font color='#cf142b'>Failed</font>");
							}
						});
					console.log("Status: " + textStatus);
					console.log("Error: " + errorThrown);
				}
			});
	}
}


function addCarouselItem(divId) {
	$(divId)
		.click(
			function(e) {
				var data = JSON.parse(e.target.attributes[0].value);
				var id = data['id']
				var itemId = e.target.id.split("-")[0]
				var owlId = `#${itemId}-owl`;
				var values = dbs.get(itemId).get(id);
				var number = counts.get(owlId) ?? 0;
				var item = makeItem(itemId + "-" + number, values['id'], values['label'], values['desc'], values['img'], true);
				//console.log(data, id, itemId, owlId, values, number)
				owl = $(owlId).owlCarousel({
					navigation: true,
					slideSpeed: 300,
					paginationSpeed: 400,
					items: 3,
					loop: true,
					itemsDesktop: false,
					itemsDesktopSmall: false,
					margin: 10,
					nav: true,
					itemsTablet: false,
					itemsMobile: false
				});

				if (counts.has(owlId))
					counts.set(owlId, parseInt(counts.get(owlId)) + 1);
				else {
					var total = [1];
					counts.set(owlId, total)
				}
				if (counts.get(owlId) > 0) {
					$(owlId + "-empty").html('&nbsp;<br>&nbsp;');
				}

				e.preventDefault();
				$(owlId)
					.trigger(
						'add.owl.carousel',
						[item])
					.trigger('refresh.owl.carousel');

				submitRequest(itemId + "-" + number, id, values['label']);
			});

}

function removeImage(trigger) {
	counts.set(trigger.id, parseInt(counts.get(trigger.id)) - 1);
	var $item = $(trigger).closest('.owl-item');
	var index = $item.closest('.owl-stage').children().index($item);
	$item.closest('.owl-carousel').owlCarousel('remove', index)
		.owlCarousel('update');

	if (owl.hasClass('owl-theme')) {
		owl.trigger('destroy.owl.carousel');
		owl.find('.owl-stage-outer').children().unwrap();
		owl.removeClass("owl-center owl-loaded owl-text-select-on");
		owl = $(trigger.id).owlCarousel({
			navigation: true,
			slideSpeed: 300,
			paginationSpeed: 400,
			items: 3,
			itemsDesktop: false,
			itemsDesktopSmall: false,
			margin: 20,
			nav: true,
			itemsTablet: false,
			itemsMobile: false
		});
		owl.owlCarousel();
	}
	var number = counts.get(trigger.id) ?? 0;
	if (number == 0) {
		var empty = trigger.id + "-empty"
		$(empty).html(empty_msg.get(trigger.id));
	}
	owl.trigger('refresh.owl.carousel');
}

function infoModalClose() {
	$("#info-modal").hide();
}

function infoModalCancel() {
	$("#info-modal").hide();
}

function settingsModalCancel() {
	$("#settingsModal").hide();
}

function settingsModalClose() {
	$("#settingsModal").hide();
	console.log("RELOAD")
	location.reload();
}

function removeModal(item) {

	var data = localStorage.getItem("mp_info")

	confirm("Are you sure you wish to unsubscribe from this resource")
	removeImage(item)

	var request_table = $("#requests-table",
		parent.document);
	request_table.find('tr').each(
		function(i, el) {
			var $tds = $(this).find('td'), id = $tds
				.eq(1).text();
			if (id == JSON.parse(data)['id']) {
				$tds.eq(5).html("<font color='#3399ff'>Unsubscribed</font>");
			}
		});
}

function removeModalClose() {
	$("#remove-modal").hide();
}

function removeModalCancel() {
	$("#remove-modal").hide();
}

function restore() {
	localStorage.clear();
}


function jumpTo(item) {
	var id = $(item)[0].id.split("-")[0];
	var oid = id.charAt(id.length - 1);
	var search = $("#search-div-" + oid).val();
	var found_items = [];
	id = "#" + id + "-owl-list";
	$("#search-div-" + "1").val("")
	$(".owlc-item-small").each(
		function(i, el) {
			if ($(el).text().toLowerCase().includes(search.toLowerCase())) {
				var img = $(el).prev().prev();
				//console.log(img[0].attributes['src']);
				var pane = $(img).closest('body').find('.owlc-item');
				$(pane.next()).each(
					function(i, el1) {
						if (($(el).text() == $(el1).text())) {
							console.log("MATCH " + ($(el).text(), $(el1).text()))
							found_items.push($(el1).closest('.owl-item').html());
						}
					});
				let page = Math.floor(i / 4);
				$(id).trigger('to.owl.carousel', (page))
			}
		});

	if (found_items.length == 0) {
		alert("No items match " + search);
		return false;
	} else {
		for (var i = 0; i < $('.owl-item, .active').length + 10; i++) {
			$("#item" + oid + "-owl-list").trigger('remove.owl.carousel', [i]).trigger('refresh.owl.carousel');
		}
		found_items = removeDuplicates(found_items);
		for (var i = 0; i < found_items.length; i++) {
			if ($(found_items[i])[0].className == ("item" + oid)) {
				//console.log(found_items);
				$('#item' + oid + '-owl-list').trigger('add.owl.carousel', found_items[i])
					.trigger('refresh.owl.carousel');

			}
		}
	}
}

$(document).bind("contextmenu", function(e) {
	var item = $(e.target).find('.owlc-item-small')[0];
	if (item && item.id.startsWith("owlc-item-desc-item")) {
		console.log(item.id)
		e.preventDefault();
		$(".custom-menu").finish().toggle(100).
			css({
				top: e.pageY + "px",
				left: e.pageX + "px"
			});
	}
});

$(document).bind("mousedown", function(e) {
	if (!$(e.target).parents(".custom-menu").length > 0) {
		$(".custom-menu").hide(100);
	}
});

function capitalize(word) {
	var firstLetter = word.charAt(0)
	var firstLetterCap = firstLetter.toUpperCase()
	var remainingLetters = word.slice(1);
	return firstLetterCap + remainingLetters
}

function getRandom(arr, n) {
	var result = new Array(n),
		len = arr.length,
		taken = new Array(len);
	if (n > len)
		throw new RangeError("getRandom: more elements taken than available");
	while (n--) {
		var x = Math.floor(Math.random() * len);
		result[n] = arr[x in taken ? taken[x] : x];
		taken[x] = --len in taken ? taken[len] : len;
	}
	return result;
}

function removeDuplicates(arr) {

	let unique = arr.reduce(function(acc, curr) {

		if (!acc.includes(curr))

			acc.push(curr);

		return acc;

	}, []);

	return unique;

}


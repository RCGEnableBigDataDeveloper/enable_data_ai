/*
dhtmlxScheduler v.4.2.0 Stardard

This software is covered by GPL license. You also can obtain Commercial or Enterprise license to use it in non-GPL project - please contact sales@dhtmlx.com. Usage without proper license is prohibited.

(c) Dinamenta, UAB.
*/
scheduler.config.occurrence_timestamp_in_utc=!1,scheduler.config.recurring_workdays=[1,2,3,4,5],scheduler.form_blocks.recurring={_get_node:function(e){return"string"==typeof e&&(e=document.getElementById(e)),"none"==e.style.display&&(e.style.display=""),e},_outer_html:function(e){function t(e){var t,r=document.createElement("div");return r.appendChild(e.cloneNode(!0)),t=r.innerHTML,r=null,t}return e.outerHTML||t(e)},render:function(e){if(e.form){var t=scheduler.form_blocks.recurring,r=t._get_node(e.form);
return t._outer_html(r)}return scheduler.__recurring_template},_ds:{},_get_form_node:function(e,t,r){var a=e[t];if(!a)return null;if(a.nodeName)return a;if(a.length)for(var s=0;s<a.length;s++)if(a[s].value==r)return a[s]},_get_node_value:function(e,t,r){var a=e[t];if(!a)return"";if(a.length){if(r){for(var s=[],n=0;n<a.length;n++)a[n].checked&&s.push(a[n].value);return s}for(var n=0;n<a.length;n++)if(a[n].checked)return a[n].value}return a.value?r?[a.value]:a.value:void 0},_set_node_value:function(e,t,r){var a=e[t];
if(a)if(a.name==t)a.value=r;else if(a.length)for(var s="object"==typeof r,n=0;n<a.length;n++)(s||a[n].value==r)&&(a[n].checked=s?!!r[a[n].value]:!!r)},_init_set_value:function(e,t,r){function a(e){for(var t=0;t<e.length;t++){var r=e[t];if(r.name)if(g[r.name])if(g[r.name].nodeType){var a=g[r.name];g[r.name]=[a,r]}else g[r.name].push(r);else g[r.name]=r}}function s(){m("dhx_repeat_day").style.display="none",m("dhx_repeat_week").style.display="none",m("dhx_repeat_month").style.display="none",m("dhx_repeat_year").style.display="none",m("dhx_repeat_"+this.value).style.display="block",scheduler.setLightboxSize()
}function n(e){var t=[_(g,"repeat")];for(y[t[0]](t,e);t.length<5;)t.push("");var r="",a=i(g);if("no"==a)e.end=new Date(9999,1,1),r="no";else if("date_of_end"==a)e.end=u(_(g,"date_of_end"));else{scheduler.transpose_type(t.join("_")),r=Math.max(1,_(g,"occurences_count"));var s=0;e.end=scheduler.date.add(new Date(e.start),r+s,t.join("_"))}return t.join("_")+"#"+r}function i(e){var t=e.end;if(t.length){for(var r=0;r<t.length;r++)if(t[r].checked)return t[r].value&&"on"!=t[r].value?t[r].value:r?2==r?"date_of_end":"occurences_count":"no"
}else if(t.value)return t.value;return"no"}function d(e,t){var r=e.end;if(r.length){var a=!!r[0].value;if(a)for(var s=0;s<r.length;s++)r[s].value==t&&(r[s].checked=!0);else{var n=0;switch(t){case"no":n=0;break;case"date_of_end":n=2;break;default:n=1}r[n].checked=!0}}else r.value=t}function l(e,t){var r=scheduler.form_blocks.recurring._set_node_value,a=e.split("#");switch(e=a[0].split("_"),x[e[0]](e,t),a[1]){case"no":d(g,"no");break;case"":d(g,"date_of_end");var s=t.end;scheduler.config.include_end_by&&(s=scheduler.date.add(s,-1,"day")),r(g,"date_of_end",f(s));
break;default:d(g,"occurences_count"),r(g,"occurences_count",a[1])}r(g,"repeat",e[0]);var n=scheduler.form_blocks.recurring._get_form_node(g,"repeat",e[0]);"SELECT"==n.nodeName&&n.onchange?n.onchange():n.onclick&&n.onclick()}var o=scheduler.form_blocks.recurring,_=o._get_node_value,c=o._set_node_value;scheduler.form_blocks.recurring._ds={start:r.start_date,end:r._end_date};var h=scheduler.date.str_to_date(scheduler.config.repeat_date),u=function(e){var t=h(e);return scheduler.config.include_end_by&&(t=scheduler.date.add(t,1,"day")),t
},f=scheduler.date.date_to_str(scheduler.config.repeat_date),v=e.getElementsByTagName("FORM")[0],g={};if(a(v.getElementsByTagName("INPUT")),a(v.getElementsByTagName("SELECT")),!scheduler.config.repeat_date_of_end){var p=scheduler.date.date_to_str(scheduler.config.repeat_date);scheduler.config.repeat_date_of_end=p(scheduler.date.add(scheduler._currentDate(),30,"day"))}c(g,"date_of_end",scheduler.config.repeat_date_of_end);var m=function(e){return document.getElementById(e)||{style:{}}};scheduler.form_blocks.recurring._get_repeat_code=n;
var y={month:function(e,t){var r=scheduler.form_blocks.recurring._get_node_value;"d"==r(g,"month_type")?(e.push(Math.max(1,r(g,"month_count"))),t.start.setDate(r(g,"month_day"))):(e.push(Math.max(1,r(g,"month_count2"))),e.push(r(g,"month_day2")),e.push(Math.max(1,r(g,"month_week2"))),scheduler.config.repeat_precise||t.start.setDate(1)),t._start=!0},week:function(e,t){var r=scheduler.form_blocks.recurring._get_node_value;e.push(Math.max(1,r(g,"week_count"))),e.push(""),e.push("");for(var a=[],s=r(g,"week_day",!0),n=t.start.getDay(),i=!1,d=0;d<s.length;d++)a.push(s[d]),i=i||s[d]==n;
a.length||(a.push(n),i=!0),a.sort(),scheduler.config.repeat_precise?i||(scheduler.transpose_day_week(t.start,a,1,7),t._start=!0):(t.start=scheduler.date.week_start(t.start),t._start=!0),e.push(a.join(","))},day:function(e){var t=scheduler.form_blocks.recurring._get_node_value;"d"==t(g,"day_type")?e.push(Math.max(1,t(g,"day_count"))):(e.push("week"),e.push(1),e.push(""),e.push(""),e.push(scheduler.config.recurring_workdays.join(",")),e.splice(0,1))},year:function(e,t){var r=scheduler.form_blocks.recurring._get_node_value;
"d"==r(g,"year_type")?(e.push("1"),t.start.setMonth(0),t.start.setDate(r(g,"year_day")),t.start.setMonth(r(g,"year_month"))):(e.push("1"),e.push(r(g,"year_day2")),e.push(r(g,"year_week2")),t.start.setDate(1),t.start.setMonth(r(g,"year_month2"))),t._start=!0}},x={week:function(e){var t=scheduler.form_blocks.recurring._set_node_value;t(g,"week_count",e[1]);for(var r=e[4].split(","),a={},s=0;s<r.length;s++)a[r[s]]=!0;t(g,"week_day",a)},month:function(e,t){var r=scheduler.form_blocks.recurring._set_node_value;
""===e[2]?(r(g,"month_type","d"),r(g,"month_count",e[1]),r(g,"month_day",t.start.getDate())):(r(g,"month_type","w"),r(g,"month_count2",e[1]),r(g,"month_week2",e[3]),r(g,"month_day2",e[2]))},day:function(e){var t=scheduler.form_blocks.recurring._set_node_value;t(g,"day_type","d"),t(g,"day_count",e[1])},year:function(e,t){var r=scheduler.form_blocks.recurring._set_node_value;""===e[2]?(r(g,"year_type","d"),r(g,"year_day",t.start.getDate()),r(g,"year_month",t.start.getMonth())):(r(g,"year_type","w"),r(g,"year_week2",e[3]),r(g,"year_day2",e[2]),r(g,"year_month2",t.start.getMonth()))
}};scheduler.form_blocks.recurring._set_repeat_code=l;for(var b=0;b<v.elements.length;b++){var w=v.elements[b];switch(w.name){case"repeat":"SELECT"==w.nodeName?w.onchange=s:w.onclick=s}}scheduler._lightbox._rec_init_done=!0},set_value:function(e,t,r){var a=scheduler.form_blocks.recurring;scheduler._lightbox._rec_init_done||a._init_set_value(e,t,r),e.open=!r.rec_type,e.blocked=this._is_modified_occurence(r)?!0:!1;var s=a._ds;s.start=r.start_date,s.end=r._end_date,a.button_click(0,e.previousSibling.firstChild.firstChild,e,e),t&&a._set_repeat_code(t,s)
},get_value:function(e,t){if(e.open){var r=scheduler.form_blocks.recurring._ds,a={};this.formSection("time").getValue(a),r.start=a.start_date,t.rec_type=scheduler.form_blocks.recurring._get_repeat_code(r),r._start?(t.start_date=new Date(r.start),t._start_date=new Date(r.start),r._start=!1):t._start_date=null,t._end_date=r.end,t.rec_pattern=t.rec_type.split("#")[0]}else t.rec_type=t.rec_pattern="",t._end_date=t.end_date;return t.rec_type},_get_button:function(){var e=scheduler.formSection("recurring").header;
return e.firstChild.firstChild},_get_form:function(){return scheduler.formSection("recurring").node},open:function(){var e=scheduler.form_blocks.recurring,t=e._get_form();t.open||e._toggle_block()},close:function(){var e=scheduler.form_blocks.recurring,t=e._get_form();t.open&&e._toggle_block()},_toggle_block:function(){var e=scheduler.form_blocks.recurring,t=e._get_form(),r=e._get_button();t.open||t.blocked?(t.style.height="0px",r&&(r.style.backgroundPosition="-5px 20px",r.nextSibling.innerHTML=scheduler.locale.labels.button_recurring)):(t.style.height="auto",r&&(r.style.backgroundPosition="-5px 0px",r.nextSibling.innerHTML=scheduler.locale.labels.button_recurring_open)),t.open=!t.open,scheduler.setLightboxSize()
},focus:function(){},button_click:function(){scheduler.form_blocks.recurring._toggle_block()}},scheduler._rec_markers={},scheduler._rec_markers_pull={},scheduler._add_rec_marker=function(e,t){e._pid_time=t,this._rec_markers[e.id]=e,this._rec_markers_pull[e.event_pid]||(this._rec_markers_pull[e.event_pid]={}),this._rec_markers_pull[e.event_pid][t]=e},scheduler._get_rec_marker=function(e,t){var r=this._rec_markers_pull[t];return r?r[e]:null},scheduler._get_rec_markers=function(e){return this._rec_markers_pull[e]||[]
},scheduler._rec_temp=[],function(){var e=scheduler.addEvent;scheduler.addEvent=function(){var t=e.apply(this,arguments);if(t){var r=scheduler.getEvent(t);this._is_modified_occurence(r)&&scheduler._add_rec_marker(r,1e3*r.event_length),r.rec_type&&(r.rec_pattern=r.rec_type.split("#")[0])}return t}}(),scheduler.attachEvent("onEventIdChange",function(e,t){if(!this._ignore_call){this._ignore_call=!0,scheduler._rec_markers[e]&&(scheduler._rec_markers[t]=scheduler._rec_markers[e],delete scheduler._rec_markers[e]);
for(var r=0;r<this._rec_temp.length;r++){var a=this._rec_temp[r];a.event_pid==e&&(a.event_pid=t,this.changeEventId(a.id,t+"#"+a.id.split("#")[1]))}delete this._ignore_call}}),scheduler.attachEvent("onConfirmedBeforeEventDelete",function(e){var t=this.getEvent(e);if(this._is_virtual_event(e)||this._is_modified_occurence(t)&&t.rec_type&&"none"!=t.rec_type){e=e.split("#");var r=this.uid(),a=e[1]?e[1]:t._pid_time/1e3,s=this._copy_event(t);s.id=r,s.event_pid=t.event_pid||e[0];var n=a;s.event_length=n,s.rec_type=s.rec_pattern="none",this.addEvent(s),this._add_rec_marker(s,1e3*n)
}else{t.rec_type&&this._lightbox_id&&this._roll_back_dates(t);var i=this._get_rec_markers(e);for(var d in i)i.hasOwnProperty(d)&&(e=i[d].id,this.getEvent(e)&&this.deleteEvent(e,!0))}return!0}),scheduler.attachEvent("onEventDeleted",function(e,t){!this._is_virtual_event(e)&&this._is_modified_occurence(t)&&(scheduler._events[e]||(t.rec_type=t.rec_pattern="none",this.setEvent(e,t)))}),scheduler.attachEvent("onEventChanged",function(e){if(this._loading)return!0;var t=this.getEvent(e);if(this._is_virtual_event(e)){var e=e.split("#"),r=this.uid();
this._not_render=!0;var a=this._copy_event(t);a.id=r,a.event_pid=e[0];var s=e[1];a.event_length=s,a.rec_type=a.rec_pattern="",this._add_rec_marker(a,1e3*s),this.addEvent(a),this._not_render=!1}else{t.rec_type&&this._lightbox_id&&this._roll_back_dates(t);var n=this._get_rec_markers(e);for(var i in n)n.hasOwnProperty(i)&&(delete this._rec_markers[n[i].id],this.deleteEvent(n[i].id,!0));delete this._rec_markers_pull[e];for(var d=!1,l=0;l<this._rendered.length;l++)this._rendered[l].getAttribute("event_id")==e&&(d=!0);
d||(this._select_id=null)}return!0}),scheduler.attachEvent("onEventAdded",function(e){if(!this._loading){var t=this.getEvent(e);t.rec_type&&!t.event_length&&this._roll_back_dates(t)}return!0}),scheduler.attachEvent("onEventSave",function(e,t){var r=this.getEvent(e);return r.rec_type||!t.rec_type||this._is_virtual_event(e)||(this._select_id=null),!0}),scheduler.attachEvent("onEventCreated",function(e){var t=this.getEvent(e);return t.rec_type||(t.rec_type=t.rec_pattern=t.event_length=t.event_pid=""),!0
}),scheduler.attachEvent("onEventCancel",function(e){var t=this.getEvent(e);t.rec_type&&(this._roll_back_dates(t),this.render_view_data())}),scheduler._roll_back_dates=function(e){e.event_length=(e.end_date.valueOf()-e.start_date.valueOf())/1e3,e.end_date=e._end_date,e._start_date&&(e.start_date.setMonth(0),e.start_date.setDate(e._start_date.getDate()),e.start_date.setMonth(e._start_date.getMonth()),e.start_date.setFullYear(e._start_date.getFullYear()))},scheduler._is_virtual_event=function(e){return-1!=e.toString().indexOf("#")
},scheduler._is_modified_occurence=function(e){return e.event_pid&&"0"!=e.event_pid},scheduler._validId=function(e){return!this._is_virtual_event(e)},scheduler.showLightbox_rec=scheduler.showLightbox,scheduler.showLightbox=function(e){var t=this.locale,r=scheduler.config.lightbox_recurring,a=this.getEvent(e),s=a.event_pid,n=this._is_virtual_event(e);n&&(s=e.split("#")[0]);var i=function(e){var t=scheduler.getEvent(e);return t._end_date=t.end_date,t.end_date=new Date(t.start_date.valueOf()+1e3*t.event_length),scheduler.showLightbox_rec(e)
};if((s||1*s===0)&&a.rec_type)return i(e);if(!s||"0"===s||!t.labels.confirm_recurring||"instance"==r||"series"==r&&!n)return this.showLightbox_rec(e);if("ask"==r){var d=this;dhtmlx.modalbox({text:t.labels.confirm_recurring,title:t.labels.title_confirm_recurring,width:"500px",position:"middle",buttons:[t.labels.button_edit_series,t.labels.button_edit_occurrence,t.labels.icon_cancel],callback:function(t){switch(+t){case 0:return i(s);case 1:return d.showLightbox_rec(e);case 2:return}}})}else i(s)},scheduler.get_visible_events_rec=scheduler.get_visible_events,scheduler.get_visible_events=function(e){for(var t=0;t<this._rec_temp.length;t++)delete this._events[this._rec_temp[t].id];
this._rec_temp=[];for(var r=this.get_visible_events_rec(e),a=[],t=0;t<r.length;t++)r[t].rec_type?"none"!=r[t].rec_pattern&&this.repeat_date(r[t],a):a.push(r[t]);return a},function(){var e=scheduler.isOneDayEvent;scheduler.isOneDayEvent=function(t){return t.rec_type?!0:e.call(this,t)};var t=scheduler.updateEvent;scheduler.updateEvent=function(e){var r=scheduler.getEvent(e);r&&r.rec_type&&(r.rec_pattern=(r.rec_type||"").split("#")[0]),r&&r.rec_type&&!this._is_virtual_event(e)?scheduler.update_view():t.call(this,e)
}}(),scheduler.transponse_size={day:1,week:7,month:1,year:12},scheduler.date.day_week=function(e,t,r){e.setDate(1),r=7*(r-1);var a=e.getDay(),s=1*t+r-a+1;e.setDate(r>=s?s+7:s)},scheduler.transpose_day_week=function(e,t,r,a,s){for(var n=(e.getDay()||(scheduler.config.start_on_monday?7:0))-r,i=0;i<t.length;i++)if(t[i]>n)return e.setDate(e.getDate()+1*t[i]-n-(a?r:s));this.transpose_day_week(e,t,r+a,null,r)},scheduler.transpose_type=function(e){var t="transpose_"+e;if(!this.date[t]){var r=e.split("_"),a=864e5,s="add_"+e,n=this.transponse_size[r[0]]*r[1];
if("day"==r[0]||"week"==r[0]){var i=null;if(r[4]&&(i=r[4].split(","),scheduler.config.start_on_monday)){for(var d=0;d<i.length;d++)i[d]=1*i[d]||7;i.sort()}this.date[t]=function(e,t){var r=Math.floor((t.valueOf()-e.valueOf())/(a*n));r>0&&e.setDate(e.getDate()+r*n),i&&scheduler.transpose_day_week(e,i,1,n)},this.date[s]=function(e,t){var r=new Date(e.valueOf());if(i)for(var a=0;t>a;a++)scheduler.transpose_day_week(r,i,0,n);else r.setDate(r.getDate()+t*n);return r}}else("month"==r[0]||"year"==r[0])&&(this.date[t]=function(e,t){var a=Math.ceil((12*t.getFullYear()+1*t.getMonth()-(12*e.getFullYear()+1*e.getMonth()))/n);
a>=0&&e.setMonth(e.getMonth()+a*n),r[3]&&scheduler.date.day_week(e,r[2],r[3])},this.date[s]=function(e,t){var a=new Date(e.valueOf());return a.setMonth(a.getMonth()+t*n),r[3]&&scheduler.date.day_week(a,r[2],r[3]),a})}},scheduler.repeat_date=function(e,t,r,a,s){a=a||this._min_date,s=s||this._max_date;var n=new Date(e.start_date.valueOf());for(!e.rec_pattern&&e.rec_type&&(e.rec_pattern=e.rec_type.split("#")[0]),this.transpose_type(e.rec_pattern),scheduler.date["transpose_"+e.rec_pattern](n,a);n<e.start_date||scheduler._fix_daylight_saving_date(n,a,e,n,new Date(n.valueOf()+1e3*e.event_length)).valueOf()<=a.valueOf()||n.valueOf()+1e3*e.event_length<=a.valueOf();)n=this.date.add(n,1,e.rec_pattern);
for(;s>n&&n<e.end_date;){var i=scheduler.config.occurrence_timestamp_in_utc?Date.UTC(n.getFullYear(),n.getMonth(),n.getDate(),n.getHours(),n.getMinutes(),n.getSeconds()):n.valueOf(),d=this._get_rec_marker(i,e.id);if(d)r&&t.push(d);else{var l=new Date(n.valueOf()+1e3*e.event_length),o=this._copy_event(e);if(o.text=e.text,o.start_date=n,o.event_pid=e.id,o.id=e.id+"#"+Math.ceil(i/1e3),o.end_date=l,o.end_date=scheduler._fix_daylight_saving_date(o.start_date,o.end_date,e,n,o.end_date),o._timed=this.isOneDayEvent(o),!o._timed&&!this._table_view&&!this.config.multi_day)return;
t.push(o),r||(this._events[o.id]=o,this._rec_temp.push(o))}n=this.date.add(n,1,e.rec_pattern)}},scheduler._fix_daylight_saving_date=function(e,t,r,a,s){var n=e.getTimezoneOffset()-t.getTimezoneOffset();return new Date(n?n>0?a.valueOf()+1e3*r.event_length-60*n*1e3:t.valueOf()-60*n*1e3:s.valueOf())},scheduler.getRecDates=function(e,t){var r="object"==typeof e?e:scheduler.getEvent(e),a=0,s=[];t=t||100;var n=new Date(r.start_date.valueOf()),i=new Date(n.valueOf());if(!r.rec_type)return[{start_date:r.start_date,end_date:r.end_date}];
if("none"==r.rec_type)return[];for(this.transpose_type(r.rec_pattern),scheduler.date["transpose_"+r.rec_pattern](n,i);n<r.start_date||n.valueOf()+1e3*r.event_length<=i.valueOf();)n=this.date.add(n,1,r.rec_pattern);for(;n<r.end_date;){var d=this._get_rec_marker(n.valueOf(),r.id),l=!0;if(d)"none"==d.rec_type?l=!1:s.push({start_date:d.start_date,end_date:d.end_date});else{var o=new Date(n),_=new Date(n.valueOf()+1e3*r.event_length);_=scheduler._fix_daylight_saving_date(o,_,r,n,_),s.push({start_date:o,end_date:_})
}if(n=this.date.add(n,1,r.rec_pattern),l&&(a++,a==t))break}return s},scheduler.getEvents=function(e,t){var r=[];for(var a in this._events){var s=this._events[a];if(s&&s.start_date<t&&s.end_date>e)if(s.rec_pattern){if("none"==s.rec_pattern)continue;var n=[];this.repeat_date(s,n,!0,e,t);for(var i=0;i<n.length;i++)!n[i].rec_pattern&&n[i].start_date<t&&n[i].end_date>e&&!this._rec_markers[n[i].id]&&r.push(n[i])}else this._is_virtual_event(s.id)||r.push(s)}return r},scheduler.config.repeat_date="%m.%d.%Y",scheduler.config.lightbox.sections=[{name:"description",height:130,map_to:"text",type:"textarea",focus:!0},{name:"recurring",type:"recurring",map_to:"rec_type",button:"recurring"},{name:"time",height:72,type:"time",map_to:"auto"}],scheduler._copy_dummy=function(){var e=new Date(this.start_date),t=new Date(this.end_date);
this.start_date=e,this.end_date=t,this.event_length=this.event_pid=this.rec_pattern=this.rec_type=null},scheduler.config.include_end_by=!1,scheduler.config.lightbox_recurring="ask",scheduler.attachEvent("onClearAll",function(){scheduler._rec_markers={},scheduler._rec_markers_pull={},scheduler._rec_temp=[]}),scheduler.__recurring_template='<div class="dhx_form_repeat"> <form> <div class="dhx_repeat_left"> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="day" />Daily</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="week"/>Weekly</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="month" checked />Monthly</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="repeat" value="year" />Yearly</label> </div> <div class="dhx_repeat_divider"></div> <div class="dhx_repeat_center"> <div style="display:none;" id="dhx_repeat_day"> <label><input class="dhx_repeat_radio" type="radio" name="day_type" value="d"/>Every</label><input class="dhx_repeat_text" type="text" name="day_count" value="1" />day<br /> <label><input class="dhx_repeat_radio" type="radio" name="day_type" checked value="w"/>Every workday</label> </div> <div style="display:none;" id="dhx_repeat_week"> Repeat every<input class="dhx_repeat_text" type="text" name="week_count" value="1" />week next days:<br /> <table class="dhx_repeat_days"> <tr> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="1" />Monday</label><br /> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="4" />Thursday</label> </td> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="2" />Tuesday</label><br /> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="5" />Friday</label> </td> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="3" />Wednesday</label><br /> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="6" />Saturday</label> </td> <td> <label><input class="dhx_repeat_checkbox" type="checkbox" name="week_day" value="0" />Sunday</label><br /><br /> </td> </tr> </table> </div> <div id="dhx_repeat_month"> <label><input class="dhx_repeat_radio" type="radio" name="month_type" value="d"/>Repeat</label><input class="dhx_repeat_text" type="text" name="month_day" value="1" />day every<input class="dhx_repeat_text" type="text" name="month_count" value="1" />month<br /> <label><input class="dhx_repeat_radio" type="radio" name="month_type" checked value="w"/>On</label><input class="dhx_repeat_text" type="text" name="month_week2" value="1" /><select name="month_day2"><option value="1" selected >Monday<option value="2">Tuesday<option value="3">Wednesday<option value="4">Thursday<option value="5">Friday<option value="6">Saturday<option value="0">Sunday</select>every<input class="dhx_repeat_text" type="text" name="month_count2" value="1" />month<br /> </div> <div style="display:none;" id="dhx_repeat_year"> <label><input class="dhx_repeat_radio" type="radio" name="year_type" value="d"/>Every</label><input class="dhx_repeat_text" type="text" name="year_day" value="1" />day<select name="year_month"><option value="0" selected >January<option value="1">February<option value="2">March<option value="3">April<option value="4">May<option value="5">June<option value="6">July<option value="7">August<option value="8">September<option value="9">October<option value="10">November<option value="11">December</select>month<br /> <label><input class="dhx_repeat_radio" type="radio" name="year_type" checked value="w"/>On</label><input class="dhx_repeat_text" type="text" name="year_week2" value="1" /><select name="year_day2"><option value="1" selected >Monday<option value="2">Tuesday<option value="3">Wednesday<option value="4">Thursday<option value="5">Friday<option value="6">Saturday<option value="7">Sunday</select>of<select name="year_month2"><option value="0" selected >January<option value="1">February<option value="2">March<option value="3">April<option value="4">May<option value="5">June<option value="6">July<option value="7">August<option value="8">September<option value="9">October<option value="10">November<option value="11">December</select><br /> </div> </div> <div class="dhx_repeat_divider"></div> <div class="dhx_repeat_right"> <label><input class="dhx_repeat_radio" type="radio" name="end" checked/>No end date</label><br /> <label><input class="dhx_repeat_radio" type="radio" name="end" />After</label><input class="dhx_repeat_text" type="text" name="occurences_count" value="1" />occurrences<br /> <label><input class="dhx_repeat_radio" type="radio" name="end" />End by</label><input class="dhx_repeat_date" type="text" name="date_of_end" value="'+scheduler.config.repeat_date_of_end+'" /><br /> </div> </form> </div> <div style="clear:both"> </div>';

//# sourceMappingURL=../sources/ext/dhtmlxscheduler_recurring.js.map
/*
dhtmlxScheduler v.4.2.0 Stardard

This software is covered by GPL license. You also can obtain Commercial or Enterprise license to use it in non-GPL project - please contact sales@dhtmlx.com. Usage without proper license is prohibited.

(c) Dinamenta, UAB.
*/
scheduler.load=function(e,t){var s;return"string"==typeof t&&(this._process=t,s=t,t=arguments[2]),this._load_url=e,this._after_call=t,e.$proxy?void e.load(this,"string"==typeof s?s:null):void this._load(e,this._date)},scheduler._dp_init_backup=scheduler._dp_init,scheduler._dp_init=function(e){e._sendData=function(e,t){if(e){if(!this.callEvent("onBeforeDataSending",t?[t,this.getState(t),e]:[null,null,e]))return!1;if(t&&(this._in_progress[t]=(new Date).valueOf()),this.serverProcessor.$proxy){var s="POST"!=this._tMode?"get":"post",r=[];
for(var a in e)r.push({id:a,data:e[a],operation:this.getState(a)});return void this.serverProcessor._send(r,s,this)}var i=new dtmlXMLLoaderObject(this.afterUpdate,this,!0),n=this.serverProcessor+(this._user?getUrlSymbol(this.serverProcessor)+["dhx_user="+this._user,"dhx_version="+this.obj.getUserData(0,"version")].join("&"):"");"POST"!=this._tMode?i.loadXML(n+(-1!=n.indexOf("?")?"&":"?")+this.serialize(e,t)):i.loadXML(n,!0,this.serialize(e,t)),this._waitMode++}},e._updatesToParams=function(e){for(var t={},s=0;s<e.length;s++)t[e[s].id]=e[s].data;
return this.serialize(t)},e._processResult=function(e,t,s){if(200==s.status)t=new dtmlXMLLoaderObject(function(){},this,!0),t.loadXMLString(e),t.xmlDoc=s,this.afterUpdate(this,null,null,null,t);else for(var r in this._in_progress){var a=this.getState(r);this.afterUpdateCallback(r,r,a,null)}},this._dp_init_backup(e)},window.dataProcessor&&(dataProcessor.prototype.init=function(e){this.init_original(e),e._dataprocessor=this,this.setTransactionMode("POST",!0),this.serverProcessor.$proxy||(this.serverProcessor+=(-1!=this.serverProcessor.indexOf("?")?"&":"?")+"editing=true")
});
//# sourceMappingURL=../sources/ext/dhtmlxscheduler_offline.js.map
/**
 * Created by JetBrains RubyMine.
 * User: vanderg
 * Date: 23/03/12
 * Time: 3:21 PM
 * To change this template use File | Settings | File Templates.
 */

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//DD Tab Menu- Script rewritten April 27th, 07: http://www.dynamicdrive.com
//**Updated Feb 23rd, 08): Adds ability for menu to revert back to default selected tab when mouse moves out of menu

//Only 2 configuration variables below:


var ddtabmenu={
	disabletablinks: true, //Disable hyperlinks in 1st level tabs with sub contents (true or false)?
	snap2original: [false, 300], //Should tab revert back to default selected when mouse moves out of menu? ([true/false, delay_millisec]

	currentpageurl: window.location.href.replace("http://"+window.location.hostname, "").replace(/^\//, ""), //get current page url (minus hostname, ie: http://www.dynamicdrive.com/)

definemenu:function(tabid, dselected){
	this[tabid+"-menuitems"]=null;
	this[tabid+"-dselected"]=-1;
	this.addEvent(window, function(){ddtabmenu.init(tabid, dselected)}, "load")
},

showsubmenu:function(tabid, targetitem){
	var menuitems=this[tabid+"-menuitems"]
	this.clearrevert2default(tabid)
 for (i=0; i<menuitems.length; i++){
		menuitems[i].className=""
		if (typeof menuitems[i].hasSubContent!="undefined")
			document.getElementById(menuitems[i].getAttribute("rel")).style.display="none"
	}
	targetitem.className="current"
	if (typeof targetitem.hasSubContent!="undefined")
		document.getElementById(targetitem.getAttribute("rel")).style.display="block"
},

isSelected:function(menuurl){
	var menuurl=menuurl.replace("http://"+menuurl.hostname, "").replace(/^\//, "")
	return (ddtabmenu.currentpageurl==menuurl)
},

isContained:function(m, e){
	var e=window.event || e
	var c=e.relatedTarget || ((e.type=="mouseover")? e.fromElement : e.toElement)
	while (c && c!=m)try {c=c.parentNode} catch(e){c=m}
	if (c==m)
		return true
	else
		return false
},

revert2default:function(outobj, tabid, e){
	if (!ddtabmenu.isContained(outobj, tabid, e)){
		window["hidetimer_"+tabid]=setTimeout(function(){
			ddtabmenu.showsubmenu(tabid, ddtabmenu[tabid+"-dselected"])
		}, ddtabmenu.snap2original[1])
	}
},

clearrevert2default:function(tabid){
 if (typeof window["hidetimer_"+tabid]!="undefined")
		clearTimeout(window["hidetimer_"+tabid])
},

addEvent:function(target, functionref, tasktype){ //assign a function to execute to an event handler (ie: onunload)
	var tasktype=(window.addEventListener)? tasktype : "on"+tasktype;
	if (target.addEventListener)
		target.addEventListener(tasktype, functionref, false)
	else if (target.attachEvent)
		target.attachEvent(tasktype, functionref)
},

init:function(tabid, dselected){
    if (!document.getElementById(tabid)) { return false; } //Added by Glen :: If the tabs are not required, then don't initialize
var menuitems=document.getElementById(tabid).getElementsByTagName("a");
	this[tabid+"-menuitems"]=menuitems;
	for (var x=0; x<menuitems.length; x++){
		if (menuitems[x].getAttribute("rel")){
			this[tabid+"-menuitems"][x].hasSubContent=true;
			if (ddtabmenu.disabletablinks)
				menuitems[x].onclick=function(){return false};
			if (ddtabmenu.snap2original[0]==true){
				var submenu=document.getElementById(menuitems[x].getAttribute("rel"))
				menuitems[x].onclick=function(e){ddtabmenu.revert2default(submenu, tabid, e)}
				submenu.onclick=function(){ddtabmenu.clearrevert2default(tabid)}
				submenu.onclick=function(e){ddtabmenu.revert2default(this, tabid, e)}
			}
		}
		else //for items without a submenu, add onMouseout effect
			menuitems[x].onmouseout=function(e){this.className=""; if (ddtabmenu.snap2original[0]==true) ddtabmenu.revert2default(this, tabid, e)}
		menuitems[x].onclick=function(){ddtabmenu.showsubmenu(tabid, this)}
		if (dselected=="auto" && typeof setalready=="undefined" && this.isSelected(menuitems[x].href)){
			ddtabmenu.showsubmenu(tabid, menuitems[x])
			this[tabid+"-dselected"]=menuitems[x]
			var setalready=true
		}
		else if (parseInt(dselected)==x){
			ddtabmenu.showsubmenu(tabid, menuitems[x])
			this[tabid+"-dselected"]=menuitems[x]
		}
	}
}
}
//initialize Tab Menu with ID "ddtabs1" and select 1st tab by default
ddtabmenu.definemenu("ddtabs1", 0);

function remove_fields(link) {
       $(link).prev("input[type=hidden]").val("1");
       $(link).closest(".fields").hide();
       }

       function add_fields(link, association, content) {
       var new_id = new Date().getTime();
       var regexp = new RegExp("new_" + association, "g")
       $(link).parent().before(content.replace(regexp, new_id));
       }


/* Used for JQuery Toggle effect to show or hide a div with the id of "effect". Class of hide make the div hidden by default*/
// EXAMPLE::
// <input type="submit" value="Post a Reply" id="button" />
//  <div id="effect" class="hide">
//    <%= render :partial => 'replies/form' %>
//  </div>

$(function() {
              // run the currently selected effect
function runEffect() {
                  // get effect type from
                  var selectedEffect = $( "#effectTypes" ).val();

                  // most effect types need no options passed by default
                  var options = {};
                  // some effects have required parameters
                  if ( selectedEffect === "scale" ) {
                      options = { percent: 0 };
                  } else if ( selectedEffect === "size" ) {
                      options = { to: { width: 200, height: 60 } };
                  }

                  // run the effect
                  $( "#effect" ).toggle( selectedEffect, options, 1000 );
              };

              // set effect from select menu value
              $( "#button" ).click(function() {
                  runEffect();
                  return false;
              });


function remove_fields(link) {
       $(link).prev("input[type=hidden]").val("1");
       $(link).closest("#fields").hide();
       }

function add_fields(link, association, content) {
       var new_id = new Date().getTime();
       var regexp = new RegExp("new_" + association, "g");
       $(link).parent().before(content.replace(regexp, new_id));
//        $(link).after(content.replace(regexp, new_id));
       }


 });




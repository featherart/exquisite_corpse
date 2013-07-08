// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

function drawingTypeChanged() {
	var opt = drawing_drawing_type_id.selectedIndex;
	var can = document.getElementById('drawing');
	if( opt == 1 ) {
		can.className="canvas-new-head";
		alert("please draw down to grey bar on bottom!");
	}
	else if( opt == 2 ) {
		can.className="canvas-new-torso";
		alert("please draw down to grey bars on either side!");
	}
	else if( opt == 3 ) {
		can.className="canvas-new-legs";
		alert("please draw down to grey bar on top!");
	}
	else {
		can.className="canvas-new-head";
		alert("please draw down to grey bar on bottom!");
	}
}

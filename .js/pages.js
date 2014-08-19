var markdown = require( "markdown" ).markdown;
var homeParsed;
var rootParsed;
var restoreParsed;
var iceParsed;
var hellfireParsed;
var plasmaParsed;
var extrasParsed;
var home = $.get('../.pages/home.txt',function(data){homeParsed = markdown.toHTML(data)});
var root = $.get('../.pages/root.txt',function(data){rootParsed = "<input type='button' id='rootBtn' class='tool oneBtn' value='Root Kindle'></input><br />"+markdown.toHTML(data)});
var restore = $.get('../.pages/restore.txt',function(data){restoreParsed = "<input type='button' id='restoreBtn' class='tool oneBtn' value='Restore Kindle'></input><br />"+markdown.toHTML(data)});
var ice = $.get('../.pages/roms/ice.txt',function(data){iceParsed = "<input type='button' id='iceBtn' class='tool oneBtn' value='Install Ice'></input><br />"+markdown.toHTML(data)});
var hellfire = $.get('../.pages/roms/hellfire.txt',function(data){hellfireParsed = "<input type='button' id='hellfireBtn' class='tool oneBtn' value='Install Hellfire'></input><br />"+markdown.toHTML(data)});
var plasma = $.get('../.pages/roms/plasma.txt',function(data){plasmaParsed = "<input type='button' id='plasmaBtn' class='tool oneBtn' value='Install Plasma'></input><br />"+markdown.toHTML(data)});
var extras = $.get('../.pages/extras.txt',function(data){extrasParsed = markdown.toHTML(data)});

$(document).ready(function(){
  $('#content').html(homeParsed);
    $("#rootLink").click(function(){
	      $('#content').html(rootParsed)
		  });
    $("#restoreLink").click(function(){
	      $('#content').html(restoreParsed)
	      });
	$("#iceLink").click(function(){
	      $('#content').html(iceParsed)
	      });
	$("#hellfireLink").click(function(){
	      $('#content').html(hellfireParsed)
		  });
	$("#plasmaLink").click(function(){
	      $('#content').html(plasmaParsed)
		  });
	$("#extrasLink").click(function(){
	      $('#content').html(extrasParsed)
		  });
	
});
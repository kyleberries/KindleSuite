var root = 
"Android rooting is the process of allowing users of smartphones, tablets, and other devices running the Android mobile operating system to attain privileged control (known as \"root access\") within Android's sub-system.<br /><br />YOU MUST ROOT YOUR DEVICE TO DO ANYTHING ELSE IN KINDLESUITE<br />YOU MUST HAVE A FASTBTOOT CABLE TO ROOT<br /> <input class='tool' type='button' value='Root Device'></input>";
var restore = 
"This is the restore page";
var ice = 
"This is the ice page";
var hellfire = 
"This is the hellfire page";
var plasma = 
"This is the plasma page";
var extras = 
"This is the extras page";

$(document).ready(function(){
  $("#rootLink").click(function(){
    $("#content").html(root);
  });
  $("#restoreLink").click(function(){
    $("#content").html(restore);
  });
  $("#iceLink").click(function(){
    $("#content").html(ice);
  });
  $("#hellfireLink").click(function(){
    $("#content").html(hellfire);
  });
  $("#plasmaLink").click(function(){
    $("#content").html(plasma);
  });
  $("#extrasLink").click(function(){
    $("#content").html(extras);
  });
});
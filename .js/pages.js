var root = 
"Android rooting is the process of allowing users of smartphones, tablets, and other devices running the Android mobile operating system to attain privileged control (known as \"root access\") within Android's sub-system.<br /><br />YOU MUST ROOT YOUR DEVICE TO DO ANYTHING ELSE IN KINDLESUITE<br />YOU MUST HAVE A FASTBTOOT CABLE TO ROOT<br /> <br /><input id='rootBtn' class='tool oneBtn' type='button' value='Root Device'></input>";
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
    $("#content").hide(0).html(root).fadeIn(500);
  });
  $("#restoreLink").click(function(){
     $("#content").hide(0).html(restore).fadeIn(500);
  });
  $("#iceLink").click(function(){
    $("#content").hide(0).html(ice).fadeIn(500);
  });
  $("#hellfireLink").click(function(){
    $("#content").hide(0).html(hellfire).fadeIn(500);
  });
  $("#plasmaLink").click(function(){
    $("#content").hide(0).html(plasma).fadeIn(500);
  });
  $("#extrasLink").click(function(){
    $("#content").hide(0).html(extras).fadeIn(500);
  });
});
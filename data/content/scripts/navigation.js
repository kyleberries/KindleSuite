$(document).ready(function(){
 $(".title1").fadeOut(0);
 $(".title1").load($(".title1").fadeIn(2000));
 $(".title2").fadeOut(0);
 $(".title2").load($(".title2").fadeIn(2000));
  $("#driverBtn").click(function(){
    $("div.content").fadeOut(500);
    $("#drivers").delay(500).fadeIn(500);
  });
   $("#rootBtn").click(function(){
    $("div.content").fadeOut(500);
    $("#root").delay(500).fadeIn(500);
  });
   $("#restoreBtn").click(function(){
   $("div.content").fadeOut(500);   
   $("#restore").delay(500).fadeIn(500);
  });
   $("#gappsBtn").click(function(){
    $("div.content").fadeOut(500);
    $("#gapps").delay(500).fadeIn(500);
  });
   $("#romsBtn").click(function(){
    $("div.content").fadeOut(500);
    $("#roms").delay(500).fadeIn(500);
  });
   $("#extrasBtn").click(function(){
    $("div.content").fadeOut(500);
    $("#extras").delay(500).fadeIn(500);
  });
});

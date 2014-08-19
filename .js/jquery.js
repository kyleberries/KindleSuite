$(document).ready(function(){

  $('.romLink').click(function(){
     $('.toggle').toggle('slow');             
    });

  /*$('#rootBtn').click(function(){
 var fbdg = window.open('file:///./fastbootDg.'+fastbootSuffix);
 window.open('file:///./fastbootDg.'+fastbootSuffix);
 $('#console').text('Kernel downgrading, please enter FASTBOOT.');
   setInterval(function(){
  if (fbdg.closed) {$('#console').text('Kernel downgrade complete.');
                       kindleRoot();}
     }),3000);
// when above closes, run adbShell() commands
//open file    'fastbootUg.'+fastbootSuffix;
// when above closes console=finished
    });*/
	});
});
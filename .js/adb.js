var Promise = require('bluebird');
var whichOs = require('which-os');
var adb = require('adbkit');
var client = adb.createClient();
var kfsowi = null;
var fastbootSuffix;
var currentOs = whichOs().search("Windows");

if(currentOs != -1) fastbootSuffix = "cmd";
else if(currentOs = -1) fastbootSuffix = "sh";

//[HMTL]   Disabled in body onload
//[CSS]   .tool display needs to be changed to none to enable this function
function kindleCheck(){
     setInterval(function(){
client.listDevices()
  .then(function(devices) {
   if (devices.length <= 0) {$('.tool').css('display','none'); throw new Error('No Device Detected.')};
    return Promise.filter(devices, function(device) {
      return client.getProperties(device.id)
        .then(function(properties) {
          if(properties['ro.product.model'] != "KFSOWI" && properties['ro.product.model'] != "") {	$('.tool').css('display','none');
		  throw new Error('Wrong Device. KS WILL brick this device');
        }})
    })
  })
  .then(function(supportedDevices) {
    $('#detector').text('KFSOWI detected: '+ supportedDevices);
	$('.tool').css('display','block');
	$('#detector').css('color','red');
  })
  .catch(function(err) {
    $('#detector').text(err)
  })},1000)};
  
  
function adbInstall(apk){
client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.install(device.id, apk)
    })
  })
  .then(function() {
    $('#console').text('Installed %s on all connected devices', apk)
  })
  .catch(function(err) {
    $('#console').text('Error: ', err)
  })};
  

function adbPush(local,kindle){
client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.push(device.id, local, kindle)
        .then(function(transfer) {
          return new Promise(function(resolve, reject) {
            transfer.on('progress', function(stats) {
              $('#console').text('[%s] Pushed %d bytes so far',
                device.id,
                stats.bytesTransferred)
            })
            transfer.on('end', function() {
              $('#console').text('[%s] Push complete', device.id)
              resolve()
            })
            transfer.on('error', reject)
          })
        })
    })
  })
  .then(function() {
    $('#console').text('File upload complete.')
  })
  .catch(function(err) {
    $('#console').text('Error: ', err.stack)
  })
};
  
 
function adbShell(command){
  client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.shell(device.id, command)
    })
  })
  .then(function() {
    $('#console').text(command+' completed.')
  })
  .catch(function(err) {
    $('#console').text('Error: ', err)
  })};
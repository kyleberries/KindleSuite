var Promise = require('bluebird');
var adb = require('adbkit');
var client = adb.createClient();
var kfsowi = null;

window.onunload= $('.tool').css('display','block');

function kindleCheck(){
client.listDevices()
  .then(function(devices) {
   if (devices.length <= 0) throw new Error('No Device Detected.');
    return Promise.filter(devices, function(device) {
      return client.getProperties(device.id)
        .then(function(properties) {
          if(properties['ro.product.model'] = "KFSOWI"){ $('#detector').text('KFSOWI detected: '+device.id);
		  kfsowi = device.id;};
		  if(properties['ro.product.model'] != "KFSOWI") {
		  $('.tool').css('display','none')
		  kfsowi = null;};
        })
    })
  })
  .catch(function(err) {
    $('#detector').text(err)
  })};

  
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
      return client.push(kfsowi, local, kindle)
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
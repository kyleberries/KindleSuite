var Promise = require('bluebird');
var adb = require('adbkit');
var client = adb.createClient();
var kfsowi;


/*function kindleCheck(){
     setInterval(function(){
client.listDevices()
  .then(function(devices) {
   if (devices.length <= 0) throw new Error('No Device Detected.');
    return Promise.filter(devices, function(device) {
      return client.getProperties(device.id)
        .then(function(properties) {
          if(properties['ro.product.model'] != "KFSOWI" && properties['ro.product.model'] != "") throw new Error('Wrong Device. KS WILL brick this device');
        })
    })
  })
  .then(function(supportedDevices) {
    $('#detector').text('KFSOWI detected: '+ supportedDevices);
  })
  .catch(function(err) {
    $('#detector').text(err)
  })},1000)};*/
  
  client.trackDevices()
  .then(function(tracker) {
    tracker.on('add', function(device) {
      $('#detector').text('Device %s was plugged in', device.id)
    })
    tracker.on('remove', function(device) {
      $('#detector').text('Device %s was unplugged', device.id)
    })
    tracker.on('end', function() {
      $('#detector').text('Tracking stopped')
    })
  })
  .catch(function(err) {
    $('#detector').text('Something went wrong:', err.stack)
  })
  

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
  

function adbPush(source,dest){
  client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.push(device.id, source, dest)
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
    $('#console').text('Done pushing '+source+' to '+dest)
  })
  .catch(function(err) {
    $('#console').text('Error: ', err)
  })};
  
 
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
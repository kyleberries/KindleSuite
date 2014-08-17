var Promise = require('bluebird');
var adb = require('adbkit');
var client = adb.createClient();


function kindleCheck(){
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
    $('#console').text('KFSOWI detected: '+ supportedDevices)
  })
  .catch(function(err) {
    $('#console').text(err)
  })};
  

function adbInstall(apk){
client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.install(device.id, apk)
    })
  })
  .then(function() {
    console.log('Installed %s on all connected devices', apk)
  })
  .catch(function(err) {
    console.error('Something went wrong:', err.stack)
  })};
  

function adbPush(source,dest){
  client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.push(device.id, source, dest)
        .then(function(transfer) {
          return new Promise(function(resolve, reject) {
            transfer.on('progress', function(stats) {
              console.log('[%s] Pushed %d bytes so far',
                device.id,
                stats.bytesTransferred)
            })
            transfer.on('end', function() {
              console.log('[%s] Push complete', device.id)
              resolve()
            })
            transfer.on('error', reject)
          })
        })
    })
  })
  .then(function() {
    console.log('Done pushing foo.txt to all connected devices')
  })
  .catch(function(err) {
    console.error('Something went wrong:', err.stack)
  })};
  
 
function adbShell(command){
  client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.shell(device.id, command)
    })
  })
  .then(function() {
    console.log(command+' completed.')
  })
  .catch(function(err) {
    console.error('Error: ', err)
  })};
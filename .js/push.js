var Promise = require('bluebird');
var adb = require('adbkit');
var client = adb.createClient();
function adbPush(pushFile,pushFileDest){
client.listDevices()
  .then(function(devices) {
  if (devices.length <= 0) throw new Error('No device detected!');
    return Promise.map(devices, function(device) {
      return client.push(device.id, pushFile, pushFileDest)
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
    alert('Done pushing file to all connected devices')
  })
  .catch(function(err) {
    alert('Something went wrong:', err.stack)
  })};
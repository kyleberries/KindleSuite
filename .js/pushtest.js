var Promise = require('bluebird')
var adb = require('adbkit')
var client = adb.createClient()

client.listDevices()
  .then(function(devices) {
    return Promise.map(devices, function(device) {
      return client.push(device.id, 'test.txt', '/data/local/tmp/foo.txt')
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
    alert('Done pushing foo.txt to all connected devices')
  })
  .catch(function(err) {
    alert('Something went wrong:', err.stack)
  })
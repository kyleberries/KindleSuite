var Promise = require('bluebird')
var adb = require('adbkit')
var client = adb.createClient()

client.listDevices()
  .then(function(devices) {
   if (devices.length <= 0) throw new Error('No Device Detected.');
    return Promise.filter(devices, function(device) {
      return client.getProperties(device.id)
        .then(function(properties) {
          if(properties['ro.product.model'] != "KFSOWI") throw new Error('Wrong Device. KS WILL brick this device');
        })
    })
  })
  .then(function(supportedDevices) {
    $('#console').text('KFSOWI detected: '+ supportedDevices)
  })
  .catch(function(err) {
    $('#console').text(err)
  })
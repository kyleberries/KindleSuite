var adb = require('adbkit');
var client = adb.createClient();
var Promise = require('bluebird');

function checkDevices(){
client.listDevices().then(function(devices){
if(devices.length != 0) {alert('Device Detected!')}
else {alert('NO Device Detected!')}
})
};


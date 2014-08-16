var adb = require('adbkit');
var client = adb.createClient();
var Promise = require('bluebird');

function checkDevices(){
client.listDevices().then(function(devices){
if(devices != "") {alert('device detected')}
else {alert('no devices')}
})
};

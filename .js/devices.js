var adb = require('adbkit');
var client = adb.createClient();
var Promise = require('bluebird');

function checkDevices(){
client.listDevices().then(function(devices){
if(devices != "") {$('#console').text('Device Detected!')}
else {$('#console').text('NO Device Detected!')}
})
};


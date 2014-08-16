var adb = require('adbkit');
var client = adb.createClient();
var Promise = require('bluebird');

function checkDevices(){
client.listDevices().then(function(devices){
if(devices.length != 0) {
/*grep ro.product.model from build.prop to var model
 If (model != "ro.product.model=KFSOWI" && model.length != 0) {alert('KindleSuite does not work with this device')}
 else {continue}
 */
alert('Device Detected!')
}
else {
alert('NO Device Detected! Click KindleSuite title to check again.')
}
client.kill(device);
})
};

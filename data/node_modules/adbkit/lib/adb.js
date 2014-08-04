(function() {
  var Adb, Client, Keycode;

  Client = require('./adb/client');

  Keycode = require('./adb/keycode');

  Adb = (function() {
    function Adb() {}

    Adb.createClient = function(options) {
      return new Client(options);
    };

    return Adb;

  })();

  Adb.Keycode = Keycode;

  module.exports = Adb;

}).call(this);

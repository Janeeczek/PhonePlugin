'use strict';
var exec = require('cordova/exec');



var PhonePlugin = (function () {
    function PhonePlugin() {
        var _this = this;
        

        console.log('PhonePlugin: has been created');
    }
    PhonePlugin.prototype.ready = function ( successCallback, errorCallback) {
            return cordova.exec(successCallback, errorCallback, "PhonePlugin", "ready");
    };
    PhonePlugin.prototype.onCall = function (successCallback, errorCallback) {
                return cordova.exec(successCallback, errorCallback, "PhonePlugin", "onCall");
        };
   
    

    return PhonePlugin;
}());

var PPG = new PhonePlugin();

module.exports = PPG;

/*
 PhonePlugin.onCall((s)=>{
      switch (s) {
          case "DISCONNECTED":
              console.log("PhonePlugin :: Call has ended");
              break;
          case "DIALING":
              console.log("PhonePlugin :: Phone is dialing");
              break;

          case "INCOMING":
              console.log("PhonePlugin :: Someone is calling");
              break;
          case "CONNECTED":
              console.log("PhonePlugin :: phone is on call");
              break;
          case "SET":
              console.log("PhonePlugin :: listener is set");
              break;
      }
      },(e)=>{console.log(e);});
 */

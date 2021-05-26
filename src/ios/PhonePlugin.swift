

import CallKit

@objc(PhonePlugin)
class PhonePlugin : CDVPlugin, CXCallObserverDelegate {
    var eventsCallbackId: String?
    var callObserver: CXCallObserver!
    @objc
    func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
        
        if call.hasEnded == true {
            print("DISCONNECTED")
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: "DISCONNECTED")
            pluginResult?.keepCallback = true
            commandDelegate.send(pluginResult, callbackId:eventsCallbackId)
        }
        if call.isOutgoing == true && call.hasConnected == false {
            print("DIALING")
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: "DIALING")
            pluginResult?.keepCallback = true
            commandDelegate.send(pluginResult, callbackId:eventsCallbackId)
        }
        if call.isOutgoing == false && call.hasConnected == false && call.hasEnded == false {
            print("INCOMING")
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: "INCOMING")
            pluginResult?.keepCallback = true
            commandDelegate.send(pluginResult, callbackId:eventsCallbackId)
         
        }
        if call.hasConnected == true && call.hasEnded == false {
            print("CONNECTED")
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: "CONNECTED")
            pluginResult?.keepCallback = true
            commandDelegate.send(pluginResult, callbackId:eventsCallbackId)
        }
        
    }
    override func pluginInitialize() {
        super.pluginInitialize()
        self.callObserver = CXCallObserver()
        callObserver.setDelegate(self, queue: nil)
        print("PhonePlugin :: Inizjalizacja")
    }
    @objc(onCall:)
    func onCall(_ command: CDVInvokedUrlCommand?) {
        print("PhonePlugin :: start is called")
        eventsCallbackId = command?.callbackId
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "SET")
        pluginResult?.keepCallback = true
        commandDelegate.send(pluginResult, callbackId:command?.callbackId)
        return
    }
}

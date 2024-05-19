import Foundation
import Capacitor
import WalkMeSDK

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(WalkMeSDKPlugin)
public class WalkMeSDKPlugin: CAPPlugin {
    
    @objc func start(_ call: CAPPluginCall) {
        
        guard let key = call.getString("key"), !key.isEmpty else {
            call.reject("WalkMe app key is missing")
            return
        }
        
        guard let secret = call.getString("secret"), !secret.isEmpty else {
            call.reject("WalkMe app secret is missing")
            return
        }
        
        DispatchQueue.main.async {
            ABBI.start(key, withSecretKey: secret, andApplicationType: ABBI_APP_HYBRID)
            call.resolve(["res": "ok"])
        }
    }
    
    @objc func setFlag(_ call: CAPPluginCall) {
        guard let flag = call.getInt("flag") else {
            call.reject("WalkMe flag must be an Int")
            return
        }
        
        ABBI.setFlag(Int32(flag))
        call.resolve()
    }
    
    @objc func restart(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            ABBI.restart()
            call.resolve(["res": "ok"])
        }
    }
    
    @objc func stop(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            ABBI.stop()
            call.resolve(["res": "ok"])
        }
    }
    
    @objc func setUserAttributes(_ call: CAPPluginCall) {
        guard let attributes = call.getObject("attributes") else {
            call.reject("WalkMe user attributes are missing")
            return
        }
        
        ABBI.setUserAttributes(attributes);
        call.resolve(["res": "ok"])
    }
    
    @objc func setUserAttribute(_ call: CAPPluginCall) {
        guard let key = call.getString("key"), !key.isEmpty else {
            call.reject("WalkMe user attribute key is missing")
            return
        }
        
        guard let value = call.getAny("value") else {
            call.reject("WalkMe user attribute value is missing")
            return
        }
        
        innerSetUserAttribute(key: key, value: value, isPrivate: false, call: call)
    }
    
    @objc func setPrivateUserAttributes(_ call: CAPPluginCall) {
        guard let attributes = call.getObject("attributes") else {
            call.reject("WalkMe user attributes are missing")
            return
        }
        
        ABBI.setPrivateUserAttributes(attributes)
        call.resolve(["res": "ok"])
    }
    
    @objc func setPrivateUserAttribute(_ call: CAPPluginCall) {
        guard let key = call.getString("key"), !key.isEmpty else {
            call.reject("WalkMe user attribute key is missing")
            return
        }
        
        guard let value = call.getAny("value") else {
            call.reject("WalkMe user attribute value is missing")
            return
        }
        
        innerSetUserAttribute(key: key, value: value, isPrivate: true, call: call)
    }
    
    @objc func clearPrivateUserAttributes(_ call: CAPPluginCall) {
        ABBI.clearPrivateUserAttributes()
        call.resolve()
    }
    
    @objc func setUserID(_ call: CAPPluginCall) {
        guard let userID = call.getString("userID"), !userID.isEmpty else {
            call.reject("WalkMe userID value is missing")
            return
        }
        
        DispatchQueue.main.async {
            ABBI.setUserID(userID)
            call.resolve(["res": "ok"])
        }
    }
    
    @objc func sendTrackedEvent(_ call: CAPPluginCall) {
        guard let name = call.getString("name"), !name.isEmpty else {
            call.reject("WalkMe tracked event name is missing")
            return
        }
        
        let properties = call.getObject("properties")
        ABBI.sendTrackedEvent(name, withProperites: properties)
        call.resolve(["res": "ok"])
    }
    
    @objc func setScreenID(_ call: CAPPluginCall) {
        guard let screenID = call.getString("screenID") else {
            call.reject("WalkMe screenID value is missing")
            return
        }
        
        if screenID.isEmpty {
            ABBI.setScreenID(nil)
        } else {
            ABBI.setScreenID(screenID)
        }
        
        call.resolve()
    }
    
    @objc func setLanguage(_ call: CAPPluginCall) {
        guard let language = call.getString("language"), !language.isEmpty else {
            call.reject("WalkMe language value is missing")
            return
        }
        
        DispatchQueue.main.async {
            ABBI.setLanguage(language)
            call.resolve(["res": "ok"])
        }
    }
    
    @objc func dismissCampaign(_ call: CAPPluginCall) {
        ABBI.dismissCampaign()
        call.resolve()
    }
    
    @objc func triggerCampaign(_ call: CAPPluginCall) {
        guard let triggerKey = call.getString("triggerKey"), !triggerKey.isEmpty else {
            call.reject("WalkMe triggerKey value is missing")
            return
        }
        
        DispatchQueue.main.async {
            ABBI.trigger(triggerKey)
            call.resolve(["res": "ok"])
        }
    }
    
    @objc func triggerCampaignWithDeepLink(_ call: CAPPluginCall) {
        guard let triggerKey = call.getString("triggerKey"), !triggerKey.isEmpty else {
            call.reject("WalkMe triggerKey value is missing")
            return
        }
        
        guard let deepLink = call.getString("deepLink"), !deepLink.isEmpty else {
            call.reject("WalkMe deepLink value is missing")
            return
        }
        
        DispatchQueue.main.async {
            ABBI.trigger(triggerKey, withDeepLink: deepLink)
            call.resolve(["res": "ok"])
        }
    }

}

// Private
extension WalkMeSDKPlugin {
    
    @objc private func innerSetUserAttribute(key: String, value: Any, isPrivate: Bool, call: CAPPluginCall) {
        
        guard value is String || value is Bool || value is NSNumber else {
            call.reject("WalkMe user attribute value is not a valid type")
            return
        }
        
        if isPrivate {
            ABBI.setPrivateUserAttributeWithKey(key, andValue: value)
        } else {
            ABBI.setUserAttributeWithKey(key, andValue: value)
        }
        
        call.resolve(["res": "ok"])
    }
}

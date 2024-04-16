#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(WalkMeSDKPlugin, "WalkMeSDKPlugin",
           CAP_PLUGIN_METHOD(start, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setFlag, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(setUserID, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(setUserAttribute, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setUserAttributes, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setPrivateUserAttribute, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setPrivateUserAttributes, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(clearPrivateUserAttributes, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(sendTrackedEvent, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setScreenID, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(setLanguage, CAPPluginReturnNone);
           CAP_PLUGIN_METHOD(dismissCampaign, CAPPluginReturnNone);

)

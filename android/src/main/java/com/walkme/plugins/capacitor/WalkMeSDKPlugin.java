package com.walkme.plugins.capacitor;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;

import abbi.io.abbisdk.ABBI;


@CapacitorPlugin(name = "WalkMeSDKPlugin")
public class WalkMeSDKPlugin extends Plugin {

    @PluginMethod
    public void start(PluginCall call) {
        String key = call.getString("key");
        if (key == null || key.isEmpty()) {
            call.reject("WalkMe app key is missing");
        }

        String secret = call.getString("secret");
        if (secret == null || secret.isEmpty()) {
            call.reject("WalkMe app secret is missing");
        }

        ABBI.start(key, secret, getActivity());
        success(call);
    }

    @PluginMethod
    public void setFlag(PluginCall call) {
        Integer key = call.getInt("flag");
        ABBI.setFlag(key);
        call.resolve();
    }

    @PluginMethod
    public void stop(PluginCall call) {
        ABBI.stop();
        success(call);
    }

    @PluginMethod
    public void restart(PluginCall call) {
        ABBI.restart();
        success(call);
    }

    @PluginMethod
    public void setUserAttributes(PluginCall call) {
        JSObject attributes = call.getObject("attributes");
        if (attributes == null) {
            call.reject("WalkMe user attributes are missing");
        }

        Map<String, Object> attributesMap = jsonObjectToMap(attributes);
        ABBI.setUserAttributes(attributesMap);
        success(call);
    }

    @PluginMethod
    public void setPrivateUserAttributes(PluginCall call) {
        JSObject attributes = call.getObject("attributes");
        if (attributes == null) {
            call.reject("WalkMe user attributes are missing");
        }

        Map<String, Object> attributesMap = jsonObjectToMap(attributes);
        ABBI.setPrivateUserAttributes(attributesMap);
        success(call);
    }

    @PluginMethod
    public void setUserAttribute(PluginCall call) {
        String key = call.getString("key");
        if (key == null || key.isEmpty()) {
            call.reject("WalkMe user attribute key is missing");
        }

        innerSetUserAttribute(key, false, call);
    }

    @PluginMethod
    public void setPrivateUserAttribute(PluginCall call) {
        String key = call.getString("key");
        if (key == null || key.isEmpty()) {
            call.reject("WalkMe user attribute key is missing");
        }

        innerSetUserAttribute(key, true, call);
    }

    @PluginMethod
    public void clearPrivateUserAttributes(PluginCall call) {
        ABBI.clearPrivateUserAttributes();
        call.resolve();
    }

    @PluginMethod
    public void setUserID(PluginCall call) {
        String userID = call.getString("userID");
        if (userID == null || userID.isEmpty()) {
            call.reject("WalkMe userID value is missing");
        }

        ABBI.setUserId(userID);
        success(call);
    }

    @PluginMethod
    public void sendTrackedEvent(PluginCall call) {
        String name = call.getString("name");
        if (name == null) {
            call.reject("WalkMe tracked event name is missing");
        }

        JSObject properties = call.getObject("properties");
        Map<String, Object> propertiesMap = jsonObjectToMap(properties);
        ABBI.sendTrackedEvent(name, propertiesMap);
        success(call);
    }


    @PluginMethod
    public void setScreenID(PluginCall call) {
        String screenID = call.getString("screenID");
        if (screenID == null) {
            call.reject("WalkMe screenID value is missing");
        }

        if (screenID.isEmpty()) {
            ABBI.setScreenID(null);
        } else {
            ABBI.setScreenID(screenID);
        }

        call.resolve();
    }

    @PluginMethod
    public void setLanguage(PluginCall call) {
        String language = call.getString("language");
        if (language == null || language.isEmpty()) {
            call.reject("WalkMe language value is missing");
        }

        ABBI.setLanguage(language);
        success(call);
    }

    @PluginMethod
    public void dismissCampaign(PluginCall call) {
        ABBI.dismissCampaign();
        call.resolve();
    }

    @PluginMethod
    public void triggerCampaign(PluginCall call) {
        String triggerKey = call.getString("triggerKey");
        if (triggerKey == null || triggerKey.isEmpty()) {
            call.reject("WalkMe triggerKey value is missing");
        }


        ABBI.trigger(triggerKey);
        success(call);
    }

    @PluginMethod
    public void triggerCampaignWithDeepLink(PluginCall call) {
        String triggerKey = call.getString("triggerKey");
        if (triggerKey == null || triggerKey.isEmpty()) {
            call.reject("WalkMe triggerKey value is missing");
        }

        String deepLink = call.getString("deepLink");
        if (deepLink == null || deepLink.isEmpty()) {
            call.reject("WalkMe deepLink value is missing");
        }

        ABBI.trigger(triggerKey, deepLink);
        success(call);
    }

    // Private
    private void success(PluginCall call) {
        JSObject ret = new JSObject();
        ret.put("res", "ok");
        call.resolve(ret);
    }
    
    private void innerSetUserAttribute(String key, boolean isPrivate, PluginCall call) {

        String valStr = "value";
        Object value = null;
        if (call.getString(valStr) != null) {
            value = call.getString(valStr);
        } else if (call.getInt(valStr) != null) {
            value = call.getInt(valStr);
        } else if (call.getBoolean(valStr) != null) {
            value = call.getBoolean(valStr);
        }

        if (value == null) {
            call.reject("WalkMe user attribute value is missing");
        }

        if (isPrivate) {
            ABBI.setPrivateUserAttribute(key, value);
        } else {
            ABBI.setUserAttribute(key, value);
        }

        success(call);
    }

    private Map<String, Object> jsonObjectToMap(JSONObject jsonObject) {
        if (jsonObject == null) {
            return null;
        }

        Map<String, Object> map = new HashMap<>();
        Iterator<String> keys = jsonObject.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            Object value = null;
            try {
                value = jsonObject.get(key);
            } catch (JSONException e) {

            }
            map.put(key, value);
        }
        return map;
    }
}

export interface WalkMeSDKPlugin {

  /** 
   * Starts WalkMe SDK.
   *
   * @param key The application key provided by WalkMe
   * @param secret The application secret key provided by WalkMe
   * 
   * To get your application key and application secret, login to WalkMe console at https://console.mobile.walkme.com
   * and click the settings icon near your application name.
   * 
   * @code
   * Usage example:
   * WalkMeSDK.start({key: "app_key", secret: "app_secret"});
   */
  start(options: WMKSPair): Promise<{ value: string }>;

  /** 
   * Utility function for support.
   *
   * @param flag Will be given by WalkMe support team when needed
   * 
   * @code
   * Usage example:
   * WalkMeSDK.setFlag({flag: some_number});
   */
  setFlag(flag: WMFlag): Promise<void>;

  /**
   * Sets user id
   * 
   * @param userID the user ID as a string
   * 
   * @code
   * Usage example:
   * WalkMeSDK.setUserID({userID: "someUserID"});
   */
  setUserID(userID: WMUserID): Promise<void>;

  /**
   * Sets a user attribute
   *
   * @param key the attribute key as a string
   * @param value the attribute value as a string / number / boolean
   * 
   * @code
   * Usage example:
   * WalkMeSDK.setUserAttribute({key: "att_key", value: "att_value"});
   */
  setUserAttribute(options: WMKVPair): Promise<{ value: string }>;

  /**
   * Sets multiple user attributes
   *
   * @param attributes the json of the attributes
   * 
   * @code
   * Usage example:
   * WalkMeSDK.setUserAttributes({attributes: {"name": "John Doe", "age": 30, "isPremium": true}});
   */
  setUserAttributes(options: WMAttributes): Promise<{ value: string }>;

  /**
   * Sets a user attribute
   *
   * @param key the attribute key as a string
   * @param value the attribute value as a string / number / boolean
   * 
   * @code
   * Usage example:
   * WalkMeSDK.setPrivateUserAttribute({key: "att_key", value: "att_value"});
   */
  setPrivateUserAttribute(options: WMKVPair): Promise<{ value: string }>;

  /**
   * Sets multiple user attributes
   *
   * @param attributes the json of the attributes
   * 
   * @code
   * Usage example:
   * WalkMeSDK.setPrivateUserAttributes({attributes: {"name": "John Doe", "age": 30, "isPremium": true}});
   */
  setPrivateUserAttributes(options: WMAttributes): Promise<{ value: string }>;

  /**
   * clears the private user attributes
   *
   * @code
   * Usage example:
   * WalkMeSDK.cleatPrivateUserAttributes();
   */
  cleatPrivateUserAttributes(): Promise<void>;

  /**
   * Sets multiple user attributes
   *
   * @param name the tracked event name
   * @param properties the properties for the tracked event (if needed)
   * 
   * @code
   * Usage example:
   * WalkMeSDK.sendTrackedEvent({name: "buy_item", properties: {"name": "item name", "price": 30}});
   */
  sendTrackedEvent(options: WMTrackedEvent): Promise<{ value: string }>;
  
  /**
   * Set ID for a specific screen.
   * When used, this should be called everytime the screen shows
   *
   * @param screenID the ID to set for a specific screen
   *
   * @code
   * Usage example:
   * WalkMeSDK.setScreenID({screenID: "login_screen"});
   */
  setScreenID(screenID: WMScreenID): Promise<void>;  

  /**
   * Set the language for your campaigns.
   * When used, the language param you pass should match the name of one of the languages you’ve set up in the console.
   *
   * @param language the language for which you want the SDK to display your campaigns
   *
   * @code
   * Usage example:
   * WalkMeSDK.setLanguage({language: "language_name"});
   */
  setLanguage(language: WMLanguage): Promise<void>;

  /**
   * Dismiss currently presented campaign, in case nothing is presented this API does nothing.
   * Exception for launcher campaigns which are not affected by this API.
   */
  dismissCampaign(): Promise<void>;
}

export interface WMFlag {flag: number}
export interface WMUserID {userID: string}
export interface WMScreenID {screenID: string}
export interface WMLanguage {language: string}
export interface WMTrigger {triggerKey: string}
export interface WMTriggerFromDeepLink {triggerKey: string, deeplink: string} 
export interface WMKSPair {key: string, secret: string}
export interface WMKVPair {key: string, value: number | string | boolean}
export interface WMAttributes {attributes: any}
export interface WMTrackedEvent {name: string, properties: any}
# capacitor-plugin-walkme-sdk

A Simple SDK that allows anyone to create and manage in-app content without coding and without deployment, to maximize in-app user engagement.

## Install

```bash
npm install capacitor-plugin-walkme-sdk
npx cap sync
```

## API

<docgen-index>

* [`start(...)`](#start)
* [`setFlag(...)`](#setflag)
* [`setUserID(...)`](#setuserid)
* [`setUserAttribute(...)`](#setuserattribute)
* [`setUserAttributes(...)`](#setuserattributes)
* [`setPrivateUserAttribute(...)`](#setprivateuserattribute)
* [`setPrivateUserAttributes(...)`](#setprivateuserattributes)
* [`cleatPrivateUserAttributes()`](#cleatprivateuserattributes)
* [`sendTrackedEvent(...)`](#sendtrackedevent)
* [`setScreenID(...)`](#setscreenid)
* [`setLanguage(...)`](#setlanguage)
* [`dismissCampaign()`](#dismisscampaign)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### start(...)

```typescript
start(options: WMKSPair) => Promise<{ value: string; }>
```

Starts WalkMe SDK.

| Param         | Type                                          |
| ------------- | --------------------------------------------- |
| **`options`** | <code><a href="#wmkspair">WMKSPair</a></code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setFlag(...)

```typescript
setFlag(flag: WMFlag) => Promise<void>
```

Utility function for support.

| Param      | Type                                      | Description                                      |
| ---------- | ----------------------------------------- | ------------------------------------------------ |
| **`flag`** | <code><a href="#wmflag">WMFlag</a></code> | Will be given by WalkMe support team when needed |

--------------------


### setUserID(...)

```typescript
setUserID(userID: WMUserID) => Promise<void>
```

Sets user id

| Param        | Type                                          | Description             |
| ------------ | --------------------------------------------- | ----------------------- |
| **`userID`** | <code><a href="#wmuserid">WMUserID</a></code> | the user ID as a string |

--------------------


### setUserAttribute(...)

```typescript
setUserAttribute(options: WMKVPair) => Promise<{ value: string; }>
```

Sets a user attribute

| Param         | Type                                          |
| ------------- | --------------------------------------------- |
| **`options`** | <code><a href="#wmkvpair">WMKVPair</a></code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setUserAttributes(...)

```typescript
setUserAttributes(options: WMAttributes) => Promise<{ value: string; }>
```

Sets multiple user attributes

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code><a href="#wmattributes">WMAttributes</a></code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setPrivateUserAttribute(...)

```typescript
setPrivateUserAttribute(options: WMKVPair) => Promise<{ value: string; }>
```

Sets a user attribute

| Param         | Type                                          |
| ------------- | --------------------------------------------- |
| **`options`** | <code><a href="#wmkvpair">WMKVPair</a></code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setPrivateUserAttributes(...)

```typescript
setPrivateUserAttributes(options: WMAttributes) => Promise<{ value: string; }>
```

Sets multiple user attributes

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code><a href="#wmattributes">WMAttributes</a></code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### cleatPrivateUserAttributes()

```typescript
cleatPrivateUserAttributes() => Promise<void>
```

clears the private user attributes

--------------------


### sendTrackedEvent(...)

```typescript
sendTrackedEvent(options: WMTrackedEvent) => Promise<{ value: string; }>
```

Sets multiple user attributes

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#wmtrackedevent">WMTrackedEvent</a></code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setScreenID(...)

```typescript
setScreenID(screenID: WMScreenID) => Promise<void>
```

Set ID for a specific screen.
When used, this should be called everytime the screen shows

| Param          | Type                                              | Description                         |
| -------------- | ------------------------------------------------- | ----------------------------------- |
| **`screenID`** | <code><a href="#wmscreenid">WMScreenID</a></code> | the ID to set for a specific screen |

--------------------


### setLanguage(...)

```typescript
setLanguage(language: WMLanguage) => Promise<void>
```

Set the language for your campaigns.
When used, the language param you pass should match the name of one of the languages you’ve set up in the console.

| Param          | Type                                              | Description                                                       |
| -------------- | ------------------------------------------------- | ----------------------------------------------------------------- |
| **`language`** | <code><a href="#wmlanguage">WMLanguage</a></code> | the language for which you want the SDK to display your campaigns |

--------------------


### dismissCampaign()

```typescript
dismissCampaign() => Promise<void>
```

Dismiss currently presented campaign, in case nothing is presented this API does nothing.
Exception for launcher campaigns which are not affected by this API.

--------------------


### Interfaces


#### WMKSPair

| Prop         | Type                |
| ------------ | ------------------- |
| **`key`**    | <code>string</code> |
| **`secret`** | <code>string</code> |


#### WMFlag

| Prop       | Type                |
| ---------- | ------------------- |
| **`flag`** | <code>number</code> |


#### WMUserID

| Prop         | Type                |
| ------------ | ------------------- |
| **`userID`** | <code>string</code> |


#### WMKVPair

| Prop        | Type                                     |
| ----------- | ---------------------------------------- |
| **`key`**   | <code>string</code>                      |
| **`value`** | <code>string \| number \| boolean</code> |


#### WMAttributes

| Prop             | Type             |
| ---------------- | ---------------- |
| **`attributes`** | <code>any</code> |


#### WMTrackedEvent

| Prop             | Type                |
| ---------------- | ------------------- |
| **`name`**       | <code>string</code> |
| **`properties`** | <code>any</code>    |


#### WMScreenID

| Prop           | Type                |
| -------------- | ------------------- |
| **`screenID`** | <code>string</code> |


#### WMLanguage

| Prop           | Type                |
| -------------- | ------------------- |
| **`language`** | <code>string</code> |

</docgen-api>

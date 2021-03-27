# FireworkVideo Google AdMob Mobile Supporting Library

## About

A supporting library for the Google AdMob (GAM) SDK for use with FireworkVideo Ad Interface along with sample code.

## Setup Prerequisites

Proceed with FireworkVideo and Google AdMob integration steps before integrating the supporting library. Then contact the business 
team / engineering team you are co-ordinating with and ensure your Firework account has ads functionality enabled.

## GAM SDK Documentation

This supporting library assumes basic familiarity with GAM. If needed, read over the GAM [Get Started](https://developers.google.com/admob/ios/quick-start) before diving in. The companion guides on [native display ads](https://developers.google.com/admob/ios/native/start) is also highly recommended.

Ensure compliance with user consent policies by reviewing the Google User Messaging Platform (UMP) [Quick Start Guide](https://developers.google.com/admob/ump/ios/quick-start).

**The supporting library only supports GAM 8.0 or higher. Using the supporting library alongside a version of GAM below 8.0 may result in undefined behavior.**

## FireworkVideo SDK Documentation

This supporting library is intended to be used alongside FireworkVideo SDK. Read over the [FireworkVideo SDK documentation](https://github.com/loopsocial/firework_ios_sdk#fireworkvideo) and [sample code](https://github.com/loopsocial/firework_ios_sdk/tree/main/FireworkVideoSample) to ensure smooth integration with GAM.

Configure your Firework content is configured and apply correct styling and/or layout before integrating the GAM supporting library. This will ensure your testing conditions will match your production environment.

## Project Structure

FireworkVideoGAMSupportSample is a sample project demonstrating the use of the supporting library alongside GAM. The sample project allows supported ad types to be enabled and tested when placed inside FireworkVideo feeds of various configurations. The supporting library does not embed either GAM or FireworkVideo and must be included alongside them in your app. **Using the supporting library alongside incompatible FireworkVideo or GAM versions may result in undefined behavior.**

## Setup

Run the below script to download GAM into the location referenced by the sample project.

```
./scripts/setup-dependencies.sh
```

GAM will throw an exception if a value for `GADApplicationIdentifier` is not included in your app's Info.plist. Include your own identifier in the sample code before running it.

## Using the SDK

Set up the SDK alongside FireworkVideo as soon as possible after app launch. See below code snippet.

```     
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FireworkVideoSDK.initializeSDK()
        FireworkVideoGAMSupportSDK.initializeSDK()      
        return true
    }
```

FireworkVideo after both SDKs are initialized, FireworkVideo will make internal requests to the supporting library as determined by the Firework configuration for your App ID and Publisher ID.

### User Consent

This version of the SDK requires the use UMP and GAM APIs to obtain user consent if required for your geography. To customize the setup of the SDK until after user consent is obtained, call `FireworkVideoGAMSupportSDK.initializeSDK` with `startGADMobileAds` set to false.

```
FireworkVideoGAMSupportSDK.initializeSDK(startGADMobileAds: false)
```

Then follow the [GAM instructions](https://developers.google.com/admob/ios/quick-start#example_appdelegatem_excerpt) for starting the GAM SDK.

## Test or Demo Ad Units

Google policies disallow the use of production ads during development. See [GAM Demo Ad Units](https://developers.google.com/admob/ios/test-ads#demo_ad_units) for a list of available demo ad units for various ad types.

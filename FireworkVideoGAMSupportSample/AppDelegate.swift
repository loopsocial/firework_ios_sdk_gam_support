//
//  AppDelegate.swift
//  FireworkVideoGAMSupportSample
//

import UIKit
import GoogleMobileAds
import FireworkVideo
import FireworkVideoGAMSupport

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FireworkVideoSDK.initializeSDK()
        FireworkVideoGAMSupportSDK.initializeSDK()
        
        print("FireworkVideo SDK Version: \(FireworkVideoSDK.version)")
        print("FireworkVideoGAMSupport SDK Version: \(FireworkVideoGAMSupportSDK.sdkVersion)")
        print("GoogleMobileAds SDK Version: \(FireworkVideoGAMSupportSDK.mobileAdsSDKVersion)")
        
        print("Is GoogleMobileAds SDK supported?: \(FireworkVideoGAMSupportSDK.isMobileAdsSDKVersionSupported)")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


//
//  AppDelegate.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/02/21.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn
import UserNotifications

@UIApplicationMain
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)

class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
   
    var window: UIWindow?
    
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        GIDSignIn.sharedInstance().clientID = "53258605089-4ek4mhnegrpdlish2vuh5pqo3uib16td.apps.googleusercontent.com"
        application.registerForRemoteNotifications()
        registerForPushNotifications()
        registerNotificationCategories()
        return true
    }
          
    func application(_ app: UIApplication,open url: URL,options:[UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current() // 1
            .requestAuthorization(options: [.alert, .sound, .badge]) { // 2
                [weak self] granted, error in
                
                print("Permission granted: \(granted)")
                guard granted else { return }
                self?.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    func registerNotificationCategories() {
        let openBoardAction = UNNotificationAction(identifier: UNNotificationDefaultActionIdentifier, title: "Open Board", options: UNNotificationActionOptions.foreground)
        let contentAddedCategory = UNNotificationCategory(identifier: "content_added_notification", actions: [openBoardAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([contentAddedCategory])
    }

    // Genrate Device Token
    func application( _ application: UIApplication,didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let device_Token = tokenParts.joined()
//        UserDefaults.standard.deviceTokenKey(deviceToken: device_Token)
        UserDefaults.standard.set(device_Token, forKey: UserDefaultsKey.deviceTokenKey.rawValue)
        print("Device Token: \(String(describing: device_Token))")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        defer {
            completionHandler()
        }

        /// Identify the action by matching its identifier.
        guard response.actionIdentifier == UNNotificationDefaultActionIdentifier else { return }

        /// Perform the related action
        print("Open board tapped from a notification!")

        /// .. deeplink into the board
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }
    
    func application(_ application: UIApplication,didFailToRegisterForRemoteNotificationsWithError error: Error)
    {
        print("Failed to register: \(error)")
    }
}
    

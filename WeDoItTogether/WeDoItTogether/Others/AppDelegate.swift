//
//  AppDelegate.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/07/13.
//

import UIKit
import Firebase
import NotificationCenter
import UserNotifications
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var userNotificationCenter = UNUserNotificationCenter.current()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        KakaoSDK.initSDK(appKey: "f0c3ea739ebf0f7f87cfaa329ffcf89c")
        
        FirebaseApp.configure()
        userNotificationCenter.delegate = self
        
        let authrizationOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        userNotificationCenter.requestAuthorization(options: authrizationOptions) { granted, error in
            if let error = error {
                print("Error: notification authrization request \(error.localizedDescription)")
            }
            if granted {
                print("Notification authorization granted.")
            } else {
                print("Notification authorization denied.")
            }
        }
        
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

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.string(from: Date())
        
        saveUserNotificationData(title: notification.request.content.title, content: notification.request.content.body, date: date)
        
        if UIApplication.shared.applicationState == .background {
            print("백그라운드 시뮬레이터에서는 안된다는 데... 실기기 테스트를 못해요... 어쩜 좋죠 ? 개발자 계정 못하는 사람은 테스트도 하지말라는 소리인가요...")
            completionHandler([.banner, .list, .badge, .sound])
        } else {
            print("포그라운드")
            completionHandler([])
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func saveUserNotificationData(title: String, content: String, date: String) {
        guard let user = UserDefaultsData.shared.getUser() else {
            return
        }
        let newNotification = UserNotification(title: title, content: content, date: date)
        
        let ref = Database.database().reference()
        ref.child("userNotifications")
            .child("\(user.userId)")
            .child("\(newNotification.id)")
            .setValue(newNotification.asDictionary())
    }
}


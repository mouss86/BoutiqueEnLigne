//
//  BoutiqueEnLigneApp.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-08.
//#imageLiteral(resourceName: "simulator_screenshot_46D5183F-54F2-4F23-942D-53EC8AD98063.png")

import SwiftUI
import FirebaseCore
import FirebaseAnalytics
import FirebaseInAppMessaging

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}




@main
struct BoutiqueEnLigneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Spash()
        }
    }
}


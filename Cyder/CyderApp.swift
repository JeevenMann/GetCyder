//
//  CyderApp.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-17.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}



@main
struct CyderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var user = User.shared
    var body: some Scene {
        WindowGroup {
            
            if user.userType == .signedIn {
                MainTabBar()
            } else {
                    LoginView()
            }
            
            
            
            
        }
    }
}

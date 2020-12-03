//
//  kuestApp.swift
//  kuest
//
//  Created by 양지수 on 2020/12/03.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingWithOptions called!")
        
        KakaoSDKCommon.initSDK(appKey: "d85ab5f9dc26a94babe3171b4ab8beb2", loggingEnable:true)
        
        FirebaseApp.configure()

        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else{
            print(error.localizedDescription)
            return}

        let credential =
            GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)

        Auth.auth().signIn(with: credential){ (result, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }

            signTemp.set(platform:"google",id:(result?.user.email)!)
            print((result?.user.email)!)
        }
    }
}



@main
struct kuestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {

        WindowGroup {
            ContentView()
        }
    }
}

//
//  SocialSystem.swift
//  kuest
//
//  Created by 양지수 on 2020/12/03.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser
var viewFlag : ViewFlag = ViewFlag()

class ViewFlag : ObservableObject{
    @Published var sign = false
    
    func sync() {
        self.sign = signTemp.login
    }
    
    func load() -> ViewFlag {
        return viewFlag
    }
}

var signTemp : SignStruct = SignStruct()

class SignStruct{
    var platform: String = ""
    var login: Bool = false
    var id: String = ""
    
    func get() -> SignStruct{
        return signTemp
    }
    
    func set(platform: String, id: String ){
        signTemp.platform = platform
        signTemp.login.toggle()
        signTemp.id = id
        viewFlag.sync()
    }
}

class SocialSign{
    
    func signIn(platform: String) {
//        if platform == "kakao"{
            AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("me() success." + (String(describing: user?.id)))
                            
                            signTemp.set(platform:"kakao",id:String(describing: user?.id).filter{$0.isNumber})
                        }
                    }
                }
            }
//        } else if platform == "google" {
//            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
//            GIDSignIn.sharedInstance()?.signIn()
//        }
    }
    
    func signOut() {
//        if signTemp.get().platform == "kakao" {
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("logout() success.")
                    signTemp.set(platform:"",id:"")
                }
            }
//        } else if signTemp.platform == "google" {
//            let firebaseAuth = Auth.auth()
//            do {
//                try firebaseAuth.signOut()
//                signTemp.set(platform:"",id:"")
//            } catch let signOutError as NSError {
//                print ("Error signing out: %@", signOutError)
//            }
//        }
    }
    
}

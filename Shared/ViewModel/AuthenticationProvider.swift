//
//  AuthenticationProvider.swift
//  MVVMLoginDemo (iOS)
//
//  Created by Ongraph on 25/02/22.
//

import Foundation


class AuthenticationProvider: NSObject {
    var user: LoginUser!
    
    var username: String {
        return user.userName
    }
    var email: String {
        return user.email
    }
    
    typealias authenticationLoginCallBack = (_ status:Bool, _ message:String) -> Void
   
    var loginCallback:authenticationLoginCallBack?
    
    func authenticateUserWith(_ username:String, andPassword password:String) {
            if username.count  != 0 {
                if password.count != 0 {
                    self.verifyUserWith(username, andPassword: password)
                } else {
                    ///password is empty
                    self.loginCallback?(false, "Password should not be empty")
                }
            } else {
                // username is empty
                self.loginCallback?(false, "Username should not be empty")
            }
    }
    
    
    //MARK:- verifyUserWithCredential
    fileprivate func verifyUserWith(_ username:String, andPassword password:String) {
        if username == "testuser" && password == "12345" {
            user = LoginUser(userName: username, email: "\(username)@testmail.com")
            self.loginCallback?(true, "User is successfully authenticated")
        } else {
            // invalid credentials
            self.loginCallback?(false, "Please enter valid credentials")
        }
    }
    
    //MARK:- loginCompletionHandler
    func loginCompletionHandler(callBack: @escaping authenticationLoginCallBack) {
        self.loginCallback = callBack
    }
}

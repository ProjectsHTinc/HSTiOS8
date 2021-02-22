//
//  ViewBindToKeypad.swift
//  OPS
//
//  Created by Happy Sanz Tech on 17/12/20.
//

import Foundation
import UIKit

extension UIView
{
    func bindToKeyboard()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    @objc func keyboardWillChange(_ notification: Notification)
    {
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let curveFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curveFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}

// FACEBOOK LOGIN SAMPLE
////        if let token = AccessToken.current,
//                !token.isExpired {
//            let token = token.tokenString
//            let request = FBSDKLoginKit.GraphRequest(graphPath:"me",
//                                                     parameters:["fields":"email,name"],
//                                              tokenString: token,
//                                              version: nil,
//                                              httpMethod:.get)
//            request.start(completionHandler: {connection,result,error in
//                print(result!)
//            })
//        }
//            else {
//
//                let loginButton = FBLoginButton()
////                        loginButton.center = view.center
////                        view.addSubview(loginButton)
//                loginButton.delegate = self
//                loginButton.permissions = ["",""]
//            }
//      }
//
//    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//
//        let token = result?.token?.tokenString
//        let request = FBSDKLoginKit.GraphRequest(graphPath:"me",
//                                                 parameters:["fields":"email,name"],
//                                          tokenString: token,
//                                          version: nil,
//                                          httpMethod:.get)
//        request.start(completionHandler: {connection,result,error in
//            print(result!)
//        })
//    }
//
//    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//
//
//    }

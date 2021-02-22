//
//  LoginWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation
import UIKit

typealias responseHandler = (_ response:LoginModel.Fetch.Response) ->()

class LoginWorker{

   func fetch(mobile_number:String, onSuccess successCallback:(responseHandler)?,onFailure failureCallback: @escaping(responseHandler)) {
       let manager = APIManager()
       manager.callAPIMobileLogin(
           mobile_no:mobile_number, onSuccess: { (resp)  in
               successCallback?(LoginModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(LoginModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


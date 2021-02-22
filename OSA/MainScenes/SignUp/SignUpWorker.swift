//
//  SignUpWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

typealias SignupresponseHandler = (_ response:SignupModel.Fetch.Response) ->()

class SignupWorker{

   func fetch(name:String,phone:String,email:String,password:String, onSuccess successCallback:(SignupresponseHandler)?,onFailure failureCallback: @escaping(SignupresponseHandler)) {
       let manager = APIManager()
       manager.callAPISignUp(
        name:name,phone:phone,email:email,password:password, onSuccess: { (resp)  in
               successCallback?(SignupModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SignupModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


//
//  OTPWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation

typealias  OTPresponseHandler = (_ response: OTPModel.Fetch.Response) ->()

class  OTPWorker{

   func fetch(mobile_number:String,OTP:String,mob_key:String,mobile_type:String,login_type:String,login_portal:String, onSuccess successCallback:( OTPresponseHandler)?,onFailure failureCallback: @escaping( OTPresponseHandler)) {
       let manager = APIManager()
       manager.callAPIOTP(
        mobile_number:mobile_number,OTP:OTP,mob_key:mob_key,mobile_type:mobile_type,login_type:login_type, login_portal:login_portal, onSuccess: { (resp)  in
               successCallback?(OTPModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback( OTPModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

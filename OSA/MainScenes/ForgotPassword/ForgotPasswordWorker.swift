//
//  EmailPasswordWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation

typealias  ForgotPasswordresponseHandler = (_ response: ForgotPasswordModel.Fetch.Response) ->()

class  ForgotPasswordWorker{

   func fetch(email:String, onSuccess successCallback:( ForgotPasswordresponseHandler)?,onFailure failureCallback: @escaping( ForgotPasswordresponseHandler)) {
       let manager = APIManager()
       manager.callAPIForgotEmail(
        email:email, onSuccess: { (resp)  in
               successCallback?(ForgotPasswordModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback( ForgotPasswordModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

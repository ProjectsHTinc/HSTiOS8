//
//  EmailLoginWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation
import UIKit

typealias EmailLoginresponseHandler = (_ response:EmailLoginModel.Fetch.Response) ->()

class EmailLoginWorker{

   func fetch(email_id:String,password:String,mob_key:String,mobile_type:String, onSuccess successCallback:(EmailLoginresponseHandler)?,onFailure failureCallback: @escaping(EmailLoginresponseHandler)) {
       let manager = APIManager()
       manager.callAPIEmailLogin(
        email_id:email_id,password:password,mob_key:mob_key,mobile_type:mobile_type, onSuccess: { (resp)  in
               successCallback?(EmailLoginModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(EmailLoginModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


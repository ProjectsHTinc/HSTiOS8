//
//  GoogleIntegrationWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

typealias GoogleIntegrationresponseHandler = (_ response:GoogleIntegrationModel.Fetch.Response) ->()

class GoogleIntegrationWorker{

   func fetch(email:String,first_name:String,last_name:String,mobile_type:String,mob_key:String,login_type:String,login_portal:String, onSuccess successCallback:(GoogleIntegrationresponseHandler)?,onFailure failureCallback: @escaping(GoogleIntegrationresponseHandler)) {
       let manager = APIManager()
       manager.callAPIGoogleIntegration(
        email:email,first_name:first_name,last_name:last_name,mobile_type:mobile_type,mob_key:mob_key,login_type:login_type,login_portal:login_portal, onSuccess: { (resp)  in
               successCallback?(GoogleIntegrationModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GoogleIntegrationModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


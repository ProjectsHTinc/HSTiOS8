//
//  ChangePasswordWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

typealias CheckPasswordresponseHandler = (_ response:CheckPasswordModel.Fetch.Response) ->()

class CheckPasswordWorker{

   func fetch(password:String,user_id:String, onSuccess successCallback:(CheckPasswordresponseHandler)?,onFailure failureCallback: @escaping(CheckPasswordresponseHandler)) {
       let manager = APIManager()
       manager.callAPICheckPassword(
        password:password,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(CheckPasswordModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CheckPasswordModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}



//
//  CheckPasswordWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

typealias ChangePasswordresponseHandler = (_ response:ChangePasswordModel.Fetch.Response) ->()

class ChangePasswordWorker{

   func fetch(password:String,user_id:String, onSuccess successCallback:(ChangePasswordresponseHandler)?,onFailure failureCallback: @escaping(ChangePasswordresponseHandler)) {
       let manager = APIManager()
       manager.callAPIChangePassword(
        password:password,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(ChangePasswordModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ChangePasswordModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}



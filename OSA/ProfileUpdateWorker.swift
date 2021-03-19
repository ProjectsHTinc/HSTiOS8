//
//  ProfileUpdateWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias ProfileUpdateresponseHandler = (_ response:ProfileUpdateModel.Fetch.Response) ->()

class ProfileUpdateWorker{

   func fetch(email:String,user_id:String,phone_number:String,gender:String,dob:String,newsletter_status:String,first_name:String,last_name:String, onSuccess successCallback:(ProfileUpdateresponseHandler)?,onFailure failureCallback: @escaping(ProfileUpdateresponseHandler)) {
       let manager = APIManager()
       manager.callAPIProfileUpdate(
        email:email, user_id:user_id,phone_number:phone_number, gender:gender,dob:dob, newsletter_status:newsletter_status,first_name:first_name, last_name:last_name, onSuccess: { (resp)  in
               successCallback?(ProfileUpdateModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ProfileUpdateModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


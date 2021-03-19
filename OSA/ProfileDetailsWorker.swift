//
//  ProfileDetailsWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias ProfileDetailsresponseHandler = (_ response:ProfileDetailsModel.Fetch.Response) ->()

class ProfileDetailsWorker{

   func fetch(user_id:String,onSuccess successCallback:(ProfileDetailsresponseHandler)?,onFailure failureCallback: @escaping(ProfileDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIProfileDetails(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(ProfileDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ProfileDetailsModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

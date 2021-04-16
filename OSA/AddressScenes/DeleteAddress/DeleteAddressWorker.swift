//
//  DeleteAddressWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation
import UIKit

typealias DeleteAddressresponseHandler = (_ response:DeleteAddressModel.Fetch.Response) ->()

class DeleteAddressWorker{

   func fetch(user_id:String,address_id:String, onSuccess successCallback:(DeleteAddressresponseHandler)?,onFailure failureCallback: @escaping(DeleteAddressresponseHandler)) {
       let manager = APIManager()
       manager.callAPIDeleteAddress(
        user_id:user_id, address_id:address_id, onSuccess: { (resp)  in
               successCallback?(DeleteAddressModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(DeleteAddressModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

//
//  DefaultAddressWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation
import UIKit

typealias DefaultAddressresponseHandler = (_ response:DefaultAddressModel.Fetch.Response) ->()

class DefaultAddressWorker{

   func fetch(user_id:String,address_id:String, onSuccess successCallback:(DefaultAddressresponseHandler)?,onFailure failureCallback: @escaping(DefaultAddressresponseHandler)) {
       let manager = APIManager()
       manager.callAPIDefaultAddress(
        user_id:user_id, address_id:address_id, onSuccess: { (resp)  in
               successCallback?(DefaultAddressModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(DefaultAddressModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

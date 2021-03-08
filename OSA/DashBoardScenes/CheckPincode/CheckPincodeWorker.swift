//
//  CheckPincodeWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//

import Foundation
import UIKit

typealias CheckPincoderesponseHandler = (_ response:CheckPincodeModel.Fetch.Response) ->()

class CheckPincodeWorker{

   func fetch(pin_code:String, onSuccess successCallback:(CheckPincoderesponseHandler)?,onFailure failureCallback: @escaping(CheckPincoderesponseHandler)) {
       let manager = APIManager()
       manager.callAPICheckPincode(
        pin_code:pin_code, onSuccess: { (resp)  in
               successCallback?(CheckPincodeModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CheckPincodeModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}



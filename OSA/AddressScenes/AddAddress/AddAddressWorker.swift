//
//  AddAddressWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation
import UIKit

typealias AddAddressresponseHandler = (_ response:AddAddressModel.Fetch.Response) ->()

class AddAddressWorker{

   func fetch(user_id:String,country_id:String,state:String,city:String,
              pincode:String,house_no:String,street:String,landmark:String,
              full_name:String,mobile_number:String,email_address:String,alternative_mobile_number:String,address_type:String,onSuccess successCallback:(AddAddressresponseHandler)?,onFailure failureCallback: @escaping(AddAddressresponseHandler)) {
       let manager = APIManager()
       manager.callAPIAddAddress(
        user_id:user_id,country_id:country_id,state:state,city:city,
        pincode:pincode,house_no:house_no,street:street,landmark:landmark,
        full_name:full_name,mobile_number:mobile_number,email_address:email_address,alternative_mobile_number:alternative_mobile_number,address_type:address_type,onSuccess: { (resp)  in
               successCallback?(AddAddressModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AddAddressModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


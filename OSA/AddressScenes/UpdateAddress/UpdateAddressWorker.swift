//
//  UpdateAddressWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation
import UIKit

typealias UpdateAddressresponseHandler = (_ response:UpdateAddressModel.Fetch.Response) ->()

class UpdateAddressWorker{

   func fetch(user_id:String,country_id:String,state:String,city:String,pincode:String,house_no:String,street:String,landmark:String,full_name:String,mobile_number:String,email_address:String,alternative_mobile_number:String,address_type:String,address_id:String,status:String, onSuccess successCallback:(UpdateAddressresponseHandler)?,onFailure failureCallback: @escaping(UpdateAddressresponseHandler)) {
       let manager = APIManager()
       manager.callAPIUpdateAddress(
        user_id:user_id,country_id:country_id,state:state,city:city,
        pincode:pincode,house_no:house_no,street:street,landmark:landmark,
        full_name:full_name,mobile_number:mobile_number,email_address:email_address,alternative_mobile_number:alternative_mobile_number,address_type:address_type,address_id:address_id, status:status, onSuccess: { (resp)  in
               successCallback?(UpdateAddressModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(UpdateAddressModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


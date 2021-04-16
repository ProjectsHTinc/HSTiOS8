//
//  ProductDetailsWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import Foundation
import UIKit

typealias ProductDetailsresponseHandler = (_ response:ProductDetailsModel.Fetch.Response) ->()

class ProductDetailsWorker{

   func fetch(product_id:String, onSuccess successCallback:(ProductDetailsresponseHandler)?,onFailure failureCallback: @escaping(ProductDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIProductDetails(
        product_id:product_id, onSuccess: { (resp)  in
               successCallback?(ProductDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ProductDetailsModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

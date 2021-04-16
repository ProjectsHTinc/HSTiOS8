//
//  ProductSizeWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//

import Foundation
import UIKit

typealias ProductSizeresponseHandler = (_ response:ProductSizeModel.Fetch.Response) ->()

class ProductSizeWorker{
    
   var respData = [ProductSizeModels]()
    func fetch(product_id:String, onSuccess successCallback:(ProductSizeresponseHandler)?,onFailure failureCallback: @escaping(ProductSizeresponseHandler)) {
       let manager = APIManager()
       manager.callAPIProductSize(
        product_id:product_id, onSuccess: { (resp)  in
               successCallback?(ProductSizeModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ProductSizeModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


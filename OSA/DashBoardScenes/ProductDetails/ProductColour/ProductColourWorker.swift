//
//  ProductColourWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//


import Foundation
import UIKit

typealias ProductColourresponseHandler = (_ response:ProductColourModel.Fetch.Response) ->()

class ProductColourWorker{
    
   var respData = [ProductColourModels]()
    func fetch(product_id:String,size_id:String, onSuccess successCallback:(ProductColourresponseHandler)?,onFailure failureCallback: @escaping(ProductColourresponseHandler)) {
       let manager = APIManager()
       manager.callAPIProductColour(
        product_id:product_id,size_id:size_id, onSuccess: { (resp)  in
               successCallback?(ProductColourModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ProductColourModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


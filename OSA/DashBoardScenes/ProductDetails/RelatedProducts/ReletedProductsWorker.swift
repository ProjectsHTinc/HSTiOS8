//
//  ReletedProductsWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import Foundation
import UIKit

typealias RelatedProductresponseHandler = (_ response:RelatedProductModel.Fetch.Response) ->()

class RelatedProductWorker{
    
   var respData = [RelatedProductModels]()
    func fetch(product_id:String, onSuccess successCallback:(RelatedProductresponseHandler)?,onFailure failureCallback: @escaping(RelatedProductresponseHandler)) {
       let manager = APIManager()
       manager.callAPIRelatedProduct(
        product_id:product_id, onSuccess: { (resp)  in
               successCallback?(RelatedProductModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(RelatedProductModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


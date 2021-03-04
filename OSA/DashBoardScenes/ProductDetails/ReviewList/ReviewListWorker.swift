//
//  ReviewListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import Foundation
import UIKit

typealias ReviewListresponseHandler = (_ response:ReviewListModel.Fetch.Response) ->()

class ReviewListWorker{
    
   var respData = [ReviewListModels]()
    func fetch(product_id:String, onSuccess successCallback:(ReviewListresponseHandler)?,onFailure failureCallback: @escaping(ReviewListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIReviewList(
        product_id:product_id, onSuccess: { (resp)  in
               successCallback?(ReviewListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ReviewListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

//
//  CheckReviewInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol CheckReviewBusinessLogic
{
    func fetchItems(request:CheckReviewModel.Fetch.Request)
}
protocol CheckReviewDataStore
{
  
}

class CheckReviewInteractor: CheckReviewBusinessLogic,CheckReviewDataStore
{

    var presenter1: CheckReviewPresentationLogic?
    var worker: CheckReviewWorker?
 
    func fetchItems(request: CheckReviewModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: CheckReviewModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = CheckReviewWorker()
        worker!.fetch(product_id:request.product_id!,user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: CheckReviewModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: CheckReviewModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

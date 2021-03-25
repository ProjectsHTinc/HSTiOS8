//
//  UpdateReviewInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol UpdateReviewBusinessLogic
{
    func fetchItems(request:UpdateReviewModel.Fetch.Request)
}
protocol UpdateReviewDataStore
{
  
}

class UpdateReviewInteractor: UpdateReviewBusinessLogic,UpdateReviewDataStore
{

    var presenter2: UpdateReviewPresentationLogic?
    var worker: UpdateReviewWorker?
 
    func fetchItems(request: UpdateReviewModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter2?.presentFetchResults(resp: UpdateReviewModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = UpdateReviewWorker()
        worker!.fetch(product_id:request.product_id!,user_id:request.user_id!,review_id:request.review_id!,comment:request.comment!,rating:request.rating!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: UpdateReviewModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: UpdateReviewModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

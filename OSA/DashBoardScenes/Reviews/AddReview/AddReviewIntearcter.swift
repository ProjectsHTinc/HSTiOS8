//
//  AddReviewIntearcter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol AddReviewBusinessLogic
{
    func fetchItems(request:AddReviewModel.Fetch.Request)
}
protocol AddReviewDataStore
{
  
}

class AddReviewInteractor: AddReviewBusinessLogic,AddReviewDataStore
{

    var presenter: AddReviewPresentationLogic?
    var worker: AddReviewWorker?
 
    func fetchItems(request: AddReviewModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: AddReviewModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = AddReviewWorker()
        worker!.fetch(product_id:request.product_id!,user_id:request.user_id!,comment:request.comment!,rating:request.rating!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AddReviewModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: AddReviewModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

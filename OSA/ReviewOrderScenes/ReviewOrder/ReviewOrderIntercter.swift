//
//  ReviewOrderIntercter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 15/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

import Foundation


protocol ReviewOrderBusinessLogic
{
    func fetchItems(request: ReviewOrderModel.Fetch.Request)
}
protocol ReviewOrderDataStore
{
  
}

class ReviewOrderInteractor: ReviewOrderBusinessLogic,ReviewOrderDataStore
{
    var presenter: ReviewOrderPresentationLogic?
    var worker: ReviewOrderWorker?
    var respData = [ReviewOrderModels]()
    func fetchItems(request: ReviewOrderModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = ReviewOrderWorker()
        worker!.fetch(user_id:request.user_id!,order_id:request.order_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ReviewOrderModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ReviewOrderModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


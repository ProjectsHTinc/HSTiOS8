//
//  ReviewListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//


import Foundation
import UIKit

protocol ReviewListBusinessLogic
{
    func fetchItems(request: ReviewListModel.Fetch.Request)
}
protocol ReviewListDataStore
{
  
}

class ReviewListInteractor: ReviewListBusinessLogic,ReviewListDataStore
{
    var presenter4: ReviewListPresentationLogic?
    var worker: ReviewListWorker?
    var respData = [ReviewListModels]()
    func fetchItems(request: ReviewListModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = ReviewListWorker()
        worker!.fetch(product_id:request.product_id!, onSuccess: { (resp) in
            self.presenter4?.presentFetchResults(resp: ReviewListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter4?.presentFetchResults(resp: ReviewListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

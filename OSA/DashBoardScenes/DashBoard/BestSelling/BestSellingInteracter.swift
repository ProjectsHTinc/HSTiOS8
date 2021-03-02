//
//  BestSellingInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//


import Foundation
import UIKit

protocol BestSellingBusinessLogic
{
    func fetchItems(request: BestSellingModel.Fetch.Request)
}

protocol BestSellingDataStore
{
  
}

class BestSellingInteractor: BestSellingBusinessLogic, BestSellingDataStore
{
    var presenter2: BestSellingPresentationLogic?
    var worker: BestSellingWorker?
    var respData = [BestSellingDetailModels]()
    func fetchItems(request: BestSellingModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter2?.presentFetchResults(resp: BestSellingModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = BestSellingWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: BestSellingModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: BestSellingModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

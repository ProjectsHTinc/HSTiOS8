//
//  CategorySelectInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/02/21.
//



import Foundation
import UIKit

protocol CategorySelectBusinessLogic
{
    func fetchItems(request: CategorySelectModel.Fetch.Request)
}

protocol CategorySelectDataStore
{
  
}

class CategorySelectInteractor: CategorySelectBusinessLogic, CategorySelectDataStore
{
    var presenter: CategorySelectPresentationLogic?
    var worker: CategorySelectWorker?
    var respData = [CategorySelectDetailModels]()
    func fetchItems(request: CategorySelectModel.Fetch.Request) {
        if request.cat_id == nil {
           self.presenter?.presentFetchResults(resp: CategorySelectModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = CategorySelectWorker()
        worker!.fetch(cat_id:request.cat_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: CategorySelectModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: CategorySelectModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

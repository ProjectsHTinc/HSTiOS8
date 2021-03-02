//
//  CategoryInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/02/21.
//

import Foundation
import UIKit

protocol CategoryBusinessLogic
{
    func fetchItems(request: CategoryModel.Fetch.Request)
}

protocol CategoryDataStore
{
  
}

class CategoryInteractor: CategoryBusinessLogic, CategoryDataStore
{
    var presenter1: CategoryPresentationLogic?
    var worker: CategoryWorker?
    var respData = [CategoryDetailModels]()
    func fetchItems(request: CategoryModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: CategoryModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = CategoryWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: CategoryModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: CategoryModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

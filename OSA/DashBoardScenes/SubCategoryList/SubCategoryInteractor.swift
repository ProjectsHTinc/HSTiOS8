//
//  SubCategoryInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/02/21.
//

import Foundation
import UIKit

protocol SubCategoryListBusinessLogic
{
    func fetchItems(request: SubCategoryListModel.Fetch.Request)
}

protocol SubCategoryListDataStore
{
  
}

class SubCategoryListInteractor: SubCategoryListBusinessLogic, SubCategoryListDataStore
{
    var presenter2: SubCategoryListPresentationLogic?
    var worker: SubCategoryListWorker?
    var respData = [SubCategoryListDetailModels]()
    func fetchItems(request: SubCategoryListModel.Fetch.Request) {
        if request.cat_id == nil {
           self.presenter2?.presentFetchResults(resp: SubCategoryListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = SubCategoryListWorker()
        worker!.fetch(cat_id:request.cat_id!,user_id:request.user_id!, sub_cat_id:request.sub_cat_id!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: SubCategoryListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: SubCategoryListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

//
//  ListFilterInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

protocol ListFilterBusinessLogic
{
    func fetchItems(request: ListFilterModel.Fetch.Request)
}
protocol ListFilterDataStore
{
  
}

class ListFilterInteractor: ListFilterBusinessLogic,ListFilterDataStore
{
    var presenter1: ListFilterPresentationLogic?
    var worker: ListFilterWorker?
    var respData = [ListFilterModels]()
    func fetchItems(request: ListFilterModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = ListFilterWorker()
        worker!.fetch(user_id:request.user_id!,cat_id:request.cat_id!,sub_cat_id:request.sub_cat_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: ListFilterModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: ListFilterModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

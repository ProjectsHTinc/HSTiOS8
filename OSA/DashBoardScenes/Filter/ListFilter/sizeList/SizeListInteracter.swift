//
//  SizeListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

protocol SizeListBusinessLogic
{
    func fetchItems(request: SizeListModel.Fetch.Request)
}
protocol SizeListDataStore
{
  
}

class SizeListInteractor: SizeListBusinessLogic,SizeListDataStore
{
    var presenter2: SizeListPresentationLogic?
    var worker: SizeListWorker?
    var respData = [SizeListModels]()
    func fetchItems(request: SizeListModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = SizeListWorker()
        worker!.fetch(user_id:request.user_id!,cat_id:request.cat_id!,sub_cat_id:request.sub_cat_id!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: SizeListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: SizeListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

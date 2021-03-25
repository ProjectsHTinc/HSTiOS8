//
//  ReturnReasonListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol ReturnReasonListBusinessLogic
{
    func fetchItems(request:ReturnReasonListModel.Fetch.Request)
}
protocol ReturnReasonListDataStore
{
  
}

class ReturnReasonListInteractor: ReturnReasonListBusinessLogic,ReturnReasonListDataStore
{

    var presenter: ReturnReasonListPresentationLogic?
    var worker: ReturnReasonListWorker?
    var respData = [ReturnReasonListModels]()
    func fetchItems(request: ReturnReasonListModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: ReturnReasonListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ReturnReasonListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ReturnReasonListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ReturnReasonListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


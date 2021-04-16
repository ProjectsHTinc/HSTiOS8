//
//  PayCODInteracter.swift
//  
//
//  Created by Happy Sanz Tech on 23/03/21.
//

import Foundation

protocol PayCODBusinessLogic
{
    func fetchItems(request:PayCODModel.Fetch.Request)
}
protocol PayCODDataStore
{
  
}

class PayCODInteractor: PayCODBusinessLogic,PayCODDataStore
{

    var presenter1: PayCODPresentationLogic?
    var worker: PayCODWorker?
 
    func fetchItems(request: PayCODModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: PayCODModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = PayCODWorker()
        worker!.fetch(order_id:request.order_id!, user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: PayCODModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: PayCODModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

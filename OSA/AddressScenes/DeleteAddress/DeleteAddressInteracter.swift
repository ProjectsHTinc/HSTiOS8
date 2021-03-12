//
//  DeleteAddressInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation

protocol DeleteAddressBusinessLogic
{
    func fetchItems(request:DeleteAddressModel.Fetch.Request)
}
protocol DeleteAddressDataStore
{
  
}

class DeleteAddressInteractor: DeleteAddressBusinessLogic,DeleteAddressDataStore
{

    var presenter1: DeleteAddressPresentationLogic?
    var worker: DeleteAddressWorker?
 
    func fetchItems(request: DeleteAddressModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: DeleteAddressModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = DeleteAddressWorker()
        worker!.fetch(user_id:request.user_id!, address_id:request.address_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: DeleteAddressModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: DeleteAddressModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

//
//  DefaultAddressInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation

protocol DefaultAddressBusinessLogic
{
    func fetchItems(request:DefaultAddressModel.Fetch.Request)
}
protocol DefaultAddressDataStore
{
  
}

class DefaultAddressInteractor: DefaultAddressBusinessLogic,DefaultAddressDataStore
{

    var presenter3: DefaultAddressPresentationLogic?
    var worker: DefaultAddressWorker?
 
    func fetchItems(request: DefaultAddressModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter3?.presentFetchResults(resp: DefaultAddressModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = DefaultAddressWorker()
        worker!.fetch(user_id:request.user_id!, address_id:request.address_id!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: DefaultAddressModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: DefaultAddressModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

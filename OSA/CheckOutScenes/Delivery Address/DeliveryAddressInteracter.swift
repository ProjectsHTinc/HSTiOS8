//
//  DeliveryAddressInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//
import Foundation

protocol DeliveryAddressBusinessLogic
{
    func fetchItems(request:DeliveryAddressModel.Fetch.Request)
}
protocol DeliveryAddressDataStore
{
  
}

class DeliveryAddressInteractor: DeliveryAddressBusinessLogic,DeliveryAddressDataStore
{

    var presenter: DeliveryAddressPresentationLogic?
    var worker: DeliveryAddressWorker?
    var respData = [DeliveryAddressModels]()
    func fetchItems(request: DeliveryAddressModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: DeliveryAddressModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = DeliveryAddressWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: DeliveryAddressModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: DeliveryAddressModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

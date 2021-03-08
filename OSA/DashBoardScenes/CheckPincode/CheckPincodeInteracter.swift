//
//  CheckPincodeInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//


import Foundation

protocol CheckPincodeBusinessLogic
{
    func fetchItems(request:CheckPincodeModel.Fetch.Request)
}
protocol CheckPincodeDataStore
{
  
}

class CheckPincodeInteractor: CheckPincodeBusinessLogic,CheckPincodeDataStore
{

    var presenter6: CheckPincodePresentationLogic?
    var worker: CheckPincodeWorker?
 
    func fetchItems(request: CheckPincodeModel.Fetch.Request) {
        if request.pin_code == nil {
           self.presenter6?.presentFetchResults(resp: CheckPincodeModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = CheckPincodeWorker()
        worker!.fetch(pin_code:request.pin_code!, onSuccess: { (resp) in
            self.presenter6?.presentFetchResults(resp: CheckPincodeModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter6?.presentFetchResults(resp: CheckPincodeModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


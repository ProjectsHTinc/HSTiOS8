//
//  LoginInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation


protocol LoginBusinessLogic
{
    func fetchItems(request: LoginModel.Fetch.Request)
}
protocol LoginDataStore
{
  
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{

    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
 
    func fetchItems(request: LoginModel.Fetch.Request) {
        if request.mobile_number == nil {
           self.presenter?.presentFetchResults(resp: LoginModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = LoginWorker()
        worker!.fetch(mobile_number:request.mobile_number!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: LoginModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: LoginModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

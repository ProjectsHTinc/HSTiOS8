//
//  SignUpInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

protocol SignupBusinessLogic
{
    func fetchItems(request: SignupModel.Fetch.Request)
}
protocol SignupDataStore
{
  
}

class SignupInteractor: SignupBusinessLogic, SignupDataStore
{
    
    var presenter: SignupPresentationLogic?
    var worker: SignupWorker?
 
    func fetchItems(request: SignupModel.Fetch.Request) {
        if request.name == nil {
           self.presenter?.presentFetchResults(resp: SignupModel.Fetch.Response(testObj: nil, isError:true, message: "emptyy" ))
        }
        worker = SignupWorker()
        worker!.fetch(name:request.name!,phone:request.phone!,email:request.email!,password:request.password!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: SignupModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: SignupModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}



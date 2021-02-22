//
//  EmailPasswordInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

protocol ForgotPasswordBusinessLogic
{
    func fetchItems(request:  ForgotPasswordModel.Fetch.Request)
}
protocol  ForgotPasswordDataStore
{
  
}

class  ForgotPasswordInteractor:  ForgotPasswordBusinessLogic,  ForgotPasswordDataStore
{

    var presenter:  ForgotPasswordPresentationLogic?
    var worker:  ForgotPasswordWorker?
 
    func fetchItems(request:  ForgotPasswordModel.Fetch.Request) {
        if request.email == nil {
           self.presenter?.presentFetchResults(resp: ForgotPasswordModel.Fetch.Response(testObj: nil, isError:true, message: "emptyy" ))
        }
        worker =  ForgotPasswordWorker()
        worker!.fetch(email:request.email!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp:  ForgotPasswordModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:  ForgotPasswordModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


//
//  EmailLoginInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation
import UIKit

protocol EmailLoginBusinessLogic
{
    func fetchItems(request: EmailLoginModel.Fetch.Request)
}
protocol EmailLoginDataStore
{
  
}

class EmailLoginInteractor: EmailLoginBusinessLogic, EmailLoginDataStore
{

    var presenter: EmailLoginPresentationLogic?
    var worker: EmailLoginWorker?
 
    func fetchItems(request: EmailLoginModel.Fetch.Request) {
        if request.email_id == nil {
           self.presenter?.presentFetchResults(resp: EmailLoginModel.Fetch.Response(testObj: nil, isError:true, message: "emptyy" ))
        }
        worker = EmailLoginWorker()
        worker!.fetch(email_id:request.email_id!,password:request.password!,mob_key:request.mob_key!,mobile_type:request.mobile_type!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: EmailLoginModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: EmailLoginModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


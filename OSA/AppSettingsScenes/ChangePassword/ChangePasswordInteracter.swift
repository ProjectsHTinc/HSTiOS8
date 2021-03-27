//
//  ChangePasswordInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol CheckPasswordBusinessLogic
{
    func fetchItems(request:CheckPasswordModel.Fetch.Request)
}
protocol CheckPasswordDataStore
{
  
}

class CheckPasswordInteractor: CheckPasswordBusinessLogic,CheckPasswordDataStore
{

    var presenter: CheckPasswordPresentationLogic?
    var worker: CheckPasswordWorker?
 
    func fetchItems(request: CheckPasswordModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: CheckPasswordModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = CheckPasswordWorker()
        worker!.fetch(password:request.password!,user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: CheckPasswordModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: CheckPasswordModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

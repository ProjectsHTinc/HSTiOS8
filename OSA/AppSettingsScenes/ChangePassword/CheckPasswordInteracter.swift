//
//  CheckPasswordInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol ChangePasswordBusinessLogic
{
    func fetchItems(request:ChangePasswordModel.Fetch.Request)
}
protocol ChangePasswordDataStore
{
  
}

class ChangePasswordInteractor: ChangePasswordBusinessLogic,ChangePasswordDataStore
{

    var presenter1: ChangePasswordPresentationLogic?
    var worker: ChangePasswordWorker?
 
    func fetchItems(request: ChangePasswordModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: ChangePasswordModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ChangePasswordWorker()
        worker!.fetch(password:request.password!,user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: ChangePasswordModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: ChangePasswordModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

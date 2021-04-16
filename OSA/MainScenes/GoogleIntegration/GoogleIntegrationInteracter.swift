//
//  GoogleIntegrationInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

protocol GoogleIntegrationBusinessLogic
{
    func fetchItems(request: GoogleIntegrationModel.Fetch.Request)
}
protocol GoogleIntegrationDataStore
{
  
}

class GoogleIntegrationInteractor: GoogleIntegrationBusinessLogic, GoogleIntegrationDataStore
{
    
    var presenter1: GoogleIntegrationPresentationLogic?
    var worker: GoogleIntegrationWorker?
 
    func fetchItems(request: GoogleIntegrationModel.Fetch.Request) {
        if request.email == nil {
           self.presenter1?.presentFetchResults(resp: GoogleIntegrationModel.Fetch.Response(testObj: nil, isError:true, message: "emptyy" ))
        }
        worker = GoogleIntegrationWorker()
        worker!.fetch(email:request.email!,first_name:request.first_name!,last_name:request.last_name!,mobile_type:request.mobile_type!,mob_key:request.mob_key!,login_type:request.login_type!,login_portal:request.login_portal!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: GoogleIntegrationModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: GoogleIntegrationModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


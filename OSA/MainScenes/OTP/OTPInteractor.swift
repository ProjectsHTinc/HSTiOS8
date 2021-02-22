//
//  OTPInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

protocol OTPBusinessLogic
{
    func fetchItems(request:  OTPModel.Fetch.Request)
}
protocol  OTPDataStore
{
  
}

class  OTPInteractor:  OTPBusinessLogic,  OTPDataStore
{

    var presenter:  OTPPresentationLogic?
    var worker:  OTPWorker?
 
    func fetchItems(request:  OTPModel.Fetch.Request) {
        if request.mobile_number == nil {
           self.presenter?.presentFetchResults(resp: OTPModel.Fetch.Response(testObj: nil, isError:true, message: "emptyy" ))
        }
        worker =  OTPWorker()
        worker!.fetch(mobile_number:request.mobile_number!,OTP:request.OTP!,mob_key:request.mob_key!,mobile_type:request.mobile_type!,login_type:request.login_type!,login_portal:request.login_portal!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp:  OTPModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:  OTPModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


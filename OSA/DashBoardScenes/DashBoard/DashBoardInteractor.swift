//
//  DashBoardInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 17/02/21.
//

import Foundation
import UIKit

protocol DashBoardBusinessLogic
{
    func fetchItems(request: DashBoardModel.Fetch.Request)
}
protocol DashBoardDataStore
{
  
}

class DashBoardInteractor: DashBoardBusinessLogic, DashBoardDataStore
{
    
    var presenter: DashBoardPresentationLogic?
    var worker: DashBoardWorker?
    var respData = [DashBoardDetailModels]()
    func fetchItems(request: DashBoardModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = DashBoardWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
//class SecondVCInteractor: SecondVCBusinessLogic, SecondVCDataStore
//{
//    var state_id: String = ""
//
//    var otp: String = ""
//    var respData = [ElectionDataModel]()
//    var presenter: SecondVCPresentationLogic?
//    var worker: SecondVCWorker?
//    //var name: String = ""
//
//    func fetchItems(request: SecondVCModel.Fetch.Request) {
//        if request.state_id == nil {
//           self.presenter?.presentFetchResults(resp: SecondVCModel.Fetch.Response(testObj: respData, isError:true, message: "" ))
//        }
//        worker = SecondVCWorker()
//        worker!.fetch(state_id:request.state_id!, onSuccess: { (resp) in
//            print(resp)
//            self.presenter?.presentFetchResults(resp: SecondVCModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
//        }) { (errorMessage) in
//            self.presenter?.presentFetchResults(resp: SecondVCModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: ""))
//        }
//    }
//}

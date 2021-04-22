//
//  ReturnRequestInteracter.swift
//  OSA
//
//  Created by HappysanziMac on 22/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol ReturnOrderRequestBusinessLogic
{
    func fetchItems(request:ReturnOrderRequestModel.Fetch.Request)
}
protocol ReturnOrderRequestDataStore
{
  
}

class ReturnOrderRequestInteractor: ReturnOrderRequestBusinessLogic,ReturnOrderRequestDataStore
{

    var presenter1: ReturnOrderRequestPresentationLogic?
    var worker: ReturnOrderRequestWorker?
 
    func fetchItems(request: ReturnOrderRequestModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: ReturnOrderRequestModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ReturnOrderRequestWorker()
        worker!.fetch(user_id:request.user_id!, purchase_order_id:request.purchase_order_id!,reason_question_id:request.reason_question_id!, answer_text:request.answer_text!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: ReturnOrderRequestModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: ReturnOrderRequestModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

       
        

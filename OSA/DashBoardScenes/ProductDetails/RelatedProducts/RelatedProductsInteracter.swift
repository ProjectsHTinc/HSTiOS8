//
//  RelatedProductsInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import Foundation
import UIKit

protocol RelatedProductBusinessLogic
{
    func fetchItems(request: RelatedProductModel.Fetch.Request)
}
protocol RelatedProductDataStore
{
  
}

class RelatedProductInteractor: RelatedProductBusinessLogic, RelatedProductDataStore
{
    var presenter3: RelatedProductPresentationLogic?
    var worker: RelatedProductWorker?
    var respData = [RelatedProductModels]()
    func fetchItems(request: RelatedProductModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = RelatedProductWorker()
        worker!.fetch(product_id:request.product_id!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: RelatedProductModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: RelatedProductModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

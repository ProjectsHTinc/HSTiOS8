//
//  ProductSizeInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//

import Foundation
import UIKit

protocol ProductSizeBusinessLogic
{
    func fetchItems(request: ProductSizeModel.Fetch.Request)
}
protocol ProductSizeDataStore
{
  
}

class ProductSizeInteractor: ProductSizeBusinessLogic, ProductSizeDataStore
{
    var presenter1: ProductSizePresentationLogic?
    var worker: ProductSizeWorker?
    var respData = [ProductSizeModels]()
    func fetchItems(request: ProductSizeModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = ProductSizeWorker()
        worker!.fetch(product_id:request.product_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: ProductSizeModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: ProductSizeModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


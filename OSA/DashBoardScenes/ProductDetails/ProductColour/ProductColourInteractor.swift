//
//  ProductColourInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//

import Foundation
import UIKit

protocol ProductColourBusinessLogic
{
    func fetchItems(request: ProductColourModel.Fetch.Request)
}
protocol ProductColourDataStore
{
  
}

class ProductColourInteractor: ProductColourBusinessLogic, ProductColourDataStore
{
    var presenter2: ProductColourPresentationLogic?
    var worker: ProductColourWorker?
    var respData = [ProductColourModels]()
    func fetchItems(request: ProductColourModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = ProductColourWorker()
        worker!.fetch(product_id:request.product_id!,size_id:request.size_id!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: ProductColourModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: ProductColourModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

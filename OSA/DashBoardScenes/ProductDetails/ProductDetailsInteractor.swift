//
//  ProductDetailsInteractor.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import Foundation
import UIKit

protocol ProductDetailsBusinessLogic
{
    func fetchItems(request: ProductDetailsModel.Fetch.Request)
}

protocol ProductDetailsDataStore
{
  
}

class ProductDetailsInteractor: ProductDetailsBusinessLogic, ProductDetailsDataStore
{
    var presenter: ProductDetailsPresentationLogic?
    var worker: ProductDetailsWorker?
  
    func fetchItems(request: ProductDetailsModel.Fetch.Request) {
        if request.product_id == nil {
            self.presenter?.presentFetchResults(resp: ProductDetailsModel.Fetch.Response(testObj: nil, isError:true, message: "empty" ))
        }
        worker = ProductDetailsWorker()
        worker!.fetch(product_id:request.product_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ProductDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ProductDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

//
//  WishListRemoveInteracter.swift
//  OSA
//
//  Created by HappysanziMac on 15/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol WishListDeleteBusinessLogic
{
    func fetchItems(request:WishListDeleteModel.Fetch.Request)
}

protocol WishListDeleteDataStore
{
  
}

class WishListDeleteInteractor: WishListDeleteBusinessLogic,WishListDeleteDataStore
{

    var presenter6: WishListDeletePresentationLogic?
    var worker: WishListDeleteWorker?
 
    func fetchItems(request: WishListDeleteModel.Fetch.Request) {
        if request.product_id == nil {
           self.presenter6?.presentFetchResults(resp: WishListDeleteModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = WishListDeleteWorker()
        worker!.fetch(product_id:request.product_id!,user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter6?.presentFetchResults(resp: WishListDeleteModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter6?.presentFetchResults(resp: WishListDeleteModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


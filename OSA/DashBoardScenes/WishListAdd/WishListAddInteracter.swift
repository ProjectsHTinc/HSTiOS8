//
//  WishListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol WishListAddBusinessLogic
{
    func fetchItems(request:WishListAddModel.Fetch.Request)
}

protocol WishListAddDataStore
{
  
}

class WishListAddInteractor: WishListAddBusinessLogic,WishListAddDataStore
{

    var presenter5: WishListAddPresentationLogic?
    var worker: WishListAddWorker?
 
    func fetchItems(request: WishListAddModel.Fetch.Request) {
        if request.product_id == nil {
           self.presenter5?.presentFetchResults(resp: WishListAddModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = WishListAddWorker()
        worker!.fetch(product_id:request.product_id!,user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter5?.presentFetchResults(resp: WishListAddModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter5?.presentFetchResults(resp: WishListAddModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


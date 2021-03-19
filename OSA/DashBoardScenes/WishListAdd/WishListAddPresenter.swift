//
//  WishListAddPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation

protocol WishListAddPresentationLogic
{
  func presentFetchResults(resp:WishListAddModel.Fetch.Response)
}

class WishListAddPresenter: WishListAddPresentationLogic
{
  weak var viewController5: WishListAddDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: WishListAddModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = WishListAddModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController5?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController5?.successFetchedItems(viewModel: viewModel)
        }
    }
}


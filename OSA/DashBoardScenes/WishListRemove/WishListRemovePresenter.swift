//
//  WishListRemovePresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol WishListDeletePresentationLogic
{
  func presentFetchResults(resp:WishListDeleteModel.Fetch.Response)
}

class WishListDeletePresenter: WishListDeletePresentationLogic
{
  weak var viewController6: WishListDeleteDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: WishListDeleteModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = WishListDeleteModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController6?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController6?.successFetchedItems(viewModel: viewModel)
        }
    }
}


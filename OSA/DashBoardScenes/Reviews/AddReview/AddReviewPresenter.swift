//
//  AddReviewPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol AddReviewPresentationLogic
{
  func presentFetchResults(resp: AddReviewModel.Fetch.Response)
}

class AddReviewPresenter: AddReviewPresentationLogic
{
  weak var viewController: AddReviewDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AddReviewModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = AddReviewModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}


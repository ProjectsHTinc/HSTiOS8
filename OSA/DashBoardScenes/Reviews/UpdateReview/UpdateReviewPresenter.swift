//
//  UpdateReviewPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol UpdateReviewPresentationLogic
{
  func presentFetchResults(resp: UpdateReviewModel.Fetch.Response)
}

class UpdateReviewPresenter: UpdateReviewPresentationLogic
{
  weak var viewController2: UpdateReviewDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: UpdateReviewModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = UpdateReviewModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController2?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController2?.successFetchedItems(viewModel: viewModel)
        }
    }
}

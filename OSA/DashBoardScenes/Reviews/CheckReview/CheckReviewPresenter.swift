//
//  CheckReviewPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol CheckReviewPresentationLogic
{
  func presentFetchResults(resp: CheckReviewModel.Fetch.Response)
}

class CheckReviewPresenter: CheckReviewPresentationLogic
{
  weak var viewController1: CheckReviewDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: CheckReviewModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = CheckReviewModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status,id: resp.testObj?.id, product_id: resp.testObj?.product_id,rating: resp.testObj?.rating, comment: resp.testObj?.comment,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}

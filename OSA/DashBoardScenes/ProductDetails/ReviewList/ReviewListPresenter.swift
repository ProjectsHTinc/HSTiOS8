//
//  ReviewListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import Foundation

protocol ReviewListPresentationLogic
{
  func presentFetchResults(resp: ReviewListModel.Fetch.Response)
}

class ReviewListPresenter: ReviewListPresentationLogic
{
  weak var viewController4: ReviewListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ReviewListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedReviewListData: [ReviewListModel.Fetch.ViewModel.DisplayedReviewListData] = []
       
        for data in resp.testObj {
            let displayedReviewListDatas = ReviewListModel.Fetch.ViewModel.DisplayedReviewListData(customer_name: data.customer_name!,product_id: data.product_id!,rating: data.rating!,comment: data.comment!)
            displayedReviewListData.append(displayedReviewListDatas)
        }
        let viewModel = ReviewListModel.Fetch.ViewModel(displayedReviewListData: displayedReviewListData)
        viewController4?.successFetchedItems(viewModel: viewModel)
    }
}
